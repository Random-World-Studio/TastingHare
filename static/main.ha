use fmt;
use io;
use os;

let items: [4]int = [1, 3, 3, 7];

export fn main() void = {
	// Example A: Static globals
	printitems();
	items[3] = 1;
	items[0] = 7;
	printitems();

	// Example B: Static locals
	fmt::println(increment())!;
	fmt::println(increment())!;
	fmt::println(increment())!;

	// Example C: Applied static allocation
	const file = os::open(os::args[1])!;
	static let buffer: [65535]u8 = [0...];
	const n = io::read(file, buffer)! as size;
	io::write(os::stdout, buffer[..n])!;
};

fn printitems() void = {
	fmt::println(items[0], items[1], items[2], items[3])!;
};

fn increment() int = {
	static let x: int = 41;
	x += 1;
	return x;
};
