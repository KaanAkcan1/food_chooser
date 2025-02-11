import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = Provider<HomeViewModel>((ref) {
  return HomeViewModel();
});

class HomeViewModel {
  void someBusinessLogic() {
    // Gelecekte buraya iş mantığı eklenebilir.
  }
}
