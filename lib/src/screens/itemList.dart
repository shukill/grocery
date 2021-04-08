import 'package:flutter/material.dart';
import 'package:grocery/src/model/itemList.dart';
import 'package:grocery/src/styles/colors.dart';
import 'package:grocery/src/styles/text.dart';
import 'package:grocery/src/widgets/itemCard.dart';
import 'package:grocery/src/widgets/myAppBar.dart';
import 'package:grocery/src/widgets/searchbar.dart';

class ItemList extends StatelessWidget {
  final List<Items> items = [
    Items(title: 'Dove Soap', quantity: '35', moneySpent: '35', imageUrl: ''),
    Items(
      title: 'Parachute oil',
      quantity: '35',
      moneySpent: '15',
      imageUrl: '',
    ),
    Items(
        title: 'Colgate Toothpaste',
        quantity: '35',
        moneySpent: '50',
        imageUrl: ''),
    Items(
      title: 'Neem FaceWash',
      quantity: '35',
      moneySpent: '50',
      imageUrl: '',
    ),
    Items(
      title: 'Sunscreen',
      quantity: '35',
      moneySpent: '30',
      imageUrl: '',
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
                'Item List',
                style: AppTextStyles.userIdBold,
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return MyItemListCard(
                      title: items[index].title,
                      quantity: items[index].quantity,
                      moneySpent: items[index].moneySpent,
                      imageUrl: items[index].imageUrl,
                    );
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
      height: MediaQuery.of(context).size.height * 0.4,
      color: AppColors.red,
      child: Material(
        color: AppColors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
        child: Column(
          children: [
            SearchAndAppBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Monthly',
                      style: AppTextStyles.userNameLight,
                    ),
                    Text(
                      'Current List',
                      style: AppTextStyles.timeAgoExtraLight,
                    ),
                  ],
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '12',
                      style: AppTextStyles.userNameLight,
                    ),
                    Text(
                      'Total Items',
                      style: AppTextStyles.timeAgoExtraLight,
                    ),
                  ],
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '1200',
                      style: AppTextStyles.userNameLight,
                    ),
                    Text(
                      'Total Cost',
                      style: AppTextStyles.timeAgoExtraLight,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchAndAppBar extends StatelessWidget {
  const SearchAndAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
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
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.white,
                ),
                BuildSearchBar(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
