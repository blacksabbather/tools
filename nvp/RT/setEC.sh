TOKEN=`curl https://api-3t.sandbox.paypal.com/nvp \
  -d User=jay_wong-sellercn_api1.me.com \
  -d PWD=REHEFEM88Y4HXG9Y \
  -d SIGNATURE=Aeyfrd2qh4o90InMoav7DxUO4HVOAQ619yX4nJXBuDGj0nPTTKlZcf3E \
  -d METHOD=SetExpressCheckout \
  -d VERSION=204 \
  -d PAYMENTREQUEST_0_PAYMENTACTION=AUTHORIZATION \
  -d PAYMENTREQUEST_0_AMT=25.00 \
  -d L_BILLINGTYPE0=MerchantInitiatedBilling \
  -d L_BILLINGAGREEMENTDESCRIPTION0=ClubUsage \
  -d cancelUrl=https://example.com/cancel \
  -d returnUrl=https://example.com/success | perl -ne 'print $1."\n" if(/TOKEN=(\S+?)&/);'`
echo "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=$TOKEN"
