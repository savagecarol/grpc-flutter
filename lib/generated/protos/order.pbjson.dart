// This is a generated file - do not edit.
//
// Generated from protos/order.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use createOrderRequestDescriptor instead')
const CreateOrderRequest$json = {
  '1': 'CreateOrderRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'brand', '3': 2, '4': 1, '5': 9, '10': 'brand'},
    {'1': 'price', '3': 3, '4': 1, '5': 9, '10': 'price'},
  ],
};

/// Descriptor for `CreateOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrderRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVPcmRlclJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVicmFuZBgCIAEoCV'
    'IFYnJhbmQSFAoFcHJpY2UYAyABKAlSBXByaWNl');

@$core.Deprecated('Use getOrderRequestDescriptor instead')
const GetOrderRequest$json = {
  '1': 'GetOrderRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRPcmRlclJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use ordersDescriptor instead')
const Orders$json = {
  '1': 'Orders',
  '2': [
    {'1': 'orders', '3': 1, '4': 3, '5': 11, '6': '.Order', '10': 'orders'},
  ],
};

/// Descriptor for `Orders`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ordersDescriptor = $convert.base64Decode(
    'CgZPcmRlcnMSHgoGb3JkZXJzGAEgAygLMgYuT3JkZXJSBm9yZGVycw==');

@$core.Deprecated('Use orderDescriptor instead')
const Order$json = {
  '1': 'Order',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'brand', '3': 3, '4': 1, '5': 9, '10': 'brand'},
    {'1': 'price', '3': 4, '4': 1, '5': 9, '10': 'price'},
  ],
};

/// Descriptor for `Order`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderDescriptor = $convert.base64Decode(
    'CgVPcmRlchIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVicmFuZBgDIA'
    'EoCVIFYnJhbmQSFAoFcHJpY2UYBCABKAlSBXByaWNl');

