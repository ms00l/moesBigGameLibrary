#!/bin/bash
API="http://localhost:4741"
URL_PATH="/games"
ID="6256e2ee8d046a49c0a663a9"
TOKEN="fbe7c2e40bd509befe85a7932a67662d"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
