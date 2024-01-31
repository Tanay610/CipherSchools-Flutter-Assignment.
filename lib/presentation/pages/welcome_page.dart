
import 'package:easy_expense/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7B61FF),
      body: Stack(
        children: [
          
          Positioned(
            bottom: 70,
            left: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Welcome to\n"+"EasyExpenses",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const SignupPage();
                        }));
                      },
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: const Color(0xffEDE1E1).withOpacity(0.75),
                        child: Center(
                          child: Image.asset(
                            "assets/moa.png",
                            height: 47,
                            )
                        ),
                      ),
                    )
                  ],
                ),
                        
                const Text("The best way to track your expenses",
                style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w400,
                      fontSize:17
                    ),
                )
              ],
            ),
          ),
          
          Positioned(
            right: 0,
            child: Transform.rotate(
              angle: -3.2,
              child: Image.asset("assets/recordcircle.png")),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset("assets/recordcircle.png")),
          Positioned(
            top: 40,
            left: 10,
            child: Image.asset("assets/Vector.png",
            height: 85,
            )),
            
        ],
      ),
    );
  }
}