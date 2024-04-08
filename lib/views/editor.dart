import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:journal/components/date.dart';
import 'package:journal/components/snackbar.dart';
import 'package:journal/database/db_provider.dart';
import 'package:journal/database/notes.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Editor extends StatefulWidget {

  NotesModel? note;

  Editor({super.key, this.note});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  String category = 'Personal';

  String date = "Date";

  Color categoryColor(){

    if(category == 'Personal'){
      return Theme.of(context).colorScheme.tertiaryContainer;
    }
    else if(category == 'Office'){
      return Theme.of(context).colorScheme.primaryContainer;
    }
    return Theme.of(context).colorScheme.secondaryContainer;
  }
  
  @override
  void initState() {

    super.initState();

    if(widget.note != null){

      titleController.text = widget.note!.title;

      descriptionController.text = widget.note!.description;

      category = widget.note!.category;

      date = widget.note!.date;

    }
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<DatabaseProvider>(builder:(context, value, child){

        return Scaffold(

          bottomNavigationBar:

          Padding(

            padding: const EdgeInsets.all(20),

            child: Row(
            
            mainAxisAlignment: MainAxisAlignment.end,
              
            children: [
            
            FilledButton.tonal(
                                                    
              onPressed: () async{
            
                var $date = await showDatePickerDialog(context);
                
                setState((){
            
                  date = DateFormat('EE, d MMMM y').format($date);
            
                });
              },
            
              style: ButtonStyle(

                padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(16, 12, 16, 12)),
                                              
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
                                  
                      Text(date, textScaler: const TextScaler.linear(1.4)),
                    ],
                  ),
                ),
              ),           
            ]),
          ),

          body: Container(

          height: MediaQuery.of(context).size.height,

          width: MediaQuery.of(context).size.height,

          margin: const EdgeInsets.all(24),

          child: SingleChildScrollView(

            scrollDirection: Axis.vertical,

            child: Column(
                  
              mainAxisAlignment: MainAxisAlignment.start,
                  
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
            
                const Gap(30),
            
                Row(
            
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
                  children: [
            
                    Builder(

                      builder: (context) =>

                      FilledButton.tonal(
                                                
                        onPressed: (){
                      
                          showPopover(

                            arrowDyOffset: 10,

                            arrowHeight: 0, arrowWidth: 0,

                            backgroundColor: Colors.transparent,

                            barrierColor: Colors.transparent,

                            shadow: List.empty(),
                            
                            context: context,
                                                  
                            bodyBuilder: (context){
                      
                              return SingleChildScrollView(

                                scrollDirection: Axis.horizontal,

                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                
                                  children: [

                                    const Gap(30),
                                
                                    FilledButton.tonal(
                                                  
                                      onPressed: (){
                                        
                                        setState(() {
                                          category = "Office";
                                        });
                                      },
                                                            
                                      style: ButtonStyle(
                                                                                    
                                      padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(12, 0, 12, 0)),
                                          
                                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)
                                              
                                      ), 
                                                            
                                      child: SingleChildScrollView(
                                          
                                        scrollDirection: Axis.horizontal,
                                          
                                        child: Row(
                                
                                          mainAxisAlignment: MainAxisAlignment.center,
                                
                                          children: [
                                                                                    
                                            Icon(Icons.circle, color: Theme.of(context).colorScheme.primaryContainer, size: 14),
                                
                                            const Gap(6),
                                
                                            const Text("Office", textScaler: TextScaler.linear(1.3)),
                                          ],
                                        ),
                                      ),
                                    ),

                                    const Gap(10),

                                    FilledButton.tonal(
                                                  
                                      onPressed: (){
                                        
                                        setState(() {
                                          category = "Personal";
                                        });
                                      },
                                                            
                                      style: ButtonStyle(
                                                                                    
                                      padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(12, 0, 12, 0)),
                                          
                                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)
                                              
                                      ), 
                                                            
                                      child: SingleChildScrollView(
                                          
                                        scrollDirection: Axis.horizontal,
                                          
                                        child: Row(
                                
                                          mainAxisAlignment: MainAxisAlignment.center,
                                
                                          children: [
                                                                                  
                                            Icon(Icons.circle, color: Theme.of(context).colorScheme.tertiaryContainer, size: 14),
                                
                                            const Gap(6),
                                
                                            const Text("Personal", textScaler: TextScaler.linear(1.3)),
                                          ],
                                        ),
                                      ),
                                    ),

                                    const Gap(10),

                                    FilledButton.tonal(
                                                  
                                      onPressed: (){

                                        setState(() {

                                          category = "Studies";

                                        });         
                                      },
                                                            
                                      style: ButtonStyle(
                                                                                    
                                      padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(12, 0, 12, 0)),
                                          
                                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)
                                              
                                      ), 
                                                            
                                      child: SingleChildScrollView(
                                          
                                        scrollDirection: Axis.horizontal,
                                          
                                        child: Row(
                                
                                          mainAxisAlignment: MainAxisAlignment.center,
                                
                                          children: [
                                                                                    
                                            Icon(Icons.circle, color: Theme.of(context).colorScheme.secondaryContainer, size: 14),
                                
                                            const Gap(6),
                                
                                            const Text("Studies", textScaler: TextScaler.linear(1.3)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                          }
                        );
                      },
                                              
                      style: ButtonStyle(
                                                                      
                        padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(14, 10, 14, 10)),
                            
                        backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)
                                
                      ),
                                              
                      child: SingleChildScrollView(
                            
                          scrollDirection: Axis.horizontal,
                            
                          child: Row(
                                                                              
                            mainAxisAlignment: MainAxisAlignment.center,
                                                                              
                            children: [
                                                                              
                              Icon(Icons.circle, color: categoryColor(), size: 14),
                                                                              
                              const Gap(6),
                                                                              
                              Text(category, textScaler: const TextScaler.linear(1.3)),
                            ],
                          ),
                        ),
                      ),
                    ),
            
                    FilledButton.tonal(
                                              
                      onPressed: (){

                        if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty){

                        if(widget.note != null){

                          value.dbHelper.update(NotesModel(title: titleController.text, description: descriptionController.text, category: category, date: date, id: widget.note!.id));
            
                          value.initDatabase();
            
                          value.setLength();
                        } 

                        else{

                          value.dbHelper.insert(NotesModel(title: titleController.text, description: descriptionController.text, category: category, date: date));
            
                          value.initDatabase();
            
                          value.setLength();
                        }

                        Navigator.of(context).pop();

                        } else{

                          SnackBarUtils.showSnackbar(context, CupertinoIcons.pencil_outline, "Please enter title & description!");
                        }

                      },
                                            
                      style: ButtonStyle(
                                                                    
                      padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(14, 10, 14, 10)),
                          
                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)
                              
                      ), 
                                            
                      child: SingleChildScrollView(
                          
                        scrollDirection: Axis.horizontal,
                          
                        child: Row(
                                                                            
                          mainAxisAlignment: MainAxisAlignment.center,
                                                                            
                          children: [
                                                                            
                            Icon(Icons.circle, color: Theme.of(context).colorScheme.secondaryContainer, size: 14),
                                                                            
                            const Gap(6),
                                                                            
                            const Text("Save", textScaler: TextScaler.linear(1.3)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            
                const Gap(14),
                              
                textBox(titleController, context, 50, 30, 1, "Subject"),
                              
                const Gap(8),
                              
                textBox(descriptionController, context, 40, 23, null, "Capture your thoughts here..."),
              ],        
            ),
          ),
        ),
      );
    });
  }
}

TextField textBox(TextEditingController controller, context, double cursorHeight, double fontSize, int? lines, String hint){

  return TextField(

      controller: controller,

      maxLines: lines,
      
      cursorColor: Theme.of(context).colorScheme.secondary,

      cursorHeight: cursorHeight,

      decoration: InputDecoration(

        hintText: hint,
    
        filled: true,
    
        fillColor: Colors.transparent,

        border: InputBorder.none,

        contentPadding: EdgeInsets.zero,

        hintStyle: TextStyle(fontSize: fontSize+2, fontWeight: FontWeight.normal, color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3))

      ),

      style: TextStyle(

        color: Theme.of(context).colorScheme.tertiary,

        height: 1.6,

        fontSize: fontSize
      ),
    );
}