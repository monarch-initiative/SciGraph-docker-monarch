#!/bin/sh

sed -e '/MONARCH_GLOBAL/ {r monarch-load-global.yaml
                         d}' monarchLoadConfiguration.yaml.tmpl > monarchLoadConfiguration.yaml
