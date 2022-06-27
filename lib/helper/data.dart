import 'package:news/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];

  CategoryModel categoryModel = CategoryModel();

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl = 'https://c8.alamy.com/comp/2BHG705/colourful-conceptual-images-2BHG705.jpg';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'shop';
  categoryModel.imageUrl ='https://image.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'fun';
  categoryModel.imageUrl ='https://www.ionos.ca/digitalguide/fileadmin/DigitalGuide/Teaser/picture-gallery-t.jpg';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'travel';
  categoryModel.imageUrl = 'https://st.depositphotos.com/1428083/2946/i/600/depositphotos_29460297-stock-photo-bird-cage.jpg';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'political';
  categoryModel.imageUrl = 'https://www.oberlo.com/media/1603970279-pexels-photo-3.jpg?fit=max&fm=jpg&w=1824';
  category.add(categoryModel);
  return category;
}
