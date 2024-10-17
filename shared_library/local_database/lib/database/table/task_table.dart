import 'package:moor_flutter/moor_flutter.dart';

class TaskTable extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  @override
  Set<Column>? get primaryKey => {id};
}
