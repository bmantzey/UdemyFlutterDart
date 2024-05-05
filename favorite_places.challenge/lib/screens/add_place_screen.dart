import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  Place? _enteredPlace;

  void _saveNewPlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (!context.mounted) {
        return;
      }

      Navigator.of(context).pop(_enteredPlace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                cursorColor: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    )
                    .color,
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground,),
                decoration: InputDecoration(
                  label: Text(
                    'Title',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return 'Please enter a valid value';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredPlace = Place(title: value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  foregroundColor: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )
                      .color,
                  backgroundColor: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      )
                      .color,
                ),
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
                onPressed: _saveNewPlace,
              )
            ],
          ),
        ),
      ),
    );
  }
}
