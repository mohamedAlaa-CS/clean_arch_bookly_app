import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView(
      {Key? key, required this.booksList, this.controller})
      : super(key: key);
  final List<BookEntity> booksList;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: booksList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(image: booksList[index].image ?? ''),
            );
          }),
    );
  }
}
