apnspembuild
============
a simple shell script to build your iOS push notification pem files for development and production<br>
<br>
The script needs 3 parameter<br>
1. the Development Push SSL Certificate which you configured in the iOS Provisioning Portal<br>
2. Production Push SSL Certificate which you configured in the iOS Provisioning Portal<br>
3. the private key you used for Certificate Request<br>
<br>
Example: <br>
./apnspembuild.sh aps_development.cer aps_production.cer privatekey.p12 
<br>
The script generates a new folder with the pem files