// This is a generated file - do not edit.
//
// Generated from protos/order.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'order.pb.dart' as $0;

export 'order.pb.dart';

class OrderServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  OrderServiceClient(super.channel, {super.options, super.interceptors});

  /// crud operations
  $grpc.ResponseFuture<$0.Order> getOrders($0.GetOrderRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getOrders, request, options: options);
  }

  $grpc.ResponseFuture<$0.Order> createOrders($0.CreateOrderRequest request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$createOrders, request, options: options);
  }

  $grpc.ResponseFuture<$0.Orders> getAllOrders($0.Empty request, {$grpc.CallOptions? options,}) {
    return $createUnaryCall(_$getAllOrders, request, options: options);
  }

  /// streaming
  $grpc.ResponseStream<$0.Order> serverSideStreaming($0.Empty request, {$grpc.CallOptions? options,}) {
    return $createStreamingCall(_$serverSideStreaming, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.Empty> clientSideStreaming($async.Stream<$0.Order> request, {$grpc.CallOptions? options,}) {
    return $createStreamingCall(_$clientSideStreaming, request, options: options).single;
  }

  $grpc.ResponseStream<$0.Order> biDirectionalStreaming($async.Stream<$0.CreateOrderRequest> request, {$grpc.CallOptions? options,}) {
    return $createStreamingCall(_$biDirectionalStreaming, request, options: options);
  }

    // method descriptors

  static final _$getOrders = $grpc.ClientMethod<$0.GetOrderRequest, $0.Order>(
      '/OrderService/getOrders',
      ($0.GetOrderRequest value) => value.writeToBuffer(),
      $0.Order.fromBuffer);
  static final _$createOrders = $grpc.ClientMethod<$0.CreateOrderRequest, $0.Order>(
      '/OrderService/createOrders',
      ($0.CreateOrderRequest value) => value.writeToBuffer(),
      $0.Order.fromBuffer);
  static final _$getAllOrders = $grpc.ClientMethod<$0.Empty, $0.Orders>(
      '/OrderService/getAllOrders',
      ($0.Empty value) => value.writeToBuffer(),
      $0.Orders.fromBuffer);
  static final _$serverSideStreaming = $grpc.ClientMethod<$0.Empty, $0.Order>(
      '/OrderService/serverSideStreaming',
      ($0.Empty value) => value.writeToBuffer(),
      $0.Order.fromBuffer);
  static final _$clientSideStreaming = $grpc.ClientMethod<$0.Order, $0.Empty>(
      '/OrderService/clientSideStreaming',
      ($0.Order value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
  static final _$biDirectionalStreaming = $grpc.ClientMethod<$0.CreateOrderRequest, $0.Order>(
      '/OrderService/biDirectionalStreaming',
      ($0.CreateOrderRequest value) => value.writeToBuffer(),
      $0.Order.fromBuffer);
}

abstract class OrderServiceBase extends $grpc.Service {
  $core.String get $name => 'OrderService';

  OrderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetOrderRequest, $0.Order>(
        'getOrders',
        getOrders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetOrderRequest.fromBuffer(value),
        ($0.Order value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateOrderRequest, $0.Order>(
        'createOrders',
        createOrders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateOrderRequest.fromBuffer(value),
        ($0.Order value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Orders>(
        'getAllOrders',
        getAllOrders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Orders value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Order>(
        'serverSideStreaming',
        serverSideStreaming_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Order value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Order, $0.Empty>(
        'clientSideStreaming',
        clientSideStreaming,
        true,
        false,
        ($core.List<$core.int> value) => $0.Order.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateOrderRequest, $0.Order>(
        'biDirectionalStreaming',
        biDirectionalStreaming,
        true,
        true,
        ($core.List<$core.int> value) => $0.CreateOrderRequest.fromBuffer(value),
        ($0.Order value) => value.writeToBuffer()));
  }

  $async.Future<$0.Order> getOrders_Pre($grpc.ServiceCall $call, $async.Future<$0.GetOrderRequest> $request) async {
    return getOrders($call, await $request);
  }

  $async.Future<$0.Order> getOrders($grpc.ServiceCall call, $0.GetOrderRequest request);

  $async.Future<$0.Order> createOrders_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateOrderRequest> $request) async {
    return createOrders($call, await $request);
  }

  $async.Future<$0.Order> createOrders($grpc.ServiceCall call, $0.CreateOrderRequest request);

  $async.Future<$0.Orders> getAllOrders_Pre($grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getAllOrders($call, await $request);
  }

  $async.Future<$0.Orders> getAllOrders($grpc.ServiceCall call, $0.Empty request);

  $async.Stream<$0.Order> serverSideStreaming_Pre($grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async* {
    yield* serverSideStreaming($call, await $request);
  }

  $async.Stream<$0.Order> serverSideStreaming($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> clientSideStreaming($grpc.ServiceCall call, $async.Stream<$0.Order> request);

  $async.Stream<$0.Order> biDirectionalStreaming($grpc.ServiceCall call, $async.Stream<$0.CreateOrderRequest> request);

}
