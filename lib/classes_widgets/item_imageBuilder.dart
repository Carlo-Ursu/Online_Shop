import 'package:flutter/material.dart';

Widget buildImage(String urlImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.amber,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
