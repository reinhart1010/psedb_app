import 'package:flutter/material.dart';

void main() {
  runApp(const PSEDBApp());
}

class PSEDBApp extends StatelessWidget {
  const PSEDBApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PSEDB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PSEDBHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class PSEDBHomePage extends StatefulWidget {
  const PSEDBHomePage({super.key, required this.title});

  final String title;

  @override
  State<PSEDBHomePage> createState() => _PSEDBHomePageState();
}

class _PSEDBHomePageState extends State<PSEDBHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}