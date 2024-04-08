import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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

        name: "Journal",

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

              Theme.of(context).brightness == Brightness.light ? CupertinoIcons.sun_min : CupertinoIcons.sun_min_fill,
              
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
            
            onPressed: (){

              showDialog(context: context, builder:(context) {
                  
                  return AlertDialog(content: Padding(
                      
                      padding: const EdgeInsets.all(5.0),
                      
                      child: SizedBox(

                        height: 120,

                        width: 120,

                        child: Column(
                        
                          children: [
                        
                            Text("Aariz", style: TextStyle(fontSize: 28, color: Theme.of(context).colorScheme.tertiary, fontFamily: "Inter", height: 1.4), textAlign: TextAlign.left),
                        
                            const Gap(14),
                        
                            FilledButton(onPressed: (){

                            }, style: ButtonStyle(
                  
                              side: MaterialStatePropertyAll(BorderSide(color: Theme.of(context).colorScheme.secondary)),

                              padding: const MaterialStatePropertyAll(EdgeInsets.all(14)), overlayColor: const MaterialStatePropertyAll(Colors.transparent), shadowColor: const MaterialStatePropertyAll(Colors.transparent), backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)), 
                              
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: Text('by Naveed azhar', textScaler: const TextScaler.linear(1.4), style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withOpacity(0.8))),
                              )),
                        
                          ],
                        ),
                      ),
                  ),
                  
                  surfaceTintColor: Colors.transparent,

                  );
              });

            }, 
            
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