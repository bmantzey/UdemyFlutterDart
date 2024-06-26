import 'package:uuid/uuid.dart';

const uuid = const Uuid();

class Place {
  Place({
    required this.title,
  }) : id = uuid.v4();
  
  final String id;
  final String title;
}