import 'dart:convert';

import 'package:flutter/material.dart';

import '../moldes/my-data.dart';

class ColumnsRows extends ChangeNotifier {
  MyData? _data;
  MyData? get data => _data;

  Future gatData(context) async {
    var response = await DefaultAssetBundle.of(context)
        .loadString('assest/raw/mJson.json');
    var mJson = json.decode(response);

    _data = MyData.fromJson(mJson);
    notifyListeners();
  }

  @override
  void notifyListeners() {}
}
