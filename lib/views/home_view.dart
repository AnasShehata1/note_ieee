import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:note_ieee/models/note_model.dart';
import 'package:note_ieee/views/search_view.dart';
import 'package:note_ieee/widgets/note_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteItem(
              note: notes[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}

Future<void> addNote(NoteModel note) async {
  var box = Hive.box('notes_key');
  await box.add(note);
}
