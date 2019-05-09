#!/bin/sh

wget https://raw.githubusercontent.com/monarch-initiative/dipper/master/dipper/curie_map.yaml -O curie_map.yaml
wget https://raw.githubusercontent.com/monarch-initiative/monarch-cypher-queries/master/src/main/cypher/dynamic-queries/cypher.yaml -O cypher.yaml

sed 's/^/    /' curie_map.yaml > curies_indented.yaml

sed -e '/INJECT_CURIES/ {r curies_indented.yaml
                         d}' monarchConfiguration.yaml.tmpl > monarchConfiguration.yaml.tmp

sed -e '/INJECT_QUERIES/ {r cypher.yaml
                          d}' monarchConfiguration.yaml.tmp > monarchConfiguration.yaml

rm monarchConfiguration.yaml.tmp
