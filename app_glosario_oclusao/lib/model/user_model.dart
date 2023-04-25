class User{

  final String name;
  final int idStudent;
  final String email;
  final String password;

  User(this.name, this.email, this.idStudent, this.password);


  factory User.fromJson(Map<String, dynamic> j){
    return User(j["name"], j['email'], j['idStudent'], j['password']);
  }

}