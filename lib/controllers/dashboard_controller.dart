import 'package:uaspemmob/services/api_service.dart';  // Pastikan ApiService telah diimpor

class DashboardController {
  // Fungsi untuk mengambil data foto
  Future<List<dynamic>> fetchPhotos() async {
    try {
      // Memanggil fungsi dari ApiService untuk mendapatkan foto
      var response = await ApiService().fetchPhotos();
      if (response != null) {
        return response;  // Kembalikan data foto
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Error fetching photos: $e');
    }
  }

  // Fungsi untuk mengarahkan ke halaman lain, misalnya ke halaman detail foto
  void navigateToPhotoDetailPage(context, photoId) {
    Navigator.pushNamed(context, '/photoDetail', arguments: photoId);
  }
}
