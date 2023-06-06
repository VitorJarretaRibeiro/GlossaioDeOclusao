import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_glosario_oclusao/view/util.dart';

class UserController {
  bool verificarDominioSouUnaerp(String email) {
    String dominio1 = 'sou.unaerp.edu.br';

    RegExp padrao = RegExp(r'@(.+)$');
    Match? result = padrao.firstMatch(email);

    if (result != null) {
      String dominioEmail = result.group(1)!;
      if (dominioEmail == dominio1) {
        return true;
      }
    }
    return false;
  }

  bool verificarDominioUnaerp(String email) {
    String dominio1 = 'unaerp.br';

    RegExp padrao = RegExp(r'@(.+)$');
    Match? result = padrao.firstMatch(email);

    if (result != null) {
      String dominioEmail = result.group(1)!;
      if (dominioEmail == dominio1) {
        return true;
      }
    }
    return false;
  }

  bool validarLogin(context, String email, String senha) {
    if (email.isNotEmpty && senha.isNotEmpty) {
      bool validar = verificarDominioSouUnaerp(email);
      bool validar2 = verificarDominioUnaerp(email);
      if (validar == true) {
        return true;
      }else if(validar2 == true){
        return true;
      }
      else {
        erro(context, 'E-mail não institucional !');
      }
    } else {
      erro(context, 'E-mail ou senha não informado!');
    }
    return false;
  }

  //
  // CRIAR UMA NOVA CONTA no serviço
  // Firebase Authentication
  //
  criarConta(
      context, String nome, String email, String senha, String confirmSenha, String idStudent) {
    if (nome.isNotEmpty &&
        email.isNotEmpty &&
        senha.isNotEmpty &&
        confirmSenha.isNotEmpty &&
        idStudent.isNotEmpty
        ) {
      bool validar = verificarDominioSouUnaerp(email);
      if (validar) {
        if (senha != confirmSenha) {
          erro(context, "As senhas são diferentes!");
        } else {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: senha)
              .then((resultado) {
            //
            // Armazenar o nome do usuário no Firebase Firestore
            //
            FirebaseFirestore.instance.collection('usuarios').add({
              'uid': resultado.user!.uid,
              'nome': nome,
              'email': email,
              'idStudent': idStudent
            });

            sucesso(context, 'Usuário criado com sucesso.');
            /* Navigator.pop(context) */
          }).catchError((e) {
            switch (e.code) {
              case 'email-already-in-use':
                erro(context, 'O email já foi utilizado.');
                break;
              case 'invalid-email':
                erro(context, 'O formato do email é inválido');
                break;
              default:
                erro(context, 'ERRO: ${e.code.toString()}');
            }
          });
        }
      } else {
        erro(context, 'E-mail não institucional!');
      }
    } else {
      erro(context, 'Todos os campos são obrigatórios!');
    }
  }

  //
  // LOGIN
  //
  login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      sucesso(context, 'Usuário autenticado com sucesso!');
      Navigator.pushNamed(context, 'carregar');
    }).catchError((e) {
      switch (e.code) {
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  //
  // ESQUECEU A SENHA
  //
  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      var validar = verificarDominioSouUnaerp(email);
      if (validar) {
        FirebaseAuth.instance
            .sendPasswordResetEmail(email: email)
            .then((value) {
          sucesso(context, 'Email enviado com sucesso.');
        }).catchError((e) {
          erro(context, 'ERRO: ${e.code.toString()}');
        });
      } else {
        erro(context, 'E-mail não institucional!');
      }
    } else {
      erro(context, "Preencha o campo para recuperar o acesso.");
    }
  }

  //
  // LOGOUT
  //
  logout() {
    FirebaseAuth.instance.signOut();
  }

  //
  // ID do Usuário Logado
  //
  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  //
  // NOME do Usuário Logado
  //
  Future<String> usuarioLogado() async {
    var emailUsuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        emailUsuario = resultado.docs[0].data()['email'] ?? '';
      },
    );
    return emailUsuario;
  }
}
