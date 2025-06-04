import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendLocationToDatabase(double latitude, double longitude) async {
    try {
      await _firestore.collection('locations').add({
        'latitude': latitude,
        'longitude': longitude,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Konum başarıyla gönderildi.");
    } catch (e) {
      print("Konum gönderilirken hata oluştu: $e");
    }
  }
}
