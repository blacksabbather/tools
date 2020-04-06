var express = require('express');
var fs = require('fs');
var https = require('https');
var app = express();
var request = require('request');
const debug = require('debug')('myapp:server');
const path = require('path');
const multer = require('multer');

var storage = multer.diskStorage({
	destination: (req, file, cb) => {
		cb(null, './public/uploads')
	},
	filename: (req, file, cb) => {
		cb(null, file.originalname.replace(/\.[^/.]+$/, "") + '-' + Date.now() + path.extname(file.originalname))
	}
});

const upload = multer({ storage: storage });


app.use(express.urlencoded({extended:false}));
app.use(express.json());

//app.post('/testUpload', upload.single(path.basename(file.originalname)), function(req,res) {
app.post('/testUpload', upload.single('file'), function(req,res) {
	debug(req.file);
	console.log('storage location is ', req.hostname +'/' + req.file.path);
	return res.send(req.file);
})

app.get('/', function (req, res) {;
  res.send('hello world');
});
app.get('/img', function(req, res) { //main page
	fs.readFile('./public/uploads/file-1564719366194.JPG', function (err, html) {
		if (err) {
			throw err;
		}
		res.writeHeader(200, {"Content-Type":"image/jpg"}); 
		res.write(html); 
		res.end();
	})
})

app.post('/webhook_notify',function(req,res){
	console.log(req.body);
	//console.log(req)
	req_str=JSON.stringify(req, censor(req));
	fs.writeFile('./req',req_str,function(err){
		if(err){return console.log(err);}
	});
	res.sendStatus(200);
	vm={};
	vm['transmission_id']=req.rawHeaders[3];
	vm['transmission_time']=req.rawHeaders[5];
	vm['transmission_sig']=req.rawHeaders[7];
	vm['cert_url']=req.rawHeaders[11];
	vm['auth_algo']=req.rawHeaders[13];
	//vm['webhook_id']='9AS42747UM3693616';
	vm['webhook_id']='2J6195117J8851008';
	vm['webhook_event']=req.body;
	var options={
		headers:{
			'Content-Type':'application/json',
		},
		auth: {
			            //'user': 'AfZ3B_U6qEtvXCTulLxrXoOtpAop9M3gA-mAxR58_aygJiSbNciYFDTf4DP3DkP1Au3qSHhdeKHnPLtG',
			            //'pass': 'EP74QlkpPUZsmWzpExZ5aWqee3lZVHsL6WLDgEcJDK-dAJcTWECPaZcw410gPtKVUPZcGSDPz9f2uPZC',
			            'user': 'Ad-jqY2OjCqMDRZiKXabXA2yXO2WTAiRcRdgr-iIAV03ytTIdUMiwI3h527fpEVua524ztpX6HU3SuyM',
			            'pass': 'EBE-kSB38QuMOFhM6mHWKf5aU0VHuOpfY-XAtLAGadqSMByndDHYGDhW6lUmJoGz9rpuOCLV43zn7k5S',
		},
		url:"https://api.sandbox.paypal.com/v1/notifications/verify-webhook-signature",
		body:JSON.stringify(vm),
		method:'POST',
	};
	request(options,function(err,resp,body){
		console.log('verification response is ...');
		console.log(body);
		console.log(new Date());
	});
});


https.createServer({
  key: fs.readFileSync('server.key'),
  cert: fs.readFileSync('server.cert'),
}, app).listen(443, function() {
  console.log('Example app listening on port 443! Go to https://localhost:443/');
});

function censor(censor) {
	var i = 0;
	return function(key, value) {
		if(i !== 0 && typeof(censor) === 'object' && typeof(value) == 'object' && censor == value) 
			return '[Circular]'; 
		if(i >= 29) // seems to be a harded maximum of 30 serialized objects?
			return '[Unknown]';
		++i; // so we know we aren't using the original object anymore
		return value;  
	}
}
