# Use this script to build the install package

First, build the app (Product > Archive > Distribute App > Developer ID Application).

Then sse `productbuild` in Terminal, this way:
```bash
productbuild --component /path/to/MarvelComicsBar.app /Applications --sign "Developer ID Installer: Your Name" MarvelComicsBar.pkg
```

Include post-install scripts if needed (e.g., for LaunchAgent).
