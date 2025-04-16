import 'package:hive_ce/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;

  NoteModel({required this.title, required this.description});
}

List<NoteModel> notes = [
  NoteModel(title: 'title', description: 'description'),
  NoteModel(title: 'title1', description: 'description'),
  NoteModel(title: 'title2', description: 'description'),
  NoteModel(title: 'title3', description: 'description'),
  NoteModel(title: 'title4', description: 'description'),
];
