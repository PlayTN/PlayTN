import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:frontend/models/locker_model.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  String? _openCompartmentId;
  final Color creamColor = const Color(0xFFF5F5DC);
  final Color blueColor = Colors.blue.shade800;

  final List<Locker> _lockers = [
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

  void _showLockerDetails(BuildContext context, Locker locker) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.6,
              builder: (_, controller) {
                return Container(
                  decoration: BoxDecoration(
                    color: creamColor,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          controller: controller,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          children: [
                            Text(
                              locker.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                            const SizedBox(height: 24),
                            ...locker.compartments.map((compartment) {
                              final bool isThisCompartmentOpen = _openCompartmentId == compartment.id;
                              final bool canOpen = _openCompartmentId == null;

                              return Card(
                                color: Colors.white,
                                elevation: 0,
                                margin: const EdgeInsets.symmetric(vertical: 8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey.shade200, width: 1),
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.inventory_2_outlined, color: blueColor),
                                  title: Text(compartment.content, style: const TextStyle(fontWeight: FontWeight.w600)),
                                  subtitle: Text('Scompartimento ${compartment.id.toUpperCase()}'),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isThisCompartmentOpen ? Colors.orange.shade700 : blueColor,
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(12),
                                    ),
                                    onPressed: !canOpen && !isThisCompartmentOpen ? null : () {
                                      setModalState(() {
                                        if (isThisCompartmentOpen) {
                                          _openCompartmentId = null;
                                        } else {
                                          _openCompartmentId = compartment.id;
                                        }
                                        setState(() {});
                                      });
                                    },
                                    child: Icon(isThisCompartmentOpen ? Icons.keyboard_return : Icons.arrow_forward, color: Colors.white),
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamColor,
      appBar: AppBar(
        backgroundColor: creamColor,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        title: Text(
          'Mappa',
          style: TextStyle(
            color: blueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(46.0667, 11.1167),
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager_labels_under/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
              ),
              MarkerLayer(
                markers: _lockers.map((locker) {
                  return Marker(
                    width: 40.0,
                    height: 40.0,
                    point: locker.location,
                    child: GestureDetector(
                      onTap: () => _showLockerDetails(context, locker),
                      child: Container(
                        decoration: BoxDecoration(
                            color: blueColor,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 3, blurRadius: 5)]),
                        child: const Icon(Icons.sports_soccer, color: Colors.white, size: 22.0),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
