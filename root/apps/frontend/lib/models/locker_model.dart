import 'package:latlong2/latlong.dart';

class Locker {
  final String id;
  final String name;
  final LatLng location;
  final List<Compartment> compartments;

  Locker({
    required this.id,
    required this.name,
    required this.location,
    required this.compartments,
  });
}

class Compartment {
  final String id;
  final String content;
  bool isOpen;

  Compartment({
    required this.id,
    required this.content,
    this.isOpen = false,
  });
}
