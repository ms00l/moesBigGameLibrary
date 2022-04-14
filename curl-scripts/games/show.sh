#!/bin/sh

API="http://localhost:4741"
URL_PATH="/games"
ID="62582eaf06b25e5e6ed96f31"
TOKEN="fbe7c2e40bd509befe85a7932a67662d"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
