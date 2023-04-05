import 'package:flutter/material.dart';

import 'model/bottom_sheet_style.dart';

/// DropdownWithSearch Class
class DropdownWithSearch<T> extends StatelessWidget {
  final BottomSheetStyle? bottomSheetStyle;
  final T selected;
  final List items;
  final EdgeInsetsGeometry? fieldPadding, fieldMargin;
  final TextStyle? selectedItemStyle, listItemStyle;
  final InputDecoration? searchFieldDecoration;
  final BoxDecoration? decoration, disabledDecoration;
  final bool disabled;
  final String label;
  final String hintText;

  final Function onChanged;

  /// DropdownWithSearch Class constractor
  const DropdownWithSearch({
    Key? key,
    required this.items,
    required this.selected,
    required this.onChanged,
    this.selectedItemStyle,
    this.decoration,
    this.disabledDecoration,
    required this.label,
    this.disabled = false,
    required this.searchFieldDecoration,
    this.fieldPadding,
    this.listItemStyle,
    this.fieldMargin,
    this.bottomSheetStyle,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final positioned = Positioned(
      top: -40,
      right: 8,
      child: IconButton(
        icon: const Icon(Icons.close),
        color: bottomSheetStyle?.backgroundColor ?? Theme.of(context).cardColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    return AbsorbPointer(
      absorbing: disabled,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: bottomSheetStyle?.isScrollControlled ?? false,
            shape: bottomSheetStyle?.shape,
            useRootNavigator: bottomSheetStyle?.useRootNavigator ?? false,
            backgroundColor: bottomSheetStyle?.backgroundColor,
            context: context,
            builder: (context) => Stack(
              clipBehavior: Clip.none,
              children: [
                positioned,
                Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SearchBox(
                    hintText: hintText,
                    listItemStyle: listItemStyle,
                    searchFieldDecoration: searchFieldDecoration,
                    items: items,
                  ),
                )
              ],
            ),
          ).then((value) {
            onChanged(value);
          });
        },
        child: Container(
          margin: fieldMargin ?? const EdgeInsets.only(top: 10),
          padding: fieldPadding ??
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: !disabled
              ? decoration ??
                  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300, width: 1))
              : disabledDecoration ??
                  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey.shade300,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
          child: Row(
            children: [
              Expanded(
                  child: Text(selected.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          selectedItemStyle ?? const TextStyle(fontSize: 14))),
              const Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
        ),
      ),
    );
  }
}

/// SearchBox class
class SearchBox extends StatefulWidget {
  final List items;
  final TextStyle? listItemStyle;
  final InputDecoration? searchFieldDecoration;
  final String hintText;

  /// SearchBox class constractor
  const SearchBox({
    Key? key,
    required this.items,
    this.searchFieldDecoration,
    this.listItemStyle,
    required this.hintText,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchBoxState();
}

class _SearchBoxState<T> extends State<SearchBox> {
  TextEditingController textController = TextEditingController();
  late List filteredList;

  @override
  void initState() {
    filteredList = widget.items;
    textController.addListener(() {
      setState(() {
        if (textController.text.isEmpty) {
          filteredList = widget.items;
        } else {
          filteredList = widget.items
              .where((element) => element
                  .toString()
                  .toLowerCase()
                  .contains(textController.text.toLowerCase()))
              .toList();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchField = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        autofocus: false,
        decoration: widget.searchFieldDecoration?.copyWith(
            hintText: widget.hintText,
            prefixIcon: const Icon(
              Icons.search,
            )),
        controller: textController,
      ),
    );
    final lists = Expanded(
      child: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: _buildList,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).dividerColor,
          ),
          margin: const EdgeInsets.all(12),
          width: 80,
          height: 5,
        ),
        searchField,
        lists,
      ],
    );
  }

  /// SearchBox build list
  Widget? _buildList(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.pop(context, filteredList[index]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: Text(
          filteredList[index].toString(),
          style: widget.listItemStyle,
        ),
      ),
    );
  }
}
