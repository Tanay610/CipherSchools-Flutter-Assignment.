import 'package:cipher_school_app/data/firebase_authentication/fire_methods.dart';
import 'package:cipher_school_app/presentation/pages/signup_page.dart';
import 'package:cipher_school_app/presentation/widgets/log_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthMethods auth = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff91919F)),
                      ),
                      Text(
                        "Kavya Gautam",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff161719)),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset("assets/edit.svg"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 356,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color(0xffEEE5FF),
                      ),
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SvgPicture.asset(
                            "assets/wallet-3.svg",
                            height: 32,
                            width: 32,
                          )),
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff292B2D)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color(0xffEEE5FF),
                      ),
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SvgPicture.asset(
                            "assets/settings.svg",
                            height: 32,
                            width: 32,
                          )),
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff292B2D)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color(0xffEEE5FF),
                      ),
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SvgPicture.asset(
                            "assets/upload.svg",
                            height: 32,
                            width: 32,
                          )),
                    ),
                    Text(
                      "Export Data",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff292B2D)),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return LogoutDialog();
                      },
                    ).then((value) {
                      if (value == true) {
                        auth.logout();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => SignupPage()),
                          (route) => false,
                        );
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Color(0xffFFE2E4),
                        ),
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SvgPicture.asset(
                              "assets/logout.svg",
                              height: 32,
                              width: 32,
                            )),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff292B2D)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
