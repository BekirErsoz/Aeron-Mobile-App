import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  Future<LocationData?> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Konum servisi açık mı kontrol et
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return null; // Servis açılmadıysa null döndür
      }
    }

    // Konum izni kontrol et
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null; // İzin verilmezse null döndür
      }
    }

    // Konum bilgisi al
    return await _location.getLocation();
  }
}
