import 'dart:io';

import 'package:car_service/Controllers/HomeController.dart';
import 'package:car_service/Helpers/WidgetHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          child: items(),
        ),
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: buildBody(),
        bottomNavigationBar: GetBuilder<HomeController>(builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.activeIndex.value,
            onTap: (index) {
              if (index == 1) {
                _showDialog();
              }
              controller.update();
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  label: "Exit"),
            ],
          );
        }),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: buildAddBtn(),
      ),
    );
  }

  Widget buildAddBtn() {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _buildShowCreateModal();
          },
          child: Container(
            height: Get.height * .05,
            width: Get.width * .25,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 2,
                    blurRadius: 8),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<String> list = [
    "aseets/Toyota-Company-Logo-Image1.jpg",
    "aseets/1200px-Mercedes_Benz_Logo_11.jpg",
    "aseets/Audi-Portfolio-Logo (1).jpg",
  ];

  SizedBox buildBody() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: _buildPageOne(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          _key.currentState?.openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            final box = Get.context!.findRenderObject() as RenderBox?;

            await Share.share(
              "Share invite code: 123456789",
              subject: "",
              sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
            );
          },
          icon: const Icon(
            Icons.share,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
      title: const Text(
        "Car Service",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _buildShowCreateModal() {
    return showCupertinoModalBottomSheet(
      context: Get.context!,
      builder: (_) {
        return Container(
          color: Colors.white,
          height: Get.height * .45,
          width: Get.width,
          margin: MediaQuery.of(Get.context!).viewInsets,
          child: Form(
            key: _fromKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 3,
                ),
                Container(color: Colors.grey, height: 5, width: 50),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
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
                    title: "Car Model",
                    onChanged: (value) {},
                    maxLength: 30,
                    maxLine: 1,
                    controller: controller.model,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Enter car model";
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
                WidgetHelper.input(
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
                const SizedBox(
                  height: 25,
                ),
                WidgetHelper.softButton(
                    title: "Add",
                    onTap: () {
                      if (_fromKey.currentState!.validate()) {
                        controller.addCar();
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  _showDialog() {
    return Get.dialog(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: Get.width * .05, vertical: Get.height * .4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Do you want to exit the app?",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.close(0);
                  },
                  child: const Center(
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Center(
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  items() {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.carList.length,
        itemBuilder: (_, index) {
          final car = controller.carList[index];
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                dragDismissible: true,
                motion: const DrawerMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () {
                    controller.deleteCar(car.id);
                  },
                ),
                children: [
                  SlidableAction(
                    onPressed: (value) {
                      controller.deleteCar(car.id);
                    },
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              closeOnScroll: true,
              enabled: true,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/carDetail", arguments: {"carId": car.id});
                },
                child: Container(
                  height: Get.height * .06,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name: ${car.name}"),
                      Text("Model: ${car.model}"),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  _buildPageOne() {
    return Column(
      children: [
        SizedBox(
          height: Get.height * .3,
          width: Get.width,
          child: PageView.builder(
            itemCount: list.length,
            itemBuilder: (_, page) {
              return Image.asset(
                list[page],
                fit: BoxFit.fill,
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "ریشه‌های تأسیس خودروسازی تویوتا، به سال ۱۹۲۶ بازمی‌گردد، که ساکیشی تویودا، اقدام به راه‌اندازی شرکت صنایع تویوتا نمود. پیشینه این شرکت، که در صنعت نساجی فعالیت می‌کرد نیز، به ابتدای قرن بیستم بازمی‌گردد، که به عنوان یک کارخانه ریسندگی فعالیت می‌نمود.[۵] ساکیشی تویودا، که سال‌ها همچون پدرش، به فروش فرش اشتغال داشت، این کارخانه را راه‌انداخته بود و در سال ۱۸۹۴ یک ماشین بافندگی صنعتی نیز ابداع کرده و ساخته بود.",
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
