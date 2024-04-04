class UserResponse {
  final LoginModel user;
  final String token;

  UserResponse({
    required this.user,
    required this.token,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      user: LoginModel.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class LoginModel {
  final int id;
  final String name;
  final String email;

  LoginModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
