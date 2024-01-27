
import 'package:easy_expense/data/firebase_authentication/fire_methods.dart';
import 'package:easy_expense/presentation/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _obscureText = true;
  final formyyy = GlobalKey<FormState>();
    final AuthMethods _authMethods = AuthMethods();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login()async{
    String email = _emailController.text.trim();
    String pass = _passwordController.text.trim();
    User? user = await _authMethods.login(email, pass);

    if (user!=null) {
      setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });
       Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomeBottomBar(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child,);
        },
      )
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      backgroundColor: Colors.blue,
        content: Text('You are now successfully logged in. Enjoy!',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          "Log In",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formyyy,
        child: SingleChildScrollView(
          child: Column(
            children: [
          SizedBox(height: 30,),
          
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 18),
              //   child: SizedBox(
              //     height: 56,
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     child: TextFormField(
              //       controller: _nameController,
              //       decoration: InputDecoration(
              //           label: Text("Name"),
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xffF1F1FA)),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xffF1F1FA)),
              //           ),
              //           border: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(16)))),
              //     ),
              //   ),
              // ),
          
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Text(
                            "Welcome back, you have been missed.",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19),
                          ),
              ),
          SizedBox(height: 30,),
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
            
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    login();
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
                    'Log in',
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
                          "Sign up with Google",
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
                    text: "You don't have an account?",
                    style: TextStyle(
                      color: Color(0xff91919F),
                    ),
                    ),
              ),
              GestureDetector(
                onTap: (){
                 Navigator.pop(context);
                },
                child: Text("SignUp",
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