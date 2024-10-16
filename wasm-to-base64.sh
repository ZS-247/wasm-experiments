# For convience, this script will convert a wasm file to a base64 string
# and output the boilerplate code to load it.
# Usage: ./wasm-to-base64.sh <wasm-file>
# By default it will output to your console
# You can simply >> to a file or pass the argument --file to avoid cluttering your console.

# Check parameters
if [ "$#" -lt 1 ]; then 
    echo "Usage: ./wasm-to-base64.sh <wasm-file>"
    exit 1
fi
# Check if file exists
if [ ! -f $1 ]; then
    echo "File $1 not found!"
    exit 1
fi

# Check if we should output to a file. If so remove the file if it exists and redirect the output
if [ "$2" == "--file" ]; then
    exec 3>&1 # Save the current stdout to file descriptor 3
    base64_file=$1.base64.js
    if [ -f $base64_file ]; then
        rm $base64_file
    fi
    exec 1>$base64_file
fi

wasm_file=$1
base64_file=$wasm_file.base64
# convert to base64 and remove newlines
base64_str=$(base64 $wasm_file | tr -d '\n')

echo "const wasmBase64 = \"data:application/wasm;base64,$base64_str\";"
echo "const wasmBytes = Uint8Array.from(atob(wasmBase64.split(',')[1]), c => c.charCodeAt(0));"
echo "const wasmModule = new WebAssembly.Module(wasmBytes);"
echo "const wasmInstance = new WebAssembly.Instance(wasmModule);"

# If we output to a file we stop redirecting the output and print a message 
if [ "$2" == "--file" ]; then
    # to stop redirecting the output we need restore stdout
    exec 1>&3
    echo "Base64 string saved to $base64_file"
else
    echo "Copy the above code to your project."
fi
echo "All done. Press ctrl-c to exit :)"
sleep 50 # Just to make sure the user sees the message
