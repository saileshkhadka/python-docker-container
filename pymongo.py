import pymongo

client = pymongo.MongoClient("mongodb://user:pwd@10.0.0.11/db_name") # defaults to port 27017

db = client.cool_db

# print the number of documents in a collection
print db.cool_collection.count()


