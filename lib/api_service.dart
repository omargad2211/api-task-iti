import 'dart:convert';
import 'package:http/http.dart' as http;
import 'album.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/albums';

  static Future<List<Album>> fetchAlbums() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
