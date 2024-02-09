import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:journal/theme/theme_provider.dart';
import 'package:journal/views/Home/home.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HiddenDrawer extends StatefulWidget {
  
  const HiddenDrawer({super.key});


  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {

  List<ScreenHiddenDrawer> _pages = [];
  
  @override
  void initState() {

    super.initState();

    _pages = [

      ScreenHiddenDrawer(
      
      ItemHiddenMenu(

        name: "Notes",

        colorLineSelected: Colors.transparent,

        baseStyle: const TextStyle(fontSize: 26),

        selectedStyle: const TextStyle(fontSize: 26),

      ), const Home()),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return HiddenDrawerMenu(
      
      screens: _pages, 
      
      backgroundColorMenu: Theme.of(context).colorScheme.background,
    
      initPositionSelected: 0,
    
      backgroundColorAppBar: Theme.of(context).colorScheme.background,
    
      elevationAppBar: 0,
    
      enableShadowItensMenu: false,
    
      leadingAppBar: const InkWell(

        child: Padding(
        
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        
          child: Icon(LineIcons.redo),
        ),
      ),

      backgroundColorContent: Colors.transparent,
    
      tittleAppBar: null,
    
      withShadow: false,

      boxShadow: null,
    
      slidePercent: 35,
    
      withAutoTittleName: false,

      verticalScalePercent: 90,
    
      actionsAppBar: [
        
        Padding(

          padding: const EdgeInsets.all(0),

          child: IconButton.filled(
            
            icon: Icon(

              Theme.of(context).brightness == Brightness.light ? CupertinoIcons.sun_max : CupertinoIcons.sun_max_fill,
              
              color: Theme.of(context).colorScheme.tertiary, size: 32), 
            
            onPressed: (){

              Provider.of<ThemeSwitcher>(context, listen: false).toggleTheme();

            }, 
            
            padding: EdgeInsets.zero, 
            
            style: ButtonStyle(

              backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.background),
            ),
          ),
        ),

        Padding(

          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),

          child: IconButton.filled(
            
            icon: Icon(LineIcons.horizontalEllipsis, color: Theme.of(context).colorScheme.tertiary), 
            
            onPressed: (){}, 
            
            padding: EdgeInsets.zero, 
            
            style: ButtonStyle(

              fixedSize: const MaterialStatePropertyAll(Size(55, 35)),

              backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
            ),
          ),
        ),
      ],
    );
  }
}