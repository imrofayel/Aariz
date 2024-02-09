import 'package:flutter/services.dart';
import 'package:journal/components/hidden_drawer.dart';
import 'package:journal/database/db_provider.dart';
import 'package:journal/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(MultiProvider(providers: [

    ChangeNotifierProvider(create:(context) => DatabaseProvider()),

    ChangeNotifierProvider(create:(context) => ThemeSwitcher()),

  ],
    
  child: const Aariz()));
    
}

class Aariz extends StatefulWidget {
  const Aariz({super.key});

  @override
  State<Aariz> createState() => _AarizState();
}

class _AarizState extends State<Aariz> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Portrait mode only
    ]);

    return Consumer<DatabaseProvider>(
      
      builder:(context, value, child){

        return MaterialApp(

          debugShowCheckedModeBanner: false,
          
          theme: Provider.of<ThemeSwitcher>(context).themeData,

          home: const HiddenDrawer(),
        );
      },  
    );
  }
}