import pymysql
import datetime
def I1():
    try:
        ce=input("Enter Email: ")
        cp=input("Enter Password: ")
        cfn=input("Enter First Name: ")
        cln=input("Enter Last Name: ")
        csn=input("Enter Street No.: ")
        cpc=int(input("Enter Pincode: "))
        cc=input("Enter City: ")
        cs=input("Enter State: ")
        cphn=int(input("Enter no. of phone no.'s: "))
        ph=[]
        for i in range(cphn):
            ph.append(input("Enter phone no.: "))
        mycursor.execute("INSERT INTO Customers_Address VALUES(%s, %s, %s)" , (cpc,cs,cc))
        mycursor.execute("INSERT INTO Customers(C_Email,C_Password,C_Fname,C_Lname,C_Street_No,C_Pin_Code) VALUES(%s, %s, %s, %s, %s, %s)",(ce,cp,cfn,cln,csn,cpc))
        for i in range(cphn):
            mycursor.execute("INSERT INTO Customers_Phone VALUES(%s, %s)",(ce,ph[i]))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print(e)

def I2():
    try:
        vg=input("Enter GSTIN no.: ")
        vph=input("Enter phone no.: ")
        vem=input("Enter Email: ")
        vf=input("Enter First Name: ")
        vl=input("Enter Last Name: ")
        mycursor.execute("INSERT INTO Vendor VALUES(%s, %s, %s, %s, %s)",(vg,vph,vem,vf,vl))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print(e)

def I3():
    try:
        wid=input("Enter ID: ")
        wcap=int(input("Enter Capacity: "))
        wsn=input("Enter Street No.: ")
        wpc=input("Enter Pincode: ")
        wc=input("Enter City: ")
        ws=input("Enter State: ")
        mycursor.execute("INSERT INTO Warehouse_Address VALUES(%s, %s, %s)",(wpc,wc,ws))
        mycursor.execute("INSERT INTO Warehouse VALUES(%s, %s, %s, %s)",(wid,wsn,wpc,wcap))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print(e)

def I4():
    try: 
        ipid=input("Enter ID: ")
        iname=input("Enter Name: ")
        iv=input("Enter Vendor GSTIN: ")
        ispec=input("Enter Specifications: ")
        ip=float(input("Enter Price: "))
        iq=int(input("Enter Quantity: "))
        itn=int(input("Enter No. of Tags: "))
        tags=[]
        for i in range(itn):
            tags.append(input("Enter tag: "))
        ir=int(input("Enter Rating(out of 10): "))
        irev=input("Enter Review: ")
        mycursor.execute("INSERT INTO Items VALUES(%s, %s, %s, %s)",(ipid,iv,ip,iq))
        mycursor.execute("INSERT INTO Items_info VALUES(%s, %s, %s, %s, %s)",(ipid,ir,irev,iname,ispec))
        for i in range(itn):
            mycursor.execute("INSERT INTO Items_Tags VALUES(%s, %s)",(ipid,tags[i]))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print(e)
    
def I5():
    try:
        eid=input("Enter ID: ")
        eaid=input("Enter Adhaar ID: ")
        epos=input("Enter Position: ")
        ef=input("Enter First Name: ")
        el=input("Enter Last Name: ")
        emid=input("Enter Manager ID: ")
        ephn=int(input("Enter no. of phone no.'s: "))
        ph=[]
        for i in range(ephn):
            ph.append(input("Enter phone no.: "))
        if emid=="":
            emid=None
        mycursor.execute("INSERT INTO Employees VALUES(%s, %s, %s, %s, %s, %s)",(eid,eaid,epos,ef,el,emid))
        for i in range(ephn):
            mycursor.execute("INSERT INTO Employee_Phone VALUES(%s, %s)",(eid,ph[i]))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print(e)

def I6():
    try:
        oid=input("Enter ID: ")
        oit=input("Enter Item ID: ")
        ounit=int(input("Enter Units Sold: "))
        ow=input("Enter Warehouse ID for this order: ")
        oeid=input("Enter Employee ID who is handling the order: ")
        oce=input("Enter Customer Email: ")
        osn=input("Enter Street No.: ")
        opc=int(input("Enter Pincode: "))
        oc=input("Enter City: ")
        os=input("Enter State: ")
        od=input("Enter date placed YYYY-MM-DD: ")
        # deriving eta as od+3 days
        ed=int(od[8])*10+int(od[9])
        em=int(od[5])*10+int(od[6])
        ey=int(od[:4])
        print(ey,em,ed)
        date = datetime.datetime(ey,em,ed)
        date += datetime.timedelta(days=3)
        oeta=str(date.date())
        ost=input("Enter delivery status: ")
        op=float(input("Enter Price: "))

        mycursor.execute("INSERT INTO Orders_Address VALUES(%s, %s,%s)",(opc,oc,os))
        mycursor.execute("INSERT INTO Orders VALUES(%s, %s,%s,%s,%s)",(oid,oce,osn,opc,od))
        mycursor.execute("INSERT INTO Orders_ETA VALUES(%s, %s)",(oeta,ost))
        mycursor.execute("INSERT INTO Orders_Id VALUES(%s, %s,%s)",(oid,op,oeta))
        mycursor.execute("INSERT INTO Ordered_In VALUES(%s, %s,%s)",(oit,oid,ounit))
        # find vendor
        mycursor.execute("SELECT I_Vendor FROM Items WHERE I_Pid=%s",(oit))
        data=mycursor.fetchall()
        mycursor.execute("INSERT INTO Sent_To VALUES(%s, %s,%s)",(oit,data[0][0],ow))
        mycursor.execute("INSERT INTO Handling VALUES(%s, %s,%s)",(oeid,oid,ow))
        mycursor.execute("INSERT INTO Delivered_to VALUES(%s, %s,%s)",(oce,oid,ow))
        mydb.commit()
    except Exception as e:
        mydb.rollback()
        print(e)
def Q1():
    try:
       mycursor.execute("SELECT * FROM Items_info WHERE I_Rating >3")
       data=mycursor.fetchall()
       print("Items with Rating >3 are-->")
       print("Item ID\tItem Name")
       for i in data:
        print(i[0],"\t",i[3])
    except Exception as e:
        mydb.rollback()
        print(e)

cont="y"
while(cont=="y"):
    # username = input("Enter mysql username- ")
    # passwd = input("Enter mysql password- ")
    # database = input("Enter mysql database- ")
    username="assignment"  # CHANGE DETAILS
    passwd="assignment"
    database="TEAM_15"
    try:
        mydb = pymysql.connect(host="localhost", user=username, password=passwd,db=database)
        if(mydb.open):
            print("Connected to database")
        else:
            print("Failed to connect")
        with mydb.cursor() as mycursor:
            while(cont=="y"):
                print("Option  | Task")
                print("-------------------------------------------")
                print("I1.     Insert Customer")
                print("I2.     Insert Vendor")
                print("I3.     Insert Warehouse")
                print("I4.     Insert Item")
                print("I5.     Insert Employee")
                print("I6.     Insert details of Order")
                print("Q1.     Display items with Rating >3")
                print("Q2.     Display cities a vendor has delivered to")
                print("Q3.     Display all the employees under a manager")
                print("Q4.     Display Number of Warehouses in a City")
                print("Q5.     Display amount spent by a Customer on the site")
                print("U1.     Update status of order once it has been delivered")
                print("U2.     Update Quantity of a Sold Item")
                print("U3      Delete a cancelled order")
                print("X.      EXIT")
                opt=input("Enter the option you want to execute - ")
                print("==================OUTPUT======================")
                if opt=="X":
                    exit()
                if opt=="I1":
                    I1()
                if opt=="I2":
                    I2()
                if opt=="I3":
                    I3()
                if opt=="I4":
                    I4()
                if opt=="I5":
                    I5()
                if opt=="I6":
                    I6()
                if opt=="Q1":
                    Q1()
                print("==============================================")
                cont=input("Do you want to continue?(y/n) ")
    except Exception as e:
        print(e)


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
