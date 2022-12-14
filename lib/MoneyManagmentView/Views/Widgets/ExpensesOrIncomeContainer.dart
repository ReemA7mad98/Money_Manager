import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/Views/Widgets/myChart.dart';
import 'package:provider/provider.dart';

import '../../models/screenArgument.dart';
import '../../providers/money_provider.dart';
import '../Screen/CategoryScreen.dart';
import '../Screen/Matters.dart';

class ExpensesOrIncome extends StatefulWidget {
  String title = '';
  ExpensesOrIncome(this.title);

  @override
  State<ExpensesOrIncome> createState() => _ExpensesOrIncomeState(title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement context
  BuildContext get context => throw UnimplementedError();

  @override
  void deactivate() {
    // TODO: implement deactivate
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
  }

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  // TODO: implement mounted
  bool get mounted => throw UnimplementedError();

  @override
  void reassemble() {
    // TODO: implement reassemble
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
  }

  @override
  // TODO: implement widget
  StatefulWidget get widget => throw UnimplementedError();
}

class _ExpensesOrIncomeState extends State<ExpensesOrIncome>
    with SingleTickerProviderStateMixin {
  late TabController MytabController;
  String title = '';
  _ExpensesOrIncomeState(this.title);

  initalizeTabController() {
    MytabController = TabController(length: 5, vsync: this);
    MytabController.index = 4;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalizeTabController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    MytabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, provider, x) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(27.0),
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 1.h,
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                  indicatorColor: Color.fromARGB(255, 49, 134, 101),
                  labelStyle: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Noto Naskh Arabic',
                  ),
                  labelColor:
                      Color.fromARGB(255, 49, 134, 101), //For Selected tab
                  unselectedLabelColor: Color.fromARGB(255, 123, 124, 116),
                  controller: MytabController,
                  tabs: [
                    Tab(
                      text: '????????',
                    ),
                    Tab(
                      text: '??????',
                    ),
                    Tab(
                      text: '??????',
                    ),
                    Tab(
                      text: '??????????',
                    ),
                    Tab(
                      text: '??????',
                    )
                  ]),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startDocked,
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 31.0),
                child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 253, 194, 42),
                  onPressed: () {
                    //Navigator.of(context).pushNamed('CategoryScreen');
                    Navigator.of(context).pushReplacementNamed(
                      'MattersScreen',
                      arguments: ScreenArguments('', 0),
                    );
                  },
                  child: Center(
                    child: Text('+',
                        style: TextStyle(color: Colors.black, fontSize: 28)),
                  ),
                )),
            body: Column(children: [
              Expanded(child: 
           TabBarView(
     controller: MytabController,
     children: [
      Row(),
Row(children: [
  Expanded(child: SizedBox()),
  Center(child:Text(DateTime.now().year!.toString() 
    
    )),
    Expanded(child: SizedBox()),IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))],),
Row(children: [Expanded(child: SizedBox()),
  Center(child: Text(DateTime.now().month!.toString() 
    
)),
    Expanded(child: SizedBox()),IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))],),
Row(children: [Expanded(child: SizedBox()),
  Center(child:Text(DateTime.now().add(const Duration(days: 7)).month!.toString() +
     '/' +
    (DateTime.now().add(const Duration(days: 7)).day).toString()+'-'+DateTime.now().month!.toString()+'/'+DateTime.now().day!.toString())),
    Expanded(child: SizedBox()),IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))],),
Row(children: [Expanded(child: SizedBox()),
  Center(child: Text(DateTime.now().month!.toString() +
     '/' +
    DateTime.now().day!.toString()+',?????????? ')),
    Expanded(child: SizedBox()),IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))],)
 ])),
              Container(height: 418.h, child: ChartApp(title!))
      // , Container(height:500.h,color:Colors.red) 
        ]) ));
    });
  }
}
