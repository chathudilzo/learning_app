import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/main.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_sate.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

PageController pageController=PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc,WelcomeState>(builder:(context,state){
          return Container(
          margin:  EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page=index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(1,context,'Next','First Fee Learning','Forget about a for of paper all knowladge in on learning','assets/images/reading.png'),
                  _page(2,context,'Next','Connect With Everyone','Always keep in touch with your tutor & friends. Lets get connected','assets/images/boy.png'),
                  _page(3,context,'Get Started','Always Facinated Learning','Anywhare any time. The time is our discrition so study when ever you want!','assets/images/man.png'),
                ],
              ),
              Positioned(
                bottom: 100.h,
                
                child: DotsIndicator(
                  position: state.page,
                  dotsCount: 3,
                decorator: DotsDecorator(
                  color: Colors.blue,
                  size: Size.square(8.0),
                  activeColor: Colors.greenAccent,
                  activeSize: Size(18.0,8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                mainAxisAlignment: MainAxisAlignment.center,))
            ],
          ),
        );
        } )
      ),
    );
  }


  Widget _page(int index,BuildContext context,String buttonName,String title,String subTitle,String imgPath){
    return Column(
                    children: [
                      SizedBox(
                    width: 345.w,
                    height: 345.w,
                    child: Image.asset(imgPath,fit: BoxFit.cover,),
                  ),
                  Container(
                    child: Text(title,style: TextStyle(color: Colors.black,fontSize: 24.sp,fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30.w,right: 30.w),
                    child: Text(subTitle,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 14.sp,fontWeight: FontWeight.normal),),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(index<3){
                        pageController.animateToPage(index,
                         duration:const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                      }else{
                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>MyHomePage(title: title)));
                        Navigator.of(context).pushNamedAndRemoveUntil('signIn', (route) => false);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 100.h,left: 25.w,right: 25.w),
                      width: 325.w,
                      height: 50.h,
                     decoration: BoxDecoration(
                      color:Colors.blue,
                      borderRadius: BorderRadius.circular(15.w),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: Offset(0, 1)
                      )]
                     ),
                     child: Center(
                      child: Text(buttonName,style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,fontWeight: FontWeight.normal
                      ),),
                     ),
                    ),
                  )
                    ],
                  );
  }
}