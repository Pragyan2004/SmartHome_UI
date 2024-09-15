import 'package:flutter/material.dart';
import 'package:smarthome_ui/pages/home.dart';
import 'package:smarthome_ui/widgets/colors.dart';
import 'package:getwidget/getwidget.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
class HomeDetails extends StatefulWidget {
   HomeDetails({
     super.key,
     required this.title,
     required this.image,
     required this.humidifier,
     required this.airPurrifier,
     required this.boolHumidifier,
     required this.boolAirPurrifier,
     required this.floorlamp,
     required this.mainLight
   });
  final String title, image, humidifier, airPurrifier;
  final bool boolHumidifier, boolAirPurrifier;
  final double floorlamp, mainLight;

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}
class _HomeDetailsState extends State<HomeDetails> with TickerProviderStateMixin{
  late double _value= widget.mainLight;
  late double _value2= widget.floorlamp;
  late final TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 4, vsync: this);
    _tabController.index=2;
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    width: double.infinity,
                      height: height/2,
                    ),
                  ),
                  Container(
                    height: height/2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: bgColor,
                          blurRadius: 20,
                          spreadRadius: 20,
                          offset: Offset(5,0)
                        )
                      ]
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding*1.5,vertical: defaultPadding),
                child: Column(
                  children: [
                    Container(
                      decoration:BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                        blurRadius:100,
                        spreadRadius: 100,
                        offset: Offset(5,0),
                )
                    ]
                ),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          },
                            icon: Icon(Icons.arrow_back_ios_new,size: 30,),
                          ),
                          Expanded(child: Center(
                            child: Text(widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          ),
                          Icon(Icons.notifications,
                            size: 30,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:height/2-200,),
                    Row(
                      children: [
                        Expanded(
                            child:Container(
                              height: 230,
                                padding: EdgeInsets.all(defaultPadding),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(33)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     Text(widget.humidifier,style: TextStyle(
                                       fontSize: 30,
                                       fontWeight: FontWeight.w600
                                     ),),
                                      SizedBox(
                                        height: 40,
                                          width: 40,
                                          child: Image.asset('icons/humidity.png'),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: defaultPadding,),
                                  Expanded(
                                    child:Text(
                                      'humidifier air',
                                      style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300
                                  ),),),
                                  SizedBox(height: defaultPadding),
                                  Container(
                                    height: 1,
                                      width: double.infinity,
                                    color: Colors.black12,
                                  ),
                                  SizedBox(height: defaultPadding*3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                    Text(
                                      'Mode',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300
                                      ),),
                                      GFToggle(
                                value:widget.boolHumidifier,
                                disabledTrackColor:secondarybgColor,
                                enabledThumbColor:primaryColor,
                                        enabledTrackColor: Colors.yellow,
                                        type:GFToggleType.ios,
                                        onChanged: (bool? value) {  },
                            )
                                    ],
                                  ),
                                ],
                              ),
                            ) ),
                        SizedBox(width: defaultPadding,),
                        Expanded(
                            child:Container(
                              height: 230,
                              padding: EdgeInsets.all(defaultPadding),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(33)
                              ),
                              child: Column(
                                children: [ Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.airPurrifier,style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600
                                    ),),
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset('icons/wind.png'),
                                    )
                                  ],
                                ),
                                  SizedBox(height: defaultPadding,),
                                  Expanded(
                                    child:Text(
                                      'Air Purifier',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300
                                      ),),),
                                  SizedBox(height: defaultPadding*2,),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Colors.black12,
                                  ),
                                  SizedBox(height: defaultPadding*2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text(
                                        'Mode',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300
                                        ),),
                                      GFToggle(
                                        onChanged:(bool?value){ },
                                        value:widget.boolHumidifier,
                                        disabledTrackColor:secondarybgColor,
                                        enabledThumbColor:primaryColor,
                                        enabledTrackColor: Colors.blue,
                                        type:GFToggleType.ios,
                                      )
                                    ],
                                  ),],
                              ),
                            ) ),
                      ],
                    ),
                    SizedBox(height: defaultPadding),
                        Container(
                          height: 200,
                          width: double.infinity,
                          padding: EdgeInsets.only(top: defaultPadding,right: defaultPadding,bottom: defaultPadding),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(33)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: defaultPadding),
                                child: Text('Main Light',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300
                                  ),),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SfSliderTheme(
                                      data: SfSliderThemeData(
                                        activeDividerColor: secondarybgColor,
                                        activeTrackHeight:10,
                                        inactiveDividerRadius: 5,
                                        thumbStrokeWidth: 7,
                                        thumbRadius: 15,
                                        inactiveDividerColor: bgColor,
                                        thumbColor: bgColor,
                                        thumbStrokeColor: secondarybgColor
                                      ),
                                    child: SfSlider(
                                      min:0,
                                      max:100,
                                      interval:5,
                                      value: _value,
                                        onChanged:(value){
                                        setState(() {
                                          _value=value;
                                        });
                                      }
                                    ),),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset('icons/ceiling-lamp.png'),
                                  )
                                ],
                              ),
                              Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: defaultPadding),
                                    child: Text('Floor lamp',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300
                                      ),),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SfSliderTheme(
                                          data: SfSliderThemeData(
                                              activeDividerColor: secondarybgColor,
                                              activeTrackHeight:10,
                                              inactiveDividerRadius: 5,
                                              thumbStrokeWidth: 7,
                                              thumbRadius: 15,
                                              inactiveDividerColor: bgColor,
                                              thumbColor: bgColor,
                                              thumbStrokeColor: secondarybgColor
                                          ),
                                          child: SfSlider(
                                              min:0,
                                              max:100,
                                              interval:5,
                                              value: _value2,
                                              onChanged:(value){
                                                setState(() {
                                                  _value2=value;
                                                });
                                              }
                                          ),),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Image.asset('icons/table-lamp.png'),
                                      )
                                    ],
                                  )
                            ],
                          ),
                        ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:Container(
          height: 100,
          color: bgColor,
          padding: EdgeInsets.all(10),
          child: TabBar(
            onTap: (value){
              if(value==0)
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
}
