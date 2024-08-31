import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key,required this.note,required this.index, required this.onNewNoteDeletion});

  final Note note;
  final int index;
  final Function(int) onNewNoteDeletion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Note View"),
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context,
                 builder: (context){
                  return AlertDialog(
                    title: const Text("Are You Sure ?!"),
                    content: Text("Note ${note.New_Title} Will Be Deleted !!"),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                          onNewNoteDeletion(index);
                          Navigator.of(context).pop();
                        }
                      , child: const Text("DELETE")
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        }
                      , child: const Text("CANCEL")
                      )
                    ],
                  );
                 }
                 );
            },
             icon: Icon(Icons.delete),
             ),
        ],
      ),

      body: Padding(
        
        padding: const EdgeInsets.all(10.0),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.New_Title,
              style: const TextStyle(
                fontSize: 30
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              note.Describtion,
              style: const TextStyle(
                fontSize: 20
              ),
            ),
          ],
        ) ,
        ),
        
    );
  }
}