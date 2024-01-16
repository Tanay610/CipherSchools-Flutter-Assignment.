import 'package:cipher_school_app/data/firebase_authentication/fire_methods.dart';
import 'package:cipher_school_app/presentation/pages/expense_page.dart';
import 'package:cipher_school_app/presentation/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isLoading = false;
  bool _obscureText = true;
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
    final AuthMethods _authMethods = AuthMethods();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleSignUp() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    User? user = await _authMethods.signUp(email, password, name);

    if (user != null) {
      // Navigate to the next screen, show a success message, etc.
      setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });
      // Navigate to the next screen, show a success message, etc.
      Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomeBottomBar(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      backgroundColor: Colors.green,
        content: Text('You are now successfully signed up!',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
     
      print('SignUp successful: ${user.uid}');
    } else {
      // Handle signup failure, show an error message, etc.
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      backgroundColor: Colors.red,
        content: Text('Sign up failed. Please try again',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
      
      print('SignUp failed');
    }
  }

  Future<void> _handleSignInWithGoogle() async {
    User? user = await _authMethods.signInWithGoogle();

    if (user != null) {
      
      print('SignIn with Google successful: ${user.uid}');
    } else {
      // Handle sign in with Google failure, show an error message, etc.
      print('SignIn with Google failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        label: Text("Name"),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF1F1FA)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF1F1FA)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        label: Text("Email"),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF1F1FA)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF1F1FA)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xff91919F),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        label: Text("Password"),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF1F1FA)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF1F1FA)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      checkColor: Colors.white,
                      activeColor: Color(0xff7F3DFF),
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'By signing up, you agree to the ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Terms of Service and ',
                              style: TextStyle(
                                color:
                                    Color(0xff7F3DFF), // Set the color to purple
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color:
                                    Color(0xff7F3DFF), // Set the color to purple
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    _handleSignUp();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xff7F3DFF), // Text color
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 56),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                  child: _isLoading?CircularProgressIndicator(
                    color: Colors.white,
                  ):Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Or with",
                  style: TextStyle(
                    color: Color(0xff91919F),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap:(){
                  _handleSignInWithGoogle();
                },
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xffF1F1FA)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset("assets/flat-color-icons_google.png"),
                        ),
                        Text(
                          "Sign Up with Google",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                text: TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(
                      color: Color(0xff91919F),
                    ),
                    ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomeBottomBar();
                  }));
                },
                child: Text("Login",
                style: TextStyle(
                  color: Color(0xff7F3DFF),
                ),
                ),
              )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
