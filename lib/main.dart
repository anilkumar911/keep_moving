import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_moving/models/my_vehilce.dart';
import 'package:keep_moving/screens/other.dart';
import 'package:keep_moving/screens/home.dart';
import 'package:keep_moving/screens/car_brand_selector.dart';
import 'package:keep_moving/database/vehicle_database.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<List<MyVehicle>> getMyVehicles() async {
    List<MyVehicle> myVehicles = await VehiclesDatabase.instance.getAllVehicles();
    return myVehicles;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  BrandSelectorScreen(),
    );
  }
}

