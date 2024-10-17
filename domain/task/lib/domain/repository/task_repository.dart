import 'package:dartz/dartz.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:task/domain/entity/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> getListTask();

  Future<Either<Failure, bool>> insertTask(TaskEntity entity);
}
