from flask_wtf import FlaskForm
from wtforms import StringField, SelectField, FileField, TextAreaField, validators, SubmitField, IntegerField
from wtforms.validators import ValidationError, Length
from flask_wtf.file import FileAllowed, FileField
from website.models import Utulek, Mesto

class AddPesForm(FlaskForm):
    ockovani = SelectField('Očkování', choices=[('Ano', 'Ano'), ('Ne', 'Ne')], validators=[validators.InputRequired()])
    jmeno = StringField('Jméno', validators=[validators.InputRequired(), Length(max=50)])
    rasa = StringField('Rasa', validators=[validators.InputRequired(), Length(max=50)])
    vek = SelectField('Věk', choices=[
        ('2 - 6 měs', '2 - 6 měs'),
        ('6 měs - 2 roky', '6 měs - 2 roky'),
        ('2 - 8 let', '2 - 8 let'),
        ('8 a více', '8 a více')
    ], validators=[validators.InputRequired()])
    velikost = SelectField('Velikost', choices=[
        ('maly', 'Malý'),
        ('stredni', 'Střední'),
        ('velky', 'Velký')
    ], validators=[validators.InputRequired()])
    stav = SelectField('Stav', choices=[
        ('kastrovany', 'Kastrovaný'),
        ('handicapovany', 'Handicapovaný'),
        ('akutni adoptce', 'Akutní adopce')
    ], validators=[validators.InputRequired()])

    pohlavi = SelectField('Pohlaví', choices=[('Pes', 'Pes'), ('Fena', 'Fena')], validators=[validators.InputRequired()])
    popis = TextAreaField('Popis', validators=[validators.InputRequired()])
    utulek_choices = [(utulek.nazev, utulek.nazev) for utulek in Utulek.query.all()]
    utulek_nazev = SelectField('Název útulku', choices=utulek_choices, validators=[validators.InputRequired()])
    fotografie = FileField('Fotografie', validators=[FileAllowed(['jpg', 'png', 'jpeg'], 'Images only!')])
    submit = SubmitField(label=('Přidat'))

    def validate_jmeno(self, jmeno):
        excluded_chars = "*?!'^+%&/()=}][{$#_.,012356789"
        for char in jmeno.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání jména.')
            
    def validate_rasa(self, rasa):
        excluded_chars = "*?!'^+%&/()=}][{$#_.,012356789"
        for char in rasa.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání rasy.')


class EditPesForm(FlaskForm):
    ockovani = SelectField('Očkování', choices=[('Ano', 'Ano'), ('Ne', 'Ne')], validators=[validators.InputRequired()])
    jmeno = StringField('Jméno', validators=[validators.InputRequired()])
    rasa = StringField('Rasa', validators=[validators.InputRequired()])
    vek = SelectField('Věk', choices=[
        ('2 - 6 měs', '2 - 6 měs'),
        ('6 měs - 2 roky', '6 měs - 2 roky'),
        ('2 - 8 let', '2 - 8 let'),
        ('8 a více', '8 a více')
    ], validators=[validators.InputRequired()])
    velikost = SelectField('Velikost', choices=[
        ('maly', 'Malý'),
        ('stredni', 'Střední'),
        ('velky', 'Velký')
    ], validators=[validators.InputRequired()])
    stav = SelectField('Stav', choices=[
        ('kastrovany', 'Kastrovaný'),
        ('handicapovany', 'Handicapovaný'),
        ('akutni adoptce', 'Akutní adopce')
    ], validators=[validators.InputRequired()])
    pohlavi = SelectField('Pohlaví', choices=[('Pes', 'Pes'), ('Fena', 'Fena')], validators=[validators.InputRequired()])
    popis = TextAreaField('Popis', validators=[validators.InputRequired()])
    utulek_choices = [(utulek.nazev, utulek.nazev) for utulek in Utulek.query.all()]
    utulek_nazev = SelectField('Název útulku', choices=utulek_choices, validators=[validators.InputRequired()])
    fotografie = FileField('Fotografie', validators=[FileAllowed(['jpg', 'png'], 'Images only!')])
    submit = SubmitField(label=('Uložit změny'))

    def validate_jmeno(self, jmeno):
        excluded_chars = "*?!'^+%&/()=}][{$#_.,012356789"
        for char in jmeno.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání jména.')
            

class FilterForm(FlaskForm):
    pohlavi = SelectField('Pohlaví', choices=[('', 'Any'),('Pes', 'Pes'), ('Fena', 'Fena')])
    vek = SelectField('Věk', choices=[('', 'Any'),('2 - 6 měs', '2 - 6 měs'),('6 měs - 2 roky', '6 měs - 2 roky'),('2 - 8 let', '2 - 8 let'),('8 a více', '8 a více')])
    velikost = SelectField('Velikost', choices=[('', 'Any'),('maly', 'Malý'),('stredni', 'Střední'),('velky', 'Velký')])
    ockovani = SelectField('Očkování', choices=[('', 'Any'),('Ano', 'Ano'), ('Ne', 'Ne')])
    stav = SelectField('Stav', choices=[('', 'Any'),('kastrovany', 'Kastrovaný'),('handicapovany', 'Handicapovaný'),('akutni adoptce', 'Akutní adopce')])
    utulek_nazev = SelectField('Název útulku', choices=[], coerce=str)

    submit = SubmitField('Apply Filters')


class MestoAddForm(FlaskForm):
    nazev = StringField('Název', validators=[validators.InputRequired()])
    kraj = StringField('Kraj', validators=[validators.InputRequired()])
    psc = IntegerField('PSČ', validators=[validators.InputRequired()])
    submit = SubmitField('Přidat Mesto')

            
    def validate_kraj(self, kraj):
        excluded_chars = "*?!'^+%&/()=}][{$#_.,012356789"
        for char in kraj.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání jména.')
            
    def validate_nazev(self, nazev):
        excluded_chars = "*?!'^+%&/()=}][{$#_.,012356789"
        for char in nazev.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání jména.')
            

class UtulekAddForm(FlaskForm):
    nazev = StringField('Název', validators=[validators.InputRequired()])
    adresa = StringField('Kraj', validators=[validators.InputRequired()])
    mesto_choices = [(mesto.nazev, mesto.nazev) for mesto in Mesto.query.all()]
    mesto_nazev = SelectField('Město', choices=mesto_choices, validators=[validators.InputRequired()])
    submit = SubmitField('Přidat')

            
    def validate_adresa(self, adresa):
        excluded_chars = "*?!'^+%&/()=}][{$#_."
        for char in adresa.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání jména.')
            
    def validate_nazev(self, nazev):
        excluded_chars = "*?!'^+%&/()=}][{$#_."
        for char in nazev.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání jména.')