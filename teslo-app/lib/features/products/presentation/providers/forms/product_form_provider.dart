import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/shared/infrastructure/inputs/inputs.dart';

class ProductFormNotifier extends StateNotifier<ProductFormState> {
  final void Function(Map<String, dynamic> porductLike)? onSubmitCallback;

  ProductFormNotifier({this.onSubmitCallback, required Product product})
      : super(ProductFormState(
        id: product.id,
        title: Title.dirty(product.title),
        slug: Slug.dirty(product.slug),
        inStock: Stock.dirty(product.stock),
        price: Price.dirty(product.price),
        sizes: product.sizes,
        gender: product.gender,
        description: product.description,
        tags: product.tags.join(', '),
        images: product.images,
      ));

    void onTitleChange(String value){
      state = state.copyWith(
        title: Title.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(value),
          Slug.dirty(state.slug.value),
          Stock.dirty(state.inStock.value),
          Price.dirty(state.price.value)
        ])
      );
    }
    void onSlugChange(String value){
      state = state.copyWith(
        slug: Slug.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(state.title.value),
          Slug.dirty(value),
          Stock.dirty(state.inStock.value),
          Price.dirty(state.price.value)
        ])
      );
    }
    void onPriceChange(double value){
      state = state.copyWith(
        price: Price.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(state.title.value),
          Slug.dirty(state.slug.value),
          Stock.dirty(state.inStock.value),
          Price.dirty(value)
        ])
      );
    }
    void onStockChange(int value){
      state = state.copyWith(
        inStock: Stock.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(state.title.value),
          Slug.dirty(state.slug.value),
          Stock.dirty(value),
          Price.dirty(state.price.value)
        ])
      );
    }
}

class ProductFormState {
  final bool isFormValid;
  final String? id;
  final Title title;
  final Slug slug;
  final Stock inStock;
  final Price price;
  final List<String> sizes;
  final String gender;
  final String description;
  final String tags;
  final List<String> images;

  ProductFormState(
      {this.isFormValid = false,
      this.id,
      this.title = const Title.dirty(''),
      this.slug = const Slug.dirty(''),
      this.inStock = const Stock.dirty(0),
      this.price = const Price.dirty(0),
      this.sizes = const [],
      this.gender = 'men',
      this.description = '',
      this.tags = '',
      this.images = const []});

  ProductFormState copyWith({
    bool? isFormValid,
    String? id,
    Title? title,
    Slug? slug,
    Stock? inStock,
    Price? price,
    List<String>? sizes,
    String? gender,
    String? description,
    String? tags,
    List<String>? images,
  }) =>
      ProductFormState(
        isFormValid: isFormValid ?? this.isFormValid,
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        inStock: inStock ?? this.inStock,
        price: price ?? this.price,
        sizes: sizes ?? this.sizes,
        gender: gender ?? this.gender,
        description: description ?? this.description,
        tags: tags ?? this.tags,
        images: images ?? this.images,
      );
}
