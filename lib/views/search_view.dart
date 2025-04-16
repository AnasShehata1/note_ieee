import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:note_ieee/constants.dart';
import 'package:note_ieee/models/note_model.dart';
import 'package:note_ieee/widgets/note_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<NoteModel> searchResult = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search here',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                searchNote(value);
                setState(() {});
              },
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) => NoteItem(
                  note: searchResult[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  searchNote(String title) {
    var box = Hive.box<NoteModel>(Constants.kNoteBox);
    searchResult = box.values.where((note) {
      return note.title.toLowerCase().contains(title);
    }).toList();
  }
}
