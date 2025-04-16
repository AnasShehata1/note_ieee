import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:note_ieee/constants.dart';
import 'package:note_ieee/models/note_model.dart';
import 'package:note_ieee/views/search_view.dart';
import 'package:note_ieee/widgets/note_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchView()));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: noteList.length,
          itemBuilder: (context, index) {
            return NoteItem(
              note: noteList[index],
              onPressed: () {
                noteList[index].delete();
                loadNotes();
                setState(() {});
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await addNote(
                        NoteModel(
                          title: titleController.text,
                          description: descController.text,
                        ),
                      );
                      loadNotes();
                      titleController.clear();
                      descController.clear();
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Text('Save'),
                  ),
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                      ),
                    ),
                    TextField(
                      controller: descController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}

void loadNotes() {
  var box = Hive.box<NoteModel>(Constants.kNoteBox);
  noteList = box.values.toList();
}

Future<void> addNote(NoteModel note) async {
  var box = Hive.box<NoteModel>(Constants.kNoteBox);
  await box.add(note);
}
