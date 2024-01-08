import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/widgets/base_text_widgets.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child: Container(
        child: reusableText('Settings'),
      ),
    ),
  );
}


Widget settingsButton(BuildContext context,void Function()? func){
  return GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text('Confirm Logout'),
                      actions: [
                        TextButton(onPressed:func, child: const Text('Confirm')),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: const Text('Cancel'))
                      ],
                    );
                  });
                },
                child: Container(
                  
                  height: 100.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image:AssetImage('assets/icons/Logout.png'),fit: BoxFit.fitHeight)
                  ),
              
                ),
              );
}