import 'dart:convert';
import 'package:fluffychat/config/app_config.dart';
import 'package:http/http.dart' as http;
import '../models/metal_member.dart';

class MetalApi {
  final String baseUrl = AppConfig.metalApiUrl;
  final String authToken = AppConfig.metalApiToken;

  Future<MetalMemebr> fetchMetalMemberProfile(String usernameOrEmail) async {
    final url = '$baseUrl/matrix/profile/$usernameOrEmail';

    final headers = {
      'Authorization': 'Bearer $authToken',
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return MetalMemebr.fromJson(data);
    } else {
      throw Exception('Failed to fetch metal member profile');
    }

  }
}