class Product {
  final DetailProduct detailProduct;
  final List<Industry> listIndustry;
 
  Product({
    required this.detailProduct,
    required this.listIndustry,
  
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      detailProduct: DetailProduct.fromJson(json['detail_product']),
      listIndustry: List<Industry>.from(
        json['list-industry'].map((industry) => Industry.fromJson(industry)),
      ),
    );
  }
}

class DetailProduct {
  final String productName;
  final String productImage;
  final String iupacName;
  final String casNumber;
  final String hsCode;
  final String formula;
  final String description;
  final String application;
  final String packagingName;

  DetailProduct({
    required this.productName,
    required this.productImage,
    required this.iupacName,
    required this.casNumber,
    required this.hsCode,
    required this.formula,
    required this.description,
    required this.application,
    required this.packagingName,
  });

  factory DetailProduct.fromJson(Map<String, dynamic> json) {
    return DetailProduct(
      productName: json['productname'],
      productImage: json['productimage'],
      iupacName: json['iupac_name'],
      casNumber: json['cas_number'],
      hsCode: json['hs_code'],
      formula: json['formula'],
      description: json['description'],
      application: json['application'],
      packagingName: json['packaging_name'],
    );
  }
}

class Industry {
  final String industryUrl;
  final String industryName;

  Industry({
    required this.industryUrl,
    required this.industryName,
  });

  factory Industry.fromJson(Map<String, dynamic> json) {
    return Industry(
      industryUrl: json['industry_url'],
      industryName: json['industry_name'],
    );
  }
}

