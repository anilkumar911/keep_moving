import 'package:flutter/material.dart';
import 'package:keep_moving/models/vehicle_model.dart';
import 'package:keep_moving/models/my_vehilce.dart';
import 'package:keep_moving/constants/constants.dart';
import 'package:keep_moving/database/vehicle_database.dart';

class ModelSelectorScreen extends StatelessWidget {

  int brandId;
  ModelSelectorScreen(this.brandId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Choose the model of your Car';
    var models = WheelsJoyModelUtils.getModelsForBrand(brandId);
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: GridView.builder(
          itemCount: models.length,
          shrinkWrap:true,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return modelCard(models[index], context);
          }),
    );
  }
}

Widget modelCard(VehicleModel model, BuildContext context) {
  return InkWell(
      child: Card(
          margin: EdgeInsets.fromLTRB(32, 32, 32, 32),
          child: Stack(
          children: [
          SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(model.modelIcon)
          ),
            Text(
                '${model.modelName}',
                style: TextStyle(fontWeight:FontWeight.bold)),
          ]
      )
      ),
      onTap: () async {
        print('Tapped ${model.modelName}');
        //if (model.fuelOptions.length)
        await showFuelSelectionDialog(context, model.fuelOptions, model.brand, model.modelName);
      }
  );
}

Future<void> showFuelSelectionDialog(BuildContext context, List<String> fuelOptions, String brand, String model) async {
  return await showDialog(context: context,
      builder: (context) {
        return FuelSelectionDialog(fuelOptions, brand, model);
      }
  );
}

class FuelSelectionDialog extends StatefulWidget {
  final List<String> fuelOptions;
  final String brand;
  final String model;

  const FuelSelectionDialog(this.fuelOptions, this.brand, this.model, {Key? key}) : super(key: key);
  @override
  State<FuelSelectionDialog> createState() => _FuelSelectionDialogState(fuelOptions, brand, model);
}

class _FuelSelectionDialogState extends State<FuelSelectionDialog> {
  List<String> fuelOptions;
  final String brand;
  final String model;

  _FuelSelectionDialogState(this.fuelOptions, this.brand, this.model);

  int _selectedFuelType = 0;

  void _setFuelType(int fuelType) {
    setState(() {
      _selectedFuelType = fuelType;
      print('in set state. Setting fuel type $_selectedFuelType');
    });
  }

  @override
  Widget build(BuildContext context) {
    print ("Building Alert dialog");
    return AlertDialog(
      title: const Text('⛽ Choose Fuel Variant',
                    style: TextStyle(
                      color:wheelsJoyFormTitleColor
                    )),
      content: SizedBox(
          width:50,
          height:200,
          child: ListView.builder(
              itemCount: fuelOptions.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                    title: Text(fuelOptions[index]),
                    selected: index == _selectedFuelType,
                    onTap: (){
                      //_selected_fuel_type = index;
                      print('selected fuel type ${fuelOptions[index]}');
                      _setFuelType(index);
                    }
                );
              }
          )),
      actions: <Widget>[
        TextButton(
          style: wheelsJoyFormButtonStyle,
          child: const Text('Back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: wheelsJoyFormButtonStyle,
          child: const Text('Add Car'),
          onPressed: () async {
            try {
              await VehiclesDatabase.instance.create(MyVehicle(
                  0, brand, model, fuelOptions[_selectedFuelType], "model_id",
                  "reg_num"));
            }catch (exception) {
              print ('Caught Exception');
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}