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
            inpt=0
            cursor = cnx.cursor(buffered=True)
            if sel=='1':
                adminConsol(cursor,cnx)
            elif sel=='2':
                dataEntry(cursor,cnx)
            elif sel=='3':
                guestConsol(cursor,cnx)

def adminConsol(cursor,cnx):
    while(1):
        print("Choose:")
        print("1- Type in and use SQL Commands")
        print("2- Run SQL Script")
        print("3- Manage Users")
        print("PRESS ANY OTHER KEY TO QUIT")
        sel=input()

        if sel =="1":
            query=input("Enter SQL QUERY:")
            cursor.execute(query)
            queryL=cursor.fetchall()
            for values in queryL:
                print(values)
                cnx.commit()

        elif sel=="2":
            scriptAddress=input("ENTER SQL SCRIPT ADDRESS:   (WITHOUT "" or '') ")
            with open(scriptAddress, 'r') as f:
                with cnx.cursor() as cursor:
                    cursor.execute(f.read(), multi=True)
                    cnx.commit()
                    print("SUCCESS")

    
        elif sel=="3":
            print(" THE USER MANAGEMENT FUNCTION IS INCOMPLETE AND THERES NOT ENOUGH TIME FOR US TO ADD THOSE :(")
            print("Press 1 to add a user")
            sel2=input()
            if sel2=='1':
                print("ENTER THE USERNAME :   ")
                userName=input()
                print("ENTER THE PASSWORD :   ")
                password=input()
                print("CREATE USER "+ userName +"@localhost "+ " IDENTIFIED BY "+ password +" ;")
                cursor.execute("CREATE USER "+ userName +" @localhost "+ " IDENTIFIED BY "+ "'" +password +"'"+" ;")
                cnx.commit()
                print( "PRESS 1 TO GRANT " + userName + " ADMIN ACCESS OR 2 TO GRANT DATA ENTRY ACCESS"  )
                sel2=input()
                if sel2==1:
                    cursor.execute("GRANT  databaseAdmin@localhost TO "+ userName + "@localhost; ")
                    cnx.commit()
                elif sel2==2:
                    cursor.execute("GRANT modifier@localhost TO "+ userName + "@localhost; ")
                    cnx.commit()
                else:
                    print("INVALID ENTRY")
        else:
            return 0


    else:
         return 0


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
        print("PRESS 1 FOR HELP OR RETURN TO CONTINUE")
        if (input()=='1'):
            helper()
        print("FIRST TYPE IN THE COLUMNS YOU NEED TO SEE OR * FOR ALL COLUMNS")
        sel1=   input(" ")
        print("NOW ENTER THE DATABASE TO ACCESS THE COLUMNS FROM")
        sel2 = input()

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
        sel3=input("PRESS 1 to CONTINUE")


def helper():
    print("HERE WE ARE TO HELP")
    print("THE AVAILABLE TABLES ARE\nart_object\nartist\nborrowed\ncollections\nexhibitions\nother_art\npainting\npermanent_collections\nsculpture ")
    print("ENTer THE TABLE NAME TO GET THE AVAILABLE COLMUNS")
    sel=input()
    if sel=='art_object':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("id, artistName, year_, title, descr, epoch, country")
    elif sel=='artist':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("artistName, DoB, DofDeath, country, epoch, style, descr")
    elif sel=='borrowed':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("id, collectionName, dateBorrowed, dateReturned, rent")
    elif sel=='collections':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("collectionName, collectionType, descr, address, contactNumber, contactPerson")
    elif sel=='exhibitions':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("id, exhibition, startDate, endDate")
    elif sel=='other_art':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("id, arttype, style")
    elif sel=='painting':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("id, paint, materialUsed, style")
    elif sel=='permanent_collections':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("id, collectionName, dateAcquired, status_, cost")
    elif sel=='sculpture':
        print("THE COLUMNS ARE AS FOLLOWS:")
        print("id, material, height, weight, style")
    else:
        print("INVALID SELECTION")


if __name__ == "__main__":
    main()