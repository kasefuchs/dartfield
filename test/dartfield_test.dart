import 'package:dartfield/dartfield.dart';
import 'package:test/test.dart';

enum Bits {
  first,
  second,
  third,
}

void main() {
  group(BitField, () {
    test('should add bit', () {
      final BitField<Bits> bitField = BitField<Bits>.empty();

      bitField.add(Bits.first);

      expect(bitField.value, BigInt.one);
    });

    test('should remove bit', () {
      final BitField<Bits> bitField = BitField<Bits>.fromInt(3);

      bitField.remove(Bits.first);

      expect(bitField.value, BigInt.two);
    });

    test('should detect if bit exists', () {
      final BitField<Bits> bitField = BitField<Bits>.fromInt(3);

      final bool bitExists = bitField.contains(Bits.first);

      expect(bitExists, true);
    });

    test('should detect if bit missing', () {
      final BitField<Bits> bitField = BitField<Bits>.fromInt(5);

      final bool bitMissing = bitField.missing(Bits.second);

      expect(bitMissing, true);
    });

    test('should return string representation', () {
      final BitField<Bits> bitField = BitField<Bits>.fromInt(5);

      final String representation = bitField.toString();

      expect(representation, 'BitField(bitType: Bits, value: 5)');
    });
  });
}
