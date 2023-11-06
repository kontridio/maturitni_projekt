from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import sqlite3
from sqlalchemy.sql import text
from flask_migrate import Migrate

# this variable, db, will be used for all SQLAlchemy commands

# create the app
app = Flask(__name__)
db = SQLAlchemy(app)
migrate = Migrate(app, db, command='migrate')
# change string to the name of your database; add path if necessary
db_name = 'data.sql'

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + db_name

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db = SQLAlchemy(app)

# initialize the app with Flask-SQLAlchemy
db.init_app(app)


# NOTHING BELOW THIS LINE NEEDS TO CHANGE
# this route will test the database connection - and nothing more

@app.route('/')
def testdb():
    try:
        db.session.query(text('1')).from_statement(text('SELECT 1')).all()
        return '<h1>It works.</h1>'
    except Exception as e:
        # e holds description of the error
        error_text = "<p>The error:<br>" + str(e) + "</p>"
        hed = '<h1>Something is broken.</h1>'
        return hed + error_text
    

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

with app.app_context():
    db.create_all()

@app.teardown_request
def teardown_request(exception):
    db.session.remove()

if __name__ == '__main__':
    app.run(debug=True)