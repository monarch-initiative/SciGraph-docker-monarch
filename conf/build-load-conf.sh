#!/bin/sh

sed -e '/MONARCH_GLOBAL/ {r monarch-load-global.yaml
                         d}' ./conf/monarchLoadConfiguration.yaml.tmpl > ./conf/monarchLoadConfiguration.yaml
