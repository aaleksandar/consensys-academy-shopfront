pragma solidity ^0.4.14;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract Shopfront is Ownable {
	uint private balance;

  struct Product {
    uint price;
    uint stock;
  }

	mapping(uint => Product) public products;
	mapping(address => bool) internal administrators;

  function Storefront() {
    administrators[msg.sender] = true;
  }

  modifier onlyAdmin() {
  	require(administrators[msg.sender] == true);
  	_;
  }

  // Owner functions

  function deposit()
    asOwner
    payable
    returns(bool success)
  {
		require(msg.value > 0);
    balance += msg.value;

    return true;
  }

  function withdraw(uint amount)
  	asOwner
  	returns(bool success)
	{
		require(amount <= balance);

		balance -= amount;
		msg.sender.transfer(amount);

		return true;
	}

	// Admin functions

	function addProduct(uint id, uint price, uint stock)
		onlyAdmin
		returns(bool success)
 {
		require(id > 0);
		require(price > 0);
		require(stock > 0);
		require(products[id] == 0);

		Product memory product = Product({
      price: price,
      stock: quantity
		});

		products[id] = product;

		return true;
	}

	// User functions

	function buyProduct(uint id)
		payable
		returns(bool success)
	{
		require(products[id].stock > 0);
		require(products[id].price == msg.value);

		balance += msg.value;
		products[id] -= 1;

		return true;
	}


}
