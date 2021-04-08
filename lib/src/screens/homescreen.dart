import 'package:flutter/material.dart';
import 'package:grocery/src/model/mainList.dart';
import 'package:grocery/src/styles/colors.dart';
import 'package:grocery/src/styles/text.dart';
import 'package:grocery/src/widgets/button.dart';
import 'package:grocery/src/widgets/listCard.dart';
import 'package:grocery/src/widgets/myAppBar.dart';
import 'package:grocery/src/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  final List<MainItems> mainitems = [
    MainItems(
      title: 'Monthly List',
      quantity: '35',
      moneySpent: '3500',
    ),
    MainItems(
      title: 'Occassion List',
      quantity: '35',
      moneySpent: '1500',
    ),
    MainItems(
      title: 'Daily List',
      quantity: '35',
      moneySpent: '3500',
    ),
    MainItems(
      title: 'Monthly List',
      quantity: '35',
      moneySpent: '3500',
    ),
    MainItems(
      title: 'Monthly List',
      quantity: '35',
      moneySpent: '3500',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.red,
          child: Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopPart(),
              SizedBox(
                height: 30,
              ),
              Text(
                'Previous List',
                style: AppTextStyles.userIdBold,
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: mainitems.length,
                  itemBuilder: (context, index) {
                    return MyMenuCard(
                        title: mainitems[index].title,
                        quantity: mainitems[index].quantity,
                        moneySpent: mainitems[index].moneySpent,
                        onTap: () => Navigator.pushNamed(context, '/itemlist'));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      color: AppColors.lightblue,
      child: Material(
        color: AppColors.lightblue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.065),
            MyAppBar(),
            SizedBox(height: 30),
            Text(
              'ListGent',
              style: AppTextStyles.title,
            ),
            SizedBox(height: 50),
            BuildSearchBar(),
            SizedBox(
              height: 30,
            ),
            AppButton(buttonText: 'Create New List'),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
