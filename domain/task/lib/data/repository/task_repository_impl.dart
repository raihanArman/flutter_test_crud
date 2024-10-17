import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:resources/strings/error_strings.dart';
import 'package:shared_library/failure/exception.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:task/data/datasource/local/task_local_datasource.dart';
import 'package:task/data/datasource/remote/task_remote_datasource.dart';
import 'package:task/data/mapper/task_mapper.dart';
import 'package:task/domain/entity/task_entity.dart';
import 'package:task/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskRemoteDataSource taskRemoteDataSource;
  final TaskMapper taskMapper;
  final TaskLocalDataSource taskLocalDataSource;

  TaskRepositoryImpl({
    required this.taskRemoteDataSource,
    required this.taskMapper,
    required this.taskLocalDataSource,
  });

  @override
  Future<Either<Failure, List<TaskEntity>>> getListTask() async {
    try {
      final result = await taskRemoteDataSource.getListTasks();
      return Right(
        result
            .map(
              (model) => taskMapper.mapDataToEntity(
                model,
              ),
            )
            .toList(),
      );
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          ErrorStrings.connectionFailure,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> insertTask(TaskEntity entity) async {
    try {
      await taskLocalDataSource.insertTask(
        taskMapper.mapEntityToData(entity),
      );
      return const Right(true);
    } on DatabaseException {
      return const Left(LocalDataBaseFailure('Failed to save task'));
    }
  }
}
