# MarvelStatus iOS app

## Setup Instructions

1. **Marvel API Keys**:
   - Register at https://developer.marvel.com/account to obtain your public and private API keys.
   - Create a file `Sources/Utilities/Secrets.swift` with the following content:
     ```swift
     enum Secrets {
         static let marvelPublicKey = "YOUR_PUBLIC_KEY"
         static let marvelPrivateKey = "YOUR_PRIVATE_KEY"
     }
     ```
