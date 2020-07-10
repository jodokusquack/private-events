# Private Events

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations?ref=lnav),
an online curriculum for learing web development.

The goal of the project is to practice Rails associations and to work with
the Active Record Gem of the framework.

In the app Users can create and invite people to Events/Parties and those guests
can then attend.

!Spoiler: These are the data models I used to tackle this problem:

INSERT MODELS HERE

In the beginning I created the suggested "sign in" process which doesn't require
password but afterwards I switched to a proper User model with the gem 'devise'.

The styling is done with Bootstrap and all extra credit so not included in the original
project description.


The following points gave me trouble during the excersize:
* `local: true` in the Users form.
    * I had to set this option in the Rails Forms Helper
        because otherwise it wouldn't recognise any errors
        on the model. It would rerender the form, but no
        additional classes where added to the fields that
        produced the errors.
