
import 'package:care_me/screens/bottom_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:care_me/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
  
import 'package:care_me/pharmacy/ph_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => PhProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      //home: const Saved(),
    );
  }
}

//앱 재실행시 자동 로그인 -> 로그아웃 기능도 있어야지 사용 가능해서 제가 나중에 만들고 주석 풀게요
/* class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return BottomBarPage();
    } else {
      return Login();
    }
  }
}
 */

