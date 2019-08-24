# Git Server running in Docker container

## Running

* Prepare `authorized_keys` file:
```
cat ~/.ssh/github/pkruczek.pub > authorized_keys
```

* Create repos dir
```
mkdir repos
```

* Build image (x86)
```
sudo docker build -t git-server .
```
* Build image (arm)
```
sudo docker build -t git-server -f Dockerfile.arm .
```

## Creating a repo

```
cd repos
mkdir project.git
cd project.git
git init --bare
```

## Start a server
```
./start-server
```

## Set remote repo in git project
```
git remote add origin git@gitserver:repos/project.git
```
