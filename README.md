# ShopCart

I am developing ShopCart initially as my full stack solution in response to a coding challenge. Feel free to contribute and reuse if you find it suitable to any of your application.

## Requirements
Initial features required as part of the user story:

* Users will be able to add multiple items, and display the total price.
* Service will calculate the total using the pricing rules provided by the following: [json  service](https://api.myjson.com/bins/gx6vz)
* Whenever a special quantity of an item is selected, special_price should be used for that instead of the normal pricing.

## Approach
[json  service](https://api.myjson.com/bins/gx6vz) is regarded as the main source of product's data and will be fetch by an admin by an UPDATE button. This process saves the latest information that the api service provides.

## Technology
Ruby On Rails, Javascript

## License
GPL-4