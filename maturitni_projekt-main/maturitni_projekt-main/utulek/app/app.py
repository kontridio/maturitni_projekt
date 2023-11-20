from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
import mysql.connector
import base64

app = Flask(__name__)

# Configure the database URL
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+mysqlconnector://root:@localhost/mydb"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class Pes(db.Model):
    idpes = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ockovani = db.Column(db.Enum('Ano', 'Ne'))
    jmeno = db.Column(db.String(45), nullable=False)
    rasa = db.Column(db.String(45))
    vek = db.Column(db.Enum('2 - 6 měs', '6 měs - 2 roky', '2 - 8 let', '8 a více'))
    velikost = db.Column(db.String(10))
    stav = db.Column(db.String(20))
    pohlavi = db.Column(db.Enum('Pes', 'Fena'))
    popis = db.Column(db.Text)
    fotografie = db.Column(db.LargeBinary)
    utulek_nazev = db.Column(db.String(45), nullable=False)

#class utulek_mesto(db.Model):
#    id = db.Column(db.Integer, primary_key=True)
#    kraj = db.Column(db.String(80), unique=True, nullable=False)
#    nazev_mesta = db.Column(db.String(120), unique=True, nullable=False)

@app.route('/pes')
def get_pes():
    pes_records = Pes.query.all()

    # Create a list to store base64-encoded images
    base64_images = []

    for record in pes_records:
        # Check if the 'fotografie' column is not None
        if record.fotografie:
            # Convert image data to base64
            base64_image = base64.b64encode(record.fotografie).decode('utf-8')
        else:
            # Set a default base64 value if 'fotografie' is None
            base64_image = 'default_base64_value'

        # Append the base64 image to the list
        base64_images.append(base64_image)

    return render_template('index.html', pes_records=pes_records, base64_images=base64_images)


if __name__ == '__main__':
    app.run(debug=True)
