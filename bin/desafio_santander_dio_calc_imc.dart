import 'dart:io';

import 'package:desafio_santander_dio_calc_imc/classes/Pessoa.dart';
import 'package:desafio_santander_dio_calc_imc/classes/calculo_imc.dart';
import 'package:desafio_santander_dio_calc_imc/classes/exceptions/nome_invalido_exception.dart';
import 'package:desafio_santander_dio_calc_imc/utils/ler_console.dart';

void main(List<String> arguments) {
  print("Calculadora IMC");

  var pessoa = Pessoa();
  var imc = CalculoIMC();

  try {
    pessoa.setNome(lerConsole("Insira seu nome: "));
    if (pessoa.getNome() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    pessoa.setNome("Main");
    print("Nome inválido! Alterando para ${pessoa.getNome()}.");
  } catch (e) {
    exit(0);
  }

  bool voltar;
  do {
    try {
      pessoa.setPeso(lerConsoleDouble("Informe o seu peso em KG: "));
      pessoa.setAltura(lerConsoleDouble("Informe sua altura em Metros"));
      voltar = false;
    } catch (e) {
      voltar = true;
    }
  } while (voltar == true);

  var setIMC = imc.calcularIMC(pessoa.getPeso(), pessoa.getAltura());

  String msg = "";
  switch (imc.getIMC(setIMC)) {
    case < 16:
      msg = "Magreza Grave";
      break;
    case < 17:
      msg = "Magreza Moderada";
      break;
    case < 18.5:
      msg = "Magreza Leve";
      break;
    case < 25:
      msg = "Saudável";
      break;
    case < 30:
      msg = "Sobrepeso";
      break;
    case < 35:
      msg = "Obesidade Grau I";
      break;
    case < 40:
      msg = "Obesidade Grau II (Severa)";
      break;
    case >= 40:
      msg = "Obesidade Grau III (Morbida)";
    default:
  }

  print(
      "Olá ${pessoa.getNome()} com você pesando ${pessoa.getPeso()} Quilos e tendo ${pessoa.getAltura()} metros de altura o seu IMC será de ${imc.getIMC(setIMC)} ($msg)");
}
