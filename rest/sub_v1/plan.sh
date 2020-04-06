token=$1
/usr/bin/curl -X POST https://api.sandbox.paypal.com/v1/payments/billing-plans/ \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" \
-d '{
  "name": "Plan with Regular and Trial Payment Definitions",
  "description": "Plan with regular and trial payment definitions.",
  "type": "FIXED",
  "payment_definitions": [
    {
      "name": "Regular payment definition",
      "type": "REGULAR",
      "frequency": "MONTH",
      "frequency_interval": "2",
      "amount": {
        "value": "39",
        "currency": "USD"
      },
      "cycles": "12",
      "charge_models": [
        {
          "type": "SHIPPING",
          "amount": {
            "value": "10",
            "currency": "USD"
          }
        },
        {
          "type": "TAX",
          "amount": {
            "value": "12",
            "currency": "USD"
          }
        }
      ]
    },
    {
      "name": "Trial payment definition",
      "type": "TRIAL",
      "frequency": "WEEK",
      "frequency_interval": "5",
      "amount": {
        "value": "9.19",
        "currency": "USD"
      },
      "cycles": "2",
      "charge_models": [
        {
          "type": "SHIPPING",
          "amount": {
            "value": "1",
            "currency": "USD"
          }
        },
        {
          "type": "TAX",
          "amount": {
            "value": "2",
            "currency": "USD"
          }
        }
      ]
    }
  ],
  "merchant_preferences": {
    "setup_fee": {
      "value": "1",
      "currency": "USD"
    },
    "return_url": "https://example.com",
    "cancel_url": "https://example.com/cancel",
    "auto_bill_amount": "YES",
    "initial_fail_amount_action": "CONTINUE",
    "max_fail_attempts": "0"
  }
}'
