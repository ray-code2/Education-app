
class Category {
  final String name;
  final int numOfCourses;
  final String image;
  final String subtitle;
  final int price;
  Category(this.name, this.numOfCourses, this.image , this.subtitle , this.price);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image'] , item['subtitle'] , item['price']))
    .toList();

var categoriesData = [
  {"name": "Marketing", 
  'courses': 4, 
  'image': "assets/images/marketing.png", 
  "subtitle": "Marketing Masterclass",
  'price': 20
  },
  {"name": "UX Design", 
  'courses': 4,
   'image': "assets/images/ux_design.png",
    "subtitle": "Ux Masterclass",
    'price': 9
     },
  {
    "name": "Photography",
    'courses': 4,
    'image': "assets/images/photography.png",
    "subtitle": "Photography Masterclass",
    'price': 10,
    
  },
  {"name": "Business", 
  'courses': 4, 
  'image': "assets/images/business.png"  ,
   "subtitle": "Business Strategy",
   'price': 12
   },
   
    {"name": "Communication",
     'courses': 4, 
     'image': "assets/images/communication.png" ,
     "subtitle": "Improve Communication",
     'price': 15
     },
      {"name": "Music",
       'courses': 4, 
       'image': "assets/images/Music.png" , 
       "subtitle": "Music Mastery",
       'price': 18
       },
];
