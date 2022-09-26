import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Calculadora IMC")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.fitness_center,
                    color: Theme.of(context).primaryColor,
                    size: 56,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _pesoController,
                  decoration: InputDecoration(
                      label: const Text('Peso (kg)'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _alturaController,
                  decoration: InputDecoration(
                    label: const Text('Altura (metros)'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      var peso =
                          double.tryParse(_pesoController.value.text) ?? 0.0;
                      var altura =
                          double.tryParse(_alturaController.value.text) ?? 0.0;
                      var imc = 0.0;
                      if (altura > 0.0) {
                        imc = peso / (altura * altura);
                      }

                      var resposta = "";
                      if (imc < 18.5) {
                        resposta = "MAGREZA - OBESIDADE GRAU 0";
                      } else if (imc >= 18.5 && imc < 24.9) {
                        resposta = "NORMAL - OBESIDADE GRAU 0";
                      } else if (imc >= 18.5 && imc < 29.9) {
                        resposta = "SOBREPESO - OBESIDADE GRAU 1";
                      } else if (imc >= 29.9 && imc < 39.9) {
                        resposta = "OBESIDADE GRAU 2";
                      } else {
                        resposta = "OBESIDADE GRAVE GRAU 3";
                      }

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(resposta)));
                    },
                    icon: Icon(Icons.calculate),
                    label: const Text("Calcular")),
              ],
            ),
          ),
        ));
  }
}
