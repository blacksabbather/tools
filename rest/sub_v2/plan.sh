token=$1
prodid=$2
curl -X POST https://api.sandbox.paypal.com/v1/billing/plans \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $token" \
  -d '{
        "product_id": "'$prodid'",
        "name": "Basic Plan",
        "description": "Basic plan",
        "billing_cycles": [
          {
            "frequency": {
                "interval_unit": "MONTH",
                "interval_count": 1
            },
            "tenure_type": "TRIAL",
            "sequence": 1,
            "total_cycles": 1
          },
            {
              "frequency": {
                "interval_unit": "MONTH",
                "interval_count": 1
              },
              "tenure_type": "REGULAR",
              "sequence": 2,
              "total_cycles": 12,
              "pricing_scheme": {
                "fixed_price": {
                  "value": "10",
                  "currency_code": "USD"
                }
              }
            }
          ],
        "payment_preferences": {
          "service_type": "PREPAID",
          "auto_bill_outstanding": true,
          "setup_fee": {
            "value": "10",
            "currency_code": "USD"
          },
          "setup_fee_failure_action": "CONTINUE",
          "payment_failure_threshold": 3
        },
        "quantity_supported": true,
        "taxes": {
          "percentage": "10",
          "inclusive": false
        }
    }'|jq ".id"
