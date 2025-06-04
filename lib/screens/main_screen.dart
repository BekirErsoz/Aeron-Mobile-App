import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  // Konum bilgisi alım fonksiyonu örnek (henüz detayları yok):
  void _getLocation() {
    print("Konum alınıyor...");
    // TODO: Geolocator vb. paketlerle gerçek konum alma işlemini uygulayabilirsiniz.
  }

  // Sağlık bilgisi gönderim fonksiyonu örnek:
  void _sendMedicalInfo() {
    print("Sağlık bilgisi gönderiliyor...");
    // TODO: Gerçek veri göndermek için HTTP istekleri vb. eklemelisiniz.
  }

  // Ses kaydı başlatma/gönderme fonksiyonu örnek:
  void _recordAudio() {
    print("Ses kaydı gönderiliyor...");
    // TODO: Mikrofon erişimi ve sunucuya dosya gönderimi aşamalarını ekleyin.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aeronormal Afet Veri Toplama'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LOGO
            Center(
              child: Image.asset(
                'images/logo.png', // Logo dosyanızın tam yolu
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 20),

            // Kullanıcı Konum Bilgisi
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.redAccent),
                title: const Text('Konumunuz:'),
                subtitle: const Text('Afet Anında Alınacaktır'),
                trailing: ElevatedButton(
                  onPressed: _getLocation,
                  child: const Text('Konumu Al'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sağlık Bilgisi Gönderme
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.medical_services, color: Colors.blueAccent),
                title: const Text('Sağlık Bilginiz'),
                subtitle: const Text('Afet Anında Alınacaktır'),
                trailing: ElevatedButton(
                  onPressed: _sendMedicalInfo,
                  child: const Text('Gönder'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Ses Kaydı Gönderimi
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.mic, color: Colors.green),
                title: const Text('Ses Kaydı Gönder'),
                subtitle: const Text('Afet Anında Alınacaktır'),
                trailing: ElevatedButton(
                  onPressed: _recordAudio,
                  child: const Text('Kaydet'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Acil Mesajlar
            SizedBox(
              height: 200, // Listeyi sabit bir yüksekliğe sığdırmak için
              child: Card(
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Acil Mesajlar:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 3, // Örnek mesaj sayısı
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.warning, color: Colors.orange),
                            title: Text('Acil Mesaj $index'),
                            subtitle: const Text('Detaylı mesaj bilgisi...'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
