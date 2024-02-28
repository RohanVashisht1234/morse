# MORSE CODE LIBRARY FOR ZIG!!!

> Using this you can convert character to morse code and vice-verse.

## How to dry run:

Please run:
- `git clone `
- `zig build run_example`

## How to use in your project:

Run the following in terminal:
- `$ mkdir my_morse`
- `$ cd my_morse`
- `$ zig init-exe`
Create a `build.zig.zon` file.

- Enter the following:
```json
.{
    .name = "my_morse"
    .version = "0.0.0"
    .dependencies = .{
        // morse v0.0.0
        .morse = .{
            .url = "https://github.com/",
            .hash = "2352345198349059",
        }
    }
}
```
Now, inside build.zig enter:
- 
```zig
const morse = b.dependency("morse", .{
    .target = target,
    .optimize = optimize,
});
exe.addModule("morse", morse.module("morse"));
```
Now, inside main.zig add:

```zig
const std = @import("std");
const morse = @import("morse");
const print = std.debug.print;

pub fn main() !void {
    try morse.init();
    var character = morse.get_char_from_morse(".-");
    print(".- is the morse code for: {s} \n", .{character});
    var a_morse = morse.get_morse_from_char('A');
    print("Morse code for a is: {s} \n", .{a_morse});
}

```
- Run `zig build run`
- Enjoy morse coding ...

# MADE BY: ROHAN VASHISHT