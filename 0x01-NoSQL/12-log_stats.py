#!/usr/bin/env python3
""" 12. Log stats - new version """

from pymongo import MongoClient

if __name__ == "__main__":
    try:
        # Create a MongoClient
        client = MongoClient('mongodb://127.0.0.1:27017')

        # Access the nginx collection
        nginx_collection = client.logs.nginx

        # Get the total count of logs
        total_logs_count = nginx_collection.count_documents({})
        print(f"{total_logs_count} logs")

        # Define HTTP methods
        methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]

        # Count logs for each HTTP method
        for method in methods:
            method_count = nginx_collection.count_documents({"method": method})
            print(f"Method {method}: {method_count}")

        # Count status checks
        status_check_count = nginx_collection.count_documents(
            {"method": "GET", "path": "/status"})
        print(f"{status_check_count} status checks")

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        # Close the MongoClient
        client.close()
