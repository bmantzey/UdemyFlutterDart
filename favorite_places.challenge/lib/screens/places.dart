import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/my_place_provider.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({
    super.key,
  });

  void _addNewPlace(BuildContext context, WidgetRef ref) async {
    final newPlace = await Navigator.of(context).push<Place>(
      MaterialPageRoute(
        builder: (context) => const AddPlaceScreen(),
      ),
    );

    if (newPlace == null) {
      return;
    }

    ref.read(favoritePlacesProvider.notifier)
       .addFavoritePlace(newPlace);
    // setState(() {
    //   _myPlaces.add(newPlace);
    // });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPlaces = ref.watch(favoritePlacesProvider);

    Widget content = Center(
      child: Text(
        'No places added yet',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );

    if (myPlaces.isNotEmpty) {
      content = ListView.builder(
        itemCount: myPlaces.length,
        itemBuilder: (listContext, index) => SingleChildScrollView(
          child: ListTile(
            title: Text(
              myPlaces[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              _addNewPlace(context, ref);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
