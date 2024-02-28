# MORSE CODE LIBRARY FOR ZIG!!!

> Using this you can convert character to morse code and vice-verse.

## How to dry run:

Please run:
- `git clone https://github.com/RohanVashisht1234/morse.git`
- `zig build run_example`

## How to use in your project:

Run the following in terminal:
- `$ mkdir my_morse`
- `$ cd my_morse`
- `$ zig init-exe`
Create a `build.zig.zon` file.

- Enter the following:
```zon
.{
    .name = "my_morse",
    .version = "0.0.0",
    .dependencies = .{
        // morse v0.0.0
        .morse = .{
            .url = "https://github.com/RohanVashisht1234/morse/archive/refs/tags/morse.tar.gz",
            .hash = "12202c6a33bb65f1f8d5c75631fa49b8f2b98f166df5576fc9729dc50888bb05f761",
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
