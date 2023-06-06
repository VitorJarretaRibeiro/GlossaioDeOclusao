import 'package:cloud_firestore/cloud_firestore.dart';

class Exercicios {
  final String enunciado;
  final String alternativa_a;
  final String alternativa_b;
  final String alternativa_c;
  final String alternativa_d;
  final String alternativa_correta;
  final Timestamp criado_em;
  final Timestamp atualizado_em;
  final bool ativo;

  Exercicios(
      this.enunciado,
      this.alternativa_a,
      this.alternativa_b,
      this.alternativa_c,
      this.alternativa_d,
      this.alternativa_correta,
      this.atualizado_em,
      this.ativo,
      this.criado_em);

  Map<String, dynamic> toJson(){
    return<String, dynamic>{
      'enunciado': enunciado,
      'alternativa_a': alternativa_a,
      'alternativa_b': alternativa_b,
      'alternativa_c': alternativa_c,
      'alternativa_d': alternativa_d,
      'alternativa_correta': alternativa_correta,
      'atualizado_em': atualizado_em,
      'ativo': ativo,
      'criado_em': criado_em
    };
  }


  factory Exercicios.fromJson(Map<String,dynamic> json){
    return Exercicios(
      json['enunciado'],
      json['alternativa_a'],
      json['alternativa_b'],
      json['alternativa_c'],
      json['alternativa_d'],
      json['alternativa_correta'],
      json['atualizado_em'],
      json['ativo'],
      json['criado_em']
    );
  }
}
