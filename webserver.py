import http.server
import socketserver
import sys
PORT = 8000
OPENBROWSER = True
# Argument parsing for port number and open browser
if len(sys.argv) > 1:
    length = len(sys.argv)
    for i in range(1, length):
        if sys.argv[i] == "--port" and i+1 < length:
            PORT = int(sys.argv[i+1])
        if sys.argv[i] == "--openbrowser" and i+1 < length:
            if sys.argv[i+1] == "false":
                OPENBROWSER = False
# Open browser if flag is set
if OPENBROWSER:
    try:
        import webbrowser
        webbrowser.open(f"http://127.0.0.1:{PORT}")
    except ModuleNotFoundError:
        print("Module webbrowser not found.")
        print("Please open your browser and navigate to:")
        print(f"http://localhost:{PORT}")
        print("You may supress this message by passing the argument:")
        print("\"--openbrowser false\"")


Handler = http.server.SimpleHTTPRequestHandler
Handler.extensions_map.update({
    '.wasm': 'application/wasm',
})

socketserver.TCPServer.allow_reuse_address = True
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    httpd.allow_reuse_address = True
    print("serving at port", PORT)
    httpd.serve_forever()
