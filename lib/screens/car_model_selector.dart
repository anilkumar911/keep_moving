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
            return modelCard(models[index]);
          }),
    );
  }
}

Widget modelCard(VehicleModel model) {
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
      onTap: (){
        print('Tapped ${model.modelName}');
      }
  );
}
