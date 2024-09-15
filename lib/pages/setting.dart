import 'package:flutter/material.dart';
import 'package:smarthome_ui/modeles/chart_ring.dart';
import 'package:smarthome_ui/modeles/statics.dart';
import 'package:smarthome_ui/pages/home.dart';
import 'package:smarthome_ui/widgets/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with TickerProviderStateMixin{
  late final TabController _tabController;
  late final TabController _tabController2;
  late final TabController _tabController3;
  final _tabs=[
    Tab(text: 'Electricity'),
    Tab(text: 'Water')
  ];
  final _tabs2=[
    Tab(text: '24 hrs'),
    Tab(text: '1 week'),
    Tab(text: '1 months',)
  ];
  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 4, vsync: this);
    _tabController2=TabController(length: 2, vsync: this);
    _tabController3=TabController(length: 3, vsync: this);
    _tabController.index=2;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Setting",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey
              ),),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_new,color: Colors.black45,),
                  SizedBox(width: defaultPadding,),
                  Text(
                    "Static",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black45
                  ),),
                ],
              ),
              SizedBox(height: defaultPadding),
              TabBar(
                controller: _tabController2,
                tabs: _tabs,
                labelColor: Colors.blueGrey,
                indicatorColor: secondarybgColor,
                labelStyle: TextStyle(fontSize: 15),
                unselectedLabelColor: Colors.black,
              ),
              SizedBox(height: defaultPadding),
              Container(
                decoration: BoxDecoration(
                  border:Border.all(
                      width: 1,
                      color: secondarybgColor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: TabBar(
                  controller: _tabController3,
                  tabs: _tabs2,
                  labelColor: Colors.blueGrey,
                  labelStyle: TextStyle(fontSize: 15),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: secondarybgColor.withOpacity(0.2),
                    border:Border.all(
                        width: 1,
                        color: secondarybgColor.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
              ),
              SizedBox(height: defaultPadding*2),
              Expanded(
                flex: 3,
                child:chartRing()),
              SizedBox(height: defaultPadding*2,),
              Expanded(
                  child:ListView.builder(
                    itemCount: demoHomeStatistics.length,
                      itemBuilder: (context,index){
                    return rowList(demoHomeStatistics[index]);
                  }
                  )
              )
    ],
    ),)
    ),
    bottomNavigationBar : Container(
    height: 100,
    color: bgColor,
        padding: EdgeInsets.all(10),
    child: TabBar(
    onTap: (value){
    if(value == 0)
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Home()));
    },
    labelColor: secondarybgColor,
    unselectedLabelColor: Colors.grey.shade400,
    controller: _tabController,
    indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
    tabs: [
    ImageIcon(AssetImage('icons/home.png'),size: 30,),
    ImageIcon(AssetImage('icons/search.png'),size: 30,),
    ImageIcon(AssetImage('icons/dashboard.png'),size: 30,),
    ImageIcon(AssetImage('icons/account.png'),size: 30,),
    ],
    )
    ) ,
    );
  }
Padding rowList(HomeStatistics homeStatistics){
    return Padding(
        padding:EdgeInsets.only(bottom: defaultPadding),
    child: Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: homeStatistics.color,
          ),
        ),
        SizedBox(width: defaultPadding/2),
        Expanded(
          child: Text(homeStatistics.homeInterior,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
        ),
        SizedBox(width: defaultPadding/2,),
        Text(homeStatistics.electricity,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),),

      ],
    ),);
}
}
