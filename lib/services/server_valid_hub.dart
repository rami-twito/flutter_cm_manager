import 'package:signalr_netcore/hub_connection_builder.dart';

const devUrl = "http://localhost:5000/DevHub";
typedef HubCallback = void Function(dynamic);

startListeningHub(HubCallback event) {
  final hubConnection =
      HubConnectionBuilder().withUrl(devUrl).withAutomaticReconnect().build();
  hubConnection.start()!.then((value) {
    print('DEV Hub start...');
  }, onError: (error) {
    print('error occur $error');
  }).catchError((error) {
    print('error occur $error');
  });

  hubConnection.on("ServerValidation", (data) {
    event(data);
  });
}
