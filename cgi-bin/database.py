#!/usr/bin/env python3
import getpass
import mysql.connector

""" This function will provide a connection to the database """
def get_connection(verbose=False):
    login_name = getpass.getuser()  # obtain user login name
    config = {"user": login_name, "database": login_name}
    connection = mysql.connector.connect(**config)
    if verbose:
        print("connecting with configuration:", config, sep="\n")
        print("Using", type(connection))
    return connection

if __name__ == "__main__":
    connection = get_connection(True)
    connection.close()
