import 'package:local_database/database/database.dart';
import 'package:shared_library/failure/exception.dart';

class TaskLocalDataSource {
  final AppDatabase appDatabase;

  TaskLocalDataSource({
    required this.appDatabase,
  });

  Future<void> insertTask(TaskTableData data) async {
    try {
      await appDatabase.taskDao.insertTask(data);
    } catch (error) {
      throw DatabaseException(error.toString());
    }
  }

  Future<List<TaskTableData>> getAllTask() async {
    try {
      final result = await appDatabase.taskDao.getAllTask();
      return result;
    } catch (error) {
      throw DatabaseException(error.toString());
    }
  }
}
