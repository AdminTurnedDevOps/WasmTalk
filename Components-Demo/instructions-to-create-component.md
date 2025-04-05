## To Create A Module
```
GOOS=wasip1 GOARCH=wasm go build -o main.wasm main.go
```

Tinygo is doing the work of looking at the code and generating `WIT` based on what you use. The caveat is that it only does that for things that it understands (what's covered by WASI P2 interfaces)

## To Create A Component
```
tinygo build -o greeter.wasm --target=wasip2 main.go
```

## Validate Component
```
wasm-tools component wit greeter.wasm
```