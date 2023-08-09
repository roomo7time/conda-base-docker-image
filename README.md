
Build the corresponding image by 
```bash
docker build -t <image name>:<tag name> .
```
In my case:
```bash
docker build -t aivsw/research:0.1 .
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
  -v /home/jay/workspace/codes/research:/app/algorithms \
  -v /home/jay/mnt/hdd/workspace/datasets:/app/datasets \
  --name research_container aivsw/research:0.1 /bin/bash
```

