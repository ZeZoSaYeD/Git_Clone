import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/screens/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key,required this.notes,required this.index, required this.onNewNoteDeletion});

  final Note notes;
  final int index;
  final Function(int) onNewNoteDeletion;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(note: notes, index: index, onNewNoteDeletion: onNewNoteDeletion,)));
      },
      child: Card(
              child: Padding(padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notes.New_Title,
                    style:const TextStyle(
                      fontSize: 20,
                    ),
                  ),
      
                  const SizedBox(height: 10,),
      
                   Text(
                    notes.Describtion,
                    style:const TextStyle(
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}