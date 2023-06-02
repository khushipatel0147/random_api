import 'package:flutter/cupertino.dart';
import 'package:random_api/modal/randomModal.dart';
import 'package:random_api/utiels/apiHelper.dart';

class RandomProvider extends ChangeNotifier {
  RandomData? randomData;

  Future<RandomData?> getRandom() async {
    randomData = await ApiHelper.apiHelper.random();
    notifyListeners();
  }
}
