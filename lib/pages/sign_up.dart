import 'dart:convert';

import 'package:boot_camp_project/model/users.dart';
import 'package:boot_camp_project/pages/home.dart';
import 'package:boot_camp_project/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:boot_camp_project/services/database.dart';
import 'package:boot_camp_project/model/users.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // static String name = '';

  final Database db = Database();
  // final Users us = Users();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                onChanged: (value) {
                setState(() {
                  // name = value;
                  // print(name);
                  print(_nameController.text.trim() );
                  // insert(value);
                });
              },
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Your name (e.g., 'Khalid')",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Your email (e.g., 'someone@gmail.com')",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
    
              SizedBox(height: 20),
              FancyPasswordField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Your password",
                  border: OutlineInputBorder(),
                ),
                controller: _passwordController,
                // iconColor: Colors.green,
                // borderColor: Colors.green,
                // borderFocusColor: Colors.green,
                onChanged: (value) {
                  print(value);
                  // Do something with the password value
                },
              ),
              SizedBox(height: 20),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text("have an account ? "),

              ElevatedButton( 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ),
                  );
                },
                style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0), // Remove shadow

  ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              ],),
              ElevatedButton(
                onPressed: () async {
                  // Handle sign up logic here
                  String name = _nameController.text.trim();
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  Users u1 = Users(
                    name: name,
                    email: email,
                    passWo: password);

                    await Database().insertUser(u1);

                  // print("Name: $name, Email: $email, Password: $password");
                  // insertUser();
                  // us.toJson(email, 1, name, password);
                  // final Users us = Users(email: email, id: 1, name: name, passWo: password);
                  // Users userJson = jsonEncode(us.toJson());
                  // db.insertUser(us);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future <void> signUp() async{
  //   try {
  //     await Supabase.instance.client.auth.signUp(password: _passwordController.text.trim(), email: _emailController.text.trim());
  //   } on AuthException catch (e) {
  //     print(e);
  //   }
  // }

  // Future <void> insert(String name) async{
  //   await Supabase.instance.client.from('plnats_users').insert({'user_name': name});
  // }
}
