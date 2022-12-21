-- SELECT "Hello world!";
-- Restaurant Owners
-- 5 Tables
-- 1X Fact,4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 query analyze data
-- 1X subquery/with

CREATE TABLE Orders (
	Orders_ID int UNIQUE,
	Orders_Date Date,
  Member_ID int,
  Set_ID TEXT
);

INSERT into orders VALUES 
	(1, "2022-10-02",	4, "A"),
  (2,	"2022-10-02",	4,  "B"),
 	(3,	"2022-10-02",	1,	"C"),
	(4,	"2022-10-03",	3,	"A"),
  (5, "2022-10-04",	2,	"B"),
  (6,	"2022-10-04",	1,	"C"),
  (7,"2022-10-06",	4,	"C"),
  (8,	"2022-10-06",	4,	"A"),
  (9,	"2022-10-07",	2,	"A"),
  (10,"2022-10-08",	4	,"A")
  ;

.mode markdown
.header on  
select * from Orders;
-------------------------------------------------------

create table Main_Set (
  Set_ID Text unique,
  Set_price real );

insert into Main_set values 
  ("A",	1000),
  ("B",	700),
  ("C",	500);

.mode markdown
.header on  
select * from Main_set;

--------------------------------------------------------
-- Menu_Table
create table Menu(
  Menu_ID int unique,
  Category text,
  Menu_Name real
);

insert into Menu values
  (1,"Menu1",'Steamed whole fish with sauce'         ),
  (2,"Menu1",'Fried fish toppted with chilli sauce'  ),
  (3,"Menu1",'Crisp fried calamari'                  ),
  (4,"Menu1",'Fried chicken with asparagus'          ),
  (5,"Menu2",'Chicken Green Curry'                   ),
  (6,"Menu2",'Sour soup made of Tamarind Paste'      ),
  (7,"Menu2",'Massa man Curry'                       ),
  (8,"Menu2",'Sour prawn soup'                       ),
  (9,"Menu3",'Fried Fish-paste balls'                ),
  (10,"Menu3",'Fried pork spare ribs with garlic and pepper' ),
  (11,"Menu3",'Charcoal-boiled pork neck'                    ),
  (12,"Menu3",'Shrimp salad with lemon grass and mint'       ),
  (13,"Menu4",'Spicy noodle salad'                           ),
  (14,"Menu4",'Boiled egg fried with tamarind sauce'         ),
  (15,"Menu4",'Steamed spring roll'                          ),
  (16,"Menu4",'Steamed Egg'                                  ),
  (17,"New_Menu",'Ice-Cream homemade.'                       ),
  (18,"New_Menu",'fresh coconut Jelly'                       ),
  (19,"New_Menu",'Seasonal fruit '                           ),
  (20,"New_Menu",'Panna cotta'                               ),
  (21,"New_Menu",'Bingsu'                                    );

.mode markdown
.header on  
select * from Menu ;

--------------------------------------------------------

create Table Order_list (
   Order_ID int, 
   Menu_ID int);

insert into Order_list values
    (1,4),
    (1,8),
    (1,11),
    (1,13),
    (1,19),
    (2,5),
    (2,12),
    (2,16),
    (2,19),
    (3,10),
    (3,13),
    (3,20),
    (4,1),
    (4,6),
    (4,9),
    (4,13),
    (4,17),
    (5,6),
    (5,12),
    (5,13),
    (5,18),
    (6,8),
    (6,12),
    (6,16),
    (6,21),
    (7,6),
    (7,12),
    (7,16),
    (7,19),
    (8,1),
    (8,6),
    (8,9),
    (8,13),
    (8,18),
    (9,3),
    (9,5),
    (9,12),
    (9,14),
    (9,17),
    (10,2),
    (10,8),
    (10,11),
    (10,16),
    (10,19);

.mode markdown
.header on  
select * from Order_list;

-------------------------------------------------------------------

create table Member (
  Member_ID int unique,	
  Member_NAME TEXT,
  Birthday date,
  City text,
  Phone text,
  Occupations text
);

insert into Member values
  (1,"K.MAAM","1993-07-14","Sriracha","066-666-6666","Salesman"),
  (2,"K.MIX","1994-07-15","Bangsaen","077-777-7777","Engineer"),
  (3,"K.MEAN","1993-07-16","Sriracha","088-888-8888","Salesman"),
  (4,"K.BRIGHT","1992-07-17","Sriracha","099-999-9999","Architect");


.mode markdown
.header on  
select * from Member;


--Q : What Is The Best_Selling of Menu For Each Category?

  with sub as  
  (
    select Menu.Category as Category,   
           Order_list.Menu_ID as Menu_ID, Menu_Name,
           count(Order_list.Menu_ID) as Count_Each_Menu
    from Order_list, Menu
    where Order_list.Menu_ID = Menu.Menu_ID 
    group by Order_list.Menu_ID
    order by Menu.Category  
  ) 
    select Category, Menu_ID, Max(Count_Each_Menu) , Menu_Name as Best_Selling_of_Menu_For_Each_Category from sub
    group by Category ;

--Q : How many the total purchase amount of each customer and sort data from highest to lowest?

select 
    Orders.Member_ID as Member,
    Member.Member_NAME,
    sum(Main_Set.Set_price) as amount_of_each_customer
    
from Orders,Main_Set,Member
where Orders.Set_ID = Main_Set.Set_ID and
      Orders.Member_ID = Member.Member_ID  
group by Member
order by amount_of_each_customer desc ;

-----------------------------------------------------------------
--Q : How many total customers does the restaurant have per day and sort data from highest to lowest?

 select 
   Orders_date, 
   count(Member_ID) as Total_order_per_day
from orders 
group by orders_date
order by Total_order_per_day desc
  
   




  

