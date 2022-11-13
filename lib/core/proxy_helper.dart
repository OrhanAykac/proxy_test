import 'dart:io';

class ProxyHelper extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY IP:PORT;";
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
