import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';

void main() {
  var handler = webSocketHandler((webSocket) {
    webSocket.stream.listen((message) {
      webSocket.sink.add('true');
    });
  });

  shelf_io.serve(handler, '0.0.0.0', 8080).then((server) {
    print('Serving at ws://${server.address.host}:${server.port}');
  });
}
