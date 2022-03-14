import 'package:flutter/material.dart';
import 'package:note/controller/controller.dart';
import 'package:timelines/timelines.dart';
import 'package:get/get.dart';


class TimeLine extends StatelessWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller =Get.put(Controller());
    return SafeArea(
      child: Scaffold(
          body: Obx(()=>Column(
            children: [
              ElevatedButton(onPressed: (){
                Get.back();
              }, child: const Text('Calendar')),
              TimelineTile(
                mainAxisExtent:100,
                nodePosition: 0.18,
                oppositeContents:  Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    controller.listTimeLine.value[0]!.day.toString().substring(5,10),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                contents: Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.listTimeLine.value[0]!.title.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          controller.listTimeLine.value[0]!.hour.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                node: const TimelineNode(
                  indicator: DotIndicator(),
                  startConnector: SolidLineConnector(),
                  endConnector: SolidLineConnector(),
                ),
              ),
            ],
          ))
        ),
    );
  }
}

