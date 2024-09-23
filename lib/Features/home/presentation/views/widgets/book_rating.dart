import 'package:bookly_app/Core/utils/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.countRating,
      required this.rating});

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int countRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          size: 16,
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "$rating",
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5),
        Opacity(
            opacity: .5,
            child: Text("($countRating)", style: Styles.textStyle14)),
      ],
    );
  }
}
