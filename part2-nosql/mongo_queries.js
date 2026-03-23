// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "ELEC001",
    category: "Electronics",
    name: "Noise-Cancelling Headphones",
    brand: "SoundMax",
    price: 3200,
    specifications: {
      warranty_years: 2,
      battery_life_hours: 30,
      wireless: true,
      voltage: "5V USB-C"
    },
    features: ["Active Noise Cancellation", "Bluetooth 5.2", "Foldable Design"],
    stock: 120,
    tags: ["audio", "wireless", "premium"]
  },
  {
    _id: "CLOTH101",
    category: "Clothing",
    name: "Men's Cotton Hoodie",
    brand: "UrbanWear",
    price: 149,
    sizes_available: ["S", "M", "L", "XL"],
    material: { fabric: "100% Cotton", gsm: 280 },
    care_instructions: [
      "Machine wash cold",
      "Do not bleach",
      "Tumble dry low"
    ],
    color_variants: [
      { color: "Black", hex: "#000000" },
      { color: "Grey", hex: "#808080" }
    ],
    stock: 75
  },
  {
    _id: "GROC501",
    category: "Groceries",
    name: "Organic Almond Milk",
    brand: "FreshFarm",
    price: 18.5,
    expiry_date: "2026-07-15",
    nutritional_info: {
      calories: 60,
      fat_g: 2.5,
      protein_g: 1,
      carbohydrates_g: 8
    },
    ingredients: [
      "Filtered Water",
      "Organic Almonds",
      "Sea Salt",
      "Vitamin D2"
    ],
    storage_instructions: "Keep refrigerated after opening",
    stock: 200
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "ELEC001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });