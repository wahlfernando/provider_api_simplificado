import 'package:flutter/material.dart';
import 'package:flutter_estudo_avancado_api/provider/home_provider.dart';
import 'package:flutter_estudo_avancado_api/view/view_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Avançado  - API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}