
import 'package:cipher_school_app/cubit/category_cubit.dart';
import 'package:cipher_school_app/cubit/expense_cubit.dart';
import 'package:cipher_school_app/cubit/total_cubit.dart';
import 'package:cipher_school_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  String? selectedWallet;
  String? selectedCategory;
  final TextEditingController descriptController = TextEditingController();
  String displayedText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0077FF),
      appBar: AppBar(
        backgroundColor: Color(0xff0077FF),
        title: Text(
          "Expense",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child:SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 22, bottom: 20),
                        color: Color(0xff0077FF),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "How much?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xffFCFCFC)),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _showTextFieldDialog(context);
                              },
                              child: Text(
                                "₹ $displayedText",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 64,
                                    color: Color(0xffFCFCFC)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32))),
                        child: Column(
                          children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 10),
                                  padding: EdgeInsets.all(3),
                                  height: 54,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffF1F1FA)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      hint: Text(
                                        "Category",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      value: selectedCategory,
                                      items: [
                                        DropdownMenuItem(
                                          value: "Food",
                                          child: Text(
                                            "Food",
                                            style: TextStyle(
                                                color: Color(0xff91919F),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "Subsriptions",
                                          child: Text(
                                            "Subscriptions",
                                            style: TextStyle(
                                                color: Color(0xff91919F),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "Shopping",
                                          child: Text(
                                            "Shopping",
                                            style: TextStyle(
                                                color: Color(0xff91919F),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: "Travel",
                                          child: Text(
                                            "Travel",
                                            style: TextStyle(
                                                color: Color(0xff91919F),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 32,
                                        color: Color(0xff91919F),
                                      ),
                                      onChanged: (v) {
                                        setState(() {
                                        selectedCategory = v!;
                                        });
                                      }),
                                ),
                              
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 7),
                              height: 54,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffF1F1FA)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: TextFormField(
                                controller: descriptController,
                                decoration: InputDecoration(
                                    hintText: "Description",
                                    contentPadding: EdgeInsets.all(4),
                                    hintStyle: TextStyle(
                                        color: Color(0xff91919F),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 10),
                              padding: EdgeInsets.all(3),
                              height: 54,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffF1F1FA)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: DropdownButtonFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  hint: Text(
                                    "Payment Method",
                                    style: TextStyle(
                                        color: Color(0xff91919F),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: selectedWallet,
                                  items: [
                                    DropdownMenuItem(
                                      value: "Credit Card",
                                      child: Text(
                                        "Credit Card",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "Cash",
                                      child: Text(
                                        "Cash",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "Debit",
                                      child: Text(
                                        "Debit Card",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 32,
                                    color: Color(0xff91919F),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      selectedWallet = val!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            SizedBox(
                              height: 56,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff7F3DFF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)))),
                                  onPressed: () {
                                      // Process data.
                                      final Map<String, Color> colors = {
                                        'Food': const Color(0xffFDD5D7),
                                        'Subscriptions': Color(0xffEEE5FF),
                                        'Shopping': Color(0xffFCEED4),
                                        'Travel': Color(0xffF1F1FA),
                                      };

                                      

                                      final Map<String, String> images = {
                                        'Food': "assets/icons8-ice-cream-cone-64.png",
                                      'Subscriptions': "assets/recurring-bill.png",
                                        'Shopping': "assets/shopping-bag.png",
                                        'Travel': "assets/car.png",
                                      };
                                      context.read<CategoryCubit>().selectCategory(images[selectedCategory]!, colors[selectedCategory]!);
                                      context.read<ExpenseCubit>().addExpense(
                                          descriptController.text.trim(),
                                          double.parse(displayedText),
                                          selectedCategory.toString(),
                                          selectedWallet.toString(),
                                          );

                                      context.read<TotalCubit>().addExpense(
                                          double.parse(displayedText));

                                      Navigator.pop(context);
                                    },
                                  
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            
        ),
      
      extendBodyBehindAppBar: true,
    );
  }

  void _showTextFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newText = displayedText;

        return AlertDialog(
          title: Text('Enter expense'),
          content: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter expense',
            ),
            onChanged: (value) {
              newText = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_isNumeric(newText)) {
                  setState(() {
                    displayedText = newText;
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  bool _isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }
}
