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

def dataEntry(cursor,cnx):
    print("Choose:")
    print("1- Search the database")
    print("2- Insert Data")
    print("3- Delete Data")
    print("Function Not Yet complete")

    

def guestConsol(cursor,cnx):

    sel3=1
    print("WELCOME TO THE GUEST CONSOLE, HERE YOU CAN ACCESS THE DATABASE")
    while sel3:
        
        print("FIRST TYPE IN THE COLUMNS YOU NEED TO SEE OR * FOR ALL COLUMNS OR PRESS 1 FOR HELP")
        sel1=   input(" ")
        if sel1 =='1':
            helper()
        print("NOW ENTER THE DATABASE TO ACCESS THE COLUMNS FROM")
        print("PRESS 1 TO GET HELP")
        sel2 = input()

        sel3=input("press 1 to continue or 0 to exit")

        cursor.execute("SELECT * FROM ART_OBJECT;")
        cnx.commit()
        myresult = cursor.fetchall()

        cursor.execute("SELECT " + sel1 + " FROM " + sel2 + " ; ")
        cnx.commit()
        myresult = cursor.fetchall()
        print("\n")

        for x in myresult:
            for y in x:
                print( y )
            print("\n")

def helper():
    pass


if _name_ == "_main_":
    main()