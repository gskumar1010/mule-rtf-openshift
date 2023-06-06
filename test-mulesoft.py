import random
import requests
import time

def get_random_product():
  """Returns a random clothing product."""
  products = [
    {
      "ITEM_ID": 1,
      "ITEM_NAME": "Shirt",
      "QTY": 1,
      "PRICE": 20
    },
    {
      "ITEM_ID": 2,
      "ITEM_NAME": "Pants",
      "QTY": 2,
      "PRICE": 30
    },
    {
      "ITEM_ID": 3,
      "ITEM_NAME": "Shoes",
      "QTY": 3,
      "PRICE": 40
    },
    {
      "ITEM_ID": 4,
      "ITEM_NAME": "Dress",
      "QTY": 1,
      "PRICE": 50
    },
    {
      "ITEM_ID": 5,
      "ITEM_NAME": "Jacket",
      "QTY": 1,
      "PRICE": 60
    },
    {
      "ITEM_ID": 6,
      "ITEM_NAME": "Hat",
      "QTY": 1,
      "PRICE": 10
    },
    {
      "ITEM_ID": 7,
      "ITEM_NAME": "Scarf",
      "QTY": 1,
      "PRICE": 20
    },
    {
      "ITEM_ID": 8,
      "ITEM_NAME": "Gloves",
      "QTY": 1,
      "PRICE": 30
    },
    {
      "ITEM_ID": 9,
      "ITEM_NAME": "Bag",
      "QTY": 1,
      "PRICE": 40
    },
    {
      "ITEM_ID": 10,
      "ITEM_NAME": "Shoelace",
      "QTY": 1,
      "PRICE": 5
    }
  ]
  return random.choice(products)

def post_product(product, num_posts, post_url):
  """Posts a product to the endpoint."""
  headers = {
    "Content-Type": "application/json"
  }
  data = {
    "ITEM_ID": product["ITEM_ID"],
    "ITEM_NAME": product["ITEM_NAME"],
    "QTY": product["QTY"],
    "PRICE": product["PRICE"]
  }
  for i in range(num_posts):
    response = requests.post(post_url, headers=headers, data=data)
    if response.status_code == 200:
      print("Product posted successfully.")
    else:
      print("Error posting product.")
    time.sleep(random.randint(0,5))
    print(f"Posted at {time.asctime()}")

if __name__ == "__main__":
  num_posts = int(input("How many times would you like to post? "))
  post_url = input("What is the post url? ")
  for i in range(10):
    product = get_random_product()
    post_product(product, num_posts, post_url)
