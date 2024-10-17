import 'package:task/data/datasource/local/task_local_datasource.dart';
import 'package:task/data/datasource/remote/task_remote_datasource.dart';
import 'package:task/data/mapper/task_mapper.dart';
import 'package:task/data/repository/task_repository_impl.dart';
import 'package:task/domain/repository/task_repository.dart';
import 'package:task/domain/usecases/get_list_task_use_case.dart';
import 'package:shared_library/di/di.dart';

class TaskDependency {
  TaskDependency() {
    _dataSource();
    _repository();
    _mapper();
    _useCase();
  }

  void _dataSource() {
    locator.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSource(
        apiHelper: locator(),
      ),
    );

    locator.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSource(
        appDatabase: locator(),
      ),
    );
  }

  void _repository() => locator.registerLazySingleton<TaskRepository>(
        () => TaskRepositoryImpl(
          taskMapper: locator(),
          taskRemoteDataSource: locator(),
          taskLocalDataSource: locator(),
        ),
      );

  void _mapper() => locator.registerLazySingleton<TaskMapper>(
        () => TaskMapper(),
      );

  void _useCase() {
    locator.registerLazySingleton<GetListTaskUseCase>(
      () => GetListTaskUseCase(
        taskRepository: locator(),
      ),
    );
  }
}
