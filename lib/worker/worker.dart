import 'dart:convert';
import 'package:http/http.dart';

class worker
{
  String location="";
  String temp="";
  String humidity="";
  String wind_speed="";
  String description="";
  String cityname="";

  worker({required this.location}){
    location=this.location;
  }

  Future<void> getdata(String location)async{

    try{
      location=this.location;
      var uri=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=cc7ee320fb1029be564636a4dde43306");
      Response response=await get(uri);
      Map datamap=jsonDecode(response.body);

      //get temperature
      Map temp_data=datamap["main"];
      double gettemp=temp_data["temp"]-273.15;
      print(gettemp);

      //get humidity
      int gethumidity=temp_data["humidity"];
      print(gethumidity);

      // getwindspeed
      Map wind_data=datamap["wind"];
      double getwind_speed=wind_data["speed"]*3.6;
      print(getwind_speed);

      //get description
      List weather_data=datamap["weather"];
      Map weathercontent=weather_data[0];
      String getdescription=weathercontent["description"];
      print(getdescription);

      //get name
      String name=datamap["name"];

      temp=gettemp.toString().substring(0,4);
      humidity=gethumidity.toString();
      wind_speed=getwind_speed.toString().substring(0,3);
      description=getdescription.toString();
      cityname=name.toString();
    }
    catch(e) {
      temp = "NA";
      humidity = "NA";
      wind_speed = "NA";
      description = "can't find data";
      cityname="NA";
    }
  }
}

