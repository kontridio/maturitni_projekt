from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os.path

# this variable, db, will be used for all SQLAlchemy commands
db = SQLAlchemy()
# create the app
app = Flask(__name__)
# change string to the name of your database; add path if necessary
db_name = 'data.sql'
# note - path is necessary for a SQLite db!!!
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
db_path = os.path.join(BASE_DIR, db_name)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + db_path

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

# initialize the app with Flask-SQLAlchemy
db.init_app(app)


# each table in the database needs a class to be created for it
# this class is named Sock because the database contains info about socks
# and the table in the database is named: socks
# db.Model is required - don't change it
# identify all columns by name and their data type
class Utulek_mesto(db.Model):
    __tablename__ = 'utulek_mesto'
    id = db.Column(db.Integer, primary_key=True)
    kraj = db.Column(db.String)
    nazev_mesta = db.Column(db.String)

class Utulek_osetrovatel(db.Model):
    __tablename__ = 'utulek_osetrovatel'
    id = db.Column(db.Integer, primary_key=True)
    jmeno = db.Column(db.String)
    prijmeni = db.Column(db.String)
    mobil = db.Column(db.String)
    utulek_nazev_id = db.Column(db.Integer)
#routes

@app.route('/')
def index():
    # get a list of unique values in the style column
    styles = db.session.execute(db.select(Utulek_mesto)
        .with_only_columns(Utulek_mesto.style).distinct())
    return render_template('index.html', styles=styles)