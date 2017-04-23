# ShopCarte

I am developing ShopCarte initially as my full stack solution in response to a coding challenge. Feel free to contribute and reuse if you find it suitable to any of your application. Visit the current version named [ShopCarte](https://shopcarte.herokuapp.com) at heroku.

## Requirements
Initial features required as part of the user story:

* Users will be able to add multiple items, and display the total price.
* Service will calculate the total using the pricing rules provided by the following: [json  service](https://api.myjson.com/bins/gx6vz)
* Whenever a special quantity of an item is selected, special_price should be used for that instead of the normal pricing.

## Design Approach
[json  service](https://api.myjson.com/bins/gx6vz) is regarded as the main source of product's data and will be fetch by an admin by an UPDATE button. This process saves the latest information that the api service provides. Additional products can be added manually. Virtual Cart is implemented and all the selected products are added as line items. Generated virtual cart id is used as part of the session which enables accummulation of all the selected items.

## How To Use
Initial products from [json  service](https://api.myjson.com/bins/gx6vz)  will be populated by pressing UPDATE button from homepage. A new product can be created as well manually. DELETE button is provided on the right side of every product to test only that update features are working once a product from [json  service](https://api.myjson.com/bins/gx6vz) is removed.  

## Testing
Rails unit testing default are used and still on the way to completion. At the moment, there are 35 assertions and still ongoing progress..

## Technology
Ruby On Rails, Javascript

## License
GPL-4