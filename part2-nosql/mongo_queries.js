// Connect to the ecommerce database
use ecommerce;

// OP1: Inserted sample documents (into the products collection)
db.products.insertMany([
  {
    product_id: "E101",
    name: "Apple MacBook Pro 14",
    category: "Electronics",
    price: 199999,
    brand: "Apple",
    specifications: {
      processor: "M3 Pro",
      ram: "18GB",
      storage: "512GB SSD",
      voltage: "230V"
    },
    warranty: {
      period_months: 12,
      type: "Manufacturer"
    },
    ratings: [5, 4, 5, 5]
  },
  {
    product_id: "C201",
    name: "Men's Cotton Casual Shirt",
    category: "Clothing",
    price: 1499,
    brand: "Levis",
    attributes: {
      size_options: ["S", "M", "L", "XL"],
      color: "Blue",
      material: "100% Cotton",
      gender: "Men"
    },
    care_instructions: [
      "Machine wash",
      "Do not bleach",
      "Iron at medium temperature"
    ]
  },
  {
    product_id: "G301",
    name: "Organic Whole Milk",
    category: "Groceries",
    price: 80,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 60,
      protein_g: 3.2,
      fat_g: 3.5,
      carbohydrates_g: 5
    },
    storage_instructions: "Keep refrigerated",
    ingredients: ["Milk"]
  }
]);

// OP2: Find Electronics priced above 20,000
db.products.find({ category: "Electronics", price: { $gt: 20000 } });

// OP3: Find Groceries expiring before 2025
db.products.find({ category: "Groceries", expiry_date: { $lt: new Date("2025-01-01") } });

// OP4: Update product with discount
db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } }
);

// OP5: Create index on category
db.products.createIndex({ category: 1 });