import 'dart:convert';
import 'package:http/http.dart' as http;  // Pastikan mengimpor http

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';  // Ganti dengan URL API Anda

  // Fungsi untuk mengambil data foto
  Future<List<Map<String, dynamic>>> fetchPhotos() async {
    final response = await http.get(Uri.parse('$baseUrl/photos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }

  // Fungsi untuk mengambil profil perusahaan (tambahkan ini)
  Future<Map<String, dynamic>> fetchCompanyProfile() async {
    final response = await http.get(Uri.parse('$baseUrl/users/1'));  // Ganti dengan endpoint yang sesuai

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load company profile');
    }
  }

  // Fungsi login (contoh)
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Login failed');
    }
  }
}
