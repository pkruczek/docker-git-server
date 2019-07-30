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

* Build image 
```
sudo docker build -t git-server .
```

## Creating a repo

```
cd repos
mkdir project.git
cd project.git
git init --bare
```

## Set remote repo in git project
```
git remote add origin git@gitserver:repos/project.git
```
