
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Futuro che conterrà i dati dei parchi dal "database"
  late Future<List<Map<String, dynamic>>> _parksFuture;

  @override
  void initState() {
    super.initState();
    _parksFuture = _fetchParksFromDatabase();
  }

  // --- SIMULAZIONE E TEMPLATE PER LA CHIAMATA AL DATABASE ---
  Future<List<Map<String, dynamic>>> _fetchParksFromDatabase() async {
    // ** ESEMPIO CON UN DATABASE SQL (es. usando il pacchetto 'sqflite') **
    // Quando avrai un database, decommenta e adatta questo blocco.
    /*
    // 1. Ottieni una connessione al tuo database.
    //    La gestione della connessione dipenderà da come hai configurato il DB.
    final db = await YourDatabaseHelper.instance.database;

    // 2. Definisci ed esegui la query per selezionare tutti i parchi.
    //    Si assume che la tabella si chiami 'parks' e abbia le colonne 'name', 'lat', 'lng'.
    final String sqlQuery = 'SELECT name, lat, lng FROM parks;';
    final List<Map<String, dynamic>> parksFromDb = await db.rawQuery(sqlQuery);

    // 3. Restituisci i risultati del database.
    return parksFromDb;
    */

    // --- CODICE DI SIMULAZIONE ATTUALE (da rimuovere in produzione) ---
    debugPrint("ATTENZIONE: Sto usando dati di simulazione. Sostituire _fetchParksFromDatabase con la logica del database reale.");
    await Future.delayed(const Duration(milliseconds: 1500));
    return [
      {"name": "Parco di Gocciadoro", "lat": 46.056508, "lng": 11.137302},
      {"name": "Parco delle Albere", "lat": 46.063189, "lng": 11.113669},
      {"name": "Giardino di Piazza Dante", "lat": 46.071110, "lng": 11.120423},
      {"name": "Doss Trento", "lat": 46.073236, "lng": 11.111506},
      {"name": "Bosco della Città", "lat": 46.04693, "lng": 11.13529},
      {"name": "Giardino del Castello del Buonconsiglio", "lat": 46.071583, "lng": 11.127167},
      {"name": "Giardino Giuseppe Dalla Fior", "lat": 46.0827, "lng": 11.1194},
      {"name": "Parco di Melta", "lat": 46.097757, "lng": 11.116460},
      {"name": "Giardino dei Poeti", "lat": 46.06899, "lng": 11.12275},
      {"name": "Giardino della Circoscrizione Argentario", "lat": 46.0716, "lng": 11.1444},
      {"name": "Parco dei Moreri", "lat": 46.0734, "lng": 11.1485},
      {"name": "Parco Langer", "lat": 46.055490, "lng": 11.126242},
      {"name": "Giardino Marzola", "lat": 46.0673, "lng": 11.1578},
      {"name": "Parco di Piedicastello", "lat": 46.0694, "lng": 11.1126},
      {"name": "Giardino Sprè", "lat": 46.0732, "lng": 11.1519},
      {"name": "Passeggiata salita Giardini", "lat": 46.067841, "lng": 11.131156},
      {"name": "Area verde \"Ex-Michelin\"", "lat": 46.063189, "lng": 11.113669},
      {"name": "Parco Fluviale dell'Adige", "lat": 46.0714, "lng": 11.1167}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parchi di Trento'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _parksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Errore nel caricamento dei parchi: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nessun parco trovato.'));
          }

          final parksData = snapshot.data!;
          final markers = parksData.map((park) {
            return Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(park["lat"], park["lng"]),
              child: Tooltip(
                message: park["name"],
                child: const Icon(
                  Icons.park,
                  color: Colors.green,
                  size: 40.0,
                ),
              ),
            );
          }).toList();

          return FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(46.0667, 11.1167),
              initialZoom: 13.0,
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(46.15, 11.00),
                  const LatLng(45.98, 11.25),
                ),
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(markers: markers),
            ],
          );
        },
      ),
    );
  }
}
