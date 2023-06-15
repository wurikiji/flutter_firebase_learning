class EmailModel {
  String email;
  String password;

  EmailModel({required this.email, required this.password});

  set setEmail(String email) => this.email = email;
  set setPassword(String password) => this.password = password;

  EmailModel copyWith({String? email, String? password}) {
    return EmailModel(email: 
      email ?? this.email,
      password : password ?? this.password,
    );
  }

  EmailModel get getModel => EmailModel(email: email, password : password);
  (String, String) get get => (email, password);
  String get getPassword => password;
}
