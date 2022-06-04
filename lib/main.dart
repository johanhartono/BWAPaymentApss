// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'theme.dart';

void main() => runApp(PaymentApps());

// ignore: use_key_in_widget_constructors
class PaymentApps extends StatefulWidget {
  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: selectedIndex == index ? Colors.blue : Colors.white),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectedIndex == index
                        ? Image.asset('assets/check_two.png',
                            width: 18, height: 18)
                        : Image.asset('assets/check_one.png',
                            width: 18, height: 18),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: planTextStyle,
                        ),
                        Text(
                          subTitle,
                          style: descTextStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 91,
                    ),
                    Text(
                      pricing,
                      style: priceTextStyle,
                    )
                  ],
                )
              ],
            )),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
        
          // ignore: sized_box_for_whitespace
          Container (
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
                
              ),
              onPressed: () {}, child: Text('Check out Now',style: buttonTextStyle)),
          )
        ],
      );
    }

    Widget header() {
      return Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 32, right: 32),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/icon_one.png',
                  width: 267,
                  height: 200,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Upgrade To',
                  style: titleTextStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                )
              ]),
              Text(
                'Go unlock all featutes and\nbuild your own business bigger',
                style: subTitleTextStyle,
                textAlign: TextAlign.center,
              )
            ],
          ));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(height: 50),
              option(0, 'Monthly', 'Good for starting up', '\$20'),
              option(1, 'Quarterly', 'Focusing on Corporate', '\$30'),
              option(2, 'Quarterly', 'Focusing on Enterprise', '\$40'),
              SizedBox(height: 50),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
