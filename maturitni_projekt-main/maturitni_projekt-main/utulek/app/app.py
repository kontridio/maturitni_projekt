from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
import mysql.connector
import base64

app = Flask(__name__)

# Configure the database URL
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+mysqlconnector://root:@localhost/utulek"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class utulek_pes(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    jmeno_psa = db.Column(db.String(80), nullable=False)
    rasa = db.Column(db.String(120), nullable=False)
    popis = db.Column(db.Text, nullable=False)
    #utulel_nazev_id = db.Column(db.Integer, secondary_key=True)
    fotografie = db.Column(db.LargeBinary)
    vek = db.Column(db.Integer, nullable=False)
    ockovani = db.Column(db.String(120), nullable=False)
    pohlavi = db.Column(db.String(120), nullable=False)

@app.route('/pes')
def get_pes():
    pes = utulek_pes.query.all()
    for utulek_pes in pes:
        if utulek_pes.fotografie:
            utulek_pes.base64_image = base64.b64encode(utulek_pes.fotografie).decode('utf-8')
        else:
            utulek_pes.base64_image = None
    return render_template('index.html', pes=pes)

if __name__ == '__main__':
    app.run(debug=True)
