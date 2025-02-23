If you're running on Docker Desktop, ensure that:
- You turn on Containerd images (Settings > General > Use containerd for pulling and storing images)
- Turn on WASM (Settings > Features in development > Enable Wasm)

# `buildx` extends build capabilities with BuildKit (like for Wasm)
```
docker buildx build --platform wasi/wasm -t gowasm .
```

```
# With wasmtime
docker run --rm --runtime=io.containerd.wasmtime.v1 --platform=wasi/wasm gowasm:latest

# With wasmedge (another Wasm runtime)
docker run --rm --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm gowasm:latest
```