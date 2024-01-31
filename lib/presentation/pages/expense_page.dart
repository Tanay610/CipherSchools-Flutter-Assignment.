
import 'package:easy_expense/cubit/category_cubit.dart';
import 'package:easy_expense/cubit/expense_cubit.dart';
import 'package:easy_expense/cubit/total_cubit.dart';
import 'package:easy_expense/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<bool> istoday = [true, true, true, true];
  int selectedTabIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 312,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffFFF6E5), Color(0xffF8EDD8)])),
            child: BlocBuilder<TotalCubit, TotalAmount>(
              builder: (context, amount) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromARGB(255, 178, 139, 255),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff7F3DFF),
                            ),
                            Text(
                              "October",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return CategoryPage(categoryCubit: CategoryCubit(),);
                            // }));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.notifications,
                              color: Color(0xff7F3DFF),
                              size: 38,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text("Account Balance"),
                    ),
                    Text(
                      '₹ ${amount.totalIncome - amount.totalExpense}',
                      style:
                          const TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 80,
                            width: 180,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.green),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(14),
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset("assets/Frame 27.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Income",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 90,
                                        child: Text(
                                          "₹${amount.totalIncome}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 19),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 80,
                            width: 180,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.red),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(14),
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset("assets/Frame 26.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Expenses",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 90,
                                        child: Text(
                                          "₹${amount.totalExpense}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildtoday(0, "Today"),
                    _buildtoday(1, "Week"),
                    _buildtoday(2, "Month"),
                    _buildtoday(3, "Year"),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Recent Transaction",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff292B2D)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    width: 78,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xffEEE5FF),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: const Center(
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff7F3DFF),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<ExpenseCubit, List<ExpenseModel>>(
            builder: (context, state) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: state.length,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final list = state[index];
                        return Dismissible(
                            key: Key(list.id.toString()),
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: const Icon(Icons.delete, color: Colors.white),
                            ),
                            onDismissed: (direction) {
                              context.read<ExpenseCubit>().removeExpense(list);
                            },
                            child: ListTile(
                              tileColor: const Color(0xffFCFCFC),
                              leading: BlocBuilder<CategoryCubit,List<Map<String, dynamic>>> (
                                builder: (context, state) {
                                  final listcate = state[index];
                                  return Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          color: listcate["color"]),
                                      child: Image.asset(listcate["imagePath"]));
                                },
                              ),
                              title: Text(
                                list.category,
                                style: const TextStyle(
                                  color: Color(0xff292B2D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                list.description,
                                style: const TextStyle(
                                    color: Color(0xff91919F),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: Column(
                                children: [
                                  Text(
                                    "-₹${list.amount}",
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                      "${list.time.hour}:${list.time.minute}${list.time.hour < 12 ? 'AM' : 'PM'}",
                                      style: const TextStyle(
                                          color: Color(0xff91919F),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }));
            },
          )
        ],
      ),
    );
  }

  Widget _buildtoday(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
        height: 34,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: selectedTabIndex == index
              ? const Color(0xffFCEED4)
              : Colors.transparent,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: selectedTabIndex == index
                    ? const Color(0xffFCAC12)
                    : const Color(0xff91919F),
                fontWeight: selectedTabIndex == index
                    ? FontWeight.w700
                    : FontWeight.w500,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}
