class SearchItem {
  final SearchType type;
  final String name;
  final String suggestionText;
  SearchItem({this.type, this.name, this.suggestionText});
}

enum SearchType { name, ingredient }
