import 'package:flutter/material.dart';
import 'package:smarthome_ui/modeles/devices.dart';
import 'package:smarthome_ui/modeles/home_interior.dart';
import 'package:smarthome_ui/pages/home_details.dart';
import 'package:smarthome_ui/pages/setting.dart';
import 'package:smarthome_ui/widgets/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final PageController _pageController=PageController(initialPage: 0);
  late final TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding*1.5,vertical: defaultPadding*2),
              child: Row(
                children: [
                  Expanded(
                    child: Text("Hello,Adi!",style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                  Icon(Icons.notifications_outlined,
                  color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(width: defaultPadding,),
                  Icon(Icons.settings_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:defaultPadding*1.5),
              child: SizedBox(height: 200,
                width: double.infinity,
              child: ListView.builder(
                controller: _pageController,
                scrollDirection:Axis.horizontal,
                itemCount: demoHomeInterior.length,
                  itemBuilder: (context,index){
                  return homeCard(demoHomeInterior[index]);
              }),
              ),
            ),
            SizedBox(height: defaultPadding),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.grey.withOpacity(0.3),
                  activeDotColor: secondarybgColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:defaultPadding),
              child: Text("My Device",style: TextStyle(
                color: Colors.grey,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding*1.5,vertical: defaultPadding),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: demoHomeDevices.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                        mainAxisExtent:MediaQuery.of(context).size.width/2-36,
                      crossAxisSpacing:20,
                      mainAxisSpacing:20,
                      ),
                      itemBuilder:(context,index){
                        return deviceCard(demoHomeDevices[index]);
                      },
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar:Container(
        height: 100,
        color: bgColor,
        padding: EdgeInsets.all(10),
        child: TabBar(
          onTap: (value){
            if(value == 2)
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SettingScreen()));
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

  Container deviceCard (HomeDevices homeDevices){
   return Container(
      padding: const EdgeInsets.all(defaultPadding/10),
      decoration: BoxDecoration(
          color:primaryColor,
          borderRadius: BorderRadius.circular(33)
      ),
     child: Column(
       children: [
         SizedBox(
           height: 95,
         width: 95,
         child: Image.asset(
           homeDevices.image,
           fit: BoxFit.cover,
          ),
         ),
         SizedBox(height: defaultPadding),
         FittedBox(child: Text(
           homeDevices.title,style: TextStyle(
           color: Colors.black,
           fontSize: 22,
           fontWeight: FontWeight.w400
         ),
         ),),
         FittedBox(child: Text(
           homeDevices.title,style: TextStyle(
             color: Colors.black45,
             fontSize: 16,
             fontWeight: FontWeight.w600
         ),
         ),),
       ],
     ),
    );
  }
  Padding homeCard(HomeInterior homeInterior){
    return Padding(
        padding: const EdgeInsets.only(right: defaultPadding),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeDetails(
                  title: homeInterior.title,
                  image: homeInterior.image,
                  humidifier: homeInterior.humidifier,
                  airPurrifier: homeInterior.airPurrifier,
                  boolHumidifier:homeInterior. boolHumidifier,
                  boolAirPurrifier: homeInterior.boolAirPurrifier,
                  floorlamp:homeInterior. floorlamp,
                  mainLight: homeInterior.mainLight
              )));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(homeInterior.image,
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:defaultPadding),
            child: Text(homeInterior.title,
            style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22
            )),
          )
        ],
      ),
    );
  }
}
