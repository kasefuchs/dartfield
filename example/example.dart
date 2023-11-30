import 'package:dartfield/dartfield.dart';

enum MemberPermissions {
  createInvites,
  kickMembers,
  banMembers,
  administrator,
  manageChannels,
  manageGuild
}

void main() {
  // Create empty bitfield.
  final BitField<MemberPermissions> emptyBitField = BitField.empty();

  // Add createInvites & manageChannels flags.
  emptyBitField
    ..add(MemberPermissions.createInvites)
    ..add(MemberPermissions.manageChannels);

  // Or set it via braces.
  emptyBitField[MemberPermissions.createInvites] = true;

  // Get enum value.
  print(emptyBitField.value);

  // Create bitfield from int.
  final BitField<MemberPermissions> intBitField = BitField.fromInt(17);

  // Check if it has manageGuild flag.
  print(intBitField.contains(MemberPermissions.manageGuild));

  // Or get it via braces.
  print(intBitField[MemberPermissions.manageChannels]);

  // Check if it missing createInvites flag.
  print(intBitField.missing(MemberPermissions.createInvites));

  // Check equality of bitfields.
  print(intBitField == emptyBitField);
}
