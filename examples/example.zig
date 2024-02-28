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
