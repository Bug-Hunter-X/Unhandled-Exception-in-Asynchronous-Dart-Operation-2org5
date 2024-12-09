```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle successful response
      final jsonData = jsonDecode(response.body);
      // Process jsonData
      return jsonData; //return value from function
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('Error decoding JSON: $e');
    // Return a default value or handle the error appropriately
    return null; 
  } on SocketException catch (e) {
    // Handle network errors
    print('Network error: $e');
    return null; //or show error message
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw the exception for higher-level handling
  }
}
```