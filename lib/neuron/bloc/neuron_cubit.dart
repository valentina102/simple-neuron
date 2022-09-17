import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dart_numerics/dart_numerics.dart' as numerics;
part 'neuron_state.dart';

class NeuronCubit extends Cubit<NeuronState> {
  NeuronCubit() : super(NeuronState.initial());

  initial() {
    List<double> weight = [];
    for (var i = 0; i < 4; i++) {
      weight.add(Random().nextDouble());
    }
    emit(state.copyWith(weight: weight, controllerInput: [0.0, 0.0, 0.0, 0.0], realInput: [1,1,1,-1]));
    entertainment();
  }

  calculate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    emit(state.copyWith(controllerInput: [
      double.parse(state.controllerx1.text),
      double.parse(state.controllerx2.text),
      double.parse(state.controllerx3.text),
      double.parse(state.controllerx4.text)
    ]));
    await calculateRealInput();
    calculateOutput();
  }

  verifyOutput() {
    if (state.output != state.expectedOutput[state.index]) {
      entertainment();
      calculateOutput();
    }
  }

  calculateRealInput() async{
    List<int> realInput = [];
    for (var i = 0; i < state.controllerInput.length; i++) {
      if (state.controllerInput[i] <= 0.0) {
        realInput.add(-1);
      } else {
        realInput.add(1);
      }
    }
    emit(state.copyWith(realInput: realInput, interactions: 0));
   await findIndexOfCase();
  }

  findIndexOfCase() {
    List<int> realCase = state.theoreticalInput.firstWhere(
        (element) => element.toString() == state.realInput.toString(),
        orElse: () => [-1, -1, -1, -1]);
    emit(state.copyWith(index: state.theoreticalInput.indexOf(realCase)));
  }

  calculateOutput() {
    double output = 0;

    for (var i = 0; i < state.controllerInput.length; i++) {
      output += state.weight[i] * state.controllerInput[i];
    }
    output = numerics.tanh(output - (state.error));
    if (output < 1) {
      output = -1;
    } else {
      output = 1;
    }
    emit(state.copyWith(output: output));
    verifyOutput();
  }

  entertainment() async {
    double firstWeight = (state.weight[0] +
        2 *
            state.learningPercentage *
            state.expectedOutput[state.index] *
            state.controllerInput[0]);

    double secondWeight = (state.weight[1] +
        2 *
            state.learningPercentage *
            state.expectedOutput[state.index] *
            state.controllerInput[1]);

    double thirdWeight = (state.weight[2] +
        2 *
            state.learningPercentage *
            state.expectedOutput[state.index] *
            state.controllerInput[2]);
    double fourthWeight = (state.weight[3] +
        2 *
            state.learningPercentage *
            state.expectedOutput[state.index] *
            state.controllerInput[3]);
    double error = (state.error + 2 * state.learningPercentage * (-1));

    emit(state.copyWith(
        weight: [firstWeight, secondWeight, thirdWeight, fourthWeight],
        error: error,
        interactions: state.interactions + 1));
  }
}
