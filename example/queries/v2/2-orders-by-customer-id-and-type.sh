
# can query by combining pk and sk

aws dynamodb query \
--table-name orders-v2 \
--index-name "customer-type-index" \
--key-condition-expression "#customerId = :customerId and begins_with(#typeSourceTypeSourceId, :typeSourceTypeSourceId)" \
--expression-attribute-names '{"#customerId":"customerId", "#typeSourceTypeSourceId": "type-sourceType-sourceId"}' \
--expression-attribute-values '{":customerId":{"S":"8f639181-7258-458c-be66-c81762a8e4d8"},
                                ":typeSourceTypeSourceId": {"S": "purchase"}}' \
--endpoint-url http://localhost:8000


