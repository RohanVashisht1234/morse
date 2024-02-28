const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "morse_example",
        .root_source_file = .{ .path = "examples/example.zig" },
        .target = target,
        .optimize = optimize,
    });
    var morse_module = b.createModule(.{
        .source_file = .{ .path = "src/morse.zig" },
    });

    // register the module so it can be referenced using the package manager.
    try b.modules.put(b.dupe("morse"), morse_module);
    exe.addModule("morse", morse_module);

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run_example", "Run the example 1");
    run_step.dependOn(&run_cmd.step);
}
