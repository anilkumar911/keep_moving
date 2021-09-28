import 'package:flutter/material.dart';
import 'package:keep_moving/models/vehicle_model.dart';

class BrandSelectorScreen extends StatelessWidget {
  const BrandSelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Choose the brand of your Car';
    var brands = WheelsJoyModelUtils.getAllCarBrands();
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: GridView.builder(
          itemCount: brands.length,
          shrinkWrap:true,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return brandCard(brands[index]);
          }),
    );
  }
}

Widget brandCard(VehicleBrand brand) {
  return InkWell(
      child: Card(
        margin: EdgeInsets.fromLTRB(32, 32, 32, 32),
        child: SizedBox(
          height: 200,
            width: 200,
            child: Image.asset(brand.brandIcon)
        )
      ),
    onTap: (){
        print('Tapped ${brand.brandName}');
    }
  );
}