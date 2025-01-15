```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Accessing nested JSON
      final nestedData = jsonData['nested']['data'];
      print(nestedData); 
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // In this scenario the error handling is not specific enough.
    // If the error was a timeout or network issue then it should be handled differently
    // than if there was an error processing the JSON response.
  }
}
```