from flask import render_template, request, redirect, url_for, flash, current_app, request
import os
import secrets
from PIL import Image
from website import app, db
from website.forms import AddPesForm, EditPesForm
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
    return render_template('home.html', posts=posts)

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

def save_picture(form_picture):
    random_hex = secrets.token_hex(8)
    _, f_ext = os.path.splitext(form_picture.filename)
    picture_fn = random_hex + f_ext
    picture_path = os.path.join(app.root_path, 'static/img', picture_fn)

    output_size = (125, 125)
    form_picture.save(picture_path)

    return picture_fn

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

        fotografie_file = form.fotografie.data


        if form.fotografie.data:
            fotografie_file = save_picture(form.fotografie.data)
        else:
            fotografie_file = None

        new_pes = Pes(ockovani=ockovani, jmeno=jmeno, rasa=rasa, vek=vek,
                      velikost=velikost, stav=stav, pohlavi=pohlavi,
                      popis=popis, utulek_nazev=utulek_nazev, fotografie=fotografie_file)

        db.session.add(new_pes)
        db.session.commit()

        flash('Pes byl přidán.', 'success')

        return redirect(url_for('show_pes'))
    
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
    utulky_entries = Utulek.query.all()
    form = EditPesForm(obj=pes_to_edit)

    if not pes_to_edit:
        flash('Pes nebyl nalezen.', 'danger')
        return redirect(url_for('show_pes'))

    if request.method == 'POST' and form.validate_on_submit():
        form.populate_obj(pes_to_edit)
        db.session.commit()
        flash('Pes byl aktualizován.', 'success')
        return redirect(url_for('show_pes'))

    return render_template('edit_pes.html', pes=pes_to_edit, utulky_entries=utulky_entries, form=form)