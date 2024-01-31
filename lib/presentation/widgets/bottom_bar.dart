
import 'package:easy_expense/presentation/pages/add_expense_page.dart';
import 'package:easy_expense/presentation/pages/add_income_page.dart';
import 'package:easy_expense/presentation/pages/expense_page.dart';
import 'package:easy_expense/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int index = 0;
  final List<Widget> screens = [
    const ExpensePage(),
    const ProfilePage(),
  ];

  final PageStorageBucket pagestore = PageStorageBucket();
  Widget currentPage = const ExpensePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: pagestore, child: currentPage),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff7F3DFF),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        onPressed: () {
          _showAddOptions(context);
        },
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 15.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentPage = const ExpensePage();
                        index = 0;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/home.svg",
                            color: index == 0
                                ? const Color(0xff7F3DFF)
                                : const Color(0xffC6C6C6)),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: index == 0
                                  ? const Color(0xff7F3DFF)
                                  : const Color(0xffC6C6C6),
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      setState(() {
                        // currentPage = SignupPage();
                        index = 1;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/transaction.svg",
                            height: 25,
                            color: index == 1
                                ? const Color(0xff7F3DFF)
                                : const Color(0xffC6C6C6)),
                        Text(
                          "Transaction",
                          style: TextStyle(
                              color: index == 1
                                  ? const Color(0xff7F3DFF)
                                  : const Color(0xffC6C6C6),
                              fontSize: 9,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        // currentPage = AddExpensePage();
                        index = 2;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/pie chart.svg",
                            color: index == 2
                                ? const Color(0xff7F3DFF)
                                : const Color(0xffC6C6C6)),
                        Text(
                          "Budget",
                          style: TextStyle(
                              color: index == 2
                                  ? const Color(0xff7F3DFF)
                                  : const Color(0xffC6C6C6),
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentPage = const ProfilePage();
                        index = 3;
                      });
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/user.svg",
                            color: index == 3
                                ? const Color(0xff7F3DFF)
                                : const Color(0xffC6C6C6)),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: index == 3
                                  ? const Color(0xff7F3DFF)
                                  : const Color(0xffC6C6C6),
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.arrow_upward,
                  color: Colors.green,
                ),
                title: const Text(
                  'Add Income',
                  style: TextStyle(
                      color: Color(0xff7F3DFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const IncomePage();
                  }));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                ),
                title: const Text(
                  'Add Expense',
                  style: TextStyle(
                      color: Color(0xff7F3DFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddExpensePage();
                  }));

                  
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
