import 'package:flutter/material.dart';
import 'package:grpcapp/generated/protos/order.pb.dart' as pb;
import 'GrpcClient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('gRPC CRUD and Streaming'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: GrpcActionsWidget(),
      ),
    );
  }
}

class GrpcActionsWidget extends StatefulWidget {
  @override
  _GrpcActionsWidgetState createState() => _GrpcActionsWidgetState();
}

class _GrpcActionsWidgetState extends State<GrpcActionsWidget> {
  final GrpcClient _grpcClient = GrpcClient();
  final List<pb.Order> _orders = [];
  String _statusMessage = '';

  @override
  void dispose() {
    _grpcClient.close();
    super.dispose();
  }

  void _showTemporaryMessage(String message, {bool clearOrders = false}) {
    setState(() {
      _statusMessage = message;
    });
    Future.delayed(Duration(seconds: 10), () { // Changed delay to 10 seconds
      setState(() {
        _statusMessage = '';
        if (clearOrders) {
          _orders.clear();
        }
      });
    });
  }

  void _createOrder() async {
    try {
      final order = await _grpcClient.createOrder(
        'New Order',
        'Brand A',
        '100.0',
      );
      _showTemporaryMessage(
          'Order Created: ${order.name}, Brand: ${order.brand}, Price: ${order.price}');
    } catch (e) {
      _showTemporaryMessage('Error creating order: $e');
    }
  }

  void _getOrder() async {
    try {
      final order = await _grpcClient.getOrder('1'); // Replace with a valid ID
      _showTemporaryMessage(
          'Order Fetched: ${order.name}, Brand: ${order.brand}, Price: ${order.price}');
    } catch (e) {
      _showTemporaryMessage('Error fetching order: $e');
    }
  }

  void _getAllOrders() async {
    try {
      final orders = await _grpcClient.getAllOrders();
      setState(() {
        _orders.clear();
        _orders.addAll(orders.orders);
      });
      _showTemporaryMessage('Fetched ${orders.orders.length} orders', clearOrders: true);
    } catch (e) {
      _showTemporaryMessage('Error fetching all orders: $e');
    }
  }

  void _serverSideStreaming() {
    _grpcClient.serverSideStreaming().listen((order) {
      setState(() {
        _orders.add(order);
      });
      _showTemporaryMessage(
          'Streamed Order: ${order.name}, Brand: ${order.brand}, Price: ${order.price}');
    }, onError: (error) {
      _showTemporaryMessage('Error in server-side stream: $error');
    }, onDone: () {
      _showTemporaryMessage('Server-side stream completed', clearOrders: true);
    });
  }

  void _clientSideStreaming() async {
    final requestStream = Stream<pb.Order>.fromIterable([
      pb.Order()
        ..name = 'Client Stream Order 1'
        ..brand = 'Brand A'
        ..price = '30.0',
      pb.Order()
        ..name = 'Client Stream Order 2'
        ..brand = 'Brand B'
        ..price = '40.0',
    ]);

    try {
      final response = await _grpcClient.clientSideStreaming(requestStream);
      _showTemporaryMessage('Client Stream Result: ${response}', clearOrders: true);
    } catch (e) {
      _showTemporaryMessage('Error in client-side stream: $e');
    }
  }

  void _biDirectionalStreaming() {
    final requestStream = Stream<pb.CreateOrderRequest>.fromIterable([
      pb.CreateOrderRequest()
        ..name = 'Bi-Directional Stream Order 1'
        ..brand = 'Brand A'
        ..price = '60.0',
      pb.CreateOrderRequest()
        ..name = 'Bi-Directional Stream Order 2'
        ..brand = 'Brand B'
        ..price = '70.0',
    ]);

    _grpcClient.biDirectionalStreaming(requestStream).listen((order) {
      setState(() {
        _orders.add(order);
      });
      _showTemporaryMessage(
          'Bi-Directional Stream Result: ${order.name}, Brand: ${order.brand}, Price: ${order.price}');
    }, onError: (error) {
      _showTemporaryMessage('Error in bi-directional stream: $error');
    }, onDone: () {
      _showTemporaryMessage('Bi-Directional stream completed', clearOrders: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _statusMessage,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _createOrder,
              child: Text('Create Order'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            ElevatedButton(
              onPressed: _getOrder,
              child: Text('Get Order'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            ElevatedButton(
              onPressed: _getAllOrders,
              child: Text('Get All Orders'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
            ElevatedButton(
              onPressed: _serverSideStreaming,
              child: Text('Server-Side Streaming'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            ),
            ElevatedButton(
              onPressed: _clientSideStreaming,
              child: Text('Client-Side Streaming'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            ElevatedButton(
              onPressed: _biDirectionalStreaming,
              child: Text('Bi-Directional Streaming'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _orders.length,
            itemBuilder: (context, index) {
              final order = _orders[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                elevation: 3,
                child: ListTile(
                  title: Text(order.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Brand: ${order.brand}, Price: \$${order.price}'),
                  trailing: Icon(Icons.shopping_cart, color: Colors.blueAccent),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}