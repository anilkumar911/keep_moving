
enum FuelType {
  petrol,
  diesel,
  electric
}

class VehicleModel{
  String brandName;
  int brandId;
  String modelName;
  String modelId;
  FuelType fuelType;
  VehicleModel(this.brandName, this.brandId, this.modelName, this.modelId,  this.fuelType);
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
  List<VehicleBrand> getAllCarBrands(){
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
    ];
  }
}