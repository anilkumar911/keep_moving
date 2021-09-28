
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

/// Returns the list of all car brands supported by wheelsJoy
///
/// This can either be static hardcoded list or a list obtained from backend.
/// Best would be to cache the list and update if brand list has changed at the
/// backend.
class WheelsJoyModelUtils{
  static List<VehicleBrand> getAllCarBrands(){
    return [
      VehicleBrand(
        'carLogos/marutisuzuki.png',
        'Maruti Suzuki',
      ),
      VehicleBrand(
        'carLogos/tata.png',
        'TATA Motors',
      ),
      VehicleBrand(
        'carLogos/mahindra.jpg',
        'Mahindra',
      ),
      VehicleBrand(
        'carLogos/hyundai.png',
        'Hyundai',
      ),
      VehicleBrand(
        'carLogos/toyota.png',
        'Toyota',
      ),
      VehicleBrand(
        'carLogos/ford.png',
        'Ford',
      ),
    ];
  }
}