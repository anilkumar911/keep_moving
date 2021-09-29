import 'package:keep_moving/models/vehicle_model.dart';

enum CarModel {
  marutiSuzukiAlto,
  marutiSuzukiAltoK10,
  marutiSuzukiSwift,
  marutiSuzukiBalino,
  marutiSuzukiVitaraBrezza,
  marutiSuzukiErtiga,
  marutiSuzukiDzire,
  marutiSuzukiWagonR,
  marutiSuzukiSpresso,
  marutiSuzukiXL6,
  marutiSuzukiCelerio,
  marutiSuzukiIgnis,
  marutiSuzukiEeco,
  marutiSuzukiScross,
  marutiSuzukiCiaz,
  marutiSuzukiCelerioX,
  marutiSuzukiCjimmy,
}
class MyVehicle{
  CarModel modelId;
  String vehicleId;
  String brandName;
  String modelName;
  FuelType fuelType;
  MyVehicle(this.modelId, this.vehicleId, this.brandName, this.modelName, this.fuelType);
}

