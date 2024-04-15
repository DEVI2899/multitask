
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../utils/api.dart';

class SearchApi {
  static onImageSearch(String query,
      {int pageIndex = 1, int totalItemsPerPage = 15}) async {
    final url =
        '${API.baseUrl}/${API.searchUrl}?${API.queryParam}=$query&${API.perPageParam}=$totalItemsPerPage&${API.pageParam}=$pageIndex';

    debugPrint(url);

    final response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${dotenv.env[API.pixelsApiKey]}"
    });

    return json.decode(response.body);
  }
}