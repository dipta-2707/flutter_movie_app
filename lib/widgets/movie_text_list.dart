import 'package:flutter/material.dart';

class MovieTextList extends ListTile {
  MovieTextList(
      String title, String year, String rated, String runtime, String rating)
      : super(
          title: Text(title),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Text(year),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Text(rated),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Text(runtime),
                  )
                ],
              ),
              (rating != "N/A")
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < double.parse(rating).toInt(); i++)
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: Colors.yellow,
                          )
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        );
}
