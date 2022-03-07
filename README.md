# PKD Project - Face Generator 🎨 

Using [Gloss Library](https://hackage.haskell.org/package/gloss) to generate faces based on user input.

## Installation

### Pre-compiled binary

Download the binary from the releases page and run it from a terminal, nothing else should be required! (Except maybe some OpenGL dependencies)

### Building from source

#### Linux

Install the OpenGL dependencies 
``` 
sudo apt-get install libglu1-mesa-dev freeglut3-dev mesa-common-dev
```

Install Gloss library
```
cabal update
cabal install gloss
```

Compile the Main.hs file and run it.

#### Windows

If you're running on Windows, I would refer to [this guide!](https://linusblog.netlify.app/haskell_gloss_wsl/)

## Usage

The program is run through a CLI, where the options will be displayed to you with explanations for the different options in the program window.

To start the program, run the downloaded binary or by compiling the Main.hs file.