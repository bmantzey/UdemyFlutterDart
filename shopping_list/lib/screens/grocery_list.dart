import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_widget.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key, required this.groceries});

  final List<GroceryItem> groceries;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (!groceries.isEmpty) {
      content = Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemCount: groceries.length,
            itemBuilder: (ctx, index) => GroceryWidget(
                  groceryItem: groceries[index],
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 32,
                )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: content,
    );
  }
}
