#!/bin/bash

chown -R hass:hass /config

exec su -c "hass --config /config" hass
