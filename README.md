# Project - Hangman

A ruby implementation of [Hangman](https://en.wikipedia.org/wiki/Hangman_(game))

This project is part of the *Odin Project* curriculum. [Link to the project's description](
https://www.theodinproject.com/lessons/ruby-hangman)


## Running the project :

### 1. Clone this repository

You can clone the repository using HTTPS:

```bash
git clone https://github.com/AliAdamH/project-hangman.git
```
Or clone it using SSH:

```bash
git clone git@github.com:AliAdamH/project-hangman.git
```

### 2. Navigate the project's directory

```bash
cd project-hangman
```


### 3. Running the project :

#### 3.1 If you have Ruby 3.3.4 installed locally :

```bash
ruby hangman.rb
```

#### 3.2 Using Docker

1. Create an image : 

```bash
docker build . -t aliadamh/hangman:latest
```

2. Run the image in a container :

```bash
docker run -it aliadamh/hangman:latest
```

_N.B: Given how containers work, and that no external volume exists, if you save a game and stop the container, the save file won't be stored. Only the exisiting save file will be loaded when running the image again._ 
