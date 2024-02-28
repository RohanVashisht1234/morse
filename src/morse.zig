// AUTHOR: Rohan Vashisht
// Library: Morse code generator (only for Zig).
// This library provides different functionalities for
// managing morse code in zig programming language.

const std = @import("std");
const allocator = std.heap.page_allocator; // declare the allocator I will use forever

// A declared non-global hashmap for string.
pub var my_hash_map = std.StringHashMap([]const u8).init(allocator);

// TODO:
// fn get_morse_for_chars(prov_string: []const u8) ![]const u8 {
//     var res = "";
//     for (prov_string) |value| {
//         var character_upper = std.ascii.toUpper(value);
//         var z = [_]u8{character_upper};
//         var vale = my_hash_map.get(&z);
//         if (vale) |vel| {
//             var dz = [_][]const u8{ res, vel };
//             res = try std.mem.concat(std.heap.page_allocator, u8, &dz);
//         } else {
//             res = try comptime std.fmt.allocPrint(std.heap.page_allocator, res, "XX"); // return this if unknown symbol found
//         }
//     }
// }

/// # Takes input as u8, outputs morse code as []const u8.
/// `returns XX if unknown character is passed.`
///
/// `Example usage:`
/// ```zig
/// const std = @import("std");
/// const morse = @import("morse.zig");
///
/// pub fn main() !void {
///     try morse.init();
///     var a_morse = morse.get_morse_from_char('A');
///     std.debug.print("Morse code for a is: {s} \n", .{a_morse});
/// }
/// ```
pub fn get_morse_from_char(character: u8) []const u8 {
    var character_upper = std.ascii.toUpper(character); // because dictionary only has upper case chars
    var z = [_]u8{character_upper}; // converted u8 to []const u8 because dictionary only has []const u8
    var val = my_hash_map.get(&z); // finding the value from the hash map
    if (val) |value| { // checking if value was found in hashmap or not
        return value; // returned the value if found
    } else { // if not found:
        return "XX"; // return XX if unknown symbol found
    }
    return "XX"; // unreachable code (dead code) whatever you call it!!!
}

/// # Takes input morse code as []const u8, outputs character as u8.
/// `returns § if unknown morse code is passed!`
///
/// `Example usage:`
/// ```zig
/// const std = @import("std");
/// const morse = @import("morse.zig");
///
/// pub fn main() !void {
///     try morse.init();
///     var character = morse.get_char_from_morse(".-");
///     std.debug.print(".- is the morse code for: {s} \n", .{character});
/// }
/// ```
pub fn get_char_from_morse(morse_chars: []const u8) []const u8 {
    var x = my_hash_map.iterator();
    while (x.next()) |item| {
        if (std.mem.eql(u8, morse_chars, item.value_ptr.*)) {
            return item.key_ptr.*;
        }
    }
    return "§";
}

/// # Please initialize morse code library before use!!!!
///
/// `Example Usage:`
///
/// ```zig
/// const std = @import("std");
/// const morse = @import("morse.zig");
///
/// pub fn main() !void {
///     try morse.init(); // DON'T FORGET
///     var a_morse = morse.get_morse_from_char('A');
///     std.debug.print("Morse code for a is: {s} \n", .{a_morse});
/// }
/// ```
pub fn init() !void {
    try my_hash_map.put("A", ".-");
    try my_hash_map.put("B", "-...");
    try my_hash_map.put("C", "-.-.");
    try my_hash_map.put("D", "-..");
    try my_hash_map.put("E", ".");
    try my_hash_map.put("F", "..-.");
    try my_hash_map.put("G", "--.");
    try my_hash_map.put("H", "....");
    try my_hash_map.put("I", "..");
    try my_hash_map.put("J", ".---");
    try my_hash_map.put("K", "-.-");
    try my_hash_map.put("L", ".-..");
    try my_hash_map.put("M", "--");
    try my_hash_map.put("N", "-.");
    try my_hash_map.put("O", "---");
    try my_hash_map.put("P", ".--.");
    try my_hash_map.put("Q", "--.-");
    try my_hash_map.put("R", ".-.");
    try my_hash_map.put("S", "...");
    try my_hash_map.put("T", "-");
    try my_hash_map.put("U", "..-");
    try my_hash_map.put("V", "...-");
    try my_hash_map.put("W", ".--");
    try my_hash_map.put("X", "-..-");
    try my_hash_map.put("Y", "-.--");
    try my_hash_map.put("Z", "--..");
    try my_hash_map.put("0", "-----");
    try my_hash_map.put("1", ".----");
    try my_hash_map.put("2", "..---");
    try my_hash_map.put("3", "...--");
    try my_hash_map.put("4", "....-");
    try my_hash_map.put("5", ".....");
    try my_hash_map.put("6", "-....");
    try my_hash_map.put("7", "--...");
    try my_hash_map.put("8", "---..");
    try my_hash_map.put("9", "----.");
    try my_hash_map.put(".", ".-.-.-");
    try my_hash_map.put(",", "--..--");
    try my_hash_map.put("?", "..--..");
    try my_hash_map.put("'", ".----.");
    try my_hash_map.put("!", "-.-.--");
    try my_hash_map.put("/", "-..-.");
    try my_hash_map.put("(", "-.--.");
    try my_hash_map.put(")", "-.--.-");
    try my_hash_map.put("&", ".-...");
    try my_hash_map.put(",", "---...");
    try my_hash_map.put(";", "-.-.-.");
    try my_hash_map.put("=", "-...-");
    try my_hash_map.put("+", ".-.-.");
    try my_hash_map.put("-", "-....-");
    try my_hash_map.put("_", "..--.-");
    try my_hash_map.put("\"", ".-..-.");
    try my_hash_map.put("$", "...-..-");
    try my_hash_map.put("@", ".--.-.");
    try my_hash_map.put(" ", "/");
}
