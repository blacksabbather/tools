TOKEN=$1
BAID=`curl https://api-3t.sandbox.paypal.com/nvp \
  -d User=jay_wong-sellercn_api1.me.com \
  -d PWD=REHEFEM88Y4HXG9Y \
  -d SIGNATURE=Aeyfrd2qh4o90InMoav7DxUO4HVOAQ619yX4nJXBuDGj0nPTTKlZcf3E \
  -d METHOD=CreateBillingAgreement \
  -d VERSION=204 \
  -d L_BILLINGTYPE0=MerchantInitiatedBilling \
  -d L_BILLINGAGREEMENTDESCRIPTION0=ClubUsage \
  -d TOKEN=$TOKEN \
  -d cancelUrl=https://example.com/cancel \
  -d returnUrl=https://example.com/success | perl -ne 'print $1."\n" if(/BILLINGAGREEMENTID=(\S+?)&/);'`
echo $BAID
