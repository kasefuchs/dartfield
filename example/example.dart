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

  // Get enum value.
  print(emptyBitField.value);

  // Create bitfield from int.
  final BitField<MemberPermissions> intBitField = BitField.fromInt(38);

  // Check if it has manageGuild flag.
  print(intBitField.contains(MemberPermissions.manageGuild));
}
