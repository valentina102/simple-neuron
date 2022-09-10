part of 'neuron_cubit.dart';

class NeuronState {
  NeuronState({
    required this.controllerx1,
    required this.controllerx2,
    required this.controllerw1,
    required this.controllerw2,
    required this.weight,
    required this.output,
    required this.controllerInput,
    required this.learningPercentage,
    required this.expectedOutput,
    required this.error,
    required this.interactions,
  });

  final TextEditingController controllerx1;
  final TextEditingController controllerx2;
  final TextEditingController controllerw1;
  final TextEditingController controllerw2;
  final List<double> weight;
  final List<double> controllerInput;


  final double expectedOutput;
  final double output;
  final double learningPercentage;
  final double error;
  final int interactions;
  factory NeuronState.initial() => NeuronState(
    controllerx1: TextEditingController(),
    controllerx2: TextEditingController(),
    controllerw1: TextEditingController(),
    controllerw2: TextEditingController(),
    weight: [],
    controllerInput: [],
    interactions: 0,
    output: 0.0,
    expectedOutput: 0.0,
    error: -0.4,
    learningPercentage: 0.6,

  );

  NeuronState copyWith({
    TextEditingController? controllerx1,
    TextEditingController? controllerx2,
    TextEditingController? controllerw1,
    TextEditingController? controllerw2,
    List<double>? weight,
    List<double>? controllerInput,
    double? expectedOutput,
    double? learningPercentage,
    double? error,
    double? output,
    int? interactions,
  }) {
    return NeuronState(
        controllerx1: controllerx1 ?? this.controllerx1,
        controllerx2: controllerx2 ?? this.controllerx2,
        controllerw1: controllerw1 ?? this.controllerw1,
        controllerw2: controllerw2 ?? this.controllerw2,
        controllerInput: controllerInput ?? this.controllerInput,
        weight: weight ?? this.weight,
        learningPercentage: learningPercentage ?? this.learningPercentage,
        expectedOutput: expectedOutput ?? this.expectedOutput,
        error: error ?? this.error,
        output: output ?? this.output,
        interactions: interactions ?? this.interactions,
    );
  }
}
