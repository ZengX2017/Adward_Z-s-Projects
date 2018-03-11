# -*- coding: utf-8 -*-
__author__ = 'Adward_Z'

from flask import Blueprint

home = Blueprint("home", __name__)

import app.home.views