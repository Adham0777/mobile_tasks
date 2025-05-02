import 'package:flutter/material.dart';
import 'package:section/dashboard.dart';
import 'package:section/items/additem.dart';
import 'package:section/items/itemmodel.dart';
import 'package:section/profile/profile.dart';

import 'package:section/details/details.dart';
import 'package:provider/provider.dart';
import 'package:section/user/user_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Itemmodel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
