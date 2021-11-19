1) List all the columns of the Salespeople table. 
                                            
Query-SELECT * FROM Salespeople;
+------+---------+-----------+------+
| SNUM | SNAME   | CITY      | COMM |
+------+---------+-----------+------+
| 1001 | Peel    | London    |   12 |
| 1002 | Serres  | Sanjose   |   13 |
| 1003 | AxelRod | New York  |   10 |
| 1004 | Motika  | London    |   11 |
| 1007 | Rifkin  | Barcelona |   15 |
| 1008 | Fran    | London    |   25 |
+------+---------+-----------+------+

********************************************************************************************************************************************************

2) List all customers with a rating of 100.

Query-  SELECT * FROM Customers WHERE RATING = 100;
+------+---------+--------+--------+------+
| CNUM | CNAME   | CITY   | RATING | SNUM |
+------+---------+--------+--------+------+
| 2001 | Hoffman | London |    100 | 1001 |
| 2005 | Clemens | London |    100 | 1001 |
| 2007 | Pereira | Rome   |    100 | 1004 |
+------+---------+--------+--------+------+

********************************************************************************************************************************************************

3) Find the largest order taken by each salesperson on each date.

SELECT SNUM ,ODATE,MAX(AMT) AS Max_Amount FROM Orders GROUP BY ODATE,SNUM;
+------+------------+------------+
| SNUM | ODATE      | Max_Amount |
+------+------------+------------+
| 1001 | 1090-05-10 |       4732 |
| 1001 | 1990-03-10 |     767.19 |
| 1002 | 1990-03-10 |    5160.45 |
| 1004 | 1990-03-10 |     1900.1 |
| 1007 | 1990-03-10 |    1098.16 |
| 1002 | 1990-04-10 |      75.75 |
| 1003 | 1990-04-10 |    1713.23 |
| 1001 | 1990-05-10 |    9891.88 |
| 1002 | 1990-05-10 |    1309.95 |
+------+------------+------------+

********************************************************************************************************************************************************

4) Arrange the Order table by descending customer number.

SELECT CNUM,ONUM,AMT,ODATE,SNUM FROM Orders ORDER BY CNUM DESC;
+------+------+---------+------------+------+
| CNUM | ONUM | AMT     | ODATE      | SNUM |
+------+------+---------+------------+------+
| 2008 | 3001 |   18.69 | 1990-03-10 | 1007 |
| 2008 | 3006 | 1098.16 | 1990-03-10 | 1007 |
| 2007 | 3002 |  1900.1 | 1990-03-10 | 1004 |
| 2006 | 3008 |    4732 | 1090-05-10 | 1001 |
| 2006 | 3011 | 9891.88 | 1990-05-10 | 1001 |
| 2004 | 3007 |   75.75 | 1990-04-10 | 1002 |
| 2004 | 3010 | 1309.95 | 1990-05-10 | 1002 |
| 2003 | 3005 | 5160.45 | 1990-03-10 | 1002 |
| 2002 | 3009 | 1713.23 | 1990-04-10 | 1003 |
| 2001 | 3003 |  767.19 | 1990-03-10 | 1001 |
+------+------+---------+------------+------+

********************************************************************************************************************************************************

5) Find which salespeople currently have orders in the order table.

SELECT DISTINCT S.SNAME FROM Salespeople S,Orders O WHERE S.SNUM=O.SNUM;

+---------+
| SNAME   |
+---------+
| Rifkin  |
| Motika  |
| Peel    |
| Serres  |
| AxelRod |
+---------+

********************************************************************************************************************************************************

6) List names of all customers matched with the salespeople serving them.

SELECT S.SNAME,S.CITY,C.CNAME FROM Salespeople S,Customers C WHERE S.SNUM=C.SNUM;
+---------+-----------+----------+
| SNAME   | CITY      | CNAME    |
+---------+-----------+----------+
| Peel    | London    | Hoffman  |
| AxelRod | New York  | Giovanni |
| Serres  | Sanjose   | Liu      |
| Serres  | Sanjose   | Grass    |
| Peel    | London    | Clemens  |
| Rifkin  | Barcelona | Cisneros |
| Motika  | London    | Pereira  |
+---------+-----------+----------+

********************************************************************************************************************************************************

7) Find the names and numbers of all salespeople who have more than one customer.

SELECT C.SNUM,S.SNAME,COUNT(*) AS Cust_Count FROM Customers C,Salespeople S WHERE C.SNUM=S.SNUM GROUP BY C.SNUM;
+------+---------+------------+
| SNUM | SNAME   | Cust_Count |
+------+---------+------------+
| 1001 | Peel    |          2 |
| 1002 | Serres  |          2 |
| 1003 | AxelRod |          1 |
| 1004 | Motika  |          1 |
| 1007 | Rifkin  |          1 |
+------+---------+------------+


********************************************************************************************************************************************************

8) Count the orders of each of the salespeople and output the results in descending order.
                           
SELECT C.SNUM,S.SNAME,COUNT(*) AS Order_Count FROM Orders O,Customers C,Salespeople S WHERE S.SNUM=C.SNUM AND O.CNUM=C.CNUM GROUP BY SNUM ORDER BY COUNT(ONUM) DESC;
+------+---------+-------------+
| SNUM | SNAME   | Order_Count |
+------+---------+-------------+
| 1002 | Serres  |           3 |
| 1007 | Rifkin  |           2 |
| 1003 | AxelRod |           1 |
| 1004 | Motika  |           1 |
| 1001 | Peel    |           1 |
+------+---------+-------------+



********************************************************************************************************************************************************

9) List the customer table if and only if one or more of the customers in the Customer table are located in SanJose.

SELECT * FROM Customers WHERE CITY IN(SELECT CITY FROM Customers WHERE CITY='SanJose' GROUP BY CITY HAVING COUNT(CITY)>1);
+------+----------+---------+--------+------+
| CNUM | CNAME    | CITY    | RATING | SNUM |
+------+----------+---------+--------+------+
| 2003 | Liu      | SanJose |    200 | 1002 |
| 2006 | Cisneros | SanJose |    300 | 1007 |
+------+----------+---------+--------+------+

********************************************************************************************************************************************************

10) Match salespeople to customers according to what city they live in.

SELECT S.SNAME,C.CNAME,S.CITY FROM Salespeople S,Customers C WHERE S.CITY=C.CITY;
+--------+----------+---------+
| SNAME  | CNAME    | CITY    |
+--------+----------+---------+
| Peel   | Hoffman  | London  |
| Motika | Hoffman  | London  |
| Fran   | Hoffman  | London  |
| Serres | Liu      | Sanjose |
| Peel   | Clemens  | London  |
| Motika | Clemens  | London  |
| Fran   | Clemens  | London  |
| Serres | Cisneros | Sanjose |
+--------+----------+---------+

********************************************************************************************************************************************************

11) Find all the customers in SanJose who have a rating above 200.

SELECT * FROM Customers WHERE(CITY='SanJose' AND RATING>=200);
+------+----------+---------+--------+------+
| CNUM | CNAME    | CITY    | RATING | SNUM |
+------+----------+---------+--------+------+
| 2003 | Liu      | SanJose |    200 | 1002 |
| 2006 | Cisneros | SanJose |    300 | 1007 |
+------+----------+---------+--------+------+

********************************************************************************************************************************************************

12) List the names and commissions of all salespeople in London. 

Query- SELECT DISTINCT SNAME,COMM,CITY FROM Salespeople WHERE CITY='london';
 +--------+------+--------+
| SNAME  | COMM | CITY   |
+--------+------+--------+
| Peel   |   12 | London |
| Motika |   11 | London |
| Fran   |   25 | London |
+--------+------+--------+

********************************************************************************************************************************************************

13) List all the orders of Salesperson Motika from the orders table.

SELECT O.ONUM,O.ODATE,O.AMT FROM Orders O,Salespeople S WHERE O.SNUM=S.SNUM AND S.SNAME='Motika';
+------+------------+--------+
| ONUM | ODATE      | AMT    |
+------+------------+--------+
| 3002 | 1990-03-10 | 1900.1 |
+------+------------+--------+

********************************************************************************************************************************************************

14) Find all customers who booked orders on October 3.

SELECT DISTINCT C.CNUM,C.CNAME,C.CITY,C.RATING FROM Customers C,Orders O WHERE O.SNUM=C.SNUM AND O.ODATE='1990-03-10';
+------+----------+---------+--------+
| CNUM | CNAME    | CITY    | RATING |
+------+----------+---------+--------+
| 2006 | Cisneros | SanJose |    300 |
| 2007 | Pereira  | Rome    |    100 |
| 2001 | Hoffman  | London  |    100 |
| 2005 | Clemens  | London  |    100 |
| 2003 | Liu      | SanJose |    200 |
| 2004 | Grass    | Berlin  |    300 |
+------+----------+---------+--------+


********************************************************************************************************************************************************

15) Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was not at least 2000 above
the maximum Amount.

SELECT ODATE,SUM(AMT) AS Total_Amount FROM Orders GROUP BY ODATE;
+------------+--------------------+
| ODATE      | Total_Amount       |
+------------+--------------------+
| 1090-05-10 |               4732 |
| 1990-03-10 |  8944.590208053589 |
| 1990-04-10 |   1788.97998046875 |
| 1990-05-10 | 11201.829833984375 |
+------------+--------------------+

********************************************************************************************************************************************************

16) Select all orders that had amounts that were greater than at least one of the orders from October 6.

select * from Orders where AMT > (select min(AMT) from Orders where ODATE = '1990-04-10');
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
| 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
| 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
| 3008 |    4732 | 1090-05-10 | 2006 | 1001 |
| 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
| 3010 | 1309.95 | 1990-05-10 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-05-10 | 2006 | 1001 |
+------+---------+------------+------+------+

********************************************************************************************************************************************************

17) Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.

 SELECT * FROM Salespeople S WHERE EXISTS(SELECT * FROM Customers C WHERE C.SNUM=S.SNUM AND C.RATING=300);
+------+--------+-----------+------+
| SNUM | SNAME  | CITY      | COMM |
+------+--------+-----------+------+
| 1002 | Serres | Sanjose   |   13 |
| 1007 | Rifkin | Barcelona |   15 |
+------+--------+-----------+------+

********************************************************************************************************************************************************

18) Find all customers whose cnum is 1000 above the snum of Serres.

select C.CNUM,C.CNAME FROM Customers C,Salespeople S WHERE S.SNUM=C.SNUM and C.CNUM>S.SNUM+1000;
+------+---------+
| CNUM | CNAME   |
+------+---------+
| 2003 | Liu     |
| 2004 | Grass   |
| 2005 | Clemens |
| 2007 | Pereira |
+------+---------+

********************************************************************************************************************************************************

19) Give the salespeople’s commissions as percentages instead of decimal numbers.

SELECT SNAME,COMM*100 AS COMM FROM Salespeople;
+---------+------+
| SNAME   | COMM |
+---------+------+
| Peel    | 1200 |
| Serres  | 1300 |
| AxelRod | 1000 |
| Motika  | 1100 |
| Rifkin  | 1500 |
| Fran    | 2500 |
+---------+------+

********************************************************************************************************************************************************

20) Find the largest order taken by each salesperson on each date, eliminating those Maximum orders, which are less than 3000.

SELECT SNUM,ODATE,MAX(AMT) AS Total_Amount FROM Orders GROUP BY ODATE,SNUM HAVING MAX(AMT)>3000;
+------+------------+--------------+
| SNUM | ODATE      | Total_Amount |
+------+------------+--------------+
| 1001 | 1090-05-10 |         4732 |
| 1002 | 1990-03-10 |      5160.45 |
| 1001 | 1990-05-10 |      9891.88 |
+------+------------+--------------+

********************************************************************************************************************************************************

21) List all the largest orders for October 3, for each salesperson.

SELECT MAX(AMT) AS Total_Amout FROM Orders O,Salespeople S WHERE O.SNUM=S.SNUM AND ODATE='1990-03-10';
+-----------------+
| Total_Amout     |
+-----------------+
| 5160.4501953125 |
+-----------------+


********************************************************************************************************************************************************

22) Find all customers located in cities where Serres has customers.

SELECT C.CNAME,C.CITY FROM Customers C,Salespeople S WHERE C.CITY=S.CITY AND S.SNAME='Serres';
+----------+---------+
| CNAME    | CITY    |
+----------+---------+
| Liu      | SanJose |
| Cisneros | SanJose |
+----------+---------+


********************************************************************************************************************************************************

23) Select all customers with a rating above 200.

Query-SELECT * FROM Customers WHERE RATING>=200;
+------+----------+---------+--------+------+
| CNUM | CNAME    | CITY    | RATING | SNUM |
+------+----------+---------+--------+------+
| 2002 | Giovanni | Rome    |    200 | 1003 |
| 2003 | Liu      | SanJose |    200 | 1002 |
| 2004 | Grass    | Berlin  |    300 | 1002 |
| 2006 | Cisneros | SanJose |    300 | 1007 |
+------+----------+---------+--------+------+

********************************************************************************************************************************************************

24) Count the number of salespeople currently having orders in the orders table.

SELECT S.SNAME ,COUNT(O.ONUM) AS Count_Order FROM Salespeople S,Customers C,Orders O WHERE S.SNUM=C.SNUM  AND C.CNUM=O.CNUM GROUP BY S.SNAME;
+---------+-------------+
| SNAME   | Count_Order |
+---------+-------------+
| AxelRod |           1 |
| Motika  |           1 |
| Peel    |           1 |
| Rifkin  |           2 |
| Serres  |           3 |
+---------+-------------+

********************************************************************************************************************************************************

25) Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name,salesperson’s name
    and the salesperson’s rate of commission.

 SELECT C.CNAME,S.SNAME,S.COMM FROM Salespeople S,Customers C WHERE S.SNUM=C.SNUM AND S.COMM>12;
+----------+--------+------+
| CNAME    | SNAME  | COMM |
+----------+--------+------+
| Liu      | Serres |   13 |
| Grass    | Serres |   13 |
| Cisneros | Rifkin |   15 |
+----------+--------+------+

********************************************************************************************************************************************************

26) Find salespeople who have multiple customers.

SELECT SNUM,COUNT(SNUM) AS Count_SalesNumber FROM Customers GROUP BY SNUM HAVING COUNT(SNUM)>1;
+------+-------------------+
| SNUM | Count_SalesNumber |
+------+-------------------+
| 1001 |                 2 |
| 1002 |                 2 |
+------+-------------------+

********************************************************************************************************************************************************
27) Find salespeople with customers located in their own cities.

SELECT S.SNAME,C.CNAME,S.CITY FROM Salespeople S,Customers C WHERE S.CITY=C.CITY ORDER BY CITY;
+--------+----------+---------+
| SNAME  | CNAME    | CITY    |
+--------+----------+---------+
| Peel   | Hoffman  | London  |
| Fran   | Hoffman  | London  |
| Peel   | Clemens  | London  |
| Fran   | Clemens  | London  |
| Motika | Hoffman  | London  |
| Motika | Clemens  | London  |
| Serres | Cisneros | Sanjose |
| Serres | Liu      | Sanjose |
+--------+----------+---------+

********************************************************************************************************************************************************

28) Find all salespeople whose name starts with ‘P’ and fourth character is ‘I’.

SELECT * FROM Salespeople WHERE SNAME LIKE 'P__L';
+------+-------+--------+------+
| SNUM | SNAME | CITY   | COMM |
+------+-------+--------+------+
| 1001 | Peel  | London |   12 |
+------+-------+--------+------+

********************************************************************************************************************************************************

29) Write a query that uses a subquery to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.

 SELECT O.* FROM Orders O,Customers C WHERE O.CNUM=C.CNUM AND C.CNAME='Cisneros';
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3008 |    4732 | 1090-05-10 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-05-10 | 2006 | 1001 |
+------+---------+------------+------+------+

********************************************************************************************************************************************************

30) Find the largest orders for Serres and Rifkin.

SELECT SNUM,MAX(AMT) AS Total_Amount FROM Orders GROUP BY SNUM HAVING SNUM IN(SELECT SNUM FROM Salespeople WHERE SNAME='Serres' OR SNAME= 'Rifkin');
+------+--------------+
| SNUM | Total_Amount |
+------+--------------+
| 1002 |      5160.45 |
| 1007 |      1098.16 |
+------+--------------+


*********************************************************************************************************************************************************

31) Sort the salespeople table in the following order: snum, sname, commission, city.

SELECT SNUM,SNAME,COMM,CITY FROM Salespeople;
+------+---------+------+-----------+
| SNUM | SNAME   | COMM | CITY      |
+------+---------+------+-----------+
| 1001 | Peel    |   12 | London    |
| 1002 | Serres  |   13 | Sanjose   |
| 1003 | AxelRod |   10 | New York  |
| 1004 | Motika  |   11 | London    |
| 1007 | Rifkin  |   15 | Barcelona |
| 1008 | Fran    |   25 | London    |
+------+---------+------+-----------+

********************************************************************************************************************************************************

32) Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.

SELECT CNAME FROM Customers WHERE CNAME BETWEEN 'A' AND 'G' ORDER BY CNAME ;
+----------+
| CNAME    |
+----------+
| Cisneros |
| Clemens  |
+----------+

********************************************************************************************************************************************************

33) Select all the possible combinations of customers you can assign.

SELECT C.CNAME,S.SNAME FROM Customers C,Salespeople S WHERE C.SNUM=S.SNUM;
+----------+---------+
| CNAME    | SNAME   |
+----------+---------+
| Hoffman  | Peel    |
| Giovanni | AxelRod |
| Liu      | Serres  |
| Grass    | Serres  |
| Clemens  | Peel    |
| Cisneros | Rifkin  |
| Pereira  | Motika  |
+----------+---------+

********************************************************************************************************************************************************

34) Select all orders that are greater than the average for October 4.

SELECT * FROM Orders WHERE AMT>(SELECT AVG(AMT) FROM Orders WHERE ODATE='1990-04-10');
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
| 3008 |    4732 | 1090-05-10 | 2006 | 1001 |
| 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
| 3010 | 1309.95 | 1990-05-10 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-05-10 | 2006 | 1001 |
+------+---------+------------+------+------+

********************************************************************************************************************************************************

35) Write a select command using correlated subquery that selects the names and numbers of all customers with ratings equal to the maximumfor their city.

SELECT CNUM,CNAME,RATING FROM Customers WHERE RATING IN(SELECT MAX(RATING) FROM Customers GROUP BY CITY);
+------+----------+--------+
| CNUM | CNAME    | RATING |
+------+----------+--------+
| 2001 | Hoffman  |    100 |
| 2002 | Giovanni |    200 |
| 2003 | Liu      |    200 |
| 2004 | Grass    |    300 |
| 2005 | Clemens  |    100 |
| 2006 | Cisneros |    300 |
| 2007 | Pereira  |    100 |
+------+----------+--------+

********************************************************************************************************************************************************

36) Write a query that totals the orders for each day and places the results in descending order.

SELECT SUM(AMT) AS AMT,ODATE FROM Orders GROUP BY ODATE ORDER BY AMT DESC;
+--------------------+------------+
| AMT                | ODATE      |
+--------------------+------------+
| 11201.829833984375 | 1990-05-10 |
|  8944.590208053589 | 1990-03-10 |
|               4732 | 1090-05-10 |
|   1788.97998046875 | 1990-04-10 |
+--------------------+------------+

********************************************************************************************************************************************************

37) Write a select command that produces the rating followed by the name of each customer in SanJose.

SELECT C.CNAME,C.RATING FROM Customers C,Salespeople S WHERE S.SNUM=C.SNUM AND S.CITY='SaNJose';
+-------+--------+
| CNAME | RATING |
+-------+--------+
| Liu   |    200 |
| Grass |    300 |
+-------+--------+

********************************************************************************************************************************************************

39) Find all orders with above average amounts for their customers.

SELECT ONUM,AMT FROM Orders WHERE AMT >(SELECT AVG(AMT) FROM Orders);
+------+---------+
| ONUM | AMT     |
+------+---------+
| 3005 | 5160.45 |
| 3008 |    4732 |
| 3011 | 9891.88 |
+------+---------+

********************************************************************************************************************************************************

40) Write a query that selects the highest rating in each city.

SELECT CITY,MAX(RATING) AS RATING FROM Customers GROUP BY CITY;
+---------+--------+
| CITY    | RATING |
+---------+--------+
| Berlin  |    300 |
| London  |    100 |
| Rome    |    200 |
| SanJose |    300 |
+---------+--------+

********************************************************************************************************************************************************

41) Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100.00.

SELECT S.SNAME,S.COMM*O.AMT AS CALCULATE FROM Salespeople S,Customers C,Orders O WHERE S.SNUM=C.SNUM AND C.CNUM=O.CNUM AND C.RATING>100;
+---------+--------------------+
| SNAME   | CALCULATE          |
+---------+--------------------+
| AxelRod |   17132.2998046875 |
| Serres  |   67085.8525390625 |
| Serres  |             984.75 |
| Serres  | 17029.349365234375 |
| Rifkin  |              70980 |
| Rifkin  |  148378.1982421875 |
+---------+--------------------+

********************************************************************************************************************************************************

42) Count the customers with ratings above SanJose’s average.

SELECT COUNT(CITY) AS COUNT FROM Customers WHERE RATING >(SELECT AVG(RATING) FROM Customers WHERE CITY='SanJose');
+-------+
| COUNT |
+-------+
|     2 |
+-------+

********************************************************************************************************************************************************

43) Find all salespeople that are located in either Barcelona or London.

Query-SELECT * FROM Salespeople WHERE CITY IN('london' , 'barcelona');
+------+--------+-----------+------+
| SNUM | SNAME  | CITY      | COMM |
+------+--------+-----------+------+
| 1001 | Peel   | London    |   12 |
| 1004 | Motika | London    |   11 |
| 1007 | Rifkin | Barcelona |   15 |
| 1008 | Fran   | London    |   25 |
+------+--------+-----------+------+

********************************************************************************************************************************************************

44) Find all salespeople with only one customer.

SELECT SNUM FROM Customers GROUP BY SNUM HAVING COUNT(*)=1;
+------+
| SNUM |
+------+
| 1003 |
| 1004 |
| 1007 |
+------+

********************************************************************************************************************************************************

45) Write a query that joins the Customer table to itself to find all pairs or customers served by a single salesperson.

SELECT C1.CNAME,C2.CNAME,S.SNAME FROM Customers C1,Customers C2,Salespeople S WHERE C1.SNUM=C2.SNUM AND C1.SNUM=S.SNUM;
+----------+----------+---------+
| CNAME    | CNAME    | SNAME   |
+----------+----------+---------+
| Hoffman  | Hoffman  | Peel    |
| Clemens  | Hoffman  | Peel    |
| Giovanni | Giovanni | AxelRod |
| Liu      | Liu      | Serres  |
| Grass    | Liu      | Serres  |
| Liu      | Grass    | Serres  |
| Grass    | Grass    | Serres  |
| Hoffman  | Clemens  | Peel    |
| Clemens  | Clemens  | Peel    |
| Cisneros | Cisneros | Rifkin  |
| Pereira  | Pereira  | Motika  |
+----------+----------+---------+

********************************************************************************************************************************************************

46) Write a query that will give you all orders for more than $1000.00.

Query- SELECT * FROM Orders WHERE AMT>1000;
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
| 3008 |    4732 | 1090-05-10 | 2006 | 1001 |
| 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
| 3010 | 1309.95 | 1990-05-10 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-05-10 | 2006 | 1001 |
+------+---------+------------+------+------+

********************************************************************************************************************************************************

47) Write a query that lists each order number followed by the name of the customer who made that order.

SELECT O.ONUM,C.CNAME FROM Orders O,Customers C WHERE C.CNUM=O.CNUM;
+------+----------+
| ONUM | CNAME    |
+------+----------+
| 3003 | Hoffman  |
| 3009 | Giovanni |
| 3005 | Liu      |
| 3007 | Grass    |
| 3010 | Grass    |
| 3008 | Cisneros |
| 3011 | Cisneros |
| 3002 | Pereira  |
+------+----------+

********************************************************************************************************************************************************

48) Write a query that selects all the customers whose ratings are equal to or greater than ANY(in the SQL sense) of ‘Serres’.

SELECT CNAME FROM Customers WHERE RATING >= ANY(SELECT RATING FROM Customers WHERE SNUM=(SELECT SNUM FROM Salespeople WHERE SNAME='Serres'));
+----------+
| CNAME    |
+----------+
| Giovanni |
| Liu      |
| Grass    |
| Cisneros |
+----------+

********************************************************************************************************************************************************

49) Write two queries that will produce all orders taken on October 3 or October 4.

SELECT * FROM Orders WHERE ODATE='1990-03-10' OR ODATE='1990-04-10';
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-03-10 | 2008 | 1007 |
| 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
| 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
| 3005 | 5160.45 | 1990-03-10 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-03-10 | 2008 | 1007 |
| 3007 |   75.75 | 1990-04-10 | 2004 | 1002 |
| 3009 | 1713.23 | 1990-04-10 | 2002 | 1003 |
+------+---------+------------+------+------+

********************************************************************************************************************************************************

50) Find only those customers whose ratings are higher than every customer in Rome.

 SELECT CNAME FROM Customers WHERE RATING >(SELECT MAX(RATING) FROM Customers WHERE CITY='ROME');
+----------+
| CNAME    |
+----------+
| Grass    |
| Cisneros |
+----------+

********************************************************************************************************************************************************

51) Write a query on the Customers table whose output will exclude all customers with a rating<= 100.00, unless they are located in Rome.

SELECT * FROM Customers WHERE (RATING<=100 AND CITY='Rome') OR RATING>100;
+------+----------+---------+--------+------+
| CNUM | CNAME    | CITY    | RATING | SNUM |
+------+----------+---------+--------+------+
| 2002 | Giovanni | Rome    |    200 | 1003 |
| 2003 | Liu      | SanJose |    200 | 1002 |
| 2004 | Grass    | Berlin  |    300 | 1002 |
| 2006 | Cisneros | SanJose |    300 | 1007 |
| 2007 | Pereira  | Rome    |    100 | 1004 |
+------+----------+---------+--------+------+

********************************************************************************************************************************************************

52) Find all rows from the customer’s table for which the salesperson number is 1001.

SELECT C.CNUM,C.CNAME,C.CITY,C.RATING,C.SNUM FROM Customers C,Salespeople S WHERE S.SNUM=C.SNUM AND S.SNUM=1001;
+------+---------+--------+--------+------+
| CNUM | CNAME   | CITY   | RATING | SNUM |
+------+---------+--------+--------+------+
| 2001 | Hoffman | London |    100 | 1001 |
| 2005 | Clemens | London |    100 | 1001 |
+------+---------+--------+--------+------+

********************************************************************************************************************************************************

53) Find the total amount in orders for each salesperson where their total of amounts are greater than the amount of the largest order in the table.

SELECT SNAME, MIN(AMT) as Amount FROM Salespeople S, Orders O where S.SNUM = O.SNUM  group by SNAME;
+---------+---------+
| SNAME   | Amount  |
+---------+---------+
| AxelRod | 1713.23 |
| Motika  |  1900.1 |
| Peel    |  767.19 |
| Rifkin  |   18.69 |
| Serres  |   75.75 |
+---------+---------+

********************************************************************************************************************************************************

54) Write a query that selects all orders save those with zeroes or NULL in the amount file.

SELECT * FROM Orders WHERE AMT IS NULL OR AMT=0;
Empty set (0.00 sec)

********************************************************************************************************************************************************

55) Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a
rating of less than 200.

SELECT S.SNAME,C.CNAME,C.RATING FROM Salespeople S,Customers C WHERE C.SNUM=S.SNUM AND C.RATING>200;
+--------+----------+--------+
| SNAME  | CNAME    | RATING |
+--------+----------+--------+
| Serres | Grass    |    300 |
| Rifkin | Cisneros |    300 |
+--------+----------+--------+

********************************************************************************************************************************************************

56) Find all salespeople name27) Find salespeople with customers located in their own cities. and commission.

SELECT SNAME,COMM FROM Salespeople ;
+---------+------+
| SNAME   | COMM |
+---------+------+
| Peel    |   12 |
| Serres  |   13 |
| AxelRod |   10 |
| Motika  |   11 |
| Rifkin  |   15 |
| Fran    |   25 |
+---------+------+

********************************************************************************************************************************************************

57) Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s cnum
rather than his rating, so that it would still be usable if his rating is changed.

********************************************************************************************************************************************************

58) Find all salespeople for whom there are customers that follow them in alphabetical order.

SELECT C.CNAME,S.SNAME FROM Customers C,Salespeople S WHERE C.SNUM=S.SNUM GROUP BY S.SNAME,C.CNAME HAVING C.CNAME>=S.SNAME;
+----------+---------+
| CNAME    | SNAME   |
+----------+---------+
| Giovanni | AxelRod |
| Pereira  | Motika  |
+----------+---------+


********************************************************************************************************************************************************

59) Write a query that produces the names and ratings of all customers who have average orders.

SELECT CNAME,RATING FROM Customers WHERE RATING>(SELECT AVG(RATING) FROM Customers);
+----------+--------+
| CNAME    | RATING |
+----------+--------+
| Giovanni |    200 |
| Liu      |    200 |
| Grass    |    300 |
| Cisneros |    300 |
+----------+--------+

********************************************************************************************************************************************************
60) Find the SUM of all Amounts from the orders table.

SELECT SUM(AMT) AS Total_Amount FROM Orders;
+--------------------+
| Total_Amount       |
+--------------------+
| 26667.400022506714 |
+--------------------+

********************************************************************************************************************************************************

61) Write a SELECT command that produces the order number, amount, and the date from rows in the order table.

SELECT ONUM,AMT,ODATE FROM Orders;
+------+---------+------------+
| ONUM | AMT     | ODATE      |
+------+---------+------------+
| 3001 |   18.69 | 1990-03-10 |
| 3002 |  1900.1 | 1990-03-10 |
| 3003 |  767.19 | 1990-03-10 |
| 3005 | 5160.45 | 1990-03-10 |
| 3006 | 1098.16 | 1990-03-10 |
| 3007 |   75.75 | 1990-04-10 |
| 3008 |    4732 | 1090-05-10 |
| 3009 | 1713.23 | 1990-04-10 |
| 3010 | 1309.95 | 1990-05-10 |
| 3011 | 9891.88 | 1990-05-10 |
+------+---------+------------+

********************************************************************************************************************************************************

62) Count the number of non NULL rating fields in the Customers table (including repeats).

SELECT COUNT(RATING) AS COUNT FROM Customers;
+-------+
| COUNT |
+-------+
|     7 |
+-------+

********************************************************************************************************************************************************

63) Write a query that gives the names of both the salesperson and the customer for each order after the order number.

SELECT C.CNAME,S.SNAME,O.ONUM FROM Customers C,Orders O,Salespeople S WHERE S.SNUM=C.SNUM AND C.CNUM=O.CNUM;
+----------+---------+------+
| CNAME    | SNAME   | ONUM |
+----------+---------+------+
| Hoffman  | Peel    | 3003 |
| Giovanni | AxelRod | 3009 |
| Liu      | Serres  | 3005 |
| Grass    | Serres  | 3007 |
| Grass    | Serres  | 3010 |
| Cisneros | Rifkin  | 3008 |
| Cisneros | Rifkin  | 3011 |
| Pereira  | Motika  | 3002 |
+----------+---------+------+

********************************************************************************************************************************************************

64) List the commissions of all salespeople servicing customers in London.

SELECT DISTINCT S.SNAME,S.SNUM,S.COMM FROM Salespeople S,Customers C WHERE S.SNUM=C.SNUM AND C.CITY='London';
+-------+------+------+
| SNAME | SNUM | COMM |
+-------+------+------+
| Peel  | 1001 |   12 |
+-------+------+------+

********************************************************************************************************************************************************

65) Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.

SELECT S.SNAME, S.CITY, C.CNAME, C.CITY AS Cus_City FROM Salespeople S,Customers C WHERE S.SNUM=C.SNUM AND S.CITY!=C.CITY;
+---------+-----------+----------+----------+
| SNAME   | CITY      | CNAME    | Cus_City |
+---------+-----------+----------+----------+
| AxelRod | New York  | Giovanni | Rome     |
| Serres  | Sanjose   | Grass    | Berlin   |
| Rifkin  | Barcelona | Cisneros | SanJose  |
| Motika  | London    | Pereira  | Rome     |
+---------+-----------+----------+----------+

********************************************************************************************************************************************************
66) Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.

SELECT S.SNAME,CITY FROM Salespeople S WHERE EXISTS(SELECT * FROM Customers C WHERE C.SNUM!=S.SNUM AND C.CITY=S.CITY);
+--------+---------+
| SNAME  | CITY    |
+--------+---------+
| Serres | Sanjose |
| Motika | London  |
| Fran   | London  |
+--------+---------+

********************************************************************************************************************************************************

67) Write a query that selects all customers serviced by Peel or Motika. (Hint: The snum field relates the 2 tables to one another.)

SELECT C.CNAME FROM Customers C,Salespeople S WHERE C.SNUM=S.SNUM AND (S.SNAME='Motika' OR S.SNAME='Peel');
+---------+
| CNAME   |
+---------+
| Hoffman |
| Clemens |
| Pereira |
+---------+

********************************************************************************************************************************************************

68) Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should
be counted only once.)

SELECT ODATE,COUNT(DISTINCT SNUM) AS COUNT FROM Orders GROUP BY ODATE;
+------------+-------+
| ODATE      | COUNT |
+------------+-------+
| 1090-05-10 |     1 |
| 1990-03-10 |     4 |
| 1990-04-10 |     2 |
| 1990-05-10 |     2 |
+------------+-------+

********************************************************************************************************************************************************

69) Find all orders attributed to salespeople who live in London.

SELECT O.* FROM Orders O,Salespeople S WHERE O.SNUM=S.SNUM AND S.CITY='London';
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3002 |  1900.1 | 1990-03-10 | 2007 | 1004 |
| 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
| 3008 |    4732 | 1090-05-10 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-05-10 | 2006 | 1001 |
+------+---------+------------+------+------+

********************************************************************************************************************************************************

70) Find all orders by customers not located in the same cities as their salespeople.

SELECT S.SNAME,S.CITY,C.CNAME,C.CITY FROM Salespeople S,Customers C  WHERE S.SNUM=C.SNUM AND S.CITY!=C.CITY;
+---------+-----------+----------+---------+
| SNAME   | CITY      | CNAME    | CITY    |
+---------+-----------+----------+---------+
| AxelRod | New York  | Giovanni | Rome    |
| Serres  | Sanjose   | Grass    | Berlin  |
| Rifkin  | Barcelona | Cisneros | SanJose |
| Motika  | London    | Pereira  | Rome    |
+---------+-----------+----------+---------+

********************************************************************************************************************************************************

71) Find all salespeople who have customers with more than one current order.

SELECT DISTINCT SNUM FROM Orders WHERE CNUM IN(SELECT CNUM FROM Orders GROUP BY CNUM HAVING COUNT(CNUM)>1);
+------+
| SNUM |
+------+
| 1007 |
| 1002 |
| 1001 |
+------+

********************************************************************************************************************************************************

72) Write a query that extracts from the customer’s table every customer assigned to a salesperson, who is currently having at least one another
customer(besides the customer being selected) with orders in the Orders Table.

********************************************************************************************************************************************************

73) Write a query on the customer’s table that will find the highest rating in each city. Put the output in this form: for the city (city), the highest
rating is (rating).

SELECT CITY,MAX(RATING) AS hIGHEST_RATING FROM Customers GROUP BY CITY;
+---------+----------------+
| CITY    | hIGHEST_RATING |
+---------+----------------+
| Berlin  |            300 |
| London  |            100 |
| Rome    |            200 |
| SanJose |            300 |
+---------+----------------+

********************************************************************************************************************************************************

74) Write a query that will produce the snum values of all salespeople with orders, having amt greater than 1000 in the Orders Table(without repeats).

SELECT DISTINCT S.SNUM,O.AMT FROM Orders O,Salespeople S WHERE O.SNUM=S.SNUM AND O.AMT>1000;
+------+---------+
| SNUM | AMT     |
+------+---------+
| 1004 |  1900.1 |
| 1002 | 5160.45 |
| 1007 | 1098.16 |
| 1001 |    4732 |
| 1003 | 1713.23 |
| 1002 | 1309.95 |
| 1001 | 9891.88 |
+------+---------+

********************************************************************************************************************************************************

75) Write a query that lists customers in a descending order of rating. Output the rating field first, followed by the customer’s names and numbers.

SELECT RATING,CNAME, CNUM FROM Customers ORDER BY RATING DESC;
+--------+----------+------+
| RATING | CNAME    | CNUM |
+--------+----------+------+
|    300 | Grass    | 2004 |
|    300 | Cisneros | 2006 |
|    200 | Giovanni | 2002 |
|    200 | Liu      | 2003 |
|    100 | Hoffman  | 2001 |
|    100 | Clemens  | 2005 |
|    100 | Pereira  | 2007 |
+--------+----------+------+

********************************************************************************************************************************************************

76) Find the average commission for salespeople in London.

SELECT CITY,AVG(COMM) AS Commission FROM Salespeople WHERE CITY ='London';
+--------+------------+
| CITY   | Commission |
+--------+------------+
| London |    16.0000 |
+--------+------------+

********************************************************************************************************************************************************

77) Find all orders credited to the same salesperson who services Hoffman.(cnum 2001).

SELECT O.* FROM Orders O,Customers C WHERE O.SNUM=C.SNUM AND C.CNUM=2001;
+------+---------+------------+------+------+
| ONUM | AMT     | ODATE      | CNUM | SNUM |
+------+---------+------------+------+------+
| 3003 |  767.19 | 1990-03-10 | 2001 | 1001 |
| 3008 |    4732 | 1090-05-10 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-05-10 | 2006 | 1001 |
+------+---------+------------+------+------+

********************************************************************************************************************************************************

78) Find all salespeople whose commission is in between 0.10 and 0.12(both inclusive).

SELECT * FROM Salespeople WHERE (COMM>=10 AND COMM<=12);
+------+---------+----------+------+
| SNUM | SNAME   | CITY     | COMM |
+------+---------+----------+------+
| 1001 | Peel    | London   |   12 |
| 1003 | AxelRod | New York |   10 |
| 1004 | Motika  | London   |   11 |
+------+---------+----------+------+

********************************************************************************************************************************************************

79) Write a query that will give you the names and cities of all salespeople in London with a commission above 0.10.

SELECT SNAME,CITY FROM Salespeople WHERE(CITY='London' AND COMM>0.10);
+--------+--------+
| SNAME  | CITY   |
+--------+--------+
| Peel   | London |
| Motika | London |
| Fran   | London |
+--------+--------+

********************************************************************************************************************************************************

80) Write a query that selects each customer’s smallest order.

SELECT CNUM,MIN(AMT) AS Amount FROM Orders GROUP BY CNUM;
+------+--------------------+
| CNUM | Amount             |
+------+--------------------+
| 2001 |  767.1900024414062 |
| 2002 |   1713.22998046875 |
| 2003 |    5160.4501953125 |
| 2004 |              75.75 |
| 2006 |               4732 |
| 2007 | 1900.0999755859375 |
| 2008 | 18.690000534057617 |
+------+--------------------+


********************************************************************************************************************************************************

81) Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.

SELECT CNAME FROM Customers WHERE CNAME LIKE 'G%' LIMIT 1 ;
+----------+
| CNAME    |
+----------+
| Giovanni |
+----------+

********************************************************************************************************************************************************

82) Write a query that counts the number of different non NULL city values in the customers table.

SELECT COUNT(DISTINCT CITY) AS COUNT_CITY FROM Customers;
+------------+
| COUNT_CITY |
+------------+
|          4 |
+------------+

********************************************************************************************************************************************************

83) Find the average amount from the Orders Table.

SELECT AVG(AMT) AS Amount FROM Orders;
+--------------------+
| Amount             |
+--------------------+
| 2666.7400022506713 |
+--------------------+

********************************************************************************************************************************************************

84) Find all customers who are not located in SanJose and whose rating is above 200.

 SELECT * FROM Customers WHERE NOT CITY='SanJose' AND RATING>200;
+------+-------+--------+--------+------+
| CNUM | CNAME | CITY   | RATING | SNUM |
+------+-------+--------+--------+------+
| 2004 | Grass | Berlin |    300 | 1002 |
+------+-------+--------+--------+------+

********************************************************************************************************************************************************

85) Give a simpler way to write this query.SELECT snum, sname, city, comm FROM salespeople WHERE (comm > + 0.12 OR comm < 0.14);

SELECT SNUM,SNAME,CITY,COMM FROM Salespeople WHERE(COMM>+12 OR COMM <14); 
+------+---------+-----------+------+
| SNUM | SNAME   | CITY      | COMM |
+------+---------+-----------+------+
| 1001 | Peel    | London    |   12 |
| 1002 | Serres  | Sanjose   |   13 |
| 1003 | AxelRod | New York  |   10 |
| 1004 | Motika  | London    |   11 |
| 1007 | Rifkin  | Barcelona |   15 |
| 1008 | Fran    | London    |   25 |
+------+---------+-----------+------+

********************************************************************************************************************************************************

86) Which salespersons attend to customers not in the city they have been assigned to?

********************************************************************************************************************************************************

87) Which salespeople get commission greater than 0.11 are serving customers rated less than 250?

SELECT SNAME FROM Salespeople WHERE COMM >11 AND SNUM IN(SELECT SNUM FROM Customers WHERE RATING <250);
+--------+
| SNAME  |
+--------+
| Peel   |
| Serres |
+--------+

********************************************************************************************************************************************************

88) Which salespeople have been assigned to the same city but get different commission percentages?

********************************************************************************************************************************************************

89) Which salesperson has earned the maximum commission?

SELECT SNAME,COMM FROM Salespeople WHERE COMM= (SELECT MAX(COMM) FROM Salespeople);
+-------+------+
| SNAME | COMM |
+-------+------+
| Fran  |   25 |
+-------+------+

********************************************************************************************************************************************************

90) Does the customer who has placed the maximum number of orders have the maximum rating?

SELECT RATING,ONUM,COUNT(*) AS Total_Count FROM Customers C,Orders O WHERE C.CNUM=O.CNUM GROUP BY O.ONUM ORDER BY Total_Count DESC;
+--------+------+-------------+
| RATING | ONUM | Total_Count |
+--------+------+-------------+
|    100 | 3003 |           1 |
|    200 | 3009 |           1 |
|    200 | 3005 |           1 |
|    300 | 3007 |           1 |
|    300 | 3010 |           1 |
|    300 | 3008 |           1 |
|    300 | 3011 |           1 |
|    100 | 3002 |           1 |
+--------+------+-------------+

********************************************************************************************************************************************************

91) List all customers in descending order of customer rating.

SELECT * FROM Customers ORDER BY RATING DESC;
+------+----------+---------+--------+------+
| CNUM | CNAME    | CITY    | RATING | SNUM |
+------+----------+---------+--------+------+
| 2004 | Grass    | Berlin  |    300 | 1002 |
| 2006 | Cisneros | SanJose |    300 | 1007 |
| 2002 | Giovanni | Rome    |    200 | 1003 |
| 2003 | Liu      | SanJose |    200 | 1002 |
| 2001 | Hoffman  | London  |    100 | 1001 |
| 2005 | Clemens  | London  |    100 | 1001 |
| 2007 | Pereira  | Rome    |    100 | 1004 |
+------+----------+---------+--------+------+

********************************************************************************************************************************************************

92) On which days has Hoffman placed orders?

SELECT C.CNAME,O.ONUM,ODATE FROM Customers C,Orders O WHERE C.CNUM=O.CNUM AND C.CNAME='Hoffman';
+---------+------+------------+
| CNAME   | ONUM | ODATE      |
+---------+------+------------+
| Hoffman | 3003 | 1990-03-10 |
+---------+------+------------+

********************************************************************************************************************************************************

93) Which salesmen have no orders between 10/03/1990 and 10/05/1990?

SELECT DISTINCT S.SNAME FROM Salespeople S,Orders O WHERE S.SNUM=O.SNUM AND O.ODATE!= (1990-03-10 AND 1990-05-10);
+---------+
| SNAME   |
+---------+
| Rifkin  |
| Motika  |
| Peel    |
| Serres  |
| AxelRod |
+---------+


********************************************************************************************************************************************************

94) How many salespersons have succeeded in getting orders?
                        
select DISTINCT (S.SNAME),O.ONUM,O.ODATE from Customers C,Salespeople S,Orders O where C.SNUM=S.SNUM and C.CNUM=O.CNUM;
+---------+------+------------+
| SNAME   | ONUM | ODATE      |
+---------+------+------------+
| Motika  | 3002 | 1990-03-10 |
| Peel    | 3003 | 1990-03-10 |
| Serres  | 3005 | 1990-03-10 |
| Serres  | 3007 | 1990-04-10 |
| Rifkin  | 3008 | 1090-05-10 |
| AxelRod | 3009 | 1990-04-10 |
| Serres  | 3010 | 1990-05-10 |
| Rifkin  | 3011 | 1990-05-10 |
+---------+------+------------+

********************************************************************************************************************************************************

95) How many customers have placed orders?

SELECT COUNT(CNUM) AS COUNT FROM Customers WHERE CNUM IN (SELECT CNUM FROM Orders GROUP BY CNUM);
+-------+
| COUNT |
+-------+
|     6 |
+-------+

********************************************************************************************************************************************************

96) On which date has each salesman booked an order of maximum value?

SELECT ODATE FROM Orders WHERE AMT IN(SELECT MAX(AMT) FROM Orders GROUP BY SNUM);
+------------+
| ODATE      |
+------------+
| 1990-03-10 |
| 1990-03-10 |
| 1990-03-10 |
| 1990-04-10 |
| 1990-05-10 |
+------------+

********************************************************************************************************************************************************

97) Who is the most successful salesperson?

SELECT S.SNAME,SUM(O.AMT) AS Total,C.SNUM FROM Orders O,Customers C,Salespeople S WHERE O.CNUM=C.CNUM AND S.SNUM=C.SNUM GROUP BY C.SNUM ORDER BY Total DESC;
+---------+--------------------+------+
| SNAME   | Total              | SNUM |
+---------+--------------------+------+
| Rifkin  |   14623.8798828125 | 1007 |
| Serres  |  6546.150146484375 | 1002 |
| Motika  | 1900.0999755859375 | 1004 |
| AxelRod |   1713.22998046875 | 1003 |
| Peel    |  767.1900024414062 | 1001 |
+---------+--------------------+------+


********************************************************************************************************************************************************

98) Which customers have the same rating?

SELECT * FROM Customers ORDER BY RATING;
+------+----------+---------+--------+------+
| CNUM | CNAME    | CITY    | RATING | SNUM |
+------+----------+---------+--------+------+
| 2001 | Hoffman  | London  |    100 | 1001 |
| 2005 | Clemens  | London  |    100 | 1001 |
| 2007 | Pereira  | Rome    |    100 | 1004 |
| 2002 | Giovanni | Rome    |    200 | 1003 |
| 2003 | Liu      | SanJose |    200 | 1002 |
| 2004 | Grass    | Berlin  |    300 | 1002 |
| 2006 | Cisneros | SanJose |    300 | 1007 |
+------+----------+---------+--------+------+

********************************************************************************************************************************************************

99) Find all orders greater than the average for October 4th.

SELECT ODATE,AVG(AMT) AS Amount FROM Orders WHERE ODATE>'1990-04-10' GROUP BY ODATE;
+------------+--------------------+
| ODATE      | Amount             |
+------------+--------------------+
| 1990-05-10 | 5600.9149169921875 |
+------------+--------------------+

********************************************************************************************************************************************************

100) List all customers with ratings above Grass’s average.

SELECT CNAME FROM Customers WHERE RATING >(SELECT AVG(RATING) FROM Customers WHERE CNAME='Grass');
Empty set (0.00 sec)

********************************************************************************************************************************************************

101) Which customers have above average orders?

SELECT C.CNAME,O.ONUM,AMT FROM Customers C,Orders O WHERE C.CNUM=O.CNUM AND O.AMT>(SELECT AVG(AMT) FROM Orders);
+----------+------+---------+
| CNAME    | ONUM | AMT     |
+----------+------+---------+
| Liu      | 3005 | 5160.45 |
| Cisneros | 3008 |    4732 |
| Cisneros | 3011 | 9891.88 |
+----------+------+---------+

********************************************************************************************************************************************************

102) Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.

********************************************************************************************************************************************************

103) Give names and numbers of all salespersons that have more than one customer?

SELECT SNAME,SNUM FROM Salespeople WHERE SNUM IN(SELECT SNUM FROM Customers GROUP BY SNUM HAVING COUNT(SNUM)>1);
+--------+------+
| SNAME  | SNUM |
+--------+------+
| Peel   | 1001 |
| Serres | 1002 |
+--------+------+

********************************************************************************************************************************************************

104) Select all salespeople by name and number who have customers in their city whom they don’t service.

SELECT S.SNAME,S.CITY,C.CNAME,C.CITY FROM Salespeople S,Customers C WHERE C.SNUM=S.SNUM AND C.CITY!=S.CITY;
+---------+-----------+----------+---------+
| SNAME   | CITY      | CNAME    | CITY    |
+---------+-----------+----------+---------+
| AxelRod | New York  | Giovanni | Rome    |
| Serres  | Sanjose   | Grass    | Berlin  |
| Rifkin  | Barcelona | Cisneros | SanJose |
| Motika  | London    | Pereira  | Rome    |
+---------+-----------+----------+---------+

********************************************************************************************************************************************************

105) Does the total amount in orders by customer in Rome and London, exceed the commission paid to salesperson in London, and New York by more 
  than 5 times?
  
********************************************************************************************************************************************************

106) Which are the date, order number, amt and city for each salesperson (by name) for the maximum order he has obtained?

SELECT O.ODATE,O.ONUM,O.AMT,S.CITY FROM Orders O,Salespeople S WHERE O.AMT=(SELECT MAX(AMT) FROM Orders);
+------------+------+---------+-----------+
| ODATE      | ONUM | AMT     | CITY      |
+------------+------+---------+-----------+
| 1990-05-10 | 3011 | 9891.88 | London    |
| 1990-05-10 | 3011 | 9891.88 | Sanjose   |
| 1990-05-10 | 3011 | 9891.88 | New York  |
| 1990-05-10 | 3011 | 9891.88 | London    |
| 1990-05-10 | 3011 | 9891.88 | Barcelona |
| 1990-05-10 | 3011 | 9891.88 | London    |
+------------+------+---------+-----------+

********************************************************************************************************************************************************

107) Which salesperson is having lowest commission?

SELECT SNAME,COMM FROM Salespeople WHERE COMM= (SELECT MIN(COMM) FROM Salespeople);
+---------+------+
| SNAME   | COMM |
+---------+------+
| AxelRod |   10 |
+---------+------+

********************************************************************************************************************************************************





                                                  
