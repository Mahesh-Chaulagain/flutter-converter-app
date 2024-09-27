import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  double? _toKm;

  void _convert() {
    final name = _controller.text.trim();
    final inputNumber = int.tryParse(name);
    if (inputNumber != null) {
      setState(() {
        _toKm = inputNumber / 1000.0;
      });
    } else {
      setState(() {
        _toKm = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion Screen'),
      ),
      body: Center(
          child: Column(children: [
        const Text('Size in Meter'),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 5.0),
              ),
              hintText: 'Enter Distance in Meter:'),
        ),
        ElevatedButton(onPressed: _convert, child: const Text('Convert')),
        const SizedBox(
          height: 10,
        ),
        Text('The value in Km is ${_toKm}')
      ])),
    );
  }
}
