import 'package:biodata_app/Models/biodata_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(BioDataModelAdapter().typeId)) {
    Hive.registerAdapter(BioDataModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
