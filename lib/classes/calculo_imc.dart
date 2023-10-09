import 'Pessoa.dart';

class CalculoIMC extends Pessoa {
  double _imc = 0.0;

  void setIMC(imc) {
    imc = _imc;
  }

  String calcularIMC(peso, altura) {
    _imc = (peso / (altura * altura));
    return _imc.toStringAsFixed(2);
  }

  double getIMC(imc) {
    return double.parse(imc);
  }
}
