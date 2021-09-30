import 'package:keep_moving/models/vehicle_model.dart';
import 'package:sqflite/sqflite.dart';

class VehicleFields {
  static final List<String> values = [
    /// Add all fields
    id, brand, model, fuelType, modelId, regNumber
  ];

  static const String id = '_id';
  static const String brand = 'brand';
  static const String model = 'model';
  static const String fuelType = 'fuelType';
  static const String modelId = 'modelId';
  static const String regNumber = 'regNumber';
  static const String lastAccessedTime = 'lastAccessedTime';
}

class MyVehicle{
  int? id;
  String brand;
  String model;
  String fuelType;
  String modelId;
  String regNumber;

  MyVehicle(this.id, this.brand, this.model, this.fuelType, this.modelId, this.regNumber);
  /// Save chosen vehicle information to local storage
  void saveLocal(){

  }
  /// Delete this vehicle from
  void deleteLocal() {

  }
  static MyVehicle fromJson(Map<String, Object?> json) => MyVehicle(
    json[VehicleFields.id] as int?,
    json[VehicleFields.brand] as String,
    json[VehicleFields.model] as String,
    json[VehicleFields.fuelType] as String,
    json[VehicleFields.modelId] as String,
    json[VehicleFields.regNumber] as String,
  );

  Map<String, Object?> toJson() => {
    VehicleFields.id: id,
    VehicleFields.brand: brand,
    VehicleFields.model: model,
    VehicleFields.fuelType: fuelType,
    VehicleFields.modelId: modelId,
    VehicleFields.regNumber: regNumber,
  };

  MyVehicle copy({
    int? id,
    String? brand,
    String? model,
    String? fuelType,
    String? modelId,
    String? regNumber,
  }) {
    return MyVehicle(
      id ?? this.id,
      brand ?? this.brand,
      model ?? this.model,
      fuelType ?? this.fuelType,
      modelId ?? this.modelId,
      regNumber ?? this.regNumber,
    );

  }


/*
  MyVehicle getLastVehicle() {
    //1. read last used vehicle from DB. and return it
  }
  */
}
enum VehicleType {
  twoWheelerBike,
  twoWheelerScooter,
  twoWheelerBicycle,
  car,
}
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
