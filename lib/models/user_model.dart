class UserModel {
  final String id;
  final String email;
  final bool emailVisibility;
  final bool verified;
  final String? name;
  final String? avatar;
  final DateTime created;
  final DateTime updated;

  UserModel({
    required this.id,
    required this.email,
    required this.emailVisibility,
    required this.verified,
    this.name,
    this.avatar,
    required this.created,
    required this.updated,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      emailVisibility: json['emailVisibility'] ?? false,
      verified: json['verified'] ?? false,
      name: json['name'],
      avatar: json['avatar'],
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'emailVisibility': emailVisibility,
      'verified': verified,
      'name': name,
      'avatar': avatar,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
    };
  }
}