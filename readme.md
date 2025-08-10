# MarvelStatus iOS app

THIS PROJECT WAS CREATED WITH THE MARVEL API DOWN. LOOK AT THE BOTTOM OF THIS README TO SEE A CURL LOG

## Installation
An installation package is already created in this repository. Download the repository and execute file `MarvelStatus.pkg` inside `Products` directory.

## How to Build
Before building this project, open it with Xcode and change in "Signing & capabilities" your own **Team** of your **Apple Developer Account**.

### Setup Instructions

1. **Marvel API Keys**:
   - Register at https://developer.marvel.com/account to obtain your public and private API keys.
   - Create a file `Sources/Utilities/Secrets.swift` with the following content:
     ```swift
     enum Secrets {
         static let marvelPublicKey = "YOUR_PUBLIC_KEY"
         static let marvelPrivateKey = "YOUR_PRIVATE_KEY"
     }
     ```

### How to launch tests from command line
Open `Terminal` app, navigate to this repository base path, and execute the followin command:
```sh
xcodebuild test -project MarvelStatus.xcodeproj -scheme MarvelStatus -destination 'platform=macOS' -verbose
```

### How to create installation package
This command creates the installable.

1. First build the project opening Xcode and selecting the menu option `Product > Archive`.
2. The press button `Distribute App`, select `Debugging` and press `Distribute` then `Export`.
3. Select any directory to copy the product, like your `Downloads` path.
4. Then copy the `MarvelStatus.app` to this repository base path.
5. Finally open `Terminal`, navigate to this repository base path, and execute the followin command:
   _ IMPOSTANT: change the certificate name (--sign parameter) to use your one one of type "Mac App Distribution". Create one if you don't have it_
   ```sh
   productbuild --component MarvelStatus.app /Applications \
                --scripts MarvelStatus/Resources/Scripts \            
                --sign "3rd Party Mac Developer Installer: Daniel Vela (TW65EXAM4U)" \
                MarvelStatus.pkg
   ```

# CURL LOG
```sh
https://gateway.marvel.com/v1/public/comics?ts=1754843490&apikey=5d1741d58d87413f1b25c251334c0244&hash=d97e660eb871e6fe89d5865c74cd6af2&limit=50
* Host gateway.marvel.com:443 was resolved.
* IPv6: (none)
* IPv4: 35.171.74.87, 54.165.58.75, 52.6.50.111
*   Trying 35.171.74.87:443...
* Connected to gateway.marvel.com (35.171.74.87) port 443
* ALPN: curl offers h2,http/1.1
* (304) (OUT), TLS handshake, Client hello (1):
*  CAfile: /etc/ssl/cert.pem
*  CApath: none
* (304) (IN), TLS handshake, Server hello (2):
* (304) (IN), TLS handshake, Unknown (8):
* (304) (IN), TLS handshake, Certificate (11):
* (304) (IN), TLS handshake, CERT verify (15):
* (304) (IN), TLS handshake, Finished (20):
* (304) (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / AEAD-AES128-GCM-SHA256 / [blank] / UNDEF
* ALPN: server accepted h2
* Server certificate:
*  subject: CN=marvel.com
*  start date: Jan  6 00:00:00 2025 GMT
*  expire date: Feb  4 23:59:59 2026 GMT
*  subjectAltName: host "gateway.marvel.com" matched cert's "*.marvel.com"
*  issuer: C=US; O=Amazon; CN=Amazon RSA 2048 M03
*  SSL certificate verify ok.
* using HTTP/2
* [HTTP/2] [1] OPENED stream for https://gateway.marvel.com/v1/public/comics?ts=1754843490&apikey=5d1741d58d87413f1b25c251334c0244&hash=d97e660eb871e6fe89d5865c74cd6af2&limit=50
* [HTTP/2] [1] [:method: GET]
* [HTTP/2] [1] [:scheme: https]
* [HTTP/2] [1] [:authority: gateway.marvel.com]
* [HTTP/2] [1] [:path: /v1/public/comics?ts=1754843490&apikey=5d1741d58d87413f1b25c251334c0244&hash=d97e660eb871e6fe89d5865c74cd6af2&limit=50]
* [HTTP/2] [1] [user-agent: curl/8.7.1]
* [HTTP/2] [1] [accept: */*]
> GET /v1/public/comics?ts=1754843490&apikey=5d1741d58d87413f1b25c251334c0244&hash=d97e660eb871e6fe89d5865c74cd6af2&limit=50 HTTP/2
> Host: gateway.marvel.com
> User-Agent: curl/8.7.1
> Accept: */*
> 
* Request completely sent off
< HTTP/2 418 
< date: Sun, 10 Aug 2025 16:31:31 GMT
< content-type: application/json; charset=utf-8
< content-length: 80
< x-amzn-requestid: 927a08ca-8d8c-4143-bed6-5e08ac747f6c
< x-amzn-remapped-content-length: 80
< x-amzn-remapped-connection: close
< x-amz-apigw-id: PGRniEamoAMEQqg=
< x-amzn-remapped-date: Sun, 10 Aug 2025 16:33:00 GMT
< 
* Connection #0 to host gateway.marvel.com left intact
```
{"code":"ImATeapotError","message":"I am a teapot: Error: Server not available"}
