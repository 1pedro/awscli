
#can't query by createdAt, so we need to add a filter expression

aws dynamodb query \
--table-name orders-v2 \
--index-name "customer-createdat-index" \
--key-condition-expression "#customerId = :customerId and #createdAt between :from and :to" \
--expression-attribute-names '{"#customerId":"customerId", "#createdAt": "createdAt-sourceType-sourceId"}' \
--expression-attribute-values '{":customerId":{"S":"8f639181-7258-458c-be66-c81762a8e4d8"},
                                ":from": {"S": "2024-03-25:00:00Z"},
                                ":to":   {"S": "2024-06-26:00:00Z"}}' \
--endpoint-url http://localhost:8000
