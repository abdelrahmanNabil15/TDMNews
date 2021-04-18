import 'package:news/Models/CategoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'business ';
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1536940135352-b4b3875df888?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'entertainment ';
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'general ';
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'health ';
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'science ';
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.CategoryName = 'sports ';
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.CategoryName = 'technology ';
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  return category;
}
