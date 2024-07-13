import '../extension/bitflag.dart';

/// Class for managing bitfields represented as integers.
class BitField<BitType extends Enum> {
  /// Set of bit flags.
  BigInt value;

  /// Create bit field from bigint.
  BitField(this.value);

  /// Create empty bit field.
  BitField.empty() : value = BigInt.zero;

  /// Create bit field from int.
  BitField.fromInt(int value) : value = BigInt.from(value);

  /// Create bit field from JSON int.
  factory BitField.fromJson(int value) => BitField.fromInt(value);

  /// Add a bit flag to the field.
  void add(BitType bit) => value |= bit.flag;

  /// Remove a bit flag from the field.
  void remove(BitType bit) => value &= ~bit.flag;

  /// Check if a specific bit flag is present in the field.
  bool contains(BitType bit) => (value & bit.flag) == bit.flag;

  /// Check if a specific bit flag is missing from the field.
  bool missing(BitType bit) => !contains(bit);

  /// Gets value of a specific bit flag is present in the field.
  bool operator [](BitType bit) => contains(bit);

  /// Sets value of a specific bit flag is present in the field.
  void operator []=(BitType bit, bool value) => value ? add(bit) : remove(bit);

  /// Check if bitfield values equals.
  @override
  bool operator ==(Object other) => other is BitField && other.value == value;

  /// Return bit field in JSON format.
  int toJson() => value.toInt();

  @override
  String toString() => 'BitField(bitType: $BitType, value: $value)';

  @override
  int get hashCode => value.hashCode;
}
