token=$1
planid=$2
curl -X POST https://api.sandbox.paypal.com/v1/billing/subscriptions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $token" \
  -d '{
        "plan_id": "'$planid'",
        "start_time": "2020-02-01T00:00:00Z",
        "quantity": "1.5",
        "shipping_amount": {
            "currency_code": "USD",
            "value": "10.00"
        },
        "subscriber": {
          "name": {
              "given_name": "John",
              "surname": "Doe"
          },
          "email_address": "customer@example.com",
          "shipping_address": {
              "name": {
                  "full_name": "John Doe"
              },
              "address": {
                  "address_line_1": "2211 N First Street",
                  "address_line_2": "Building 17",
                  "admin_area_2": "San Jose",
                  "admin_area_1": "CA",
                  "postal_code": "95131",
                  "country_code": "US"
              }
          }
        },
        "application_context": {
          "brand_name": "example",
          "locale": "en-US",
          "shipping_preference": "SET_PROVIDED_ADDRESS",
          "user_action": "SUBSCRIBE_NOW",
          "payment_method": {
              "payer_selected": "PAYPAL",
              "payee_preferred": "IMMEDIATE_PAYMENT_REQUIRED"
          },
          "return_url": "https://example.com/returnUrl",
          "cancel_url": "https://example.com/cancelUrl"
        }
      }'
