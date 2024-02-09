import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Future<DateTime> showDatePickerDialog(BuildContext context) async {

  DateTime selectedDate = DateTime.now();

  await showCupertinoDialog(
    
    context: context,
    
    builder: (context){

        return GestureDetector(

          onDoubleTap: () => Navigator.pop(context),

          child: Container(
          
            decoration: BoxDecoration(
              
              color: Theme.of(context).colorScheme.primary,
          
            ),
          
            child: CupertinoDatePicker(
                    
              onDateTimeChanged: (value) {
                    
                  selectedDate = value;       
                    
              },
                    
              mode: CupertinoDatePickerMode.date,
                    
              initialDateTime: DateTime.now(),
                    
              minimumYear: 1990,
                    
              maximumDate: DateTime.now(),
                    
              itemExtent: 60,
                    
            ),
          ),
        );
      },
    );

  return selectedDate;
}