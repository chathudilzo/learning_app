import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/home/bloc/home_page_state.dart';
import 'package:learning_app/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body:BlocBuilder<HomePageBlocs,HomePageStates>(builder: (context,state){
        return  Container(
        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 25.w),
        child: CustomScrollView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          slivers: [
           SliverToBoxAdapter(child:  homePageTopText('Hello',color: AppColors.primaryThirdElementText),),

            SliverToBoxAdapter(child: homePageTopText('Chathura Dilshan',top: 5)),

            SliverPadding(padding: EdgeInsets.only(top: 20.h)),
            //search bar 
            SliverToBoxAdapter(child: searchView()),
            SliverToBoxAdapter(child: SlidersView(context,state)),
            SliverToBoxAdapter(child: menuView()),
            //grid view for 4 items
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 0.w),
            sliver: SliverGrid(
              //controll items and count
              delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                return GestureDetector(
                  onTap: (){

                  },
                  child: courseGridItem()
                );
              },childCount: 4
              ),
            //control rows and columns
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.6  //item width will be 1.6 times the height.
               )
              ),
            )
          ],
        ),
      );
      })
    );
  }
}