import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:frontend/models/locker_model.dart';
import 'package:frontend/services/locker_service.dart';
import 'package:frontend/theme/app_theme.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with AutomaticKeepAliveClientMixin {
  late Future<List<Locker>> _lockersFuture;
  final LockerService _lockerService = LockerService();
  String? _openCompartmentId;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _lockersFuture = _lockerService.getLockers();
  }

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
                  decoration: const BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: AppTheme.borderColor,
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
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textColor),
                            ),
                            const SizedBox(height: 24),
                            ...locker.compartments.map((compartment) {
                              final bool isThisCompartmentOpen = _openCompartmentId == compartment.id;
                              final bool canOpen = _openCompartmentId == null;

                              return Card(
                                child: ListTile(
                                  leading: const Icon(Icons.inventory_2_outlined, color: AppTheme.primaryColor),
                                  title: Text(compartment.content, style: const TextStyle(fontWeight: FontWeight.w600)),
                                  subtitle: Text('Scompartimento ${compartment.id.toUpperCase()}'),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isThisCompartmentOpen ? AppTheme.accentColor : AppTheme.primaryColor,
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
    super.build(context);

    final LatLngBounds trentoBounds = LatLngBounds(
      const LatLng(46.04, 11.10),
      const LatLng(46.09, 11.15),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Mappa')),
      body: FutureBuilder<List<Locker>>(
        future: _lockersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Errore: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nessun locker trovato.'));
          }

          final lockers = snapshot.data!;

          return FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(46.0678, 11.1211),
              initialZoom: 15.5,
              cameraConstraint: CameraConstraint.contain(bounds: trentoBounds),
              maxZoom: 18.0,
              minZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                retinaMode: true,
              ),
              MarkerLayer(
                markers: lockers.map((locker) {
                  return Marker(
                    width: 40.0,
                    height: 40.0,
                    point: locker.location,
                    child: GestureDetector(
                      onTap: () => _showLockerDetails(context, locker),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 3, blurRadius: 5)]),
                        child: const Icon(Icons.sports_soccer, color: Colors.white, size: 22.0),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
