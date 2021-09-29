import 'package:flutter/material.dart';
import 'package:keep_moving/models/vehicle_model.dart';

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
        await showInformationDialog(context);
      }
  );
}

const fuelTypes = ['Petrol', 'Diesel', 'CNG', 'Electric'];
int _selected_fuel_type = 0;

Future<void> showInformationDialog(BuildContext context) async {
  return await showDialog(context: context,
      builder: (context) {
        return FuelSelectionDIalog();
      }
  );
}

class FuelSelectionDIalog extends StatefulWidget {
  @override
  State<FuelSelectionDIalog> createState() => _FuelSelectionDIalogState();
}

class _FuelSelectionDIalogState extends State<FuelSelectionDIalog> {
  int _selected_fuel_type_s = 0;

  void _setFuelType(int fuelType) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _selected_fuel_type_s = fuelType;
      print('in set state. Setting fuel type ${_selected_fuel_type_s}');
    });
  }

  @override
  Widget build(BuildContext context) {
    print ("Building Alert dialog");
    return AlertDialog(
      content: SizedBox(
          width:50,
          height:200,
          child: ListView.builder(
              itemCount: fuelTypes.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                    title: Text(fuelTypes[index]),
                    selected: index == _selected_fuel_type_s,
                    onTap: (){
                      //_selected_fuel_type = index;
                      print('selected fuel type ${fuelTypes[index]}');
                      _setFuelType(index);
                    }
                );
              }
          )),
      actions: <Widget>[
        TextButton(
          child: Text('Add Car'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

}