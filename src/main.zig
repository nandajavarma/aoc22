const std = @import("std");

const day1 = @import("day01.zig").main;

pub fn main() !void {
    // Initizalise the allocator. Using GPA
    var allocator = std.heap.page_allocator;


    try day1(allocator);

}
