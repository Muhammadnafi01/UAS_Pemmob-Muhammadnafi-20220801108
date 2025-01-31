import 'package:flutter/material.dart';
import 'package:uaspemmob/services/api_service.dart';

class PhotoListScreen extends StatefulWidget {
  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late Future<List<dynamic>> photos;

  @override
  void initState() {
    super.initState();
    photos = ApiService().fetchPhotos(); // Memanggil API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery Photos')),
      body: FutureBuilder<List<dynamic>>(
        future: photos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No photos available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var photo = snapshot.data![index];
                return ListTile(
                  title: Text(photo['title']),
                  leading: Image.network(photo['url']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
