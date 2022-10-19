import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/screens/home_screen.dart';
import 'config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage('tasks');
    storage.setItem("expences", storage.getItem("expences") ?? []);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LocalStorage storage = LocalStorage('tasks');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      final LocalStorage storage = LocalStorage('tasks');
    });
  }

  @override
  Widget build(BuildContext context) {
    // storage.clear();
    // storage.clear();
    // storage.setItem("amount", "0");

    SettingConfig x = SettingConfig(context);

    return const HomeScreen(
    );
  }
}
