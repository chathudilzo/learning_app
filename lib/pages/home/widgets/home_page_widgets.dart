import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/common/widgets/base_text_widgets.dart';

import 'package:learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/home/bloc/home_page_events.dart';
import 'package:learning_app/pages/home/bloc/home_page_state.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w,right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
              child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(image:AssetImage('assets/icons/person.png'))
              ),
            ),
          )
        ],
      ),
    ),
  );
}

                                    //color can be not provided in that case default is use
Widget homePageTopText(String text,{Color color=AppColors.primaryText,int top=20}){

  return Container(
   margin: EdgeInsets.only(top: top.h),
   child: Text(text,style: TextStyle(
     color: color,
     fontSize: 24.sp,
     fontWeight: FontWeight.bold
   ),),
 );
}


Widget searchView(){
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourElementText)
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.h),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              width: 214.w,
              height: 40.h,
              child: TextField(
                
                keyboardType: TextInputType.multiline,
                decoration:const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: 'Search Your Course',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp
                ),
                autocorrect: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(14.w),
            border: Border.all(color: AppColors.primaryElement)
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
      
    ],
    
  );
}


//slider views

Widget SlidersView(BuildContext context,HomePageStates state){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
          _slidersContainer(img:'assets/icons/Art.png'),
          _slidersContainer(img:'assets/icons/Image(1).png'),
          _slidersContainer(img:'assets/icons/Image(2).png')
        ],),
      ),
      Container(
        child: DotsIndicator(dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
          color: AppColors.primaryThirdElementText,
          activeColor: AppColors.primaryElement,
          size: const Size.square(5.0),
          activeSize: const Size(17.0, 5.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          )
        ),

        ),
      )


      
    ],
  );
}

//sliders widget

Widget _slidersContainer({String img='assets/icons/Art.png'}){
  return
        Container(
            width: 325,
            height: 160.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img),fit: BoxFit.fill)
            ),
      );
}


//menu view for items below

Widget menuView(){
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
           reusableText('Choose Your course'),
           GestureDetector(child: reusableText('See all',color: AppColors.primaryThirdElementText,fontSize: 10))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
           _reusbaleMenuTextButton('All'),
           _reusbaleMenuTextButton('Popular',textColor: AppColors.primaryThirdElementText,backgroundColor: Colors.white),
           _reusbaleMenuTextButton('Newest',textColor: AppColors.primaryThirdElementText,backgroundColor: Colors.white)
            
          ],
        ),
      )
    ],
  );
}





Widget _reusbaleMenuTextButton(String text,{Color textColor=AppColors.primaryElementText,Color backgroundColor=AppColors.primaryElement}){
  return  Container(
    margin: EdgeInsets.only(right: 20.w),
              padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 5.h,bottom: 5.h),
              decoration: BoxDecoration(color:backgroundColor,
            border: Border.all(color: backgroundColor),
            borderRadius: BorderRadius.circular(7.w)),
            child: reusableText(text,
            color: textColor,
            fontWeight: FontWeight.normal,
            fontSize: 11
            ),
            );
}

Widget courseGridItem(){
  return Container(
                    padding: EdgeInsets.all(12.w),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      image: DecorationImage(image: AssetImage('assets/icons/Image(2).png'),fit: BoxFit.fill)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         Text(
                          'Best Course for IT adn Programming',
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          softWrap: false,
                          style: TextStyle(
                            color:AppColors.primaryElementText,
                            fontWeight: FontWeight.bold,
                            fontSize:11.sp),),
                            SizedBox(height: 5.h,),
                            Text(
                          'Flutter best course',
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          softWrap: false,
                          style: TextStyle(
                            color:AppColors.primaryFourElementText,
                            fontWeight: FontWeight.normal,
                            fontSize:8.sp),),
                      ]
                    ),
                  );
}