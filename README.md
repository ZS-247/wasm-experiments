This repo contains some of my experiments with compiling c code to webassembly.
I have not used emcc or any special toolchains/runtimes for this. 
I have used clang and llvm to direct compile the c code to webassembly and called it from javascript.

The resulting site is available [here](https://zs-247.github.io/wasm-experiments/)

## How to run locally

Wasm doesnt need a server to run, you can run it locally by opening the html file in a browser. As explained in the site, wasm can be directly embeded in the html file, however for convienience a simple python script will run a webserver that serves everything correctly.

### Prerequisites

- Python 3 (for the webserver)
- clang (for compiling the c code if you want to make changes)
- a browser that supports webassembly (most modern browsers do)


### Running the site

1. Clone the repo
    ```bash
    git clone <repo-url>
    cd <repo-name>
    ```
2. Run the python server
    ```bash
    python webserver.py # by default it runs on port 8000 and serves the current directory.
    ```
3. Open the browser and go to `http://localhost:8000`

The javascript code will load the wasm file and run the functions defined in the c code. The output will be displayed as an alert box. (note, your browser may warn you about supressing alerts)

The javascript code is currently embeded inside index.html, purely for convienience and simplicity.
