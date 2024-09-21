import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    

    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            FeaturedBooksListView(),
            SizedBox(
              height: 30,
            ),
            Text(
              "Best Seller",
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 20,
            ),
            BestsellerListView(),
          ],
        ),
      ),
    );









    // return const CustomScrollView(
    //   physics: BouncingScrollPhysics(),
    //   slivers: [
    //     SliverToBoxAdapter(
    //       child: Padding(
    //         padding: EdgeInsets.only(
    //           left: 24,
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             CustomAppBar(),
    //             FeaturedBooksListView(),
    //             SizedBox(
    //               height: 30,
    //             ),
    //             Text(
    //               "Best Seller",
    //               style: Styles.textStyle18,
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
        
    //      SliverToBoxAdapter(child: BestsellerListView()),
          
        
    //   ],
    // );
  }
}
