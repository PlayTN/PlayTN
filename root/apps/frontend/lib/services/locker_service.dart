import 'package:frontend/models/locker_model.dart';
import 'package:latlong2/latlong.dart';

class LockerService {
  /// Fetches the list of all lockers from the data source.
  ///
  /// This method simulates a network/database call.
  /// In a real application, this would make an HTTP request to your backend API.
  Future<List<Locker>> getLockers() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 2));

    // This is where you would typically parse a JSON response from your API.
    // For now, we return hardcoded data.
    final List<Locker> mockLockers = [
      Locker(
          id: 'piazza-duomo',
          name: 'Locker Piazza Duomo',
          location: const LatLng(46.0709, 11.1213),
          compartments: [
            Compartment(id: 'a1', content: 'Pallone da Basket'),
            Compartment(id: 'a2', content: 'Set Frisbee'),
          ]),
      Locker(
          id: 'muse',
          name: 'Locker MUSE',
          location: const LatLng(46.0652, 11.1297),
          compartments: [
            Compartment(id: 'b1', content: 'Libri di Poesia'),
          ]),
      Locker(
          id: 'stazione-fs',
          name: 'Locker Stazione FS',
          location: const LatLng(46.0721, 11.1185),
          compartments: [
            Compartment(id: 'c1', content: 'Set da Scacchi'),
            Compartment(id: 'c2', content: 'Racchette da Ping-Pong'),
            Compartment(id: 'c3', content: 'Bocce'),
          ]),
    ];

    // To simulate an error, you could uncomment the following line:
    // throw Exception('Failed to load lockers');

    return mockLockers;
  }
}
