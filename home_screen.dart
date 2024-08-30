import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/screens/create_note.dart';

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
          return Card(
            child: Padding(padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  notes[index].New_Title,
                  style:const TextStyle(
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 10,),

                 Text(
                  notes[index].Describtion,
                  style:const TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
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