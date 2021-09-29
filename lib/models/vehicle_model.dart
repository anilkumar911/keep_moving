
enum FuelType {
  petrol,
  diesel,
  electric
}

class Vehicle{
  String brandName;
  int brandId;
  String modelName;
  String modelId;
  FuelType fuelType;
  Vehicle(this.brandName, this.brandId, this.modelName, this.modelId,  this.fuelType);
}

class VehicleBrand{
  String brandIcon;
  String brandName;
  VehicleBrand(this.brandIcon, this.brandName);
}

class VehicleModel {
  String modelName;
  int modelId;
  String modelIcon;
  List<String> fuelOptions;
  VehicleModel(this.modelName, this.modelId, this.modelIcon, this.fuelOptions);
}

/// Returns the list of all car brands supported by wheelsJoy
///
/// This can either be static hardcoded list or a list obtained from backend.
/// Best would be to cache the list and update if brand list has changed at the
/// backend.
class WheelsJoyModelUtils{
  static List<VehicleModel> getModelsForBrand(int brandId){
    return [
      VehicleModel(
        'Verito',
        1,
        'assets/carModels/mahindra/verito.jpg',
        ['Diesel','Petrol'],
      ),
      VehicleModel(
        'Scorpio',
        2,
        'assets/carModels/mahindra/scorpio.png',
        ['Diesel'],
      ),
      VehicleModel(
        'Bolero',
        3,
        'assets/carModels/mahindra/bolero.png',
        ['Diesel'],
      ),
      VehicleModel(
        'XUV500',
        4,
        'assets/carModels/mahindra/xuv500.png',
        ['Diesel'],
      ),
    ];
  }
  static List<VehicleBrand> getAllCarBrands(){
    return [
      VehicleBrand(
        'assets/carLogos/marutisuzuki.png',
        'Maruti Suzuki',
      ),
      VehicleBrand(
        'assets/carLogos/tata.png',
        'TATA Motors',
      ),
      VehicleBrand(
        'assets/carLogos/mahindra.jpg',
        'Mahindra',
      ),
      VehicleBrand(
        'assets/carLogos/hyundai.png',
        'Hyundai',
      ),
      VehicleBrand(
        'assets/carLogos/toyota.png',
        'Toyota',
      ),
      VehicleBrand(
        'assets/carLogos/ford.png',
        'Ford',
      ),
    ];
  }
}