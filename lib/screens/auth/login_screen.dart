import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_scores/screens/auth/register_screen.dart';
import 'package:live_scores/constants/colors.dart';
import 'package:live_scores/widgtes/bottom_auth_widget.dart';
import 'package:live_scores/screens/home_screen.dart';
import 'package:live_scores/utils/Util.dart';
import 'package:live_scores/widgtes/header.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailLoginController = TextEditingController();
  final _passwordLoginController = TextEditingController();
  bool isShow1 = true;
  bool isLoading1 = false;
  final _formKeyLogin = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFBBD),
      body: Form(
        key: _formKeyLogin,
        child: Column(
          children: [
            Header(title: "SignIn", backgroundColor: darkColor),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailLoginController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hint: Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 4,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordLoginController,
                    obscureText: isShow1,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow1 = !isShow1;
                          });
                        },
                        icon: Icon(
                          isShow1 ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      hint: Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 4,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      if (_formKeyLogin.currentState!.validate()) {
                        SignIn();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                        child: isLoading1
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAuthWidget(
        simpleText: "Don't have an account?",
        navigateText: "Register",
        navigatePage: RegisterScreen(),
      ),
    );
  }

  SignIn() {
    setState(() {
      isLoading1 = true;
    });
    _auth
        .signInWithEmailAndPassword(
          email: _emailLoginController.text.trim(),
          password: _passwordLoginController.text.trim(),
        )
        .then((value) {
          Util().toastMsg('Logged In Succsessfully!',context);
          setState(() {
            isLoading1 = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        })
        .onError((error, stackTrace) {
          Util().toastMsg(error.toString(),context);
          setState(() {
            isLoading1 = false;
          });
        });
  }
}
