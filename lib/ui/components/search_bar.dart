import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umuzi/ui/components/padding.dart';
import '../theme.dart';
import 'border.dart';

class SearchBar extends StatelessWidget {
  final Function(String)? onSearchIconPressed;
  final String? text;
  final String? searchPlaceholder;
  final double? height;
  final EdgeInsets padding;
  final Color? primaryColor;
  final Color? backgroundColor;
  final TextEditingController _controller = TextEditingController();
  SearchBar({Key? key, required this.onSearchIconPressed, this.searchPlaceholder, this.text, this.height = 72, this.padding = defaultSearchBarPadding, this.primaryColor, this.backgroundColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Validate the colors, if any are null put defaults into place.
    final backColor = backgroundColor ?? Theme.of(context).colorScheme.secondary;
    final primColor = primaryColor ?? darkGreen;
    final placColor = (primColor == darkGreen)
        ? lowEmphasisGreen
        : primColor.withAlpha((primColor.alpha * 0.5).toInt());

    // Put the text into the search bar if it is not null.
    if (text != null) {
      _controller.text = text!;
    }

    return Container(
      height: height,
      padding: padding,
      child: CupertinoTextField(
        controller: _controller,
        textInputAction: TextInputAction.search,
        onEditingComplete: () {
          _submitSearch();
        },
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: const BorderRadius.all(mediumContainerRadius),
            border: smallContainerBorder(
                Theme.of(context).colorScheme.onBackground)),
        placeholder: searchPlaceholder,
        placeholderStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w400,
          color: placColor,
        ),
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w500,
          color: primColor,
        ),
        suffix: IconButton(
            onPressed: () {
              _submitSearch();
            },
            iconSize: 24,
            icon: Icon(
              Icons.search,
              color: primColor,
            )),
      ),
    );
  }

  void _submitSearch() {
    onSearchIconPressed!(_controller.text);
    _controller.clear();
  }
}
