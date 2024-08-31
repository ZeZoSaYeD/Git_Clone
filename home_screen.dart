import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/screens/create_note.dart';
import 'package:flutter_application_1/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List <Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memo Using Flutter"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context,index){
          return NoteCard(notes: notes[index], index: index, onNewNoteDeletion: onNewNoteDeletion);
      },
     ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateNote(onNewNoteCreation: onNewNoteCreation ,)));
        },
        child: const Icon(Icons.add),
        ),
    );
  }

  void onNewNoteCreation(Note note){
    notes.add(note);
    setState(() {});

  }

  void onNewNoteDeletion(int index){
    notes.removeAt(index);
    setState(() {});
  }
}