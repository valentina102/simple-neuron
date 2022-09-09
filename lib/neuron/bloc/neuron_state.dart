part of 'neuron_cubit.dart';

class NeuronState {
  NeuronState({
    required this.controllerx1,
    required this.controllerx2,
    required this.weight,
    required this.learningPercentage,
    required this.lr,
    required this.input,
    required this.output,
    required this.expectedOutput,
  });

  final TextEditingController controllerx1;
  final TextEditingController controllerx2;
  final List<double> weight;
  final List<List<int>> input;
  final List<double> output;
  final List<int> expectedOutput;
  final double learningPercentage;
  final double lr;
  factory NeuronState.initial() => NeuronState(
        controllerx1: TextEditingController(),
        controllerx2: TextEditingController(),
        weight: [],
        learningPercentage: 0.0,
        lr: 0.01,
        input: [
          [0, 0],
          [0, 1],
          [1, 0],
          [1, 1]
        ],
        output: [0, 1, 1, 1],
        expectedOutput: [8,9,4,5],
      );

  NeuronState copyWith({
    TextEditingController? controllerx1,
    TextEditingController? controllerx2,
    List<double>? weight,
    List<int>? expectedOutput,
    double? learningPercentage,
  }) {
    return NeuronState(
      controllerx1: controllerx1 ?? this.controllerx1,
      controllerx2: controllerx2 ?? this.controllerx2,
      weight: weight ?? this.weight,
      learningPercentage: learningPercentage ?? this.learningPercentage,
      lr: lr,
      input: input,
      output: output,
      expectedOutput: expectedOutput ?? this.expectedOutput,
    );
  }
}
