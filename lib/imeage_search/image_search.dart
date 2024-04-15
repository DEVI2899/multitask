import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class ImageSearchPage extends StatefulWidget {
  const ImageSearchPage({super.key});

  @override
  _ImageSearchPageState createState() => _ImageSearchPageState();
}

class _ImageSearchPageState extends State<ImageSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _images = [];
  bool _loading = false;

  void _fetchImages(String query) async {
    setState(() {
      _loading = true;
    });
    const String apiKey = 'v0bqsHHbU6cCK3BrsEEPchJT9nsSPA5oRQ64cecusfOYe2XnzzXReMOF'; // Replace with your Pixabay API key
    const String baseUrl = 'https://api.pexels.com/v1/';
    final url = Uri.parse('$baseUrl?key=$apiKey&q=${Uri.encodeFull(query)}&image_type=photo&per_page=50');
    final response = await http.get(url) ;

    if (response.statusCode == 200) {
      setState(() {
        _images = json.decode(response.body)['hits'];
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search images',
            ),
            onSubmitted: (value) {
              _fetchImages(value);
            },
          ),
        ),
        body: _loading ? const Center(
          child: CircularProgressIndicator(),
        )
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: _images[index]['webformatURL'],
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}