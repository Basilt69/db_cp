import streamlit as st
from postgres import postgres

# st.set_page_config(initial_sidebar_state="collapsed"


def header():
    author = """
        made by [Basil Tkachenko](https://github.com/Basilt69)
        for [DB](https://github.com/Basilt69/db_cp) course project
        in [BMSTU](https://bmstu.ru)
        """

    st.header("МГТУ им. Баумана. Кафедра ИУ7")
    st.markdown("**Курс:** Базы данных")
    st.markdown("**Преподаватель:** Павлюк А.А.")
    st.markdown("**Студент:** Ткаченко В.М.")
    st.sidebar.image('logo.png', width=300)
    st.sidebar.markdown(author)


def main():
    header()

    db = st.sidebar.radio(
        "Выберите тип БД:", (
            "1. Postgres.",
        ),
        index=0
    )

    if db[:1] == "1":
        postgres.main()



if __name__ == "__main__":
    main()
