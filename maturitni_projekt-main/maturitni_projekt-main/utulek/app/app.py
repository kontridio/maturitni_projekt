from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import CheckConstraint
from flask_wtf import FlaskForm
from wtforms import Form, StringField, SelectField, FileField

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///pes.sqlite3'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Mesto(db.Model):
    nazev = db.Column(db.String(45), primary_key=True)
    kraj = db.Column(db.String(45), nullable=False)
    psc = db.Column(db.Integer, nullable=False)

class Utulek(db.Model):
    nazev = db.Column(db.String(45), primary_key=True)
    adresa = db.Column(db.String(45), nullable=False)
    mesto_nazev = db.Column(db.String(45), db.ForeignKey('mesto.nazev'), nullable=False)
    mesto = db.relationship('Mesto', backref=db.backref('utulky', lazy=True))

class Pes(db.Model):
    idpes = db.Column(db.Integer, primary_key=True)
    ockovani = db.Column(db.Enum('Ano', 'Ne', name='ockovani_enum'), nullable=True)
    jmeno = db.Column(db.String(45), nullable=False)
    rasa = db.Column(db.String(45))
    vek = db.Column(db.Enum('2 - 6 měs', '6 měs - 2 roky', '2 - 8 let', '8 a více', name='vek_enum'), nullable=True)
    velikost = db.Column(db.Enum('maly', 'stredni', 'velky', name='velikost_enum'), nullable=True)
    stav = db.Column(db.Enum('kastrovany', 'handicapovany', 'akutni adoptce', name='stav_enum'), nullable=True)
    pohlavi = db.Column(db.Enum('Pes', 'Fena', name='pohlavi_enum'), nullable=True)
    popis = db.Column(db.String(200))
    fotografie = db.Column(db.LargeBinary)
    utulek_nazev = db.Column(db.String(45), nullable=False)

    __table_args__ = (
        CheckConstraint('ockovani IN ("Ano", "Ne")'),
        CheckConstraint('vek IN ("2 - 6 měs", "6 měs - 2 roky", "2 - 8 let", "8 a více")'),
        CheckConstraint('velikost IN ("maly", "stredni", "velky")'),
        CheckConstraint('stav IN ("kastrovany", "handicapovany", "akutni adoptce")'),
        CheckConstraint('pohlavi IN ("Pes", "Fena")'),
    )

with app.app_context():
    db.create_all()                  

mesto_data = [
    {
        'nazev': 'City1',
        'kraj': 'Region1',
        'psc': 12345
    },
    {
        'nazev': 'City2',
        'kraj': 'Region2',
        'psc': 67890
    }
]

utulek_data = [
    {
        'nazev': 'Shelter1',
        'adresa': 'Address1',
        'mesto_nazev': 'City1'
    },
    {
        'nazev': 'Shelter2',
        'adresa': 'Address2',
        'mesto_nazev': 'City2'
    }
]

# Add data to the Mesto table
with app.app_context():
    for entry in mesto_data:
        mesto_entry = Mesto(**entry)
        db.session.add(mesto_entry)
    db.session.commit()

# Add data to the Utulek table
with app.app_context():
    for entry in utulek_data:
        utulek_entry = Utulek(**entry)
        db.session.add(utulek_entry)
    db.session.commit()


@app.route('/pes')
def show_pes():
    pes_entries = Pes.query.all()
    return render_template('index.html', pes_entries=pes_entries)

@app.route('/pes/add/', methods=['GET', 'POST'])
def add_pes():
    if request.method == 'POST':
        ockovani = request.form['ockovani']
        jmeno = request.form['jmeno']
        rasa = request.form['rasa']
        vek = request.form['vek']
        velikost = request.form['velikost']
        stav = request.form.getlist('stav')  # Use getlist to handle multiple selections
        pohlavi = request.form['pohlavi']
        popis = request.form['popis']
        utulek_nazev = request.form['utulek_nazev']

        new_pes = Pes(ockovani=ockovani, jmeno=jmeno, rasa=rasa, vek=vek,
                      velikost=velikost, stav=stav, pohlavi=pohlavi,
                      popis=popis, utulek_nazev=utulek_nazev)

        db.session.add(new_pes)
        db.session.commit()

        return redirect(url_for('index'))  # Redirect to the page showing all dogs

    return render_template('add_pes.html')

if __name__ == '__main__':
    app.run(debug=True)
