import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dart_numerics/dart_numerics.dart' as numerics;
part 'neuron_state.dart';

class NeuronCubit extends Cubit<NeuronState> {
  NeuronCubit() : super(NeuronState.initial());

  initial() {
    double learningPercentage = 0.0;
    List<double> weight = [];
    learningPercentage = Random().nextDouble();
    emit(state.copyWith(learningPercentage: learningPercentage));
  }

  output(input) {
    int output = 0;
    for (var index = 0; index < input.length; index++) {
      output += numerics.tanh((state.weight[index] * input[index])).toInt();
    }
    output += state.learningPercentage.toInt();

    if (output < 1) {
      output = 0;
    } else {
      output = 1;
    }
    return output;
  }

  entertainment(int cicles) async {
    for (var index = 0; index < cicles; index++) {
      var errorCicle = 0.0;
      for (var j = 0; j < state.input.length; j++) {
        var currentInput = state.input[j];
        var currentOutput = state.output[j];
        var out = output(currentInput);
        var error = currentOutput - out;
        errorCicle += (error).abs();
        await adjustWeights(error, currentInput);
      }
      print(errorCicle / state.input.length);
    }
  }

  adjustWeights(double error, List<int> currentInput) async {
    List<double> weight = state.weight;
    double learning = 0.0;
    for (var index = 0; index < weight.length; index++) {
      var ajust = error * state.lr * currentInput[index];
      weight[index] += ajust;
    }
    double adjust = error * state.lr * 1;
    learning += adjust;

    emit(state.copyWith(weight: weight, learningPercentage: learning));
  }

  calculate() async {
    List<int> expectedOutput = [];
    bool needEntertainment = true;
    emit(state.copyWith(weight: [
      double.parse(state.controllerx1.text),
      double.parse(state.controllerx2.text)
    ]));
    do {
      for (var index = 0; index < state.input.length; index++) {
        expectedOutput.add(output(state.input[index]));
        if (output(state.input[index]) != state.output[index].toInt()) {
          await entertainment(5);
          needEntertainment = true;
        }else{
          needEntertainment = false;
        }
      }
    }while (needEntertainment);

    await addExpectedOutput(expectedOutput);
  }

  addExpectedOutput(List<int> expectedOutput) async {
    emit(state.copyWith(expectedOutput: expectedOutput));
  }
}
