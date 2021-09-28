import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_moving/controllers/counter_controller.dart';
import 'package:keep_moving/screens/other.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterController());
    print('In build function of *** home.dart ***');
    return Scaffold(
        body: Obx(() => Center(
          child :
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Clicks: ${counterController.counter.value}'),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const OtherScreen());
                    },
                    child: const Text("Open Other"),
                  )
                ]
            )
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            counterController.increment();
          },
          child: const Icon(Icons.view_module, color: Colors.amber),),
    );
  }
}