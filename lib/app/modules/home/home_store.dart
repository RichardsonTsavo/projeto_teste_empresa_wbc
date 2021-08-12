import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String result = "";
  @observable
  String imcInfo = "";

  Map<String, dynamic> filds = {"weight": "", "height": ""};

  @action
  void calculate() {
    double imc = 0;
    double peso = double.parse(filds["weight"].toString().replaceAll(",", "."));
    double altura =
        double.parse(filds["height"].toString().replaceAll(",", "."));

    imc = peso / (altura * altura);
    result = imc.toStringAsFixed(2).replaceAll('.', ",");
    if (imc < 18.5) {
      imcInfo = "Magreza";
    } else if (imc >= 18.5 && imc < 24.9) {
      imcInfo = "Normal";
    } else if (imc >= 24.9 && imc < 30) {
      imcInfo = "Sobrepeso";
    } else {
      imcInfo = "Obesidade";
    }
  }
}
