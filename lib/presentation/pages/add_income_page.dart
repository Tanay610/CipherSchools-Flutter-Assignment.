
import 'package:easy_expense/cubit/total_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  
    String? selectedCategory;
    String? selectedWallet;
    final bool isZero = true;
    final TextEditingController descriptController = TextEditingController();
  String displayedText = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7B61FF),
      appBar: AppBar(
        backgroundColor: const Color(0xff7B61FF),
        title: const Text(
          "Income",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body:SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 22, bottom: 20),
                      color: const Color(0xff7B61FF),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
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
                          onTap: (){
                            _showTextFieldDialog(context);
                          },
                           child: Text(
                              "₹ ${displayedText}",
                              style: const TextStyle(
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
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              padding: const EdgeInsets.all(3),
                              height: 54,
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xffF1F1FA)),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16))),
                              child: DropdownButtonFormField(
                                  decoration:
                                      const InputDecoration(border: InputBorder.none),
                                  hint: const Text(
                                    "Source",
                                    style: TextStyle(
                                        color: Color(0xff91919F),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: selectedCategory,
                                  items: [
                                    const DropdownMenuItem(
                                      value: "Salary",
                                      child: Text(
                                        "Salary",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const DropdownMenuItem(
                                      value: "Freelance work",
                                      child: Text(
                                        "Freelance work",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const DropdownMenuItem(
                                      value: "Gifts",
                                      child: Text(
                                        "Gifts",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const DropdownMenuItem(
                                      value: "Borrowed",
                                      child: Text(
                                        "Borrowed",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 32,
                                    color: Color(0xff91919F),
                                  ),
                                  onChanged: (v) {
                                    selectedCategory = v;
                                   
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 7),
                              height: 54,
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xffF1F1FA)),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16))),
                              child: TextFormField(
                                controller: descriptController,
                                decoration: const InputDecoration(
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
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              padding: const EdgeInsets.all(3),
                              height: 54,
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xffF1F1FA)),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16))),
                              child: DropdownButtonFormField(
                                  decoration:
                                      const InputDecoration(border: InputBorder.none),
                                  hint: const Text(
                                    "Payment Method",
                                    style: TextStyle(
                                        color: Color(0xff91919F),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  value: selectedWallet,
                                  items: [
                                    const DropdownMenuItem(
                                      value: "Credit Card",
                                      child: Text(
                                        "Credit Card",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const DropdownMenuItem(
                                      value: "Cash",
                                      child: Text(
                                        "Cash",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const DropdownMenuItem(
                                      value: "Debit Card",
                                      child: Text(
                                        "Debit Card",
                                        style: TextStyle(
                                            color: Color(0xff91919F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 32,
                                    color: Color(0xff91919F),
                                  ),
                                  onChanged: (v) {
                        
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: SizedBox(
                                height: 56,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff7F3DFF),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)))),
                                    onPressed: () {
                                      // context.read<ExpenseCubit>().addExpense(descriptController.text.trim(), 120, selectedCategory.toString(), selectedWallet.toString());
                                      Navigator.pop(context);
                                      context.read<TotalCubit>().addIncome(double.parse(displayedText));
                                    },
                                    child: const Text(
                                      "Continue",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
  void _showTextFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newText = displayedText;

        return AlertDialog(
          title: const Text('Enter Income'),
          content: TextField(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter here...',
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
              child: const Text('Cancel'),
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
              child: const Text('Save'),
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
