# see-gpu-label-script

A tool to see your gpu's name.

this script currently is only designed to work for Ubuntu linux.

[![asciicast?](https://asciinema.org/a/321696.png)](https://asciinema.org/a/321696)
This video was made when see-gpu-label-script was still in version 2.0. i will eventually update it.

sᴇᴇ-ɢᴘᴜ-ʟᴀʙᴇʟ-sᴄʀɪᴘᴛ ᴅᴏᴇs ɴᴏᴛ ʀᴇǫᴜɪʀᴇ sᴜᴘᴇʀᴜsᴇʀ, ʙᴜᴛ ʀᴇsᴜʟᴛs ᴍᴀʏ ʙᴇ ɪɴᴀᴄᴄᴜʀᴀᴛᴇ ɪғ ʏᴏᴜ ᴅᴏɴᴛ ʀᴜɴ ɪᴛ ᴀs sᴜᴘᴇʀᴜᴇʀ.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

See deployment for notes on how to deploy the project on a live system.


### Getting the script

Get the script:
```
git clone https://github.com/W1ll1am04/see-gpu-label-script/
```
# Executing & Setup

cd into see-gpu-label-script directory.
```
cd see-gpu-label-script
```
Assign permission.
```
chmod +x gpu.sh
```
Boom, now run the script:
```
./gpu.sh
```
## Parameters
```
usage: ./gpu.sh [arg].
A tool to see your gpu's name.
Arguments & usage, and an explanation: 

-h, --help        display this message."
-n, --no-su       dont request superuser permission.
-g, --gpu-only    display gpu label only.
-c, --chip        display chip label only.
```
## License

This project is licensed under the GPL-3.0 license - see the [LICENSE](LICENSE) file for details
