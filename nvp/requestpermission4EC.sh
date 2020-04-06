curl https://svcs.sandbox.paypal.com/Permissions/RequestPermissions \
 -H "X-PAYPAL-SECURITY-USERID: jay_wong-sellercn_api1.me.com" \
 -H "X-PAYPAL-SECURITY-PASSWORD: REHEFEM88Y4HXG9Y" \
 -H "X-PAYPAL-SECURITY-SIGNATURE: Aeyfrd2qh4o90InMoav7DxUO4HVOAQ619yX4nJXBuDGj0nPTTKlZcf3E" \
 -H "X-PAYPAL-REQUEST-DATA-FORMAT: NV" \
 -H "X-PAYPAL-RESPONSE-DATA-FORMAT: NV" \
 -H "X-PAYPAL-APPLICATION-ID : APP-80W284485P519543T" \
 -d "requestEnvelope.errorLanguage=en_US&scope(0)=EXPRESS_CHECKOUT&scope(1)=REFUND&callback=http://my/callback"
