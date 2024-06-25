import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  void decrement() {
    setState(() {
      setState(() {
        if (numOfItems > 1) {
          setState(() {
            numOfItems--;
          });
        }
      });
    });
  }

  void increment() {
    setState(() {
      numOfItems++;
    });
  }

  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildAddRemoveItemBtn(icon: Icons.remove, onPressed: decrement),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        buildAddRemoveItemBtn(icon: Icons.add, onPressed: increment),
      ],
    );
  }

  SizedBox buildAddRemoveItemBtn(
      {required IconData icon, required void Function()? onPressed}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
