#!/bin/bash

chown -R hass:hass /config

exec su --preserve-environment -c "hass --config /config" hass
