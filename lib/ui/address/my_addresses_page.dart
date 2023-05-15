import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/address/address/address_cubit.dart';
import 'package:kibanda_kb/cubits/address/delivery_address_selection_cubit.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/models/address/address.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';
import 'package:star_menu/star_menu.dart';

class MyAddressesPage extends StatelessWidget {
  const MyAddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'My Addresses',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Saved Addresses',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<AddressCubit, AddressState>(
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    success: (v) {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                          const MaterialBanner(
                              content: Text('Hello'),
                              actions: [Text('Dismiss')]));
                    },
                    failed: (e) {
                      AppToast.showToast(message: e, isError: true);
                    });
              },
              builder: (context, state) {
                return state.maybeWhen(loading: () {
                  return const Center(
                    child: SpinKitSpinningLines(color: Palette.greenColor),
                  );
                }, success: (addresses) {
                  return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SingleAddressWidget(
                            isHome: true, address: addresses[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      itemCount: addresses.length);
                }, orElse: () {
                  return Container();
                });
              },
            ),
          )),
          Card(
            color: Palette.greyColor,
            elevation: 0,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Would you like to add a new\n address?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CupertinoButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const ChooseLocationRoute());
                    },
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),

                          // color: Palette.orangeColor,
                          border:
                              Border.all(color: Palette.orangeColor, width: 2)),
                      child: const Center(
                        child: Text(
                          'Add Address',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Palette.orangeColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 54,
        color: Palette.greyColor,
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${context.watch<CartCubit>().state.length} items',
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  "KES ${context.watch<CartCubit>().getBalance() + context.watch<CartCubit>().getTax()}",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              width: 100,
            ),
            Expanded(
              child: SizedBox(
                height: 30,
                child: CupertinoButton(
                  color: Palette.orangeColor,
                  onPressed: () {
                    if (context.read<DeliveryAddressSelectionCubit>().state !=
                        null) {
                      AutoRouter.of(context).pop();
                    } else {
                      AppToast.showToast(
                          message:
                              'Select your delivery address or add a new one',
                          isError: true);
                    }
                  },
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Schedule Delivery',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        CupertinoIcons.chevron_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class SingleAddressWidget extends StatelessWidget {
  final bool isHome;
  final Address address;
  const SingleAddressWidget(
      {Key? key, required this.isHome, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DeliveryAddressSelectionCubit>().save(address);
      },
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            border: Border.all(
                color: context.watch<DeliveryAddressSelectionCubit>().state ==
                        address
                    ? Palette.greenColor
                    : Palette.placeholderGrey,
                width: context.watch<DeliveryAddressSelectionCubit>().state ==
                        address
                    ? 3
                    : 1),
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Column(
              children: const [
                Icon(
                  CupertinoIcons.building_2_fill,
                  color: Palette.orangeColor,
                )
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Palette.orangeColor)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        address.address_type!,
                        style: const TextStyle(
                            color: Palette.orangeColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text('${address.address}, ${address.city}'
                      ''),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            ),
            Column(
              children: [
                StarMenu(
                  // params: StarMenuParameters(
                  //     onItemTapped: (index, controller) async {
                  //   controller.closeMenu();
                  // }),
                  items: [
                    Container(
                      width: 200,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CupertinoButton(
                              onPressed: () {},
                              color: Palette.greenColor,
                              padding: const EdgeInsets.all(0),
                              child: const Text('Edit Address')),
                          const SizedBox(
                            height: 4,
                          ),
                          CupertinoButton(
                              onPressed: () {},
                              color: CupertinoColors.destructiveRed,
                              padding: const EdgeInsets.all(0),
                              child: const Text('Delete Address')),
                        ],
                      ),
                    ),
                  ],
                  // params: StarMenuParameters(
                  //     onItemTapped: (index, controller) async {
                  //   controller.closeMenu();
                  // }),
                  child: const Icon(Icons.more_vert),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
