import 'dart:convert';

import 'package:app_glosario_oclusao/model/user_model.dart';
import 'package:flutter/services.dart';


class UserController {
  List<User> list = [
    User('Admin', "admin@admin.com", 000000, "admin")
  ];


  bool autheticatorLogin (String email, String password){
    print(list);
    for (User user in list){
      if(user.email == email && user.password == password){
        return true;
      }
    }
    return false;
  }
  
  bool autheticatorRecover (String email){

    for(User user in list){
      if(user.email == email){
        return true;
      }
    }
    return false;
  }

  void addUser(String name, int idStudent, String email, String password){
    list.add(User(name, email, idStudent, password));
  }

}
