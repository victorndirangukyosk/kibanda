import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kibanda_kb/configuration/configuration.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/featured_product_cubit.dart';
import 'package:kibanda_kb/cubits/cubit/validate_order_cubit.dart';
import 'package:kibanda_kb/routes/router.gr.dart';
import 'package:kibanda_kb/ui/home/cart/cart_product_list.dart';
import 'package:kibanda_kb/ui/home/cart/cart_widget.dart';
import 'package:kibanda_kb/ui/home/featured_widget/fearured_widget.dart';
import 'package:kibanda_kb/utilities/toast/toast.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = context.watch<CartCubit>().state.length < 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.save_outlined,
                size: 28,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      var formKey = GlobalKey<FormBuilderState>();
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: FormBuilder(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                            color: Palette.greenColor,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8))),
                                        child: Center(
                                          child: Text(
                                            'Save basket',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FormBuilderTextField(
                                      name: 'name',
                                      maxLines: 1,
                                      validator: FormBuilderValidators.compose(
                                          [FormBuilderValidators.required()]),
                                      decoration: InputDecoration(
                                          hintText: 'Enter the basket name',
                                          hintStyle: TextStyle(
                                              color: Palette.placeholderGrey,
                                              fontSize: 13),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: CupertinoButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                      //   Expanded(
                                      //       child: BlocConsumer<SaveToBasketCubit,
                                      //           SaveToBasketState>(
                                      //     listener: (context, state) {
                                      //       state.maybeWhen(
                                      //           success: () {
                                      //             AppToast.showToast(
                                      //                 message:
                                      //                     'Successfully added products to basket',
                                      //                 isError: false);
                                      //             context
                                      //                 .read<WishlistCubit>()
                                      //                 .getWishLists();
                                      //             Navigator.pop(context);
                                      //           },
                                      //           orElse: () {});
                                      //     },
                                      //     builder: (context, state) {
                                      //       return state.maybeWhen(
                                      //           orElse: () {
                                      //             return CupertinoButton(
                                      //                 onPressed: () {
                                      //                   if (formKey.currentState!
                                      //                       .saveAndValidate()) {
                                      //                     var data = {};
                                      //                     for (int i = 0;
                                      //                         i <
                                      //                             context
                                      //                                 .read<
                                      //                                     CartCubit>()
                                      //                                 .state
                                      //                                 .length;
                                      //                         i++) {
                                      //                       data.addAll({
                                      //                         'products[$i][product_id]':
                                      //                             context
                                      //                                 .read<
                                      //                                     CartCubit>()
                                      //                                 .state[i]
                                      //                                 .product_id,
                                      //                         'products[$i][quantity]': context
                                      //                             .read<
                                      //                                 CartProductMetadataCubit>()
                                      //                             .state
                                      //                             .where((element) =>
                                      //                                 element
                                      //                                     .product_id ==
                                      //                                 int.parse(context
                                      //                                     .read<
                                      //                                         CartCubit>()
                                      //                                     .state[
                                      //                                         i]
                                      //                                     .product_id!))
                                      //                             .first
                                      //                             .amount
                                      //                             .toString(),
                                      //                       });
                                      //                     }

                                      //                     context
                                      //                         .read<
                                      //                             SaveToBasketCubit>()
                                      //                         .saveToBasket(
                                      //                             data: {
                                      //                           ...formKey
                                      //                               .currentState!
                                      //                               .value,
                                      //                           ...data
                                      //                         });
                                      //                   }
                                      //                 },
                                      //                 padding:
                                      //                     const EdgeInsets.all(0),
                                      //                 child: Text(
                                      //                   'Submit',
                                      //                   style: TextStyle(
                                      //                       fontSize: 13,
                                      //                       fontWeight:
                                      //                           FontWeight.bold,
                                      //                       color: Palette
                                      //                           .greenColor),
                                      //                 ));
                                      //           },
                                      //           loading: () =>
                                      //               CupertinoActivityIndicator());
                                      //     },
                                      //   )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }),
          CupertinoButton(
              child: Icon(
                CupertinoIcons.delete,
                color: CupertinoColors.destructiveRed,
              ),
              onPressed: () {
                HapticFeedback.heavyImpact();
                showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                            color:
                                                CupertinoColors.destructiveRed,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8))),
                                        child: Center(
                                          child: Text(
                                            'Delete the cart?',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Are you sure to delete the entire cart? \nThis action is non-reversible, please save the cart if you wish to use the sam in future',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Palette.placeholderGrey,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: CupertinoButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'No, keep it',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      )),
                                      Expanded(
                                          child: CupertinoButton(
                                              onPressed: () async {
                                                await context
                                                    .read<CartCubit>()
                                                    .removeAll();
                                                Navigator.pop(context);
                                              },
                                              padding: const EdgeInsets.all(0),
                                              child: Text(
                                                'Yes, delete',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: CupertinoColors
                                                        .destructiveRed),
                                              ))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
              })
        ],
        title: Text('My Cart',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
      ),
      body: BlocConsumer<ValidateOrderCubit, ValidateOrderState>(
        listener: (context, state) {
          state.maybeWhen(
              loading: () {
                context.read<CartCubit>().updateCart();
              },
              orElse: () {},
              success: () {
                AutoRouter.of(context).push(MyAddressesRoute());
              },
              failed: (error) {
                AppToast.showToast(message: error, isError: true);
              });
        },
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => Center(
                    child: SpinKitSpinningLines(
                      color: Palette.greenColor,
                    ),
                  ),
              orElse: () => isEmpty
                  ? EmptyCartWidget()
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: CartProductList(
                            refreshCartUI: () {
                              setState(() {});
                            },
                          )),
                          CheckoutWidget()
                        ],
                      ),
                    ));
        },
      ),
    );
  }
}

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset(
              'assets/svgs/circle.svg',
              height: 326,
              width: 326,
            )),
        Positioned(
          left: 0,
          top: 300,
          child: RotatedBox(
            quarterTurns: 2,
            child: SvgPicture.asset(
              'assets/svgs/circle.svg',
              height: 136,
              width: 136,
            ),
          ),
        ),
        Center(child: SvgPicture.asset('assets/svgs/box.svg')),
        Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Oh, an empty cart!!!',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Isn\'t this the right time to fill your cart?',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white38,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Explore our products',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        CupertinoButton(
                            child: Text(
                              'View All',
                              style: TextStyle(fontSize: 14),
                            ),
                            onPressed: () {
                              AutoRouter.of(context)
                                  .push(ExpandedCategoriesRoute());
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => Center(
                            child: SpinKitSpinningCircle(
                              color: Palette.greenColor,
                            ),
                          ),
                          orElse: () => Container(),
                          success: (products, isLast, page) => FeaturedWidget(
                            products: products,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
