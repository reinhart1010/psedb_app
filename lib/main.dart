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
      home: const PSEDBHomePage(),
    );
  }
}

class PSEDBHomePage extends StatefulWidget {
  const PSEDBHomePage({super.key});

  @override
  State<PSEDBHomePage> createState() => _PSEDBHomePageState();
}

class _PSEDBHomePageState extends State<PSEDBHomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text("PSEDB"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SearchBar(
                backgroundColor: WidgetStateProperty.all(theme.colorScheme.primaryContainer),
                onSubmitted: (value) => {},
                shadowColor: WidgetStateColor.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
