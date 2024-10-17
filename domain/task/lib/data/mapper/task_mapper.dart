import 'package:local_database/database/database.dart';
import 'package:task/data/model/task_data_model.dart';
import 'package:task/domain/entity/task_entity.dart';

class TaskMapper {
  TaskEntity mapDataToEntity(TaskDataModel data) => TaskEntity(
        name: data.name,
        description: data.description,
        id: data.id,
      );

  TaskTableData mapEntityToData(TaskEntity entity) => TaskTableData(
        name: entity.name!,
        description: entity.description!,
        id: entity.id!,
      );
}
