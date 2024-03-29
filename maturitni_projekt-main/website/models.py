from sqlalchemy import CheckConstraint
from flask_login import UserMixin
from datetime import datetime
from website import db, login_manager

@login_manager.user_loader
def load_user(user_id):
    return Admin.query.get(int(user_id))

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    date_joined = db.Column(db.DateTime, default=datetime.utcnow)
    role = db.Column(db.String(1), default='U')

    def __repr__(self):
        return f"User('{self.username}', '{self.email}')"

class Admin(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(255), nullable=False, unique=True)
    password = db.Column(db.String(255), nullable=False)

    def __repr__(self):
        return f'Admin("{self.username}","{self.id}")'

class Mesto(db.Model):
    nazev = db.Column(db.String(45), primary_key=True)
    kraj = db.Column(db.String(45), nullable=False)
    psc = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f"User('{self.nazev}')"


class Utulek(db.Model):
    nazev = db.Column(db.String(45), primary_key=True)
    adresa = db.Column(db.String(45), nullable=False)
    mesto_nazev = db.Column(db.String(45), db.ForeignKey('mesto.nazev'), nullable=False)
    mesto = db.relationship('Mesto', backref=db.backref('utulky', lazy=True))

    def __repr__(self):
        return f"User('{self.nazev}')"

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
    fotografie = db.Column(db.String(100), nullable=False, default='default.jpeg') 
    
    utulek_nazev = db.Column(db.String(45), db.ForeignKey('utulek.nazev', name='utulek_nazev'), nullable=False)
    utulek = db.relationship('Utulek', backref=db.backref('pes', lazy=True))

    __table_args__ = (
        CheckConstraint('ockovani IN ("Ano", "Ne")'),
        CheckConstraint('vek IN ("2 - 6 měs", "6 měs - 2 roky", "2 - 8 let", "8 a více")'),
        CheckConstraint('velikost IN ("maly", "stredni", "velky")'),
        CheckConstraint('stav IN ("kastrovany", "handicapovany", "akutni adoptce")'),
        CheckConstraint('pohlavi IN ("Pes", "Fena")'),
    )

    def __repr__(self):
        return f"User('{self.nazev}', {self.fotografie}')"
    
class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    content = db.Column(db.Text, nullable=False)