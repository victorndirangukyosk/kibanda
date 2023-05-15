import 'package:auto_route/auto_route.dart';
import 'package:kibanda_kb/delivery/choose_location_page.dart';
import 'package:kibanda_kb/delivery/delivery_details_page.dart';
import 'package:kibanda_kb/delivery/search_city_page.dart';
import 'package:kibanda_kb/ui/address/my_addresses_page.dart';
import 'package:kibanda_kb/ui/home/cart/cart_page.dart';
import 'package:kibanda_kb/ui/home/cart/order_success_page.dart';
import 'package:kibanda_kb/ui/home/categories/search_page.dart';
import 'package:kibanda_kb/ui/home/expanded_categories_page.dart';
import 'package:kibanda_kb/ui/home/main_home_page.dart';
import 'package:kibanda_kb/ui/home/my_orders/my_orders_page.dart';
import 'package:kibanda_kb/ui/home/my_orders/single_order_page.dart';
import 'package:kibanda_kb/ui/home/payments/mpesa_payment_page.dart';
import 'package:kibanda_kb/ui/home/payments/payment_options_page.dart';
import 'package:kibanda_kb/ui/home/payments/transaction_mpesa_payment.dart';
import 'package:kibanda_kb/ui/home/transactions_page/transaction_page.dart';
import 'package:kibanda_kb/ui/login_page.dart';
import 'package:kibanda_kb/ui/splash_screen.dart';

import '../delivery/continue_with_this_location_page.dart';
import '../delivery/save_address_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: LoginPage),
  AutoRoute(page: MainHomePage),
  AutoRoute(page: MyAddressesPage),
  AutoRoute(page: ExpandedCategoriesPage),
  AutoRoute(page: OrderSuccessPage),
  AutoRoute(page: PaymentOPtionsPage),
  AutoRoute(page: CartPage),
  AutoRoute(page: MyAddressesPage),
  AutoRoute(page: MpesaPaymentPage),
  AutoRoute(page: MyOrdersPage),
  AutoRoute(page: SingleOrderPage),
  AutoRoute(page: TransactionPage),
  AutoRoute(page: TransactionalMpesaPage),
  AutoRoute(page: DeliveryDetailsPage),
  AutoRoute(page: SearchPage),
  AutoRoute(page: SearchCityPage),
  AutoRoute(page: ChooseLocationPage),
  AutoRoute(page: ContinueWithThisLocationPage),
  AutoRoute(page: SaveAddressPage),
])
class $AppRouter {}
