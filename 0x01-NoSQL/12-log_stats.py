#!/usr/bin/env python3
""" 12. Log stats - new version """

from pymongo import MongoClient

if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')

    nginx_collection = client.logs.nginx

    total_logs_count = nginx_collection.count_documents({})
    print(f"{total_logs_count} logs")

    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]

    for method in methods:
        method_count = nginx_collection.count_documents({"method": method})
        print(f"Method {method}: {method_count}")

    status_check_count = nginx_collection.count_documents(
        {"method": "GET", "path": "/status"})
    print(f"{status_check_count} status checks")

    client.close()
