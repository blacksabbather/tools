/usr/bin/curl https://svcs.sandbox.paypal.com/AdaptivePayments/Pay \
  -s \
  --insecure \
  -H "X-PAYPAL-SECURITY-USERID: sb-typ8v15519_api1.business.example.com" \
  -H "X-PAYPAL-SECURITY-PASSWORD: PHWYRCFEUNRUWQWM" \
  -H "X-PAYPAL-SECURITY-SIGNATURE: A8iHridokODAOI7h2cIy.B4KWYROATOxwKKfowLJLXvlpOtm0cNuCNt9" \
  -H "X-PAYPAL-REQUEST-DATA-FORMAT: NV" \
  -H "X-PAYPAL-RESPONSE-DATA-FORMAT: NV" \
  -H "X-PAYPAL-APPLICATION-ID: APP-80W284485P519543T" \
  -d "actionType=PAY&clientDetails.applicationId=APP-80W284485P519543T&clientDetails.ipAddress=127.0.0.1&currencyCode=USD&feesPayer=EACHRECEIVER&memo=Example&receiverList.receiver(0).amount=25.00&receiverList.receiver(0).email=jay_wong-sellercn@me.com&receiverList.receiver(0).primary=true&receiverList.receiver(1).amount=5.00&receiverList.receiver(1).email=jay_wong-selllerhk@me.com&receiverList.receiver(1).primary=false&requestEnvelope.errorLanguage=en_US&returnUrl=http://example.com/success.html&cancelUrl=http://example.com/cancel.html"
