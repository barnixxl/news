import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final url = 'https://store.asb.by:9000/upload/iblock/a58/tz1ce2ta97uzi5c9sc98hy3vhgcqke77/news.jpg';
  print('Testing: $url');
  
  final client = HttpClient();
  try {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();
    print('Status: ${response.statusCode}');
    print('Headers:');
    response.headers.forEach((name, values) {
      print('  $name: ${values.join(', ')}');
    });
    final bytes = await response.first;
    print('Body length: ${bytes.length}');
  } catch (e) {
    print('ERROR: $e');
    print('Type: ${e.runtimeType}');
    if (e is HandshakeException) {
      print('HandshakeException details:');
      print('  message: ${e.message}');
      if (e.osError != null) {
        print('  osError: ${e.osError}');
      }
    }
  } finally {
    client.close();
  }
  
  // Also test with badCertificateCallback
  print('\n--- With badCertificateCallback ---');
  final client2 = HttpClient()
    ..badCertificateCallback = (cert, host, port) {
      print('Cert subject: ${cert.subject}');
      print('Cert issuer: ${cert.issuer}');
      print('Host: $host, Port: $port');
      return true;
    };
  try {
    final request = await client2.getUrl(Uri.parse(url));
    final response = await request.close();
    print('Status: ${response.statusCode}');
    final bytes = await response.first;
    print('Body length: ${bytes.length}');
  } catch (e) {
    print('ERROR: $e');
  } finally {
    client2.close();
  }
}
