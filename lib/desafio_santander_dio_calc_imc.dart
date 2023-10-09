import 'package:desafio_santander_dio_calc_imc/classes/calculo_imc.dart';

String nome(String nome) {
  if (nome == "") {
    throw ArgumentError("O nome não pode ser vazio");
  }
  return nome;
}

var imc = CalculoIMC();
var msg;
String verIMC(setIMC) {
  var imcValue = setIMC;

  if (imcValue < 16) {
    msg = "Magreza Grave";
  } else if (imcValue < 17) {
    msg = "Magreza Moderada";
  } else if (imcValue < 18.5) {
    msg = "Magreza Leve";
  } else if (imcValue < 25) {
    msg = "Saudável";
  } else if (imcValue < 30) {
    msg = "Sobrepeso";
  } else if (imcValue < 35) {
    msg = "Obesidade Grau I";
  } else if (imcValue < 40) {
    msg = "Obesidade Grau II (Severa)";
  } else if (imcValue >= 40) {
    msg = "Obesidade Grau III (Morbida)";
  }

  return msg;
}
