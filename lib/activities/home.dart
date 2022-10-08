import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState(){
    super.initState();
    print('this is init state');
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Setstate called");
  }

  TextEditingController searchcontroller=new TextEditingController();

  @override
  void dispose() {
    searchcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Map infodata = {};
    infodata = ModalRoute.of(context)!.settings.arguments as Map;
    String temp=infodata["temp_value"].toString();
    String humidity=infodata["hum_value"].toString();
    String wind=infodata["wind_speed"].toString();
    String description=infodata["description"].toString();
    String city=infodata["cityname"].toString();


    // print((infodata["temp_value"]).toString());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent,Colors.purpleAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
              padding: EdgeInsets.fromLTRB(10,0,0,0),
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search any city name"
                          ),
                        ),
                      ),
                      GestureDetector(child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.search),
                      ),onTap: (){
                        print(searchcontroller.text);
                        if(searchcontroller.text==""){
                          print("Blank Search");
                        }
                        else{
                          Navigator.pushReplacementNamed(context,'/loading',arguments: {
                            "cityname":searchcontroller.text
                          });
                        }
                      },),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10,0),
                        padding: EdgeInsets.all(10),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(description,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                              Text("In ${city}")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10,0),
                    padding: EdgeInsets.all(10),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(WeatherIcons.thermometer,size: 50,color: Colors.red,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(temp,style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
                              Text(" \u2103",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(WeatherIcons.day_windy,size: 25,color: Colors.blueAccent),
                            SizedBox(height: 20),
                            SingleChildScrollView(child: Center(child: Text("Wind Speed $wind Kph",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)))),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child:Container(
                          color: Colors.white.withOpacity(0.5),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(WeatherIcons.humidity,size: 25,color: Colors.blueAccent),
                              SizedBox(height: 20),
                              Center(child: Text("Humidity $humidity %",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                            ],
                          ),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 15, 10,0),
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Made By Ritik Kushwaha",style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic)),
                            Text("Realtime data weather app",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
