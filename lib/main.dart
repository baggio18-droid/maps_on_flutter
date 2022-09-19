import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
//     for (final office in googleOffices.offices) {
//        final marker = Marker(
//          markerId: MarkerId(office.name),
//          position: LatLng(office.lat, office.lng),
//          infoWindow: InfoWindow(
//            title: office.name,
//            snippet: office.address,
//          ),
//        );
//        _markers[office.name] = marker;
//      }
//    });
//  }
for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: const MarkerId("malang"),
          position: const LatLng(-7.9413650, 112.6096625),
          infoWindow: const InfoWindow(
            title: "Malang",
            snippet: "JL.MT Haryono",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueViolet,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Office Locations'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}