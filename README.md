#  👋 Buy-Bye 👋

BuyBye, the fastest online shop you'll ever use.

The first iteration of BuyBye platform was developed by its owner,
who's not really a programmer. He did a pretty good job anyway and
managed to set up a working shopping cart and put some fancy styles with the help of a designer.

But now, he wants to add some discounts and promotions to boost the sales for christmas and he found the problem was a little bit over his skills. So he's requested our help!

The discounts that he wants to deploy are the following:

* If you spend over £800, then you get 10% off of your purchase.
* If you buy 2 or more Guitars then the price drops to $655.
* If you buy 4 or more items of the same type, you get a 5% on those items

Note: The discounts rules ARE combinable. For example, you buy 5 Guitars: As you are buying more than 1 guitars, the price for each will drop to $655 (instead of $863). Also you are buying more than 4, so each guitar costs a 5% less, so each guitar costs 623, which  makes a total of: 632 * 5 = 3115. As 3115 is greater than 800, you also get a 10% discount of 311.5, so the total you will pay for the guitars would be 3115 - 311.5 = 2803.5

Take into account that these discounts might change in the near future, so the way the rules are implemented should be flexible

When he tried to implement these rules, he left the app partially broken.
Our objective is to fix any broken funcionality and implement the checkout.

For this he left a BIG checkout button in the shopping cart that you must make it work. When a user clicks that button the system must:

1) calculate the discounts
2) Create an Order in the database.
   This order must have the items that were bought
   and the discounts that were applied
3) show a confirmation page where the user can see:
  * the order number
  * the orders' items
  * the discounts that were applied
  * the total without discounts
  * the total with discounts
## Tasks

- [ ] <TASK_1>
- [ ] <TASK_2>

## Setup

See [SETUP.md](SETUP.md).

## Delivery

Send your solution to [info@sinaptia.dev](mailto:info@sinaptia.dev) and mark your completed tasks in the list above. See example:

- [x] Task 1 (means completed)
- [ ] Task 2 (means not completed)
