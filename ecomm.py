import pymysql
import datetime
from datetime import date


def I1():
    try:
        ce = input("Enter Email: ")
        cp = input("Enter Password: ")
        cfn = input("Enter First Name: ")
        cln = input("Enter Last Name: ")
        csn = input("Enter Street No.: ")
        cpc = int(input("Enter Pincode: "))
        cc = input("Enter City: ")
        cs = input("Enter State: ")
        cphn = int(input("Enter no. of phone no.'s: "))
        ph = []
        for i in range(cphn):
            ph.append(input("Enter phone no.: "))
        mycursor.execute(
            "INSERT IGNORE INTO Customers_Address VALUES(%s, %s, %s)", (cpc, cs, cc))
        mycursor.execute(
            "INSERT INTO Customers(C_Email,C_Password,C_Fname,C_Lname,C_Street_No,C_Pin_Code) VALUES(%s, %s, %s, %s, %s, %s)", (ce, cp, cfn, cln, csn, cpc))
        for i in range(cphn):
            mycursor.execute(
                "INSERT INTO Customers_Phone VALUES(%s, %s)", (ce, ph[i]))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)


def I2():
    try:
        vg = input("Enter GSTIN no.: ")
        vph = input("Enter phone no.: ")
        vem = input("Enter Email: ")
        vf = input("Enter First Name: ")
        vl = input("Enter Last Name: ")
        mycursor.execute(
            "INSERT INTO Vendor VALUES(%s, %s, %s, %s, %s)", (vg, vph, vem, vf, vl))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)


def I3():
    try:
        wid = input("Enter ID: ")
        wcap = int(input("Enter Capacity: "))
        wsn = input("Enter Street No.: ")
        wpc = input("Enter Pincode: ")
        wc = input("Enter City: ")
        ws = input("Enter State: ")
        mycursor.execute(
            "INSERT IGNORE INTO Warehouse_Address VALUES(%s, %s, %s)", (wpc, wc, ws))
        mycursor.execute(
            "INSERT INTO Warehouse VALUES(%s, %s, %s, %s)", (wid, wsn, wpc, wcap))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)


def I4():
    try:
        ipid = input("Enter ID: ")
        iname = input("Enter Name: ")
        iv = input("Enter Vendor GSTIN: ")
        ispec = input("Enter Specifications: ")
        ip = float(input("Enter Price: "))
        iq = int(input("Enter Quantity: "))
        itn = int(input("Enter No. of Tags: "))
        tags = []
        for i in range(itn):
            tags.append(input("Enter tag: "))
        ir = int(input("Enter Rating(out of 10): "))
        irev = input("Enter Review: ")
        mycursor.execute(
            "INSERT INTO Items VALUES(%s, %s, %s, %s)", (ipid, iv, ip, iq))
        mycursor.execute(
            "INSERT INTO Items_info VALUES(%s, %s, %s, %s, %s)", (ipid, ir, irev, iname, ispec))
        for i in range(itn):
            mycursor.execute(
                "INSERT INTO Items_Tags VALUES(%s, %s)", (ipid, tags[i]))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)


def I5():
    try:
        eid = input("Enter ID: ")
        eaid = input("Enter Adhaar ID: ")
        epos = input("Enter Position: ")
        ef = input("Enter First Name: ")
        el = input("Enter Last Name: ")
        emid = input("Enter Manager ID: ")
        ephn = int(input("Enter no. of phone no.'s: "))
        ph = []
        for i in range(ephn):
            ph.append(input("Enter phone no.: "))
        if emid == "":
            emid = None
        mycursor.execute(
            "INSERT INTO Employees VALUES(%s, %s, %s, %s, %s, %s)", (eid, eaid, epos, ef, el, emid))
        for i in range(ephn):
            mycursor.execute(
                "INSERT INTO Employee_Phone VALUES(%s, %s)", (eid, ph[i]))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)


def I6():
    try:
        oid = input("Enter ID: ")
        oit = input("Enter Item ID: ")
        ounit = int(input("Enter Units Sold: "))
        ow = input("Enter Warehouse ID for this order: ")
        oeid = input("Enter Employee ID who is handling the order: ")
        oce = input("Enter Customer Email: ")
        osn = input("Enter Street No.: ")
        opc = int(input("Enter Pincode: "))
        oc = input("Enter City: ")
        os = input("Enter State: ")
        od = input("Enter date placed YYYY-MM-DD: ")
        # deriving eta as od+3 days
        ed = int(od[8])*10+int(od[9])
        em = int(od[5])*10+int(od[6])
        ey = int(od[:4])
        print(ey, em, ed)
        date = datetime.datetime(ey, em, ed)
        date += datetime.timedelta(days=3)
        oeta = str(date.date())
        ost = input("Enter delivery status: ")
        op = float(input("Enter Price: "))

        mycursor.execute(
            "INSERT IGNORE INTO Orders_Address VALUES(%s, %s,%s)", (opc, oc, os))
        mycursor.execute(
            "INSERT INTO Orders VALUES(%s, %s,%s,%s,%s)", (oid, oce, osn, opc, od))
        mycursor.execute("INSERT INTO Orders_ETA VALUES(%s, %s)", (oeta, ost))
        mycursor.execute(
            "INSERT INTO Orders_Id VALUES(%s, %s,%s)", (oid, op, oeta))
        mycursor.execute(
            "INSERT INTO Ordered_In VALUES(%s, %s,%s)", (oit, oid, ounit))
        # find vendor
        mycursor.execute("SELECT I_Vendor FROM Items WHERE I_Pid=%s", (oit))
        data = mycursor.fetchall()
        mycursor.execute(
            "INSERT INTO Sent_To VALUES(%s, %s,%s)", (oit, data[0][0], ow))
        mycursor.execute(
            "INSERT INTO Handling VALUES(%s, %s,%s)", (oeid, oid, ow))
        mycursor.execute(
            "INSERT INTO Delivered_to VALUES(%s, %s,%s)", (oce, oid, ow))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)


def Q1():
    try:
        rating = int(input('Enter minimum rating: '))
        mycursor.execute("SELECT * FROM Items_info WHERE I_Rating > %s", (rating))
        data = mycursor.fetchall()
        print(f"Items with Rating > {rating} are-->")
        print("Item ID\tItem Name")
        for i in data:
            print(i[0], "\t", i[3],sep="")
    except Exception as e:
        mydb.rollback()
        print('Error:',e)

def Q2():
    try:
        vendor = input('Enter vendor GSTIN: ')
        mycursor.execute(f'SELECT A.O_City FROM Items I,Vendor V,Ordered_In O, Orders Ord, Orders_Address A WHERE V.V_GSTIN = "{vendor}" AND I.I_Vendor = V.V_GSTIN AND O.I_Pid = I.I_Pid AND Ord.O_Id = O.O_Id AND Ord.O_Pin_Code = A.O_Pin_Code;')
        data = mycursor.fetchall()
        print(f"Cities that {vendor} has delivered to-->")
        print("City")
        for i in data:
            print(i)
    except Exception as e:
        mydb.rollback()
        print('Error:',e)

def Q3():
    try:
        meid = input('Enter manager employee Id: ')
        mycursor.execute(f'SELECT E_EID, CONCAT(E_Fname," ",E_Lname) FROM Employees WHERE Mgr_EID = "{meid}";')
        data = mycursor.fetchall()
        print(f"Employees under EID = {meid} are-->")
        print("EID\tName")
        for i in data:
            print(i[0],"\t",i[1],sep="")
    except Exception as e:
        mydb.rollback()
        print('Error:',e)

def Q4():
    try:
        city = input('Enter city name: ')
        mycursor.execute(f'SELECT W.W_ID, W.W_Street_No, W.W_Pin_Code FROM Warehouse W, Warehouse_Address A WHERE A.W_Pin_Code = W.W_Pin_Code AND A.W_City = "{city}";')
        data = mycursor.fetchall()
        print(f"Warehouses in {city} are-->")
        print("WID\tStreet No.\tPin Code")
        for i in data:
            print(i[0],"\t",i[1],"\t\t",i[2],sep="")
    except Exception as e:
        mydb.rollback()
        print('Error:',e)

def Q5():
    try:
        customer = input('Enter customer email: ')
        mycursor.execute(f'SELECT O.O_Id,SUM(I.I_Price) FROM Items I,Ordered_In Ord, Orders O WHERE O.O_CEmail = "{customer}" AND O.O_Id = Ord.O_Id AND Ord.I_Pid = I.I_Pid GROUP BY O.O_Id;')
        data = mycursor.fetchall()
        sum = 0
        print(f"Orders given by {customer} are-->")
        print("Order ID\tAmount Spent")
        for i in data:
            sum += int(i[1])
            print(i[0],"\t\t",i[1],sep="")
        print(f"Total Amount spent by {customer} is",sum)
    except Exception as e:
        mydb.rollback()
        print('Error:',e)

def U1():
    try:
        today = str(date.today())
        mycursor.execute("UPDATE Orders_ETA SET O_Status='DELIVERED' WHERE O_ETA <= %s",(today))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)
    
def U2():
    try:
        mycursor.execute("SELECT Units_sold,I_Pid FROM Ordered_In")
        data=mycursor.fetchall()
        for i in range(len(data)):
            mycursor.execute("UPDATE Items SET I_Quantity=I_Quantity-%s WHERE I_Pid=%s",data[i])
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)

def U3():
    try:
        mycursor.execute("DELETE FROM Orders WHERE O_Id in (SELECT a.O_Id from Orders_Id a,Orders_ETA b WHERE a.O_ETA=b.O_ETA AND b.O_Status='CANCELLED')")
    except Exception as e:
        mydb.rollback()
        print('Error:',e)

def U4():
    try:
        eid = input('Enter employee id: ')
        mycursor.execute("DELETE FROM Employees WHERE E_EID= %s", eid)
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print('Error:',e)

functions = {
    "I1": I1,
    "I2": I2,
    "I3": I3,
    "I4": I4,
    "I5": I5,
    "I6": I6,
    "Q1": Q1,
    "Q2": Q2,
    "Q3": Q3,
    "Q4": Q4,
    "Q5": Q5,
    "U1": U1,
    "U2": U2,
    "U3": U3,
    "U4": U4,
    "X": exit
}


cont = "y"
while(cont == "y"):
    # username = input("Enter mysql username- ")
    # passwd = input("Enter mysql password- ")
    # database = input("Enter mysql database- ")
    username = "adyansh"  # CHANGE DETAILS
    passwd = "Password1$"
    database = "TEAM_15"
    try:
        mydb = pymysql.connect(
            host="localhost", user=username, password=passwd, db=database)
        if(mydb.open):
            print("Connected to database")
        else:
            print("Failed to connect")
        with mydb.cursor() as mycursor:
            while(cont == "y"):
                print("Option  | Task")
                print("-------------------------------------------")
                print("I1.     Insert Customer")
                print("I2.     Insert Vendor")
                print("I3.     Insert Warehouse")
                print("I4.     Insert Item")
                print("I5.     Insert Employee")
                print("I6.     Insert details of Order")
                print("Q1.     Display items with Rating > x")
                print("Q2.     Display cities a vendor has delivered to")
                print("Q3.     Display all the employees under a manager")
                print("Q4.     Display Details of Warehouses in a City")
                print("Q5.     Display amount spent by a Customer on the site")
                print("U1.     Update status of order once it has been delivered")
                print("U2.     Update Quantity of a Sold Item")
                print("U3      Delete a cancelled order")
                print("U4      Fire an Employee")
                print("X.      EXIT")
                opt = input("Enter the option you want to execute - ")
                if opt != "X":
                    print("==================OUTPUT======================")
                functions[opt]()
                print("==============================================")
                cont = input("Do you want to continue?(y/n) ")
    except Exception as e:
        print('Error:',e)


"""
Queries

- Insert Customer (Customers, Customers_Phone, Customers_Address)
- Insert Vendor (Vendors)
- Insert Warehouse (Warehouse,Warehouse_Address)
- Insert Item  (Item_Tags, Items, Items_Info)
- Insert Empolyee (Employees, Employee_Phone)
- Insert Order Placed (Orders_ID, Orders_ETA, Orders, Ordered_In, Delivered_To , Handling, Sent_To)

- Display Items that have an Rating of >3
- display items with a particular tag

- view all the cities a vendor has deliveries to


- view all employees under a manager 

- count number of warehouses in a city

- find amount spent for a customer so far

Updates 
- Change O Status of Order once Item has been Delivered.
- If an Item has been ordered by a Customer decrease its I Quantity by IT Sold.
- delete a cancelled Order
- auto status update ??

"""
