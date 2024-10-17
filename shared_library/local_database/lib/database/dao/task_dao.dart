import 'package:local_database/database/database.dart';
import 'package:local_database/database/table/task_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'task_dao.g.dart';

@UseDao(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(AppDatabase db) : super(db);

  Future insertTask(TaskTableData data) =>
      into(taskTable).insert(data, mode: InsertMode.insertOrReplace);

  Future<List<TaskTableData>> getAllTask() => select(taskTable).get();
}
