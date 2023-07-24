class Product{
  late int id;
  late String name;
 late String description;
 late double unitPrice;

  Product(this.id, this.name, this.description, this.unitPrice);
  Product.withId(this.id, this.name, this.description, this.unitPrice);
}
