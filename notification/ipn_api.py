from flask import Flask,request
from flask_restful import Resource, Api, reqparse
import sys
import urllib.parse
import requests
import json

VERIFY_URL='https://www.sandbox.paypal.com/cgi-bin/webscr'
VERIFY_URL_PROD = 'https://ipnpb.paypal.com/cgi-bin/webscr'

app=Flask(__name__, static_url_path='')

api=Api(app)

class ipnNotify(Resource):
    def post(self):
        #pass
        vm=request.form.copy()
        print(vm)
        vm['cmd']='_notify-validate'
        #headers = {'content-type': 'application/x-www-form-urlencoded','user-agent': 'Python-IPN-Verification-Script'}
        headers = {'content-type': 'application/x-www-form-urlencoded'}
        r = requests.post(VERIFY_URL, params=vm, headers=headers, verify=True)
        r.raise_for_status()
        print(r.text)
        return r.text

class ipnNotifyProd(Resource):
    def post(self):
        #pass
        vm=request.form.copy()
        print(vm)
        vm['cmd']='_notify-validate'
        #headers = {'content-type': 'application/x-www-form-urlencoded','user-agent': 'Python-IPN-Verification-Script'}
        headers = {'content-type': 'application/x-www-form-urlencoded'}
        r = requests.post(VERIFY_URL_PROD, params=vm, headers=headers, verify=True)
        r.raise_for_status()
        print(r.text)
        return r.text

api.add_resource(ipnNotify, '/ipn_notify')
api.add_resource(ipnNotifyProd, '/ipn_notify_prod')
@app.route('/PDT',methods=['GET'])
def PDT():
    #print(request.args.get('tx'))
    data={
            'cmd':'_notify-synch',
            'tx':request.args.get('tx'),
            #'at':'p43Fj0AS2_rzpij2r6BO2b5ix4NxPK4QVEn7kNrBHe6Zlrg3ZC-BaGpQX8',
            #'at':'ec_YxP7c53sQnxAa5EJgxqC2U7-LHijSIUIV5VE5_lbb_x0ADdNGNMZNN1C',
            #'at':'wfPXUlP66cO-QKfE94xMFeJC3uugvIBys96mzy4rVq6jxw7HpkDVlLu3euC',
            'at':'b-y0SgkH51YxP5L7yRuJ_Z04vZJRkuWTh_Hvd0A4CcN72pN79ORLbaE8ZaS',
    }
    response=requests.post('https://www.sandbox.paypal.com/cgi-bin/webscr',data=data)
    #print(json.dumps(response))
    #print(response.headers)
    #print(response.content)
    #print(response.text)
    return {'hello': response.text+' sandbox'}
#api.add_resource(PDT, '/PDT')
@app.route('/PDTPROD',methods=['GET'])
def PDTPROD():
    data={
            'cmd':'_notify-synch',
            'tx':request.args.get('tx'),
            'at':'2tFUehq4aDs_AqkLkwKrxGGs2NSzzQqt1_OcJBWntX4RVzwN5lL7H3YjsKO',
    }
    response=requests.post('https://www.paypal.com/cgi-bin/webscr',data=data)
    print(response.text)
    print(response.headers)
    print(response.content)
    return {'hello': response.text}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int("80"), debug=False)
