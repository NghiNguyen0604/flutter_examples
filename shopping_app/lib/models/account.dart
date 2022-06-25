// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Account {
  String email;
  String wwid;
  Account({
    required this.email,
    required this.wwid,
  });

  Account copyWith({
    String? email,
    String? wwid,
  }) {
    return Account(
      email: email ?? this.email,
      wwid: wwid ?? this.wwid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'wwid': wwid,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      email: map['email'] as String,
      wwid: map['wwid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Account(email: $email, wwid: $wwid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account && other.email == email && other.wwid == wwid;
  }

  @override
  int get hashCode => email.hashCode ^ wwid.hashCode;
}
