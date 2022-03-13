# docker-trial
Docker와 Docker Compose 써보기

## docker 운영에 필요한 CLI 명령어들

### Container Image 빌드

`Dockerfile`이 있는 상태에서 아래 명령어를 실행.

```bash
$ docker build -t (image 이름) .
$ docker build -t getting-started .
```

### App Container 실행

```bash
$ docker run -dp (host의 포트 번호):(container의 포트 번호) (image 이름)
$ docker run -dp 3000:3000 getting-started
```

### 실행 중인 Container 보기

```bash
$ docker ps
```

### 실행 중인 Container 중단하기

`docker ps`를 통해 container ID를 확인할 수 있음.

```bash
$ docker stop (중단하려는 container의 ID)
```

### 중단된 Container 제거하기

```bash
$ docker rm (제거하려는 container의 ID)
```

### Container에서 명령어 실행하기

다음 두 가지 방법 중 하나를 사용한다.

1. docker desktop의 대시보드에서 container의 CLI 아이콘 클릭 &rarr; 생성되는 터미널 창에서 명령어 실행
2. container ID를 사용해서 로컬 터미널 창에서 명령어 실행

```bash
$ docker exec (container의 ID) (명령어)
```

### Container의 파일 시스템

모든 container는 독립된 파일 시스템을 가진다. 같은 image로부터 실행되었다 할지라도.

### Container Volume

volume을 사용하면, host의 디스크 공간을 container의 특정 디렉토리에 mount할 수 있다. container에서 해당 디렉토리에 파일을 추가하거나 삭제하면 host에서도 확인할 수 있고, 새로운 container를 실행할 때 같은 volume을 사용하면, 파일 시스템과 별개로 해당 디렉토리는 공유할 수 있다.

### 이름있는 Volume 생성하기

```bash
$ docker volume create (volume 이름)
```

### Volume과 함께 App Container 실행

```bash
$ docker run -dp (host의 포트 번호):(container의 포트 번호) -v (생성한 volume 이름):(volume을 mount할 container의 절대경로) (image 이름)
$ docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
```

### Volume이 생성되는 host 경로 확인하기

다음 명령어를 통해, container에 mount되는 host의 디스크 공간(`Mountpoint`)을 확인할 수 있다.\
단, Docker Desktop을 사용 중인 경우, docker 명령어는 작은 VM에서 실행되고, `Mountpoint` 역시 그 VM에서의 경로를 나타낸다.

```bash
$ docker volume inspect (volume 이름)
```

### Bind mount

bind mount는 volume을 다루는 또다른 방식이다. bind mount를 사용하면 host의 특정 디렉토리를 container에 mount할 수 있다.

### Bind mount와 함께 App Container 실행

PowerShell에서 명령어 개행 시, `\` 대신 `` ` `` 를 사용해야 한다.

```bash
$ docker run -dp (host의 포트 번호):(container의 포트 번호) \
    -w (명령이 실행될 container의 절대경로) \
    -v (host의 디렉토리 경로):(volume을 mount할 container의 절대경로) \
    (image 이름) \
    (working directory에서 실행 할 명령어)
$ docker run -dp 3000:3000 \
    -w /app \
    -v "$(pwd):/app" \
    node:12-alpine \
    sh -c "yarn install && yarn run dev"
```
