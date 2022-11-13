import 'dart:io';

class ProxyHelper extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }

  @override
  String findProxyFromEnvironment(url, environment) {
    return 'PROXY IP:PORT;';
  }
}
