import 'package:car_service/Controllers/HomeController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Helpers/WidgetHelper.dart';

class CarDetailScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();

  CarDetailScreen({Key? key}) : super(key: key) {
    controller.getItem(Get.arguments["carId"]);
  }

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          WidgetHelper.input(
              enabled: false,
              title: "Car Name",
              onChanged: (value) {},
              maxLength: 30,
              maxLine: 1,
              controller: controller.carName,
              validate: (value) {
                if (value!.isEmpty) {
                  return "Enter car name";
                }
              }),
          const SizedBox(
            height: 15,
          ),
          WidgetHelper.input(
            enabled: false,
            title: "Car Model",
            onChanged: (value) {},
            maxLength: 30,
            maxLine: 1,
            controller: controller.model,
            validate: (value) {
              if (value!.isEmpty) {
                return "Enter car model";
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          WidgetHelper.input(
            enabled: false,
            title: "Color",
            onChanged: (value) {},
            maxLength: 30,
            maxLine: 1,
            controller: controller.color,
            validate: (value) {
              if (value!.isEmpty) {
                return "Enter Color";
              }
            },
          ),
          const Spacer(),
          WidgetHelper.softButton(
              title: "Add oil change report",
              onTap: () {
                _buildShowModal(Get.arguments["carId"]);
              }),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed("/oilList",
                arguments: {"carIdOil": Get.arguments["carId"]});
          },
          icon: const Icon(
            Icons.list,
            size: 30,
          ),
        ),
      ],
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
      title: const Text(
        "Car Detail",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _buildShowModal(id) {
    return showCupertinoModalBottomSheet(
      context: Get.context!,
      builder: (_) {
        return Container(
          height: Get.height * .9,
          width: Get.width,
          color: Colors.white,
          margin: MediaQuery
              .of(Get.context!)
              .viewInsets,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _fromKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(color: Colors.grey, height: 5, width: 50),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "km",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.km,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter km";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "Motor Oil",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.oilModel,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter Motor oil";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "Oil Filter",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.oilFilterModel,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter oil filter";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "Oil Air Filter",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.airFilter,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter air Filter";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "Acidic Water",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.water,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter acidic water";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "Grace",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.giriss,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter Grace";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "Next Km",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.nextKm,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter Next km";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "Service kar",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.serviceKar,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter service kar";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
                  title: "Price",
                  onChanged: (value) {},
                  maxLength: 30,
                  maxLine: 1,
                  controller: controller.price,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Enter Price";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: Get.height * .08,
                  width: Get.width,
                  child: Obx(() {
                    return Row(
                      children: [
                        SizedBox(
                          width: Get.width * .45,
                          height: Get.height * .07,
                          child: CheckboxListTile(
                            title: const Text("gearbox",),
                            value: controller.gearbox.value,
                            onChanged: (value) {
                              if(controller.gearbox.value == false){
                                controller.gearbox.value = true;
                                controller.difranciel.value = false;
                              }else{
                                controller.gearbox.value = false;
                                controller.difranciel.value = true;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .45,
                          height: Get.height * .07,
                          child: CheckboxListTile(
                            title: const Text("Differential",),
                            value: controller.difranciel.value,
                            onChanged: (value) {
                              if(controller.difranciel.value == false){
                                controller.difranciel.value = true;
                                controller.gearbox.value = false;
                              }else{
                                controller.difranciel.value = false;
                                controller.gearbox.value = true;
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(
                  height: 50,
                ),
                WidgetHelper.softButton(
                  title: "Create Report",
                  onTap: () {
                    if (_fromKey.currentState!.validate()) {
                      controller.addOilReport(id);
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
