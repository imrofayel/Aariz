import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:journal/database/db_provider.dart';
import 'package:journal/database/notes.dart';
import 'package:journal/views/editor.dart';
import 'package:line_icons/line_icons.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {

  @override
  void initState(){    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<DatabaseProvider>(

      builder: (context, value, child){
      
      return Scaffold(

        floatingActionButton: IconButton(onPressed: (){

          Navigator.push(context, 
                    
          MaterialPageRoute(builder: (context) => Editor()),
                    
          );
          
        }, 
        
        icon: const Icon(LineIcons.edit, size: 40),

        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary), padding: const MaterialStatePropertyAll(EdgeInsets.all(20))),
        
        ),

        body: Column(
          
          children: [
            
              FutureBuilder(
        
                future: value.notesList,
        
                builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                  
                  if(snapshot.hasData && snapshot.data!.isNotEmpty){
                    
                    return Expanded(
                                                      
                      child: Column(
        
                        children: [
        
                          Expanded(
        
                            child: ListView.builder(

                              scrollDirection: Axis.vertical,

                              itemCount: snapshot.data!.length,
                              
                              itemBuilder:(context, index) {
                                
                                return InkWell(

                                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),

                                  highlightColor: Colors.transparent,

                                  splashFactory: null,
                                                            
                                  onTap: (){

                                    Navigator.push(context, MaterialPageRoute(builder:(context) => Editor(note: snapshot.data![index])));
                                                            
                                  },
                                                            
                                  child: Container(
                                                      
                                    height: 180, width: MediaQuery.of(context).size.width,
                                  
                                    margin: const EdgeInsets.fromLTRB(14, 14, 14, 20),
                                                      
                                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                                                      
                                    child: SingleChildScrollView(
                                                      
                                      scrollDirection: Axis.vertical,
                                                      
                                      child: Column(
                                                      
                                        mainAxisAlignment: MainAxisAlignment.start,
                                                      
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      
                                        children: [
                                                      
                                          Row(
                                                      
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                      
                                            children: [
                                              
                                              SizedBox(width: 180, child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Text(snapshot.data![index].title, textScaler: const TextScaler.linear(1.8)))),

                                              Row(

                                                mainAxisAlignment: MainAxisAlignment.start,

                                                children: [

                                                  FilledButton.tonal(
                                                
                                                    onPressed: (){},
                                                  
                                                    style: ButtonStyle(
                                                                          
                                                      padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(12, 6, 10, 6)),
                                                          
                                                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)
                                                    ), 
                                                  
                                                    child: SingleChildScrollView(
                                                          
                                                      scrollDirection: Axis.horizontal,
                                                          
                                                      child: Row(
                                                                                  
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                  
                                                        children: [
                                                                                  
                                                          Icon(Icons.circle, color: 
                                                          
                                                          categoryColor(snapshot.data![index].category, context),
                                                          
                                                          size: 14
                                                          
                                                          ),
                                                                                  
                                                          const Gap(4),
                                                                                  
                                                          Text(snapshot.data![index].category, textScaler: const TextScaler.linear(1.3)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  Builder(

                                                    builder: (context) {

                                                      return IconButton(onPressed: (){
                                                      
                                                        showPopover(context: context,

                                                        barrierColor: Colors.transparent, 

                                                        backgroundColor: Colors.transparent,

                                                        direction: PopoverDirection.left,

                                                        shadow: List.empty(),

                                                        arrowWidth: 0, arrowHeight: 0,
                                                        
                                                        bodyBuilder:(context) {
                                                      
                                                          return SizedBox(
                                                      
                                                            child: FilledButton(onPressed: (){
                                                              
                                                            value.dbHelper.delete(snapshot.data![index].id);

                                                            value.initDatabase();
                                                            
                                                            value.setLength();

                                                            Navigator.pop(context);

                                                            }, style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary), padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(12, 20, 12, 20)), side: MaterialStatePropertyAll(BorderSide(color: Theme.of(context).colorScheme.secondary))), child: Icon(CupertinoIcons.delete, size: 24, color: Theme.of(context).colorScheme.tertiary))
                                                      
                                                          );
                                                        },
                                                      );
                                                      
                                                      }, icon: const Icon(LineIcons.verticalEllipsis, size: 28), padding: EdgeInsets.zero);
                                                    }
                                                  ),

                                                ],
                                              ),
                                            ],
                                          ),
                                          
                                          FilledButton.tonal(
                                                  
                                            onPressed: (){},

                                            style: ButtonStyle(
                                                                                    
                                              padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(12, 10, 12, 6)),
                                                                            
                                              backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)
                                                                              
                                            ), 
                                                                                  
                                            child: SingleChildScrollView(
                                                                          
                                              scrollDirection: Axis.horizontal,
                                                                          
                                                child: Row(
                                                                
                                                  mainAxisAlignment: MainAxisAlignment.center,

                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                
                                                  children: [
                          
                                                    Icon(Icons.circle, color: Theme.of(context).colorScheme.tertiary, size: 14),
                                                                
                                                    const Gap(6),
                                                                
                                                    Text(snapshot.data![index].date, textScaler: const TextScaler.linear(1.3)),
                                                  ],
                                                ),
                                              ),
                                            ),

                                          const Gap(6),

                                          Text(snapshot.data![index].description, textScaler: const TextScaler.linear(1.55), style: const TextStyle(height: 1.6)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },  
                            ),
                          ),
                        ],
                      )
                    );
                  }
        
                  else {
                    
                    return Visibility(
        
                      visible: snapshot.connectionState == ConnectionState.done,
        
                      child: Expanded(
                
                        child: Column(
        
                          mainAxisAlignment: MainAxisAlignment.center,
        
                          children: [
        
                            Center(
                            
                              child: Icon(LineIcons.seedling, size: 100, color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3))

                            ),
        
                            const Gap(25),
        
                            Text("Your canvas is blank.", textScaler: const TextScaler.linear(2.2), style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3))),

                            const Gap(100),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ]
          )
        );
      }
    );
  }
}

Color categoryColor(String category, context){

    if(category == 'Personal'){
      return Theme.of(context).colorScheme.tertiaryContainer;
    }
    else if(category == 'Office'){
      return Theme.of(context).colorScheme.primaryContainer;
    }
    return Theme.of(context).colorScheme.secondaryContainer;
}