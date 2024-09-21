// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/Features/home/presentation/views/widgets/image_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bookly_app/Core/utils/go_router.dart';
import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/constants.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kBookDtails,extra: book);
        },
        child: SizedBox(
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ImageBookItem(imageUrl: book.volumeInfo.imageLinks?.thumbnail??""),
            
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        book.volumeInfo.title.toString(),
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                       
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                     Text(
                      book.volumeInfo.authors![0],
                      style: Styles.textStyle14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                         BookRating(
                          countRating: book.volumeInfo.ratingsCount??0,
                          rating:book.volumeInfo.averageRating??0,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// AspectRatio(
//                 aspectRatio: 2.5 / 4,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: const DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage(AssetsData.test1),
//                     ),
//                   ),
//                 ),
//               ),