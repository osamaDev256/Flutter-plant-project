import 'package:boot_camp_project/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String name = '';

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
        title: const Text("Log In"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              // TextFormField(
              //   controller: _passwordController,
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     labelText: "Password",
              //     hintText: "Your password",
              //     border: OutlineInputBorder(),
              //   ),
              
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

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text("Dont have an account ? "),

              ElevatedButton( 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0), // Remove shadow

  ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              ],),
                            ElevatedButton(
                onPressed: () {
                  // Handle sign up logic here
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  print("Name: $name, Email: $email, Password: $password");
                },
                child: Text("Log in"),
              ),      
// ElevatedButton(
//   onPressed: () {
//     // Add your onPressed logic here
//   },
//   child: Text("do"),
//   style: ButtonStyle(
//     backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//     textStyle: MaterialStateProperty.all<TextStyle>(
//       TextStyle(
//         fontSize: 20, // Adjust the font size as needed
//         fontWeight: FontWeight.bold,
//         // Add any other text style properties you need
//       ),
//     ),
//   ),
// ),

            ],
          ),
        ),
      ),
    );
  }
}
