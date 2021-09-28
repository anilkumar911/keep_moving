import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_moving/controllers/counter_controller.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterController _counterController = Get.find();
    print ('In build function of Other.dart');
    return Scaffold(
        body: Center(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Screen was clicked ${_counterController.counter.value}'),
                  const SizedBox(height:10),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Go Back"),
                  )
                ]
            )
        )
    );
  }
}
