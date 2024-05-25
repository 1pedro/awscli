aws dynamodb query \
--table-name orders-v2 \
--key-condition-expression "#customerId = :customerId" \
--expression-attribute-names '{"#customerId":"customerId"}' \
--expression-attribute-values '{":customerId":{"S":"8f639181-7258-458c-be66-c81762a8e4d8"}}' \
--endpoint-url http://localhost:8000
