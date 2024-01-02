// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:learning_app/common/values/colors.dart';

// AppBar buildAppBar(){
//   return AppBar(
          
//           bottom: PreferredSize(preferredSize: Size.fromHeight(1.0), child: Container(
//             color:AppColors.primarySecondaryBackground,
//             //line thick
//             height: 1.0,
//           )),
//           title: Text('LogIn', style: TextStyle(
//           color: AppColors.primaryText,
//           fontSize: 16.sp
//         ),),);
// }


// //context for access bloc
// Widget buildThirdPartyLogin(BuildContext context){
//   return Container(
//     margin: EdgeInsets.only(top: 40.h,bottom: 20.h),
//     padding: EdgeInsets.only(left: 35,right: 35),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         _reusableIcons('google.png'),
//         _reusableIcons('apple.png'),
//         _reusableIcons('facebook.png')
//       ],
//     ),
//   );
// }

// Widget _reusableIcons(String imagePath){
//   return GestureDetector(
//           onTap: (){

//           },
//           child: Container(
//             width: 40.w,
//             height: 40.w,
//             child: Image.asset('assets/icons/$imagePath'),
//           ),
//         );
// }


// Widget reusableText(String text){
//   return Container(
//     margin: EdgeInsets.only(bottom: 5.h),
//     child: Text(text,
//     style: TextStyle(
//       color: Colors.grey.withOpacity(0.5),
//       fontWeight: FontWeight.normal,
//       fontSize: 14.sp
//     ),),
//   );
// }


// Widget buildTextField(String hinttx,String textType,String iconName,void Function(String value)? func){
//   return Container(
//     margin: EdgeInsets.only(bottom:20.h),
//     width: 325.w,
//     height: 50.h,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.all(Radius.circular(15.w)),
//       border: Border.all(
//         color: AppColors.primaryFourElementText
//       ),
//       color: Colors.white
//     ),
//     child: Row(
//       children: [
//         Container(
//           width: 16.w,
//           height: 16.w,
//           margin: EdgeInsets.only(left: 17.w),
//           child: Image.asset('assets/icons/$iconName'),
//         ),
//         SizedBox(
//           width: 270.w,
//           height: 50.h,
//           child: TextField(
//             onChanged:(value)=>func!(value),
//             keyboardType: TextInputType.multiline,
//             decoration:  InputDecoration(
              
//               hintText: hinttx,
//               border:const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.transparent
//                 ),
              
//               ),
//               enabledBorder:const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.transparent
//                 ),
              
//               ),
//               disabledBorder:const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.transparent
//                 ),
              
//               ),
//               focusedBorder:const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.transparent
//                 ),
              
//               ),
//               hintStyle: TextStyle(
//                 color: AppColors.primarySecondaryElementText
//               )
//             ),
//             style: TextStyle(
//               color: AppColors.primaryText,
//               fontFamily: 'Avenir',
//               fontWeight: FontWeight.normal,
//               fontSize: 14.sp
//             ),
//             autocorrect:false,
//             obscureText: textType=='password'?true:false,
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget forgotPassword(){
//   return Container(
//     width: 260.w,
//     height: 44.h,
//     child: GestureDetector(
//       onTap: (){

//       },
//       child: Text('Forgot Password?',style: TextStyle(
//         color: AppColors.primaryText,
//         decoration: TextDecoration.underline,
//         decorationColor: AppColors.primaryText,
//         fontSize: 12.sp
//       ),),
//     ),
//   );
// }


// Widget buildLoginandRegButton(String buttonName,String buttonType,void Function()?func){
//   return GestureDetector(
//     onTap:func,
//     child: Container(
//       margin: EdgeInsets.only(left: 25.w,right: 25.w,top: buttonType=='login'?40.h:20.h),
//       width: 325.w,
//       height: 50.h,
//       decoration: BoxDecoration(
//         border:Border.all(
//           color: buttonType=='login'?Colors.transparent
//           :AppColors.primaryFourElementText
//         ),
//         boxShadow: [BoxShadow(
//         spreadRadius: 1,
//         blurRadius: 2,
//         offset: Offset(0, 1),
//         color: Colors.grey.withOpacity(0.3)
//         )],
//         color:buttonType=='login'? AppColors.primaryElement:AppColors.primaryBackground,
//         borderRadius: BorderRadius.all(Radius.circular(15.w))
//       ),
//       child: Center(
//         child: Text(buttonName,style: TextStyle(
//           fontSize: 16.sp,fontWeight: FontWeight.normal,
//           color:buttonType=='login'?AppColors.primaryBackground:AppColors.primaryText,
//         ),),
//       ),
//     ),
//   );
// }