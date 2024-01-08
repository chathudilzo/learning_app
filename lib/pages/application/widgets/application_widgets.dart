import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/pages/home/home_page.dart';
import 'package:learning_app/pages/profile/profile.dart';

Widget buildPage(int index){
  List<Widget> _widgets=[
    const HomePage(),
    Center(child: Text('Search'),),
    Center(child: Text('Course'),),
    Center(child: Text('Chat'),),
    const ProfilePage()
    ];
    
   return _widgets[index];
}


var bottomTabs=[
  
              BottomNavigationBarItem(
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child:  Image.asset('assets/icons/home.png',color: AppColors.primaryElement,),
                  ),
                label: 'Home',
                icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset('assets/icons/home.png'),
              )),BottomNavigationBarItem(
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child:  Image.asset('assets/icons/search2.png',color: AppColors.primaryElement,),
                  ),
                label: 'Search',
                icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset('assets/icons/search2.png'),
              )),
              BottomNavigationBarItem(
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child:  Image.asset('assets/icons/play-circle1.png',color: AppColors.primaryElement,),
                  ),
                label: 'course',
                icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset('assets/icons/play-circle1.png'),
              )),
              BottomNavigationBarItem(
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child:  Image.asset('assets/icons/message-circle.png',color: AppColors.primaryElement,),
                  ),
                label: 'chat',
                icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset('assets/icons/message-circle.png'),
              )),
              BottomNavigationBarItem(
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child:  Image.asset('assets/icons/person.png',color: AppColors.primaryElement,),
                  ),
                label: 'home',
                icon: SizedBox(
                width: 15.w,
                height: 15.h,
                child: Image.asset('assets/icons/person.png'),
              )),
];
