# ROC Tax Filing for macOS
This is a [Homebrew](https://brew.sh) Formula for the tax filing program in ROC.
The origin installer on [ipfs](https://ipfs.io/ipfs/zBurK93rmxR5oXZZu87YN8C8Bf9D8DxoRPZU5AsfhuDTFR3T4iZmBVHfR93a1NNWNNnydzXVJGD3gfdhFrY19QeiH2Zv7) as a record.
## Usage
Run this in shell:
```
brew install atkinschang/ROC-Tax-Filing/roctaxfiling
runHIPKILocalServer.sh
```
Then you are able to use [https://efile.tax.nat.gov.tw/irxw/index.jsp](https://efile.tax.nat.gov.tw/irxw/index.jsp).
## Why I create this?
I'd like to keep my mac *clean* and *safe*.
The origin installer [script](https://gist.github.com/AtkinsChang/5be357c20583c1ed7bd8c9e9a656cc78) runs most command with `sudo`.
It creates a lot of files under root permission in your home directory and pollute your `~/bin` and `~/lib`.
```
$ ls -FGlAhp ~/Library/HiPKILocalSignServer
total 32
-rw-r--r--   1 root    staff   6.0K May 12 17:19 .DS_Store
drwxr-xr-x   9 root    staff   288B May 12 17:19 CardManagement/
-rwxr-xr-x   1 root    staff    15K May 12 17:19 ChtPopupForm.htm
-rwxr-xr-x   1 root    staff   1.9M May 12 17:19 HiPKIDecrypt.exe
-rwxr-xr-x   1 root    staff   1.9M May 12 17:19 HiPKISign.exe
-rwxr-xr-x   1 root    staff   1.6M May 12 17:19 HiPKIWriteCert.exe
-rwxr-xr-x   1 root    staff   1.6M May 12 17:19 ListInfo.exe
-rwxr-xr-x   1 root    staff    50B May 12 17:19 Module_CardManagement.txt
-rwxr-xr-x   1 root    staff    66B May 12 17:19 Module_HiPKILocalSignServer.txt
-rwxr-xr-x   1 root    staff   5.1K May 12 17:19 ReleaseNote.txt
-rwxr-xr-x   1 root    staff   1.3K May 12 17:19 addDomain.htm
-rw-r--r--   1 atkins  staff   872B May 12 17:19 debug.log.2018-05-12
drwxr-xr-x  12 root    staff   384B May 12 17:19 digits/
-rwxr-xr-x   1 root    staff    13K May 12 17:19 errorcode.js
-rw-r--r--   1 atkins  staff   923B May 12 17:19 exceptions.log.2018-05-12
-rwxr-xr-x   1 root    staff    32K May 12 17:19 hipkiFuncs.js
-rwxr-xr-x   1 root    staff    17K May 12 17:19 hipkiLocalServer.js
-rwxr-xr-x   1 root    staff   660B May 12 17:19 hipkilog.js
-rwxr-xr-x   1 root    staff   1.7M May 12 17:19 libHicos_p11v1.dylib
-rw-r--r--   1 atkins  staff   229B May 12 17:19 log.HIPKILocalServer.install.txt
-rwxr-xr-x   1 root    staff    23M May 12 17:19 node
drwxr-xr-x  55 root    staff   1.7K May 12 17:19 node_modules/
-rwxr-xr-x   1 root    staff   2.6K May 12 17:19 popupForm.htm
-rwxr-xr-x   1 root    staff    17K May 12 17:19 selfTest.htm
-rwxr-xr-x   1 root    staff     2B May 12 17:19 whiteList.txt
```
```
$ ls -FGlAhp ~/bin
total 1
-rwxr-xr-x  1 root  staff    53B May 12 17:19 checkHIPKILocalServer.sh
-rwxr-xr-x  1 root  staff    97B May 12 17:19 runHIPKILocalServer.sh
-rwxr-xr-x  1 root  staff    56B May 12 17:19 stopHIPKILocalServer.sh
```
```
$ ls -FGlAhp ~/lib
total 2
-rwxr-xr-x  1 root  staff   1.7M May 12 17:19 libHicos_p11v1.dylib
```
And the installer will also install `RunAtLoad` startup script with [launchctl](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/launchctl.1.html) to start it with OS.
```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.node.HIPKILocalServer.cht</string>
    <key>Nice</key>
    <integer>1</integer>
    <key>ProgramArguments</key>
    <array>
        <string>zsh</string>
        <string>-c</string>
        <string>~/bin/runHIPKILocalServer.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```
