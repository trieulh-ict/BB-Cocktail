import 'package:bb_cocktail/model/ui_model/search_item.dart';
import 'package:flutter/material.dart';

class SearchDropdownItem extends DropdownMenuItem<SearchItem> {
  SearchDropdownItem({
    @required this.item,
    Key key,
  }) : super(
            key: key,
            value: item,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 4),
              child: Text(
                item.name,
                style: TextStyle(color: Color.fromARGB(255, 175, 175, 176)),
              ),
            ));

  final SearchItem item;
}
