import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kharadi_assignment/screens/signup_page.dart';
import 'package:provider/provider.dart';
import 'providers/image_provider.dart';
import 'screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageDataProvider(),
      child: MaterialApp(
        title: 'Flutter Assignment',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SignupPage(),
      ),
    );
  }
}
