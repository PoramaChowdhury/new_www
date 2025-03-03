import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({
    super.key,
    required this.colors,
  });
  final List<Color> colors;
  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getColorItems(),
      ),
    );
  }
  List<Widget> getColorItems(){
    List<Widget> _colorList = [];
    for(Color color in widget.colors){
      _colorList.add(getColorItemWidget(
        colorCode: color,
        onTap: () {
          _selectedColor = color;
          setState(() {});
        },
        isSelected: _selectedColor == color,
      ),);
    }
    return _colorList;
  }

  Widget getColorItemWidget({
    required Color colorCode,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: colorCode,
            foregroundColor: Colors.white,
            child: isSelected? const Icon(Icons.check, color: Colors.white,) : null,
          ),
        ),
      ),
    );
  }
}
