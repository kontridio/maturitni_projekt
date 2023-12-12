from flask import render_template, request, redirect, url_for, flash, current_app, request
import os
from website import app, db
from website.forms import AddPesForm
from website.models import Mesto, Utulek, Pes
from werkzeug.utils import secure_filename

posts = [
    {
        'author': 'Corey Schafer',
        'title': 'Blog Post 1',
        'content': 'First post content',
        'date_posted': 'April 20, 2018'
    },
    {
        'author': 'Jane Doe',
        'title': 'Blog Post 2',
        'content': 'Second post content',
        'date_posted': 'April 21, 2018'
    }
]

@app.route('/')
def home():
    return render_template('home.html', posts=posts)  # You need to create this template

@app.route('/mesta')
def show_mesta():
    mesta_entries = Mesto.query.all()
    return render_template('mesta.html', mesta_entries=mesta_entries)

@app.route('/utulky')
def show_utulky():
    utulky_entries = Utulek.query.all()
    return render_template('utulky.html', utulky_entries=utulky_entries)

@app.route('/pes')
def show_pes():
    pes_entries = Pes.query.all()
    return render_template('pes.html', pes_entries=pes_entries)

@app.route('/pes/add/', methods=['GET', 'POST'])
def add_pes():
    form = AddPesForm()

    if request.method == 'POST' and form.validate_on_submit():
        ockovani = form.ockovani.data
        jmeno = form.jmeno.data
        rasa = form.rasa.data
        vek = form.vek.data
        velikost = form.velikost.data
        stav = form.stav.data
        pohlavi = form.pohlavi.data
        popis = form.popis.data
        utulek_nazev = form.utulek_nazev.data

        fotografie = None

        # Handle image upload
        if 'fotografie' in request.files:
            file = request.files['fotografie']
            if file.filename != '':
                filename = secure_filename(file.filename)
                file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                fotografie = filename

        new_pes = Pes(ockovani=ockovani, jmeno=jmeno, rasa=rasa, vek=vek,
                      velikost=velikost, stav=stav, pohlavi=pohlavi,
                      popis=popis, utulek_nazev=utulek_nazev, fotografie=fotografie)

        db.session.add(new_pes)
        db.session.commit()

        flash('Pes byl přidán.', 'success')

        return redirect(url_for('show_pes'))  # Redirect to the page showing all dogs
    
    return render_template('add_pes.html', form = form)


@app.route('/pes/delete/<int:id>', methods=['GET', 'POST'])
def delete_pes(id):
    pes_to_delete = Pes.query.get(id)

    if pes_to_delete:
        db.session.delete(pes_to_delete)
        db.session.commit()
        flash('Pes byl odstraněn.', 'success')
    else:
        flash('Pes nebyl nalezen.', 'danger')

    return redirect(url_for('show_pes'))

@app.route('/pes/edit/<int:id>', methods=['GET', 'POST'])
def edit_pes(id):
    pes_to_edit = Pes.query.get(id)

    if not pes_to_edit:
        flash('Pes nebyl nalezen.', 'danger')
        return redirect(url_for('show_pes'))
    
    if request.method == 'POST':
        # Handle image upload
        if 'fotografie' in request.files:
            file = request.files['fotografie']
            if file.filename != '':
                filename = secure_filename(file.filename)
                file.save(os.path.join(current_app.config['UPLOAD_FOLDER'], filename))
                pes_to_edit.fotografie = filename  # Corrected line

    if request.method == 'POST':
        pes_to_edit.ockovani = request.form['ockovani']
        pes_to_edit.jmeno = request.form['jmeno']
        pes_to_edit.rasa = request.form['rasa']
        pes_to_edit.vek = request.form['vek']
        pes_to_edit.velikost = request.form['velikost']
        pes_to_edit.stav = request.form.get('stav')
        pes_to_edit.pohlavi = request.form['pohlavi']
        pes_to_edit.popis = request.form['popis']
        pes_to_edit.utulek_nazev = request.form['utulek_nazev']

        db.session.commit()
        flash('Pes byl aktualizován.', 'success')
        return redirect(url_for('show_pes'))

    return render_template('edit_pes.html', pes=pes_to_edit)
# Add more routes as needed