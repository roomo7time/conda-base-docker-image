
Build the corresponding image by 
```bash
docker build -t <image name>:<tag name> .
```
In my case:
```bash
docker build -t aivsw/research:mm-cu11.8-u20 .
```

Run the container by
```bash
docker run -it --gpus all --ipc host \
  -v <path to directory in host>:<path to directory in container> \
  --name <container name> <image name or id> /bin/bash
```
For example:
```bash
docker run -it --gpus all --ipc host \
  -v /home/jay/projects:/app/projects \
  -v /home/jay/mnt/hdd/data:/app/data \
  --name research_mm aivsw/research:mm-cu11.8-u20 /bin/bash
```

