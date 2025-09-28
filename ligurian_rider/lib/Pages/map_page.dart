import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xml/xml.dart' as xml;

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(44.409348, 8.951529), // Center the map over Genoa
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          // Bring your own tiles
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          // For demonstration only
          userAgentPackageName: 'com.map_test.app', // Add your app identifier
          // And many more recommended properties!
        ),
        MouseRegion(
          hitTestBehavior: HitTestBehavior.translucent,
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                // launchUrl(Uri.parse('https://www.youtube.com/@catrek'));
              },
              child: FutureBuilder(
                future: readCoordinatesFromGpx(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<LatLng>> snapshot) {
                  return snapshot.hasData
                      ? PolylineLayer(
                          polylines: [
                            Polyline(
                                points: snapshot.data!,
                                color: Colors.green,
                                strokeWidth: 10,
                                useStrokeWidthInMeter: true)
                          ],
                        )
                      : const CircularProgressIndicator();
                },
              )),
        ),
        RichAttributionWidget(
          // Include a stylish prebuilt attribution widget that meets all requirments
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(Uri.parse(
                  'https://openstreetmap.org/copyright')),
                  textStyle: TextStyle(), // (external)
            ),
            // Also add images...
          ],
          showFlutterMapAttribution: false,
        ),
      ],
    );
  }
}


Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path\\test.gpx');
}

Future<List<LatLng>> readCoordinatesFromGpx() async {
  try {
    final file = await _localFile;
    List<LatLng> coordinates = [];
    // Read the file
    final contents = await file.readAsString();

    final document = xml.XmlDocument.parse(contents);
    final gpx = document.findElements('gpx').first;
    final trk = gpx.findElements('trk').first;
    final trkseg = trk.findElements('trkseg').first;
    trkseg.findElements('trkpt').forEach((element) {
      coordinates.add(LatLng(double.parse(element.attributes.first.value),
          double.parse(element.attributes.last.value)));
    });
    return coordinates;
  } catch (e) {
    // If encountering an error, return 0
    return List.empty();
  }
}