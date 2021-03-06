SELECT queryA.optionId, queryA.productName, queryA.optionName, queryA.productBrand, queryA.productPrime, queryA.productFreeShipping, jsonb_object_agg(OptionSpecs.optionSpecName, OptionSpecs.optionSpecText) AS optionSpecs, queryA.optionImageUrl, queryA.optionDimensions, queryA.optionWeight, queryA.optionLastPrice, queryA.optionPrice FROM
(SELECT Options.optionId, Products.productName, Options.optionName, Products.productBrand, Products.productPrime, Products.productFreeShipping , jsonb_agg(OptionImages.imageUrl) AS optionImageUrl, Options.optionDimensions, Options.optionWeight, Options.optionLastPrice, Options.optionPrice FROM Products
INNER JOIN Options ON Options.productId = Products.productid
RIGHT JOIN OptionImages ON OptionImages.optionId = Options.optionId
WHERE Products.productId = $1
GROUP BY Options.optionId, Products.productName, Options.optionName, Products.productBrand, Products.productprime, Products.productfreeShipping,  Options.optionDimensions, Options.optionWeight, Options.optionLastPrice, Options.optionPrice, Options.optionLastPrice) AS queryA
INNER JOIN OptionSpecs ON OptionSpecs.optionId = queryA.optionId
GROUP BY queryA.optionId, queryA.productName, queryA.optionName, queryA.productBrand, queryA.productPrime, queryA.productFreeShipping, queryA.optionImageUrl, queryA.optionDimensions, queryA.optionWeight, queryA.optionLastPrice, queryA.optionPrice;