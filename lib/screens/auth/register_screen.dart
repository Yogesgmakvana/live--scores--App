import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_scores/screens/auth/login_screen.dart';
import 'package:live_scores/constants/colors.dart';
import 'package:live_scores/widgtes/bottom_auth_widget.dart';
import 'package:live_scores/utils/Util.dart';
import 'package:live_scores/widgtes/header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKeyRegister = GlobalKey<FormState>();

  bool isLoading=false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool isShow = true;
  bool isShow1 = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFBBD),
      body: SingleChildScrollView(
        child: Form(
          key: _formKeyRegister,
          child: Column(
            children: [
               Header(title: "SignUp", backgroundColor:darkColor),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  children: [
                    TextFormField(
                  controller: _nameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hint: Text(
                      'Full Name',
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
                  controller: _emailController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Email";
                    }
                    if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
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
                  controller: _passwordController,
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
                        isShow1
                            ? Icons.visibility_off
                            : Icons.visibility,
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
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: isShow,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    if (value != _passwordController.text) {
                      return "Password Must be same";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      icon: Icon(
                        isShow
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    hint: Text(
                      'Confirm Password',
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
                    if (_formKeyRegister.currentState!.validate()) {
                      signUp();
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
                      child:isLoading ? CircularProgressIndicator(color: Colors.white,) : Text(
                        'Register',
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
      ),
      bottomNavigationBar: BottomAuthWidget(
        simpleText:"Already have an account?",
        navigatePage: const LoginScreen(),
        navigateText:"Login",
      ),
    );
    
  }

  signUp() {
     setState(() {
       isLoading=true;
     });
     
      _auth
        .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _confirmPasswordController.text.trim(),
        )
        .then((value) {
             Util().toastMsg('account created succsessfully!',context);
          //go to next screen
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

          setState(() {
       isLoading=true;
     });
        })
        .onError((error, stackTrace) {
          Util().toastMsg(error.toString(),context);
          setState(() {
       isLoading=false;
     });
        });
  }
}
