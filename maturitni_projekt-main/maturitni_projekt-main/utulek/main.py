from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
import mysql.connector

app = Flask(__name__)

# Configure the database URL
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+mysqlconnector://root:@localhost/utulek"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class utulek_mesto(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    kraj = db.Column(db.String(80), unique=True, nullable=False)
    nazev_mesta = db.Column(db.String(120), unique=True, nullable=False)

@app.route('/pes')
def get_mesto():
    mesto = utulek_mesto.query.all()
    return render_template('templates\index.html', mesto=mesto)

if __name__ == '__main__':
    app.run(debug=True)
