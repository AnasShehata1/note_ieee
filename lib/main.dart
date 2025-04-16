import 'package:flutter/material.dart';
import 'package:note_ieee/constants.dart';
import 'package:note_ieee/models/note_model.dart';
import 'package:note_ieee/views/home_view.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(Constants.kNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      home: HomeView(),
    );
  }
}
