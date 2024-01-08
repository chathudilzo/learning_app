import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/routes/routes.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/common/widgets/base_text_widgets.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          reusableText('Profile'),
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset('assets/icons/more-vertical.png'),
          )
        ],
      ),
    ),
  );
}


//profile icpon and edit

Widget profileIconAndEditButton(){
  return Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  image: DecorationImage(image: AssetImage('assets/icons/headpic.png'))
                ),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 6.w),
                child: Image(image: const AssetImage('assets/icons/edit_3.png'),width: 25.w,height: 25.h,),
              );
}

//setting section buttons list
var imageInfo=<String,String>{
  'Settings':'settings.png',
  'Payement details':'credit-card.png',
  'Love':'heart(1).png',
  'Achievement':'award.png',
  'Reminders':'cube.png'

};

Widget buildListView(BuildContext context){
  return Column(
    children: [
      ...List.generate(imageInfo.length, (index) => GestureDetector(
        onTap:()=>Navigator.of(context).pushNamed(AppRoutes.SETTINGS) ,
        child: Container(
          margin: EdgeInsets.only(bottom:15.h ),
          child: Row(children: [
            Container(
              width: 40.w,
              height: 40.h,
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: AppColors.primaryElement
              ),
              child: Image.asset('assets/icons/${imageInfo.values.elementAt(index)}',fit: BoxFit.cover,),
            ),
            SizedBox(width: 15.w,),
            Text(imageInfo.keys.elementAt(index),style: TextStyle(color: AppColors.primaryText,fontSize: 16.sp,fontWeight: FontWeight.bold),)
          ],)
        ),
      ))
    ],
  );
}


