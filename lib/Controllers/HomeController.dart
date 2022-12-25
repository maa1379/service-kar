import 'package:car_service/Helpers/ViewHelpers.dart';
import 'package:car_service/Models/CarModel.dart';
import 'package:car_service/Models/OilChangeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<CarListModel> carList = <CarListModel>[].obs;
  RxList<OilChangeListModel> oilChangeList = <OilChangeListModel>[].obs;
  late CarListModel carListModel;
  late OilChangeListModel oilChangeListModel;
  RxList<Map<String, dynamic>> listOfCar = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> listOfOil = <Map<String, dynamic>>[].obs;
  TextEditingController carName = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController km = TextEditingController();
  TextEditingController oilModel = TextEditingController();
  TextEditingController oilFilterModel = TextEditingController();
  TextEditingController airFilter = TextEditingController();
  TextEditingController water = TextEditingController();
  TextEditingController giriss = TextEditingController();
  TextEditingController nextKm = TextEditingController();
  TextEditingController serviceKar = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController carId = TextEditingController();
  RxBool gearbox = false.obs;
  RxBool difranciel = false.obs;


  final PageController pageController = PageController();
  RxInt activeIndex = 0.obs;

  addCar() async {
    CarModel.add(
      name: carName.text,
      key: "car",
      model: model.text,
      color: color.text,
      isChecked: false,
    );
    getData();
    carName.clear();
    color.clear();
    model.clear();
    Get.back();
    update();
  }

  addOilReport(id) async {
    OilChangeModel.add(
      km: km.text,
      carId: id,
      oilModel: oilModel.text,
      date: DateTime.now().toString(),
      airFilter: airFilter.text,
      giriss: giriss.text,
      nextKm: nextKm.text,
      oilFilterModel: oilFilterModel.text,
      price: price.text,
      serviceKar: serviceKar.text,
      waskazin: gearbox.isFalse ? difranciel.value : gearbox.value,
      water: water.text,
    );
    getOilData();
    km.clear();
    oilModel.clear();
    airFilter.clear();
    giriss.clear();
    nextKm.clear();
    oilFilterModel.clear();
    price.clear();
    serviceKar.clear();
    water.clear();
    Get.back();
    update();
  }

  deleteCar(id) async {
    CarModel.remove(id);
    getData();
    update();
  }

  deleteOil(id) async {
    OilChangeModel.remove(id);
    getOilData();
    update();
  }

  getItem(int id) async {
    final item = await CarModel.getItem(id);
    carListModel = CarListModel.fromJson(item);
    model.text = carListModel.model!;
    carName.text = carListModel.name!;
    color.text = carListModel.color!;
    update();
  }

  getOilItem(int id) async {
    listOfOil.clear();
    oilChangeList.clear();
    listOfOil.value = await OilChangeModel.getAllDataWhere(id);
    for (var element in listOfOil) {
      oilChangeList.add(OilChangeListModel.fromJson(element));
    }
    km.clear();
    oilModel.clear();
    airFilter.clear();
    giriss.clear();
    nextKm.clear();
    oilFilterModel.clear();
    price.clear();
    serviceKar.clear();
    water.clear();
    update();
  }

  updateOil(id, carId) {
    OilChangeModel.updateItem(
      km: km.text,
      carId: carId,
      oilModel: oilModel.text,
      id: id,
      date: DateTime.now().toString(),
      airFilter: airFilter.text,
      giriss: giriss.text,
      nextKm: nextKm.text,
      oilFilterModel: oilFilterModel.text,
      price: price.text,
      serviceKar: serviceKar.text,
      waskazin: gearbox.isFalse ? difranciel.value : gearbox.value,
      water: water.text,
    );
    ViewHelper.showSuccessDialog("Updated");
    getOilData();
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    listOfCar.clear();
    carList.clear();
    listOfCar.value = await CarModel.getAllData();
    for (var element in listOfCar) {
      carList.add(CarListModel.fromJson(element));
    }
  }

  getOilData() async {
    listOfOil.clear();
    oilChangeList.clear();
    listOfOil.value = await OilChangeModel.getAllData();
    for (var element in listOfOil) {
      oilChangeList.add(OilChangeListModel.fromJson(element));
    }
  }
}
