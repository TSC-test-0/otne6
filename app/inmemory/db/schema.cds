namespace guitarStore;

entity Product {
  key ID: UUID;
  productName: String(200);
  productDescription: String(500);
  price: Decimal(10,2);
  warehouse: Association to Warehouse;
  discount: Association to Discount;
}

entity Pitch {
  key ID: UUID;
  targetAudience: String(200);
  pitchText: String(500);
  product: Association to Product;
}

entity Warehouse {
  key ID: UUID;
  stock: Integer;
  products: Composition of many Product on products.warehouse = $self;
}

entity Discount {
  key ID: UUID;
  discountAmount: Decimal(5,2);
  discountDescription: String(200);
  products: Association to many Product on products.discount = $self;
}

