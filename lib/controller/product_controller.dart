import 'package:get/state_manager.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  //List<Product>()
  var productList = [].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }

    print( "list size: ${productList.length}");
  }
}