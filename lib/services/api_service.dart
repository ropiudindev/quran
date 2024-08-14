import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/surat.dart';
import '../models/detail_surat.dart';

class ApiService {
  final String baseUrl = 'https://equran.id/api/v2';

  Future<List<Surat>> fetchSuratList() async {
    final response = await http.get(Uri.parse('$baseUrl/surat'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Surat.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load surat list');
    }
  }

  Future<DetailSurat> fetchSuratDetail(int nomor) async {
    final response = await http.get(Uri.parse('$baseUrl/surat/$nomor'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      return DetailSurat.fromJson(data);
    } else {
      throw Exception('Failed to load surat detail');
    }
  }
}
