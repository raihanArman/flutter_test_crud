import 'package:network/network/api_helper.dart';
import 'package:resources/resources.dart';
import 'package:shared_library/failure/exception.dart';
import 'package:task/data/model/task_data_model.dart';

class TaskRemoteDataSource {
  final ApiHelper apiHelper;

  TaskRemoteDataSource({
    required this.apiHelper,
  });

  Future<List<TaskDataModel>> getListTasks() async {
    try {
      final result = await apiHelper.get(
        url: "${ApiStrings.baseUrl}",
      );
      return List<TaskDataModel>.from(
        (result as List).map((json) => TaskDataModel.fromJson(json)),
      );
    } catch (_) {
      throw ServerException();
    }
  }
}
