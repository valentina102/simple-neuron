import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dart_numerics/dart_numerics.dart' as numerics;
part 'neuron_state.dart';

class NeuronCubit extends Cubit<NeuronState> {
  NeuronCubit() : super(NeuronState.initial());

  initial() {
    emit(state.copyWith(weight: [0.0, 0.0], controllerInput: [0.0, 0.0]));
  }

  calculate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    emit(state.copyWith(weight: [
      double.parse(state.controllerw1.text),
      double.parse(state.controllerw2.text)
    ], controllerInput: [
      double.parse(state.controllerx1.text),
      double.parse(state.controllerx2.text)
    ]));
    await calculateExpectedOutput();
     calculateOutput();


  }
  verifyOutput (){
    if(state.output != state.expectedOutput){
      entertainment();
      calculateOutput();
    }
  }
  calculateExpectedOutput() {
    if (double.parse(state.controllerx1.text) <= 0.0 ||
        double.parse(state.controllerx2.text) <= 0.0) {
      emit(state.copyWith(expectedOutput: 0, interactions: 0));
    } else {
      emit(state.copyWith(expectedOutput: 1, interactions: 0));
    }
  }

   calculateOutput() {
    double output = 0;

    output = numerics.tanh(
        (state.weight[0] * double.parse(state.controllerx1.text)) +
            (state.weight[1] * double.parse(state.controllerx2.text)) -
            (state.error));
    if (output < 1) {
      output = 0;
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
            state.expectedOutput *
            double.parse(state.controllerx1.text));
    double secondWeight = (state.weight[1] +
        2 *
            state.learningPercentage *
            state.expectedOutput *
            double.parse(state.controllerx2.text));
    double error = (state.error + 2 * state.learningPercentage * (-1));

    emit(state.copyWith(
        weight: [firstWeight, secondWeight],
        error: error,
        interactions: state.interactions + 1));
  }
}
