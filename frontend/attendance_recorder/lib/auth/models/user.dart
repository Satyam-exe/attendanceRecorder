class User {
  final int id;
  final String role;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String password;

  User({
    required this.id,
    required this.role,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    required this.password
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password
    };
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      role: json['role'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password']
    );
  }
}