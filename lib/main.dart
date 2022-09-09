import 'package:flutter/material.dart';
import 'package:neuron/injection_container.dart' as di;
import 'package:neuron/neuron/page/neuron.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    const App(),
  );
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
     home: NeuronPage(),
    );
  }
}