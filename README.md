# Rev/Pwn kali configuration


This is simply a dockerized version of kali linux configured with noVNC and vncserver to support rev/pwn stuff.

It comes preinstalled with gdb pwndbg (run it using gdb)

To access the server noVNC navigate to this [link](http://localhost:9020/vnc.html?resize=scale)

## Usage

Clone the repository to either your `Windows` or `Linux` and use the appropriate build script to install and run. After than you can either run the container through the docker GUI or use this command

When using for the first time, cd into the repository and do

```powershell
./build_docker.bat
```

on windows and

```bash
chmod +x build_docker.sh
./build_docker.sh
```

on linux.

Once you have done this, the container will run. But from subsequent runs of the container simply use the below command on both windows and linux:

```bash
docker run -it -p 9020:9020 -p 9021:5900 rev-pwn
```

Also this supports VNC so if that's your thing connect to VNC through port 9021.

## Personal Note
Obviously this is not full featured but I tried to do what I can. If you want uncomment the line in the dockerfile if you want to install ghidra along with the rest of the stuff. 

Star this repo if you like it pls :).

Enjoy!
