import 'package:dartz/dartz.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/usecase/usecase.dart';
import 'package:task/domain/entity/task_entity.dart';
import 'package:task/domain/repository/task_repository.dart';

class GetListTaskUseCase extends UseCase<List<TaskEntity>?, NoParams> {
  final TaskRepository taskRepository;

  GetListTaskUseCase({
    required this.taskRepository,
  });

  @override
  Future<Either<Failure, List<TaskEntity>?>> call(NoParams params) async =>
      taskRepository.getListTask();
}
