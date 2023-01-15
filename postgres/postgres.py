import streamlit as st
import psycopg2
import pandas as pd


# initialize connection
# uses st.cache to only run once
# @st.cache(allow_output_mutation=True, hash_funcs={"_thread.RLock": lambda _: None})
def init_connection():
    #return psycopg2.connect(st.secrets["postgres"])
    return psycopg2.connect(st.secrets["auth_key"])



def get_sql_query(filename):
    f = open(f"queries/{filename}", encoding="utf-8", mode="r")
    query = f.read()
    f.close()
    return query


def main():
    st.image("postgres/logo.png", width=300)

    show_schema = st.checkbox("Показать диаграмму")
    if show_schema:
        st.image("postgres/logo.png")

    conn = init_connection()

    display = (
        "Организации и их права",
        "Число вступивших организаций по месяцам ",
        "Дни недели ч максимальным числом вступивших организаций",
        "Суммы покупок по месяцам",
        "Топ 10 регионов по вступлениям",
        "Топ 5 посредников",
        "Поиск организации",
        "Наиболее популярные права",
        "Произвольный запрос",
    )
    options = list(range(len(display)))
    select = st.selectbox("Выберите запрос:", options, format_func=lambda x: display[x])
    query = None

    if select == 0:
        query = get_sql_query("organisations_rights.sql")
        organisations_rights = pd.read_sql(query, conn)
        st.write(organisations_rights)

    elif select == 1:
        query = get_sql_query("weekday_org.sql")
        weekday_org = pd.read_sql(query, conn)
        st.write(weekday_org)

    elif select == 2:
        month = int(st.slider("Выберите месяц:", min_value=1, max_value=12, value=1, step=1))
        query = get_sql_query("count_by_month.sql").format(month=month)
        count_by_month = pd.read_sql(query, conn)
        st.write(count_by_month)

    elif select == 3:
        query = get_sql_query("joins_by_months.sql")
        joins_by_months = pd.read_sql(query, conn)
        st.write(joins_by_months)

    elif select == 4:
        query = get_sql_query("top_intermediaries.sql")
        top_intermediaries = pd.read_sql(query, conn)
        st.write(top_intermediaries)

    elif select == 5:
        query = get_sql_query("top_regional_joins.sql")
        top_regional_joins = pd.read_sql(query, conn)
        st.write(top_regional_joins)


    elif select == 6:
        query = get_sql_query("find_organisation.sql")
        organisation = pd.read_sql(query, conn)
        st.write(organisation)


    elif select == 7:
        query = get_sql_query("rights_count_filter.sql")
        rights_count_filter = pd.read_sql(query, conn)
        st.write(rights_count_filter)

    elif select == 8:
        query = get_sql_query("joins_by_months.sql")
        joins_by_month = pd.read_sql(query, conn)
        st.write(joins_by_month)

    elif select == 9:
        query = st.text_area("Введите произвольный запрос:", value="SELECT version();")
        avg_salary_filter = pd.read_sql(query, conn)
        st.write(avg_salary_filter)

    show_query = st.checkbox("Показать SQL-запрос")
    if show_query:
        st.code(query)

    st.markdown("---")
    st.markdown("Данные сгенерированы с помощью [generatedata](https://generatedata.com/) и SQL-функций")
    show_funcs = st.checkbox("Показать использованные SQL-функции")
    if show_funcs:
        st.code(get_sql_query("random.sql"))

    show_init = st.checkbox("Показать SQL-запросы инициализации БД")
    if show_init:
        st.code(get_sql_query("init.sql"))

if __name__ == "__main__":
    main()


