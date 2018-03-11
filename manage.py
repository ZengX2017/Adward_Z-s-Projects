# -*- coding: utf-8 -*-
__author__ = 'Adward_Z'

from app import app
from flask_script import Manager

manage = Manager(app)

if __name__ == "__main__":
    app.run()