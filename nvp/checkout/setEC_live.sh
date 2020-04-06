TOKEN=`curl https://api-3t.paypal.com/nvp \
  -d USER=bstestaccount1_api1.163.com \
  -d PWD=ANT683RNCPRUGN3M \
  -d SIGNATURE=AZwU5FStorQXztpiAP9YQMp0Y3WpAxheclOrpqFyXr2oj8DOTFiu1CgL \
  -d METHOD=SetExpressCheckout \
  -d VERSION=204 \
  -d AMT=101 \
  -d PAYMENTACTION=Sale \
  -d LANDINGPAGE=Billing \
  -d SOLUTIONTYPE=Sole \
  -d USERSELECTEDFUNDINGSOURCE=CreditCard \
  -d cancelUrl=https://example.com/cancel \
  -d returnUrl=https://example.com/success | perl -ne 'print $1."\n" if(/TOKEN=(\S+?)&/);'`
echo "https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=$TOKEN"
