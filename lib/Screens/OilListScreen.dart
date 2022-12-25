import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Controllers/HomeController.dart';
import '../Helpers/WidgetHelper.dart';

class OilListScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();

  OilListScreen({Key? key}) : super(key: key) {
    print(Get.arguments['carIdOil']);
    controller.getOilItem(Get.arguments['carIdOil']);
  }

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      title: const Text(
        "Service Report",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _buildBody() {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white,
      child: GetBuilder<HomeController>(builder: (controller) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.oilChangeList.length,
                itemBuilder: itemBuilder,
              ),
            )
          ],
        );
      }),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = controller.oilChangeList[index];
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        dragDismissible: true,
        motion: const DrawerMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            controller.deleteOil(item.id);
          },
        ),
        children: [
          SlidableAction(
            onPressed: (value) {
              controller.deleteOil(item.id);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (value) {
              controller.km.text = item.km.toString();
              controller.oilModel.text = item.oilModel.toString();
              controller.airFilter.text = item.airFilter.toString();
              controller.giriss.text = item.giriss.toString();
              controller.nextKm.text = item.nextKm.toString();
              controller.oilFilterModel.text = item.oilFilterModel.toString();
              controller.price.text = item.price.toString();
              controller.serviceKar.text = item.serviceKar.toString();
              controller.water.text = item.water.toString();
              _buildShowModal(item.id, Get.arguments['carIdOil']);
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      closeOnScroll: true,
      enabled: true,
      child: Container(
        height: Get.height * .25,
        width: Get.width,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(left: 10, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Oil model: ${item.oilModel}"),
                Text("km: ${item.km}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Next Km: ${item.nextKm}"),
                Text("Date: ${item.date!.substring(0, 10)}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("price: ${item.price}"),
                Text("Air Filter: ${item.airFilter}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("giriss kari: ${item.giriss}"),
                Text("Acidic Water: ${item.water}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Oil Filter: ${item.oilFilterModel}"),
                Text("service kar: ${item.serviceKar}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Oil Filter: ${item.waskazin == true ? "No" : "Yes"}"),
                Text("Oil Filter: ${item.waskazin == false ? "yes" : "No"}"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildShowModal(id, carId) {
    return showCupertinoModalBottomSheet(
      context: Get.context!,
      builder: (_) {
        return Container(
          height: Get.height * .9,
          width: Get.width,
          color: Colors.white,
          margin: MediaQuery.of(Get.context!).viewInsets,
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
                            title: const Text(
                              "gearbox",
                            ),
                            value: controller.gearbox.value,
                            onChanged: (value) {
                              if (controller.gearbox.value == false) {
                                controller.gearbox.value = true;
                                controller.difranciel.value = false;
                              } else {
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
                            title: const Text(
                              "Differential",
                            ),
                            value: controller.difranciel.value,
                            onChanged: (value) {
                              if (controller.difranciel.value == false) {
                                controller.difranciel.value = true;
                                controller.gearbox.value = false;
                              } else {
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
                      controller.updateOil(id, carId);
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
