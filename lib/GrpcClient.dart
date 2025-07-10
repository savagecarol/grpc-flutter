import 'package:grpc/grpc.dart';
import 'package:grpcapp/generated/protos/order.pbgrpc.dart';

class GrpcClient {
  late final ClientChannel channel;
  late final OrderServiceClient stub;

  GrpcClient() {
    channel = ClientChannel(
      '10.0.2.2', // Replace with your server's address --> emulator
      port: 9090, // Replace with your server's port
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    stub = OrderServiceClient(channel);
  }

  // CRUD Operations
  Future<Order> getOrder(String id) async {
    final request = GetOrderRequest()..id = id;
    return await stub.getOrders(request);
  }

  Future<Order> createOrder(String name, String brand, String price) async {
    final request = CreateOrderRequest()
      ..name = name
      ..brand = brand
      ..price = price;
    return await stub.createOrders(request);
  }

  Future<Orders> getAllOrders() async {
    final request = Empty();
    return await stub.getAllOrders(request);
  }

  // Streaming Operations
  Stream<Order> serverSideStreaming() {
    final request = Empty();
    return stub.serverSideStreaming(request);
  }

  Future<Empty> clientSideStreaming(Stream<Order> requestStream) async {
    return await stub.clientSideStreaming(requestStream);
  }

  Stream<Order> biDirectionalStreaming(Stream<CreateOrderRequest> requestStream) {
    return stub.biDirectionalStreaming(requestStream);
  }

  void close() {
    channel.shutdown();
  }
}