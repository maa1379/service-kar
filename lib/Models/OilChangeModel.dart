import '../DB/BaseModel.dart';

class OilChangeModel extends BaseModel {
  @override
  Map<String, DbDataTypes> fields() {
    return {
      'date': DbDataTypes.Text,
      'km': DbDataTypes.Text,
      'oilModel': DbDataTypes.Text,
      'oilFilterModel': DbDataTypes.Text,
      'airFilter': DbDataTypes.Text,
      'water': DbDataTypes.Text,
      'giriss': DbDataTypes.Text,
      'waskazin': DbDataTypes.Integer,
      'CarId': DbDataTypes.Integer,
      'nextKm': DbDataTypes.Text,
      'serviceKar': DbDataTypes.Text,
      'price': DbDataTypes.Text,
    };
  }

  @override
  String primaryKey() {
    return 'id';
  }

  // returns the id of the added row
  static Future<int> add({
    required String date,
    required String oilModel,
    required String km,
    required int carId,
    required String oilFilterModel,
    required String airFilter,
    required String water,
    required String giriss,
    required String nextKm,
    required String price,
    required String serviceKar,
    required bool waskazin,
  }) async {
    return await OilChangeModel().insert({
      'date': date,
      'km': km,
      'oilModel': oilModel,
      'oilFilterModel': oilFilterModel,
      'airFilter': airFilter,
      'water': water,
      'giriss': giriss,
      'waskazin': waskazin ? 1 : 0,
      'nextKm': nextKm,
      'serviceKar': serviceKar,
      'price': price,
      'carId': carId,
    });
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    return await OilChangeModel().getAll();
  }

  static Future<List<Map<String, dynamic>>> getAllDataWhere(id) async {
    return await OilChangeModel().getAllWhere("", "carId", id.toString());
  }

  static Future<int> remove(id) async {
    return await OilChangeModel().delete(id);
  }

  static Future getItem(id) async {
    return await OilChangeModel().get(id);
  }

  static Future<int> updateItem({
    required String date,
    required String oilModel,
    required String km,
    required int carId,
    required String oilFilterModel,
    required String airFilter,
    required String water,
    required String giriss,
    required String nextKm,
    required String price,
    required String serviceKar,
    required bool waskazin,
    required int id,
  }) async {
    return await OilChangeModel().update(id, {
      'date': date,
      'km': km,
      'oilModel': oilModel,
      'oilFilterModel': oilFilterModel,
      'airFilter': airFilter,
      'water': water,
      'giriss': giriss,
      'waskazin': waskazin ? 1 : 0,
      'nextKm': nextKm,
      'serviceKar': serviceKar,
      'price': price,
      'carId': carId,
    });
  }
}

class OilChangeListModel {
  int? id;
  String? date;
  String? km;
  String? oilModel;
  String? oilFilterModel;
  String? airFilter;
  String? water;
  String? giriss;
  bool? waskazin;
  String? nextKm;
  String? serviceKar;
  String? price;
  String? carId;

  OilChangeListModel({
    this.date,
    this.id,
    this.km,
    this.oilModel,
    this.oilFilterModel,
    this.airFilter,
    this.water,
    this.giriss,
    this.waskazin,
    this.nextKm,
    this.serviceKar,
    this.price,
    this.carId,
  });

  factory OilChangeListModel.fromJson(Map<String, dynamic> json) =>
      OilChangeListModel(
        id: json["id"],
        date: json["date"],
        km: json["km"],
        carId: json["carId"],
        oilModel: json["oilModel"],
        water: json["water"],
        giriss: json["water"],
        airFilter: json["airFilter"],
        nextKm: json["nextKm"],
        oilFilterModel: json["oilFilterModel"],
        price: json["price"],
        serviceKar: json["serviceKar"],
        waskazin: json["isChecked"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'km': km,
        'oilModel': oilModel,
        'oilFilterModel': oilFilterModel,
        'airFilter': airFilter,
        'water': water,
        'giriss': giriss,
        'waskazin': waskazin,
        'nextKm': nextKm,
        'serviceKar': serviceKar,
        'price': price,
        'carId': carId,
      };
}
