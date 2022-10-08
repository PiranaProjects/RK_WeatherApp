import 'package:flutter/material.dart';
import 'package:rk_weather_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String tempA = "";
  String humidityA = "";
  String windspeedA = "";
  String descriptionA = "";
  String citynameA="Pantnagar";

  @override
  void initState() {
    print("this is init state of loading");
    super.initState();
  }

  void startApp(String CitySearch) async {
    worker instance = worker(location:CitySearch);

    await instance.getdata(instance.location);
    // setState(() {
    //   tempA = instance.temp;
    //   humidityA = instance.humidity;
    //   windspeedA = instance.wind_speed;
    //   descriptionA = instance.description;
    //   citynameA=instance.location;
    // });
    tempA = instance.temp;
    humidityA = instance.humidity;
    windspeedA = instance.wind_speed;
    descriptionA = instance.description;
    citynameA=instance.location;
    print(instance.temp);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": tempA,
        "hum_value": humidityA,
        "wind_speed": windspeedA,
        "description": descriptionA,
        "cityname":citynameA
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map citysearch = {};
    if(ModalRoute.of(context)!.settings.arguments!=null) {
      citysearch = ModalRoute.of(context)!.settings.arguments as Map;
      citynameA=citysearch["cityname"].toString();
    }
    startApp(citynameA);


    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("Temp=${tempA}"),
                // Text("humidity=${humidityA}"),
                // Text("windspeed=${windspeedA}"),
                // Text("description=${descriptionA}"),
                Image.asset(
                  'assets/images/image1.png',
                ),
                Text(
                  "RK Weather App",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SpinKitFadingFour(
                  color: Colors.black,
                  size: 50.0,
                )
              ],
            ),
          ),
        ));
  }
}
