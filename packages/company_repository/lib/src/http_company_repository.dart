import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:company_repository/company_repository.dart';

import 'models/models.dart';

class HTTPCompanyRepository extends CompanyRepository {
  @override
  Future<List<Company>> getCompanies() async {
    const String url =
        "https://test-backend-primeits-portal.onrender.com/api/company";

    try {
      // Sending the GET request
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json", // Optional: Specify JSON format
        },
      );

      // Handling the response
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // Parse the JSON response
        log("Fetched companies: $data");

        List<dynamic> companies = data['data'];

        return companies.map((e) => Company.fromJson(e)).toList();
      } else {
        log("Failed to fetch companies. Status code: ${response.statusCode}");
        log("Response body: ${response.body}");
      }

      return [];
    } catch (e) {
      log("An error occurred: $e");
      rethrow;
    }
  }
}
