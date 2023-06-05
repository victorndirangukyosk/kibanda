import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kibanda_kb/configuration/palette/palette.dart';
import 'package:kibanda_kb/cubits/cart/cart_cubit.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/ui/home/product/product_widget.dart';

class ProductTile extends StatelessWidget {
  final VendorProducts product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool inCart = context
        .watch<CartCubit>()
        .state
        .any((element) => element.product_id == product.product_id);

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: ListTile(
        trailing: const Icon(CupertinoIcons.chevron_right),
        enableFeedback: true,
        dense: false,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.5, color: Palette.orangeColor),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(20.0),
        onTap: () async {
          HapticFeedback.selectionClick();
          await showCupertinoModalPopup(
              context: context,
              builder: (context) => Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(
                            product: product,
                          ),
                        ),
                      ),
                    ),
                  ));
        },
        leading: SizedBox(
          width: 100,
          height: 100,
          child: CachedNetworkImage(
            imageUrl: product.thumb!,
          ),
        ),
        title: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.name!,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                inCart
                    ? const Icon(
                        CupertinoIcons.cart,
                        color: Palette.orangeColor,
                      )
                    : Container()
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        'Kshs',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        product.price!,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'per',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        product.unit!,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
