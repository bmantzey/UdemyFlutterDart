import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryWidget extends StatelessWidget {
  const GroceryWidget({super.key, required this.groceryItem});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24.0,
          height: 24.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: groceryItem.category.color),
          ),
        ),
        const SizedBox(
          width: 36,
        ),
        Text(
          groceryItem.name,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        const Spacer(),
        Text(
            groceryItem.quantity.toString(),
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
      ],
    );
  }
}
