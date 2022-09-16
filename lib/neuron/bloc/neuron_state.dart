part of 'neuron_cubit.dart';

class NeuronState {
  NeuronState({
    required this.controllerx1,
    required this.controllerx2,
    required this.controllerx3,
    required this.controllerx4,
    required this.weight,
    required this.output,
    required this.controllerInput,
    required this.learningPercentage,
    required this.expectedOutput,
    required this.error,
    required this.interactions,
    required this.realInput,
    required this.theoreticalInput,
    required this.index,
  });

  final TextEditingController controllerx1;
  final TextEditingController controllerx2;
  final TextEditingController controllerx3;
  final TextEditingController controllerx4;
  final List<double> weight;
  final List<double> controllerInput;
  final List<int> realInput;
  final List<List<int>> theoreticalInput;
  final List<int>  expectedOutput;
  final double output;
  final double learningPercentage;
  final double error;
  final int interactions;
  final int index;
  factory NeuronState.initial() => NeuronState(
        controllerx1: TextEditingController(),
        controllerx2: TextEditingController(),
        controllerx3: TextEditingController(),
        controllerx4: TextEditingController(),
        weight:  [-1, -1, -1, -1],
        controllerInput:  [-1, -1, -1, -1],
        interactions: 0,
        output: 0.0,
        expectedOutput: [-1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,1],
        error: -0.4,
        learningPercentage: 0.6,
        realInput:  [-1, -1, -1, -1],
        theoreticalInput: [
          [-1,-1,-1,-1],
          [-1,-1,-1,1],
          [-1,-1,1,-1],
          [-1,-1,1,1],
          [-1,1,-1,-1],
          [-1,1,-1,1],
          [-1,1,1,-1],
          [-1,1,1,1],
          [1,-1,-1,-1],
          [1,-1,-1,1],
          [1,-1,1,-1],
          [1,-1,1,1],
          [1,1,-1,-1],
          [1,1,-1,1],
          [1,1,1,-1],
          [1,1,1,1],
        ],
    index: 0,
      );

  NeuronState copyWith({
    TextEditingController? controllerx1,
    TextEditingController? controllerx2,
    TextEditingController? controllerx3,
    TextEditingController? controllerx4,
    List<double>? weight,
    List<double>? controllerInput,
    List<int>? realInput,
    List<int>? expectedOutput,
    double? learningPercentage,
    double? error,
    double? output,
    int? interactions,
    int? index,
  }) {
    return NeuronState(
      controllerx1: controllerx1 ?? this.controllerx1,
      controllerx2: controllerx2 ?? this.controllerx2,
      controllerx3: controllerx3 ?? this.controllerx3,
      controllerx4: controllerx4 ?? this.controllerx4,
      controllerInput: controllerInput ?? this.controllerInput,
      weight: weight ?? this.weight,
      learningPercentage: learningPercentage ?? this.learningPercentage,
      expectedOutput: expectedOutput ?? this.expectedOutput,
      error: error ?? this.error,
      output: output ?? this.output,
      interactions: interactions ?? this.interactions,
      realInput: realInput ?? this.realInput,
      theoreticalInput: this.theoreticalInput,
      index: index ?? this.index,
    );
  }
}
