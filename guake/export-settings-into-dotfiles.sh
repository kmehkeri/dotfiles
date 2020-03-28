#!/bin/bash

dconf dump /apps/guake/ > guake-config
dconf dump /org/gnome/desktop/notifications/application/guake/ > guake-notifications
