const std = @import("std");
const expect = std.testing.expect;


var input:  []const u8 =
    \\1000
    \\2000
    \\3000
    \\
    \\4000
    \\
    \\5000
    \\6000
    \\
    \\7000
    \\8000
    \\9000
    \\
    \\10000
    ;

pub fn partA(numbers: std.ArrayList(usize)) usize {
    var max_sum: usize = 0;
    var current_sum: usize = 0;
    var idx: usize = 0;
    while (idx < numbers.items.len) {
        const val = numbers.items[idx];
        if (val == 0) {
            if (current_sum > max_sum) {
                max_sum = current_sum;
            }

            current_sum = 0;
        } else {
            current_sum = current_sum + val;
        }
        idx++;
    }

    return max_sum;
}

pub fn partB(numbers: std.ArrayList(usize)) usize {
    var first: usize = 0
    var second: usize = 0
    var third: usize = 0

    var current_sum: usize = 0;
    var idx: usize = 0;
    while (idx < numbers.items.len) {
        const val = numbers.items[idx];
        if (val == 0) {
            if (current_sum > third) {
                if (current_sum > second) {
                    if (current_sum > third) {
                        
                    }
                }
            }

            current_sum = 0;
        } else {
            current_sum = current_sum + val;
        }

        idx = idx + 1;
    }

    return max_sum;
}
        

pub fn main(allocator: std.mem.Allocator) !void {
    const file_path: []const u8 = "inputs/day01/input.txt";

    const content = try readFile(allocator, file_path);

    const numbers = try readNumsFromFile(allocator, content);

    const ansA = partA(numbers);

    std.debug.print("Part A answer is, {d}!\n", .{ansA});
}

pub fn readFile(allocator: std.mem.Allocator, filePath: []const u8) ![]const u8 {
    var buff = try allocator.alloc(u8, 100000);
    const contents: []const u8 = try std.fs.cwd().readFile(filePath, buff);
    return contents;
}

pub fn readNumsFromFile(allocator: std.mem.Allocator, content: []const u8) !std.ArrayList(usize) {
    var numbers = std.ArrayList(usize).init(allocator);
    var builder: usize = 0;

    for(content) |char| {
        if(char == '\n') {
        try numbers.append(builder);
        builder = 0;
        } else {
        builder = builder * 10 + char - 48;
        }
    }
    if(builder != 0) try numbers.append(builder);

    return numbers;
}

test "most calories an elf is carrying is 24000 for partA" {
    const allocator = std.heap.page_allocator;

    const numbers = try readNumsFromFile(allocator, input);
    
    try expect(partA(numbers) == 24000 );
}
