
#can't query by createdAt, so we need to add a filter expression

aws dynamodb query \
--table-name orders-v1 \
--key-condition-expression "#customerId = :customerId" \
--expression-attribute-names '{"#customerId":"customerId", "#createdAt": "created-at"}' \
--expression-attribute-values '{":customerId":{"S":"8f639181-7258-458c-be66-c81762a8e4d8"},
                                ":from": {"S": "2024-03-25:00:00Z"},
                                ":to":   {"S": "2024-06-25:00:00Z"}}' \
--filter-expression "#createdAt between :from and :to" \
--endpoint-url http://localhost:8000
