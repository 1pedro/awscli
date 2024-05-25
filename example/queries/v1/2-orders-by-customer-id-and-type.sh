
# can query by combining pk and sk

aws dynamodb query \
--table-name orders-v1 \
--key-condition-expression "#customerId = :customerId and begins_with(#sourceTypeAndsourceId, :sourcetype)" \
--expression-attribute-names '{"#customerId":"customerId", "#sourceTypeAndsourceId": "sourceTypeAndsourceId"}' \
--expression-attribute-values '{":customerId":{"S":"8f639181-7258-458c-be66-c81762a8e4d8"},
                                ":sourcetype": {"S": "off-app"}}' \
--endpoint-url http://localhost:8000



# since it will query then filter
# there are chances that not all purchases will come

aws dynamodb query \
--table-name orders-v1 \--key-condition-expression "#customerId = :customerId" \
--expression-attribute-names '{"#customerId":"customerId", "#type": "type"}' \
--expression-attribute-values '{":customerId":{"S":"8f639181-7258-458c-be66-c81762a8e4d8"}, ":type": {"S": "purchase"}}' \
--filter-expression "#type = :type" \
--endpoint-url http://localhost:8000
