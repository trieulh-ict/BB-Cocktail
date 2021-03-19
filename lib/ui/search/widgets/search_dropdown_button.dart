import 'package:flutter/material.dart';

class SearchDropdownButton<T> extends StatelessWidget {
  const SearchDropdownButton(
      {Key key, @required List<DropdownMenuItem<T>> items, @required DropdownMenuItem<T> currentDropdownItem, ValueChanged<T> onValueChanged})
      : _items = items,
        _currentDropdownItem = currentDropdownItem,
        _onValueChanged = onValueChanged,
        super(key: key);

  final List<DropdownMenuItem<T>> _items;
  final DropdownMenuItem<T> _currentDropdownItem;
  final ValueChanged<T> _onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32.0), color: Color.fromARGB(255, 38, 38, 41)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          items: _items,
          icon: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
          dropdownColor: Color.fromARGB(255, 38, 38, 41),
          value: _currentDropdownItem.value,
          onChanged: (value) => _onValueChanged(value),
        ),
      ),
    );
  }
}
