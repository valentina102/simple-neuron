import 'package:flutter/services.dart';
import 'package:neuron/base/base_page.dart';
import 'package:neuron/neuron/bloc/neuron_cubit.dart';
import 'package:flutter/material.dart';

import '../../injection_container.dart';

class NeuronPage extends BasePage<NeuronState, NeuronCubit> {
  const NeuronPage({Key? key}) : super(key: key);

  @override
  NeuronCubit createBloc() => sl<NeuronCubit>()..initial();
  @override
  Widget buildPage(BuildContext context, state, NeuronCubit bloc) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("First Neuron"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text("X1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          controller: state.controllerx1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("X2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          controller: state.controllerx2,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.2);
                  }
                  return EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.2);
                }), backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.blueAccent;
                  }
                  return Colors.blue;
                })),
                onPressed: () => bloc.calculate(),
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Entradas",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16),
                  ),
                  Text(
                    "Salida esperada",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16),
                  ),
                  Text(
                    "Salida real",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(itemCount: state.input.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text("[ ${state.input[index][0]} - ${state.input[index][1]} ]",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16),
                              );
                            }
                        )
                    ), Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(itemCount: state.output.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(state.output[index].toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16),
                              );
                            }
                        )
                    ), Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(itemCount: state.input.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(state.expectedOutput[index].toString(),
                                  textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16),
                              );
                            }
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
