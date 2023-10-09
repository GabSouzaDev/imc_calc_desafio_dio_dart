import 'package:desafio_santander_dio_calc_imc/classes/calculo_imc.dart';
import 'package:test/test.dart';
import 'package:desafio_santander_dio_calc_imc/desafio_santander_dio_calc_imc.dart'
    as app;

void main() {
  var imc = CalculoIMC();
  test('verificar se IMC é double', () {
    expect(imc.getIMC('18.56'), 18.56);
  });

  test('verificar se nome sendo vazio ocorrerá um erro', () {
    expect(() => app.nome(""), throwsA(TypeMatcher<ArgumentError>()));
  });

  group('Verificar se resultado de imc retorna mensagem correta', () {
    var valuesToTest = {
      {'setIMC': 15}: 'Magreza Grave',
      {'setIMC': 16}: 'Magreza Moderada',
      {'setIMC': 18}: 'Magreza Leve',
      {'setIMC': 24}: 'Saudável',
      {'setIMC': 29}: 'Sobrepeso',
      {'setIMC': 34}: 'Obesidade Grau I',
      {'setIMC': 35}: 'Obesidade Grau II (Severa)',
      {'setIMC': 66}: 'Obesidade Grau III (Morbida)',
    };
    valuesToTest.forEach((values, expected) {
      test('Entrada: $values Esperado: $expected', () {
        expect(app.verIMC(double.parse(values['setIMC'].toString())), expected);
      });
    });
  });
}
