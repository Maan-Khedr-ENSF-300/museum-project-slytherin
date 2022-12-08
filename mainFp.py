import mysql.connector
from mysql.connector import errorcode

def main():
    inpt=1
    while(inpt):
        print("Select Role To Continue")
        print("1: Admin")
        print("2: Data Entry")
        print("3: Guest User")

        sel=input()
        if sel =='1' or sel =='2':
            userName=input("ENTER USERNAME  :  ")
            passWord=input("ENTER PASSWORD  :  ")
        elif sel =='3':
            userName="guestUser"
            passWord=None

        try:
            cnx = mysql.connector.connect(host="127.0.0.1", port=3306,user=userName, password=passWord, database='museumFp')
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                print("INCORRECT USERNAME OR PASSWORD")
            elif err.errno == errorcode.ER_BAD_DB_ERROR:
                print("DATABASE DOESN'T EXIST !")
            else:
                print(err)
        else:
            print("Success")
            inpt=0
            cursor = cnx.cursor(buffered=True)
            print("12")
            if sel=='1':
                adminConsol(cursor,cnx)
            elif sel=='2':
                dataEntry(cursor,cnx)
            elif sel=='3':
                guestConsol(cursor,cnx)