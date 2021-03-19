import 'package:bb_cocktail/model/ui_model/search_item.dart';
import 'package:bb_cocktail/ui/search/widgets/search_dropdown_button.dart';
import 'package:bb_cocktail/ui/search/widgets/search_dropdown_item.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller;
  List<SearchDropdownItem> _items;
  SearchDropdownItem _currentDropdownItem;
  String _searchString = "";

  @override
  void initState() {
    _controller = TextEditingController();
    _items = <SearchItem>[
      SearchItem(type: SearchType.name, name: 'By Name', suggestionText: 'eg. Margarita...'),
      SearchItem(type: SearchType.ingredient, name: 'By Ingredient', suggestionText: 'eg. Gin...')
    ].map<SearchDropdownItem>((item) {
      return SearchDropdownItem(item: item);
    }).toList();
    _currentDropdownItem = _items.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double containerPadding = 16.0;
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14)),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + containerPadding, left: containerPadding, right: containerPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildSearchTextField()),
              SizedBox(
                width: 16.0,
              ),
              _buildDropdownButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(BuildContext context) {
    return SearchDropdownButton<SearchItem>(
        items: _items,
        currentDropdownItem: _currentDropdownItem,
        onValueChanged: (value) {
          setState(() {
            _currentDropdownItem = SearchDropdownItem(item: value);
          });
        });
  }

  TextField _buildSearchTextField() {
    return TextField(
        style: TextStyle(color: Color.fromARGB(255, 175, 175, 176)),
        controller: _controller,
        onChanged: (value) => setState(() {
              _searchString = value;
            }),
        decoration: InputDecoration(
            hintText: _currentDropdownItem.value.suggestionText,
            hintStyle: TextStyle(color: Color.fromARGB(255, 175, 175, 176)),
            filled: true,
            fillColor: Color.fromARGB(255, 38, 38, 41),
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 175, 175, 176),
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear),
                    color: Color.fromARGB(255, 175, 175, 176),
                    onPressed: () => _controller.clear(),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8.0, right: _searchString.isNotEmpty ? 0.0 : 4.0)));
  }
}
