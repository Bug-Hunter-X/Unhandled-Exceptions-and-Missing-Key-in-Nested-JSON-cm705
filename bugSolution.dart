```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        final nestedData = jsonData['nested']['data'];
        print(nestedData); 
      } on FormatException catch (e) {
        print('Error decoding JSON: $e');
      } on NoSuchMethodError catch (e) {
        print('Key not found in nested JSON: $e');
      } catch (e) {
        print('Unexpected error processing JSON: $e');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.  ${response.body}');
    }
  } on http.ClientException catch (e) {
    print('Network error: $e');
  } on TimeoutException catch (e) {
    print('Timeout error: $e');
  } catch (e) {
    print('Unexpected error: $e');
  }
}
```