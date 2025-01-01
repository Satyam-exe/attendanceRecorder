class User {
  final int id;
  final String username;
  final String role;
  final String fullName;
  final String email;
  final String? phoneNumber;

  User({
    required this.id,
    required this.username,
    required this.role,
    required this.fullName,
    required this.email,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'role': role,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      role: json['role'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}