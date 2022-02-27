import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  /// constructor for the user class
  const User(
    this.userId,
    this.email,
  );

  final String userId;
  final String email;

  @override
  String toString() => 'User(userId: $userId,email: $email)';

  @override
  List<Object> get props => [userId, email];

  static const empty = User('-', '-');
}
