// generated by diplomat-tool

part of 'lib.g.dart';

final class _LineBreakOptionsFfi extends ffi.Struct {
  @ffi.Int32()
  external int strictness;
  @ffi.Int32()
  external int wordOption;
  @ffi.Bool()
  external bool jaZh;
}

/// See the [Rust documentation for `LineBreakOptions`](https://docs.rs/icu/latest/icu/segmenter/struct.LineBreakOptions.html) for more information.
final class LineBreakOptions {
  LineBreakStrictness strictness;
  LineBreakWordOption wordOption;
  bool jaZh;

  LineBreakOptions({
    required this.strictness,
    required this.wordOption,
    required this.jaZh,
  });

  // This struct contains borrowed fields, so this takes in a list of
  // "edges" corresponding to where each lifetime's data may have been borrowed from
  // and passes it down to individual fields containing the borrow.
  // This method does not attempt to handle any dependencies between lifetimes, the caller
  // should handle this when constructing edge arrays.
  // ignore: unused_element
  LineBreakOptions._fromFfi(_LineBreakOptionsFfi ffi)
    : strictness = LineBreakStrictness.values[ffi.strictness],
      wordOption = LineBreakWordOption.values[ffi.wordOption],
      jaZh = ffi.jaZh;

  // ignore: unused_element
  _LineBreakOptionsFfi _toFfi(ffi.Allocator temp) {
    final struct = ffi.Struct.create<_LineBreakOptionsFfi>();
    struct.strictness = strictness.index;
    struct.wordOption = wordOption.index;
    struct.jaZh = jaZh;
    return struct;
  }

  @override
  bool operator ==(Object other) =>
      other is LineBreakOptions &&
      other.strictness == strictness &&
      other.wordOption == wordOption &&
      other.jaZh == jaZh;

  @override
  int get hashCode => Object.hashAll([strictness, wordOption, jaZh]);
}
