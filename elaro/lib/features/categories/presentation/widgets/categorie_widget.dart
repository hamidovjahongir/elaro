import 'dart:ffi';

import 'package:elaro/core/constants/app_color.dart';
import 'package:elaro/features/categories/data/model/categories_model.dart';
import 'package:flutter/material.dart';

class CategorieWidget extends StatefulWidget {
  final CategorieModel data;
  const CategorieWidget({super.key, required this.data});

  @override
  State<CategorieWidget> createState() => _CategorieWidgetState();
}

class _CategorieWidgetState extends State<CategorieWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Row(
            spacing: 10,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Image.network(widget.data.data.image, fit: BoxFit.cover),
              ),
              Text(
                widget.data.data.nameUz,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColor.black.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
