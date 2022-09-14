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
        title: Text("First Neuron", style: TextStyle(color: Colors.blue)),
          backgroundColor:Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    margin: EdgeInsets.only(bottom: 10) ,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: const Text("Weight",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text("w1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 20)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextField(
                              controller: state.controllerw1,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("w2",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 20)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextField(
                              controller: state.controllerw2,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.blue,
                    margin: EdgeInsets.symmetric(vertical: 10) ,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: const Text("Input",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text("x1",
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
                          const Text("x2",
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
                            horizontal:
                                MediaQuery.of(context).size.height * 0.2);
                      }
                      return EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height * 0.2);
                    }), backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue;
                      }
                      return Colors.blue;
                    })),
                    onPressed: () => bloc.calculate(context),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.blue,
                    margin: EdgeInsets.only(bottom: 10) ,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "Inputs",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          "Expected output",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          "Real output",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              "[ ${state.controllerx1.text}, ${state.controllerx2.text} ]",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              state.expectedOutput.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              state.output.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.blue,
                    margin: EdgeInsets.only(bottom: 10) ,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "New Weights",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          "Interactions",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          "Error",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              "[ ${state.weight[0].toStringAsFixed(3)}, ${state.weight[1].toStringAsFixed(3)} ]",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              state.interactions.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              state.error.toStringAsFixed(3),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            )),
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
