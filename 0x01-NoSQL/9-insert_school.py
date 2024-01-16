#!/usr/bin/env python3
""" 9. Insert a document in Python """

def insert_school(mongo_collection, **kwargs):
    """ Insert a document in Python """
    doc = mongo_collection.insert_one(kwargs)
    return str(doc.inserted_id)
