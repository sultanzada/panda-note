import 'package:get/get.dart';
import 'package:panda/db/db_helper.dart';
import 'package:panda/model/task.dart';

class TaskController extends GetxController {
  DBHelper _dbHelper = DBHelper();
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task task}) async {
    int result = await _dbHelper.insert(task);
    return result;
  }
}
