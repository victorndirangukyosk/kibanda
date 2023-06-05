// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:location_geocoder/geocoder.dart' as _i25;

import '../delivery/choose_location_page.dart' as _i17;
import '../delivery/continue_with_this_location_page.dart' as _i18;
import '../delivery/delivery_details_page.dart' as _i14;
import '../delivery/save_address_page.dart' as _i19;
import '../delivery/search_city_page.dart' as _i16;
import '../models/order/order.dart' as _i24;
import '../ui/address/my_addresses_page.dart' as _i4;
import '../ui/home/cart/cart_page.dart' as _i8;
import '../ui/home/cart/order_success_page.dart' as _i6;
import '../ui/home/categories/search_page.dart' as _i15;
import '../ui/home/expanded_categories_page.dart' as _i5;
import '../ui/home/main_home_page.dart' as _i3;
import '../ui/home/my_orders/my_orders_page.dart' as _i10;
import '../ui/home/my_orders/single_order_page.dart' as _i11;
import '../ui/home/payments/mpesa_payment_page.dart' as _i9;
import '../ui/home/payments/payment_options_page.dart' as _i7;
import '../ui/home/payments/transaction_mpesa_payment.dart' as _i13;
import '../ui/home/product/products_page.dart' as _i21;
import '../ui/home/transactions_page/transaction_page.dart' as _i12;
import '../ui/login_page.dart' as _i2;
import '../ui/my_customers/my_customers_page.dart' as _i20;
import '../ui/splash_screen.dart' as _i1;

class AppRouter extends _i22.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    MainHomeRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainHomePage(),
      );
    },
    MyAddressesRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MyAddressesPage(),
      );
    },
    ExpandedCategoriesRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ExpandedCategoriesPage(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.OrderSuccessPage(),
      );
    },
    PaymentOPtionsRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentOPtionsRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.PaymentOPtionsPage(
          key: args.key,
          orderData: args.orderData,
        ),
      );
    },
    CartRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.CartPage(),
      );
    },
    MpesaPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<MpesaPaymentRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.MpesaPaymentPage(
          key: args.key,
          orderReference: args.orderReference,
          data: args.data,
        ),
      );
    },
    MyOrdersRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MyOrdersPage(),
      );
    },
    SingleOrderRoute.name: (routeData) {
      final args = routeData.argsAs<SingleOrderRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.SingleOrderPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    TransactionRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.TransactionPage(
          key: args.key,
          transactionData: args.transactionData,
          orderData: args.orderData,
        ),
      );
    },
    TransactionalMpesaRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionalMpesaRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.TransactionalMpesaPage(
          key: args.key,
          orderId: args.orderId,
        ),
      );
    },
    DeliveryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DeliveryDetailsRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.DeliveryDetailsPage(
          key: args.key,
          orderData: args.orderData,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.SearchPage(
          key: args.key,
          searchQuery: args.searchQuery,
        ),
      );
    },
    SearchCityRoute.name: (routeData) {
      final args = routeData.argsAs<SearchCityRouteArgs>(
          orElse: () => const SearchCityRouteArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.SearchCityPage(
          key: args.key,
          searchQuery: args.searchQuery,
        ),
      );
    },
    ChooseLocationRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.ChooseLocationPage(),
      );
    },
    ContinueWithThisLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ContinueWithThisLocationRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.ContinueWithThisLocationPage(
          key: args.key,
          address: args.address,
        ),
      );
    },
    SaveAddressRoute.name: (routeData) {
      final args = routeData.argsAs<SaveAddressRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.SaveAddressPage(
          key: args.key,
          address: args.address,
        ),
      );
    },
    MyCustomersRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.MyCustomersPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.ProductsPage(),
      );
    },
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i22.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i22.RouteConfig(
          MainHomeRoute.name,
          path: '/main-home-page',
        ),
        _i22.RouteConfig(
          MyAddressesRoute.name,
          path: '/my-addresses-page',
        ),
        _i22.RouteConfig(
          ExpandedCategoriesRoute.name,
          path: '/expanded-categories-page',
        ),
        _i22.RouteConfig(
          OrderSuccessRoute.name,
          path: '/order-success-page',
        ),
        _i22.RouteConfig(
          PaymentOPtionsRoute.name,
          path: '/payment-options-page',
        ),
        _i22.RouteConfig(
          CartRoute.name,
          path: '/cart-page',
        ),
        _i22.RouteConfig(
          MyAddressesRoute.name,
          path: '/my-addresses-page',
        ),
        _i22.RouteConfig(
          MpesaPaymentRoute.name,
          path: '/mpesa-payment-page',
        ),
        _i22.RouteConfig(
          MyOrdersRoute.name,
          path: '/my-orders-page',
        ),
        _i22.RouteConfig(
          SingleOrderRoute.name,
          path: '/single-order-page',
        ),
        _i22.RouteConfig(
          TransactionRoute.name,
          path: '/transaction-page',
        ),
        _i22.RouteConfig(
          TransactionalMpesaRoute.name,
          path: '/transactional-mpesa-page',
        ),
        _i22.RouteConfig(
          DeliveryDetailsRoute.name,
          path: '/delivery-details-page',
        ),
        _i22.RouteConfig(
          SearchRoute.name,
          path: '/search-page',
        ),
        _i22.RouteConfig(
          SearchCityRoute.name,
          path: '/search-city-page',
        ),
        _i22.RouteConfig(
          ChooseLocationRoute.name,
          path: '/choose-location-page',
        ),
        _i22.RouteConfig(
          ContinueWithThisLocationRoute.name,
          path: '/continue-with-this-location-page',
        ),
        _i22.RouteConfig(
          SaveAddressRoute.name,
          path: '/save-address-page',
        ),
        _i22.RouteConfig(
          MyCustomersRoute.name,
          path: '/my-customers-page',
        ),
        _i22.RouteConfig(
          ProductsRoute.name,
          path: '/products-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i22.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.MainHomePage]
class MainHomeRoute extends _i22.PageRouteInfo<void> {
  const MainHomeRoute()
      : super(
          MainHomeRoute.name,
          path: '/main-home-page',
        );

  static const String name = 'MainHomeRoute';
}

/// generated route for
/// [_i4.MyAddressesPage]
class MyAddressesRoute extends _i22.PageRouteInfo<void> {
  const MyAddressesRoute()
      : super(
          MyAddressesRoute.name,
          path: '/my-addresses-page',
        );

  static const String name = 'MyAddressesRoute';
}

/// generated route for
/// [_i5.ExpandedCategoriesPage]
class ExpandedCategoriesRoute extends _i22.PageRouteInfo<void> {
  const ExpandedCategoriesRoute()
      : super(
          ExpandedCategoriesRoute.name,
          path: '/expanded-categories-page',
        );

  static const String name = 'ExpandedCategoriesRoute';
}

/// generated route for
/// [_i6.OrderSuccessPage]
class OrderSuccessRoute extends _i22.PageRouteInfo<void> {
  const OrderSuccessRoute()
      : super(
          OrderSuccessRoute.name,
          path: '/order-success-page',
        );

  static const String name = 'OrderSuccessRoute';
}

/// generated route for
/// [_i7.PaymentOPtionsPage]
class PaymentOPtionsRoute extends _i22.PageRouteInfo<PaymentOPtionsRouteArgs> {
  PaymentOPtionsRoute({
    _i23.Key? key,
    required Map<String, dynamic> orderData,
  }) : super(
          PaymentOPtionsRoute.name,
          path: '/payment-options-page',
          args: PaymentOPtionsRouteArgs(
            key: key,
            orderData: orderData,
          ),
        );

  static const String name = 'PaymentOPtionsRoute';
}

class PaymentOPtionsRouteArgs {
  const PaymentOPtionsRouteArgs({
    this.key,
    required this.orderData,
  });

  final _i23.Key? key;

  final Map<String, dynamic> orderData;

  @override
  String toString() {
    return 'PaymentOPtionsRouteArgs{key: $key, orderData: $orderData}';
  }
}

/// generated route for
/// [_i8.CartPage]
class CartRoute extends _i22.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart-page',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i9.MpesaPaymentPage]
class MpesaPaymentRoute extends _i22.PageRouteInfo<MpesaPaymentRouteArgs> {
  MpesaPaymentRoute({
    _i23.Key? key,
    required String orderReference,
    required Map<String, dynamic> data,
  }) : super(
          MpesaPaymentRoute.name,
          path: '/mpesa-payment-page',
          args: MpesaPaymentRouteArgs(
            key: key,
            orderReference: orderReference,
            data: data,
          ),
        );

  static const String name = 'MpesaPaymentRoute';
}

class MpesaPaymentRouteArgs {
  const MpesaPaymentRouteArgs({
    this.key,
    required this.orderReference,
    required this.data,
  });

  final _i23.Key? key;

  final String orderReference;

  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'MpesaPaymentRouteArgs{key: $key, orderReference: $orderReference, data: $data}';
  }
}

/// generated route for
/// [_i10.MyOrdersPage]
class MyOrdersRoute extends _i22.PageRouteInfo<void> {
  const MyOrdersRoute()
      : super(
          MyOrdersRoute.name,
          path: '/my-orders-page',
        );

  static const String name = 'MyOrdersRoute';
}

/// generated route for
/// [_i11.SingleOrderPage]
class SingleOrderRoute extends _i22.PageRouteInfo<SingleOrderRouteArgs> {
  SingleOrderRoute({
    _i23.Key? key,
    required _i24.Order order,
  }) : super(
          SingleOrderRoute.name,
          path: '/single-order-page',
          args: SingleOrderRouteArgs(
            key: key,
            order: order,
          ),
        );

  static const String name = 'SingleOrderRoute';
}

class SingleOrderRouteArgs {
  const SingleOrderRouteArgs({
    this.key,
    required this.order,
  });

  final _i23.Key? key;

  final _i24.Order order;

  @override
  String toString() {
    return 'SingleOrderRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i12.TransactionPage]
class TransactionRoute extends _i22.PageRouteInfo<TransactionRouteArgs> {
  TransactionRoute({
    _i23.Key? key,
    dynamic transactionData,
    required Map<String, dynamic> orderData,
  }) : super(
          TransactionRoute.name,
          path: '/transaction-page',
          args: TransactionRouteArgs(
            key: key,
            transactionData: transactionData,
            orderData: orderData,
          ),
        );

  static const String name = 'TransactionRoute';
}

class TransactionRouteArgs {
  const TransactionRouteArgs({
    this.key,
    this.transactionData,
    required this.orderData,
  });

  final _i23.Key? key;

  final dynamic transactionData;

  final Map<String, dynamic> orderData;

  @override
  String toString() {
    return 'TransactionRouteArgs{key: $key, transactionData: $transactionData, orderData: $orderData}';
  }
}

/// generated route for
/// [_i13.TransactionalMpesaPage]
class TransactionalMpesaRoute
    extends _i22.PageRouteInfo<TransactionalMpesaRouteArgs> {
  TransactionalMpesaRoute({
    _i23.Key? key,
    required int orderId,
  }) : super(
          TransactionalMpesaRoute.name,
          path: '/transactional-mpesa-page',
          args: TransactionalMpesaRouteArgs(
            key: key,
            orderId: orderId,
          ),
        );

  static const String name = 'TransactionalMpesaRoute';
}

class TransactionalMpesaRouteArgs {
  const TransactionalMpesaRouteArgs({
    this.key,
    required this.orderId,
  });

  final _i23.Key? key;

  final int orderId;

  @override
  String toString() {
    return 'TransactionalMpesaRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i14.DeliveryDetailsPage]
class DeliveryDetailsRoute
    extends _i22.PageRouteInfo<DeliveryDetailsRouteArgs> {
  DeliveryDetailsRoute({
    _i23.Key? key,
    required Map<String, dynamic> orderData,
  }) : super(
          DeliveryDetailsRoute.name,
          path: '/delivery-details-page',
          args: DeliveryDetailsRouteArgs(
            key: key,
            orderData: orderData,
          ),
        );

  static const String name = 'DeliveryDetailsRoute';
}

class DeliveryDetailsRouteArgs {
  const DeliveryDetailsRouteArgs({
    this.key,
    required this.orderData,
  });

  final _i23.Key? key;

  final Map<String, dynamic> orderData;

  @override
  String toString() {
    return 'DeliveryDetailsRouteArgs{key: $key, orderData: $orderData}';
  }
}

/// generated route for
/// [_i15.SearchPage]
class SearchRoute extends _i22.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i23.Key? key,
    String? searchQuery,
  }) : super(
          SearchRoute.name,
          path: '/search-page',
          args: SearchRouteArgs(
            key: key,
            searchQuery: searchQuery,
          ),
        );

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.searchQuery,
  });

  final _i23.Key? key;

  final String? searchQuery;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, searchQuery: $searchQuery}';
  }
}

/// generated route for
/// [_i16.SearchCityPage]
class SearchCityRoute extends _i22.PageRouteInfo<SearchCityRouteArgs> {
  SearchCityRoute({
    _i23.Key? key,
    String? searchQuery,
  }) : super(
          SearchCityRoute.name,
          path: '/search-city-page',
          args: SearchCityRouteArgs(
            key: key,
            searchQuery: searchQuery,
          ),
        );

  static const String name = 'SearchCityRoute';
}

class SearchCityRouteArgs {
  const SearchCityRouteArgs({
    this.key,
    this.searchQuery,
  });

  final _i23.Key? key;

  final String? searchQuery;

  @override
  String toString() {
    return 'SearchCityRouteArgs{key: $key, searchQuery: $searchQuery}';
  }
}

/// generated route for
/// [_i17.ChooseLocationPage]
class ChooseLocationRoute extends _i22.PageRouteInfo<void> {
  const ChooseLocationRoute()
      : super(
          ChooseLocationRoute.name,
          path: '/choose-location-page',
        );

  static const String name = 'ChooseLocationRoute';
}

/// generated route for
/// [_i18.ContinueWithThisLocationPage]
class ContinueWithThisLocationRoute
    extends _i22.PageRouteInfo<ContinueWithThisLocationRouteArgs> {
  ContinueWithThisLocationRoute({
    _i23.Key? key,
    required _i25.Address address,
  }) : super(
          ContinueWithThisLocationRoute.name,
          path: '/continue-with-this-location-page',
          args: ContinueWithThisLocationRouteArgs(
            key: key,
            address: address,
          ),
        );

  static const String name = 'ContinueWithThisLocationRoute';
}

class ContinueWithThisLocationRouteArgs {
  const ContinueWithThisLocationRouteArgs({
    this.key,
    required this.address,
  });

  final _i23.Key? key;

  final _i25.Address address;

  @override
  String toString() {
    return 'ContinueWithThisLocationRouteArgs{key: $key, address: $address}';
  }
}

/// generated route for
/// [_i19.SaveAddressPage]
class SaveAddressRoute extends _i22.PageRouteInfo<SaveAddressRouteArgs> {
  SaveAddressRoute({
    _i23.Key? key,
    required _i25.Address address,
  }) : super(
          SaveAddressRoute.name,
          path: '/save-address-page',
          args: SaveAddressRouteArgs(
            key: key,
            address: address,
          ),
        );

  static const String name = 'SaveAddressRoute';
}

class SaveAddressRouteArgs {
  const SaveAddressRouteArgs({
    this.key,
    required this.address,
  });

  final _i23.Key? key;

  final _i25.Address address;

  @override
  String toString() {
    return 'SaveAddressRouteArgs{key: $key, address: $address}';
  }
}

/// generated route for
/// [_i20.MyCustomersPage]
class MyCustomersRoute extends _i22.PageRouteInfo<void> {
  const MyCustomersRoute()
      : super(
          MyCustomersRoute.name,
          path: '/my-customers-page',
        );

  static const String name = 'MyCustomersRoute';
}

/// generated route for
/// [_i21.ProductsPage]
class ProductsRoute extends _i22.PageRouteInfo<void> {
  const ProductsRoute()
      : super(
          ProductsRoute.name,
          path: '/products-page',
        );

  static const String name = 'ProductsRoute';
}
