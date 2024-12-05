import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class ApiService {
  static const String baseUrl = 'https://tiptop.firetensor.com/api';

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<Map<String, dynamic>> getDetailedSalesReport(
      DateTime startDate, DateTime endDate) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/reporteVentaDetallada?fechaInicio=${DateFormat('yyyy-MM-dd').format(startDate)}&fechaFin=${DateFormat('yyyy-MM-dd').format(endDate)}'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load detailed sales report');
    }
  }

  static Future<Map<String, dynamic>> getStockReport() async {
    final response = await http.get(Uri.parse('$baseUrl/reporteStock'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load stock report');
    }
  }
}
