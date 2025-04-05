
1. Components
Components are self-contained units of WebAssembly code. They're compiled, portable, and have well-defined interfaces. Unlike raw WebAssembly modules, components are designed for composition - they can be combined to build larger applications.
Your greeter.go implements a simple component that provides a greeting function.

2. Interfaces
Interfaces define the API between components. They specify:
Functions that can be called
Types that can be passed between components
Resources that can be managed
In your greeter.wit file, you've defined the greeter interface with a greet function that takes a string name and returns a string greeting.

3. Worlds
A "world" in the Component Model describes the boundary between a component and its environment. It specifies:
What the component imports (uses from other components)
What the component exports (provides to other components)

A world is composed of interfaces, but each interface is directional -it indicates whether the interface is available for outside code to call (an "export"), or whether outside code must fulfill the interface for the component to call (an "import").

4. WIT (WebAssembly Interface Type)
WIT is a language for defining interfaces between WebAssembly components. It provides:
A way to describe types across language boundaries
A standard format for interface definitions
Documentation of component APIs
The syntax is designed to be human-readable and language-neutral.

5. Packages
Packages are a way to distribute and version WebAssembly components. They provide:
Metadata about the component
Version information
Dependencies on other packages
To explore packaging concepts, you could:

6. Guest
The “guest” means the application code that you’re writing. For example, if I write a Rust function called run and that function is going into my WIT file as an export, that means the Rust code/file/function is the “guest”.