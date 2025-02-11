# food_chooser

 lib/
│── main.dart
│── core/
│   │── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │── utils/
│   │   ├── helpers.dart
│   │   ├── extensions.dart
│   │── services/
│   │   ├── api_service.dart
│   │   ├── local_storage_service.dart
│── data/
│   │── models/
│   │   ├── ingredient_model.dart
│   │   ├── recipe_model.dart
│   │── sources/
│   │   ├── local_data_source.dart
│   │   ├── remote_data_source.dart
│── domain/
│   │── repositories/
│   │   ├── ingredient_repository.dart
│   │   ├── recipe_repository.dart
│── application/
│   │── providers/
│   │   ├── ingredient_provider.dart
│   │   ├── recipe_provider.dart
│── presentation/
│   │── pages/
│   │   ├── home/
│   │   │   ├── home_page.dart
│   │   │   ├── home_view_model.dart
│   │   │   ├── home_widgets.dart
│   │   ├── recipe/
│   │   │   ├── recipe_list_page.dart
│   │   │   ├── recipe_detail_page.dart
│   │   │   ├── recipe_view_model.dart
│   │   │   ├── recipe_widgets.dart
│   │   ├── ingredient/
│   │   │   ├── ingredient_list_page.dart
│   │   │   ├── add_ingredient_page.dart
│   │   │   ├── ingredient_view_model.dart
│   │   │   ├── ingredient_widgets.dart
│   │── widgets/
│   │   ├── recipe_card.dart
│   │   ├── ingredient_list_tile.dart
│── router/
│   │── app_router.dart
│── pubspec.yaml
