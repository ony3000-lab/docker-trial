# docker-trial
Docker와 Docker Compose 써보기

## docker 운영에 필요한 CLI 명령어들

### Container Image 빌드

`Dockerfile`이 있는 상태에서 아래 명령어를 실행.

```bash
$ docker build -t (Image 이름) .
$ docker build -t getting-started .
```

### App Container 실행

```bash
$ docker run -dp (pc의 포트 번호):(container의 포트 번호) (빌드에 사용한 Image 이름)
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
