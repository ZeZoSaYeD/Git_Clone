import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key , required this.onNewNoteCreation});

  final Function(Note) onNewNoteCreation;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  final tController = TextEditingController();
  final dController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
        children: [
          TextFormField(
            controller: tController,
            style: const TextStyle(
              fontSize: 30
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "New Title"
            ),
          ), 
          
          const SizedBox(height: 15,)
          ,
          TextFormField(
            controller: dController,
            style: const TextStyle(
              fontSize: 20
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Describtion"
            ),
          ),
        ],
      ),
    ),

    floatingActionButton: FloatingActionButton(
      onPressed: (){
        if(tController.text.isEmpty){
          return;
        }
        if(dController.text.isEmpty){
          return;
        }

        final note = Note(
          Describtion: dController.text,
          New_Title: tController.text
        );

        widget.onNewNoteCreation(note);
        Navigator.of(context).pop();
      },
      child: const Icon(Icons.save),
    )
    );
  }
}