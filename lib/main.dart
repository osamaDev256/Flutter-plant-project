// import 'package:boot_camp_project/pages/login_page.dart';
import 'package:boot_camp_project/pages/cardsDetails.dart';
import 'package:boot_camp_project/pages/home.dart';
import 'package:boot_camp_project/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:boot_camp_project/services/database.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mwtbnhytwhnfiotmasyc.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13dGJuaHl0d2huZmlvdG1hc3ljIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ4MzUxNTcsImV4cCI6MjAzMDQxMTE1N30.zer9HuDWbL987796uhVrGNOIqON3ZnbpH_g0Dpqh0mY',
  );
  runApp(MyApp());
}

        
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData( scaffoldBackgroundColor: const Color.fromARGB(255, 43, 121, 46),),
      home: SignUp(),
      // routes: {
      //   '/LogIn':(context) => LogIn(),
      //   '' 
      // },
    );
  }
}
