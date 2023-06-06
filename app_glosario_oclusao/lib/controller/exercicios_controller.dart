import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/exercicios_model.dart';
import '../view/util.dart';

class ExercicioController {
  //
  // ADICIONAR uma nova Tarefa na Coleção
  //
  void adicionar(context, Exercicios t) {
    FirebaseFirestore.instance
        .collection('Exercicios')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Exercicio adicionada com sucesso!'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // LISTAR
  //
  listar() {
    return FirebaseFirestore.instance
        .collection('Exercicios');
  }

  //
  // ATUALIZAR
  //
  void atualizar(context, id, Exercicios t) {
    FirebaseFirestore.instance
        .collection('Exercicios')
        .doc(id)
        .update(t.toJson())
        .then((value) => sucesso(context, 'Exercicio atualizada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível atualizar o Exercicio.'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // EXCLUIR
  //
  void excluir(context, id, ativo) {
    ativo = false;
    FirebaseFirestore.instance
        .collection('Exercicios')
        .doc(id)
        .set(ativo)
        .then((value) => sucesso(context, 'Exericio excluído com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir o Exercicio.'));
  } 
}