import 'package:flutter/material.dart';

class MovieListTile extends ListTile {
  MovieListTile(String title, String year, String poster, {super.key})
      : super(
          leading: Container(
              width: 80.0,
              child: (poster == 'N/A')
                  ? const Icon(Icons.image)
                  : Image.network(poster)),
          title: Text(title),
          subtitle: Text(year),
        );
}
