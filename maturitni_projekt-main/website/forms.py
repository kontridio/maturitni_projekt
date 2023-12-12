from flask_wtf import FlaskForm
from wtforms import StringField, SelectField, FileField, TextAreaField, validators, SubmitField
from wtforms.validators import ValidationError, Length
from flask_wtf.file import FileAllowed

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
    utulek_nazev = StringField('Název útulku', validators=[validators.InputRequired()])
    fotografie = FileField('Fotografie', validators=[FileAllowed(['jpg', 'png'], 'Images only!')])
    submit = SubmitField(label=('Přidat'))

    def validate_jmeno(self, jmeno):
        excluded_chars = " *?!'^+%&/()=}][{$#_.,"
        for char in jmeno.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání jména.')
            
    def validate_rasa(self, rasa):
        excluded_chars = " *?!'^+%&/()=}][{$#_.,"
        for char in rasa.data:
            if char in excluded_chars:
                raise ValidationError(f'Znak "{char}" nemůže být použit při zadávání rasy.')
