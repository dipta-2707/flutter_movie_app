import 'package:flutter/material.dart';

class MovieBannerTile extends GridTile {
  MovieBannerTile(String imgUrl, {super.key})
      : super(
          child: (imgUrl != "N/A")
              ? Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.no_photography),
        );
}
