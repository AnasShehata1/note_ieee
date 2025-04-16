import 'package:flutter/material.dart';
import 'package:note_ieee/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.amber,
      ),
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.description),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
