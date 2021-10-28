// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:order_app/models/product_model.dart';
// import 'package:order_app/module/cart/cart_event.dart';
// import 'package:order_app/module/cart/cart_state.dart';

// // import '../screen/product.dart';
// class CartBloc extends BlocEvent {
//   Product product;
//   CartBloc(this.product);
// }
// class DelFromCart extends BlocEvent {
//   Product product;
//   DelFromCart(this.product);
// }
// class ClearCart extends BlocEvent {}
// class LoadedState extends BlocState {
//   List<Product> products;
//   LoadedState(this.products);
// }
// class LoadingState extends BlocState{}
// class FailedToLoadState extends BlocState {
//   Exception error;
//   FailedToLoadState(this.error);
// }


// class ProductBloc extends Bloc<BlocEvent, BlocState>{
//   ProductBloc() : super(null);

//   List<Product> cartProducts = [];


//   @override
//   Stream<BlocState> mapEventToState(BlocEvent event) async*{
//     yield LoadingState();
//     try{
//       if (event is CartBloc)
//         cartProducts.add(event.product);
//       if (event is DelFromCart)
//         cartProducts.remove(event.product);
//       if (event is ClearCart)
//         cartProducts = [];
//       yield LoadedState(cartProducts);
//     }
//     catch(e){
//       yield FailedToLoadState(error);
//     }
//   }
// }
