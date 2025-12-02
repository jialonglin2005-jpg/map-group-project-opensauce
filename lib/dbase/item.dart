import '../models/user.dart';
import '../models/renter_item.dart';

final List<RentalItem> dummyRentalItems = [
  // Item 1
  RentalItem(
    id: '1',
    name: 'TMA-2 HD Wireless',
    imageUrls: [
      'https://m.media-amazon.com/images/I/41-aM730pFL._AC_UF894,1000_QL80_.jpg',
      'https://m.media-amazon.com/images/I/51+uECWkCkL._AC_UF894,1000_QL80_.jpg',
    ],
    category: 'Electronic',
    pricePerDay: 10.00,
    deposit: 20.00,
    description: 'High definition wireless headphones with superior sound quality. Modular design.',
    location: 'KTDI',
    rating: 4.6,
  ),

  // Item 2
  RentalItem(
    id: '2',
    name: 'Canon EOS 80D',
    imageUrls: [
      'https://m.media-amazon.com/images/I/61f9Hy-cujL._AC_SL1000_.jpg',
    ],
    category: 'Electronic',
    pricePerDay: 45.00,
    deposit: 100.00,
    description: 'Great DSLR for photography enthusiasts. Lens included.',
    location: 'KDOJ',
    rating: 4.8,
  ),

  // Item 3
  RentalItem(
    id: '3',
    name: 'Camping Tent (4 Pax)',
    imageUrls: [
      'https://m.media-amazon.com/images/I/61+M35-3cWL._AC_SL1500_.jpg',
    ],
    category: 'Sports',
    pricePerDay: 15.00,
    deposit: 50.00,
    description: 'Waterproof tent, easy to set up. Perfect for weekend getaways.',
    location: 'KDSE',
    rating: 4.2,
  ),
];