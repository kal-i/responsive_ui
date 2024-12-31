import 'sushi.dart';

class CartItem {
  final Sushi sushi;
  final int quantity;

  const CartItem({
    required this.sushi,
    required this.quantity,
  });
}