import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

      child: AnnotatedRegion(
        
        value: SystemUiOverlayStyle(

          statusBarColor: Theme.of(context).colorScheme.background,

          systemNavigationBarColor: Theme.of(context).colorScheme.background,

          systemNavigationBarIconBrightness: Theme.of(context).brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,

          statusBarIconBrightness: Theme.of(context).brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,

        ),

        child: Scaffold(
        
          backgroundColor: Theme.of(context).colorScheme.background,

          body: const NotesView(),
        )
      )
    );
  }
}
