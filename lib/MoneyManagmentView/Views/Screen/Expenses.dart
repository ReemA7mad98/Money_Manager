import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/Views/Widgets/custome_appbar.dart';
import 'package:helloworld/MoneyManagmentView/models/expense.dart';
import 'package:provider/provider.dart';

import '../../data/Categories.dart';
import '../../providers/money_provider.dart';
import '../Widgets/ViewData.dart';

class ExpensesScreen extends StatefulWidget {
  static late TabController tabController;
  static GlobalKey<ScaffoldState> key1 = GlobalKey();
  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  int myTabIndex = 0;
  initalizeTabController() {
    ExpensesScreen.tabController = TabController(length: 2, vsync: this);
    ExpensesScreen.tabController.index = 1;
    ExpensesScreen.tabController.addListener(() {
      makeDelay();
    });
  }

  makeDelay() async {
    await Future.delayed(Duration(seconds: 1));
    Provider.of<MoneyProvider>(context, listen: false)
        .changeMyTabIndex(ExpensesScreen.tabController.index);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    initalizeTabController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ExpensesScreen.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, provider, x) {
      return Scaffold(
          key: ExpensesScreen.key1, // set it here
          endDrawer: buildProfileDrawer(),
          appBar: customAppbar(),
          body: Container(
              height: 800.h,
              child: provider.expenses.isNotEmpty || provider.incomes.isNotEmpty
                  ? Column(children: [
                      Expanded(
                          // height: 443.h,
                          child: ListView.builder(
                              itemCount: ExpensesScreen.tabController.index == 1
                                  ? provider.expenses
                                      .where((element) =>
                                          element.account_ID ==
                                          provider.balances
                                              .elementAt(
                                                  provider.selectedbalance!)!
                                              .account_ID!)
                                      .length
                                  : provider.incomes
                                      .where((element) =>
                                          element.account_ID ==
                                          provider.balances
                                              .elementAt(
                                                  provider.selectedbalance!)!
                                              .account_ID)
                                      .length,
                              itemBuilder: (context, index) {
                                return (() {
                                
                                
                                  if (Provider.of<MoneyProvider>(context,
                                              listen: false)
                                          .myTabIndex ==
                                      1) {
                                    return ViewData(
                                        'expenses',
                                        (provider.expenses
                                                .where((element) =>
                                                    element.account_ID ==
                                                    provider.balances
                                                        .elementAt(provider
                                                            .selectedbalance!)!
                                                        .account_ID)
                                                .toList())[index]
                                            .toMap());
                                  } else {

                                    return ViewData(
                                        'incomes',
                                        (provider.incomes
                                                .where((element) =>
                                                    element.account_ID ==
                                                    provider.balances
                                                        .elementAt(provider
                                                            .selectedbalance!)!
                                                        .account_ID)
                                                .toList())[index]
                                            .toMap());
                                  }
                                }());
                              }))
                    ])
                  : SizedBox(child: Text(''))));
    });
  }
}

buildProfileDrawer() {
  return Drawer(
    backgroundColor: Color.fromARGB(255, 49, 134, 101),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 57, 106, 85),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('image/AvatarProfilePic.png'),
          ),
          accountEmail: Text('Reem@gmail.com', textAlign: TextAlign.end),
          accountName: Text('Reem'),
         
        ),
        Expanded(
            child: ListTile(
          title: Text('????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.list),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(0);
          },
        )),
        Expanded(
            child: ListTile(
          //  title: Text('????????????'),
          title: Text('????????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.done),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(1);
          },
        )),
        Expanded(
            child: ListTile(
          // title: Text('???????????? ????????????????'),
          title: Text('???????????? ????????????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
         leading: Icon(Icons.done),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('????????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.list),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          // title: Text('?????????????????? ??????????????'),
          title: Text('?????????????????? ??????????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.payment),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
         
          title: Text('??????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.notification_add),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
         
          title: Text('????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.currency_exchange),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          
          title: Text('??????????????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          // title: Text('???????? ???? ????????????????'),
          title: Text('???????? ???? ????????????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.share),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          //  title: Text('?????? ??????????????'),
          title: Text('?????? ??????????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
          leading: Icon(Icons.star),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        )),
        Expanded(
            child: ListTile(
          title: Text('?????????? ???? ???????? ??????????', textAlign: TextAlign.end),
          iconColor: Colors.white,
          textColor: Colors.white,
         
          leading: Icon(Icons.contact_mail),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            ExpensesScreen.tabController.animateTo(2);
          },
        ))
      ],
    ),
  );
  
}
