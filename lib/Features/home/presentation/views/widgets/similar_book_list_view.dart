import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manger/similar_book_details_cubit/similar_book_details_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/image_book_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBoookListView extends StatelessWidget {
  const SimilarBoookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookDetailsCubit, SimilarBookDetailsState>(
      builder: (context, state) {
        if (state is SimilarBookDetailsSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ImageBookItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.smallThumbnail??"",
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBookDetailsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
