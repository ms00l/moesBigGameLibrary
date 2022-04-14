#!/bin/sh

API="http://localhost:4741"
URL_PATH="/games"
TOKEN="fbe7c2e40bd509befe85a7932a67662d"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
