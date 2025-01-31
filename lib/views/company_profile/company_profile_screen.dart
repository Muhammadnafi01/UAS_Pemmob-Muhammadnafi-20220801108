import 'package:flutter/material.dart';
import 'package:uaspemmob/services/api_service.dart';  // Impor API Service

class CompanyProfileScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Company Profile')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.fetchCompanyProfile(),  // Ganti sesuai dengan API Anda
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            // Menampilkan data perusahaan
            return Center(child: Text('Company Name: ${snapshot.data!['name']}'));
          }
        },
      ),
    );
  }
}
