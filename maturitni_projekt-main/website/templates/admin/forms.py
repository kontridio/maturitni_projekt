from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SelectField, FileField
from wtforms.validators import Email, InputRequired, Length
from ....website.models import User

def email_is_available(email):
    if not email:
        return True
    return not User.find_by_email(email)

def username_is_available(username):
    # Implement as needed
    pass

class EmailForm(FlaskForm):
    email = StringField('Email Address', validators=[
        Email(message="Please enter a valid email address"),
        InputRequired(message="You can't leave this empty")
    ])

class LoginForm(EmailForm):
    password = PasswordField('Password', validators=[
        InputRequired(message="You can't leave this empty")
    ])

    remember_me = BooleanField('Keep me logged in')

class ResetPasswordForm(FlaskForm):
    password = PasswordField('New password', validators=[
        Length(min=6, max=30, message="Please use between 6 and 30 characters"),
        InputRequired(message="You can't leave this empty")
    ])

    confirm = PasswordField('Repeat password')

class RegistrationForm(FlaskForm):
    username = StringField('Choose your username', validators=[
        Length(min=6, max=30, message="Please use between 6 and 30 characters"),
        InputRequired(message="You can't leave this empty")
    ])

    email = StringField('Your email address', validators=[
        Email(message="Please enter a valid email address"),
        InputRequired(message="You can't leave this empty")
    ])

    password = PasswordField('Create a password', validators=[
        Length(min=6, max=30, message="Please use between 6 and 30 characters"),
        InputRequired(message="You can't leave this empty")
    ])

class EditUserForm(FlaskForm):
    username = StringField('Choose your username', validators=[
        Length(min=6, max=30, message="Please use between 6 and 30 characters"),
        InputRequired(message="You can't leave this empty")
    ])

    email = StringField('Your email address', validators=[
        Email(message="Please enter a valid email address"),
        InputRequired(message="You can't leave this empty")
    ])

    password = PasswordField('Create a password', validators=[
        Length(min=6, max=30, message="Please use between 6 and 30 characters"),
        InputRequired(message="You can't leave this empty")
    ])

    card_number = StringField('Your access Card number')

    full_name = StringField('Full Name', validators=[
        InputRequired(message="You can't leave this empty")
    ])

    access = SelectField('Access', choices=[('A', 'SuperAdmin'), ('B', 'Admin'), ('U', 'User')])