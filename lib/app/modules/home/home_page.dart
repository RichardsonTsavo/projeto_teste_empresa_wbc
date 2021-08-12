import 'package:brasil_fields/brasil_fields.dart';
import 'package:calculadora_de_imc/app/modules/home/home_store.dart';
import 'package:calculadora_de_imc/app/shared/utils/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Calculadora de IMC'),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight * 0.9,
              width: constraints.maxWidth,
              child: Form(
                key: form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Peso",
                          style:
                              TextStyle(fontSize: constraints.maxWidth * 0.05),
                        ),
                        Container(
                          width: constraints.maxWidth / 2,
                          child: CustomTextFormField(
                            keyboardType: TextInputType.number,
                            validator: (String? text) {
                              if (text!.isEmpty) {
                                return "Adicione o seu peso";
                              }
                            },
                            labelText: "Kg",
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              PesoInputFormatter()
                            ],
                            onChanged: (String text) {
                              store.filds["weight"] = text;
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Altura",
                          style:
                              TextStyle(fontSize: constraints.maxWidth * 0.05),
                        ),
                        Container(
                          width: constraints.maxWidth / 2,
                          child: CustomTextFormField(
                            keyboardType: TextInputType.number,
                            validator: (String? text) {
                              if (text!.isEmpty) {
                                return "Adicione a sua altura";
                              }
                            },
                            labelText: "Altura",
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              AlturaInputFormatter()
                            ],
                            onChanged: (String text) {
                              store.filds["height"] = text;
                            },
                          ),
                        )
                      ],
                    ),
                    Observer(
                      builder: (context) => Text(
                        "Seu imc é: ${store.result}",
                        style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                      ),
                    ),
                    Observer(
                      builder: (context) => Text(
                        "${store.imcInfo}",
                        style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(constraints.maxWidth / 3, 50)),
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            store.calculate();
                          }
                        },
                        child: Text("Calcular"))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
