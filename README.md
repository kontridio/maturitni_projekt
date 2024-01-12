Aplikace pro útulky pro psy
Tato webová aplikace slouží k správě informací o psech a útulcích. Cílem projektu je usnadnit proces adopce poskytováním platformy pro prezentaci psů dostupných k adopci a informací o útulcích.

Funkce
Procházejte a vyhledávejte psy na základě různých filtrů (věk, velikost, očkování, atd.).
Zobrazte podrobné informace o každém psovi, včetně obrázků a podrobností o útulku.
Přidávejte nové psy a útulky do systému.
Upravujte a mažte existující záznamy o psech a útulcích.
Uživatelská autentizace a autorizace pro administrátorské funkce.
Použité technologie
Frontend:

HTML, CSS
Bootstrap pro stylizaci
Jinja2 template engine
JavaScript
Backend:

Flask webový framework
SQLAlchemy pro správu databáze
WTForms pro manipulaci s formuláři
Flask-Login pro uživatelskou autentizaci
Flask-WTF pro manipulaci s formuláři ve spojení s Flask
Databáze:

SQLite

Instalace a spuštění
1. Klonujte repozitář:
    git clone https://github.com/your-username/dog-shelter-app.git
    cd dog-shelter-app

2. Vytvořte virtuální prostředí:
    python -m venv venv

3. Aktivujte virtuální prostředí:
    Na Windows:
        venv\Scripts\activate

    Na macOS/Linux:
        source venv/bin/activate

4. Nainstalujte závislosti:
    pip install -r requirements.txt

5. Spusťte aplikaci:
    flask run

6. Přistupte k aplikaci:
    Otevřete webový prohlížeč a přejděte na http://localhost:5000

