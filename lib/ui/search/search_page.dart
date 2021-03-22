import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/ui_model/search_item.dart';
import 'package:bb_cocktail/ui/search/search_cubit.dart';
import 'package:bb_cocktail/ui/search/widgets/search_cocktail_grid_view.dart';
import 'package:bb_cocktail/ui/search/widgets/search_dropdown_button.dart';
import 'package:bb_cocktail/ui/search/widgets/search_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller;
  List<SearchDropdownItem> _items;
  SearchDropdownItem _currentDropdownItem;
  final PublishSubject<String> _searchStream = PublishSubject<String>();

  SearchCubit cubit = getIt<SearchCubit>();

  @override
  void initState() {
    _controller = TextEditingController();
    _items = <SearchItem>[
      SearchItem(
          type: SearchType.name,
          name: 'By Name',
          suggestionText: 'eg. Margarita...'),
      SearchItem(
          type: SearchType.ingredient,
          name: 'By Ingredient',
          suggestionText: 'eg. Gin...')
    ]
        .map<SearchDropdownItem>((item) => SearchDropdownItem(item: item))
        .toList();
    _currentDropdownItem = _items.first;

    _searchStream.debounceTime(Duration(seconds: 1)).forEach(_searchValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final containerPadding = 16.0;
    return BlocProvider<SearchCubit>(
      create: (context) => cubit,
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14)),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + containerPadding,
            left: containerPadding,
            right: containerPadding),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(child: _buildSearchTextField()),
                  SizedBox(
                    width: 16,
                  ),
                  _buildDropdownButton(context),
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(builder: _buildSearchResult)
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(BuildContext context) =>
      SearchDropdownButton<SearchItem>(
          items: _items,
          currentDropdownItem: _currentDropdownItem,
          onValueChanged: (value) {
            setState(() {
              _controller.text = '';
              _currentDropdownItem = SearchDropdownItem(item: value);
            });
          });

  TextField _buildSearchTextField() => TextField(
      style: TextStyle(color: Color.fromARGB(255, 175, 175, 176)),
      controller: _controller,
      onChanged: (value) => setState(() {
            _searchStream.add(value);
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
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.only(
              top: 0,
              bottom: 0,
              left: 8,
              right: _controller.text != null && _controller.text.isNotEmpty
                  ? 0
                  : 4)));

  Widget _buildSearchResult(BuildContext context, SearchState state) {
    Widget content;
    if (state is SearchInitial) {
      content = Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SearchSuccess) {
      content = CocktailGridView(items: state.drinks);
    }

    return Expanded(
      child: Container(
        child: content,
      ),
    );
  }

  void _searchValue(String searchStr) {
    if (searchStr.isNotEmpty) {
      cubit.searchByType(searchStr, _currentDropdownItem.item.type);
    } else {
      cubit.reset();
    }
  }
}
