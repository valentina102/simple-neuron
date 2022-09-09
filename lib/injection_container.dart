import 'package:get_it/get_it.dart';
import 'package:neuron/neuron/bloc/neuron_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Cubit
  sl.registerFactory<NeuronCubit>(
        () => NeuronCubit(),
  );
}