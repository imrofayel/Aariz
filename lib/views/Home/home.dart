import 'package:flutter/material.dart';
import 'package:journal/views/Home/notes_view.dart';
class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(
      
        backgroundColor: Theme.of(context).colorScheme.background,
      
        body: const NotesView(),
      )
    );
  }
}
