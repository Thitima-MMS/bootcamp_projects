#Order Pizza Online - Delivery and Takeaway
#Homework

#question 1
        greeting <- function(){      
          print("Welcome to pizza Restaurant")
          print("What is your name?")
          user_name <- readLines("stdin",n=1)
          print(paste("Hi K.", user_name ))
          #print("  These are all code for you")
          #print("1.buy 1000฿ discount  50฿ is CODE050") 
          #print("2.buy 1500฿ discount 100฿ is CODE100")
          #print("3.buy 2000฿ discount 200฿ is CODE200")
        
          #print("Please save the code => Let's start for ordering" )
          #print('' )
        }
   
#question 2
   
           pizza_flavor <- function(){
             # count <- 0
            #  while(count < 6){
              print("What would you like to order? Please choose the number 1, 2 ,3 ,4")
              print("1.Veggie Pizza")
              print ("2.Pepperoni Pizza")
              print("3.Mawaiian Pizza")
              print("4.BBQ Chicken Pizza")
              q2 <- readLines("stdin",n=1)
              
                 if (q2 == 1){
                     "Veggie Pizza"
                     # break
                    } else if (q2 == 2) {
                      print("Pepperoni Pizza")
                     # break
                    } else if (q2==3){
                      print("Mawaiian Pizza" )
                    #  break
                    } else if(q2==4){
                      print("BBQ Chicken Pizza" )
                     # break
                    }         
                      else {print("please choose number 1,2,3,4")
                      #count <- count+1
                      #if(count == 5){
                     #   break
                      # }
                           }
               #}
               }    

#Function Q 3,4
#Question 3
price_size <- function(){
      print("What size would you like to order ? : Please choose S,M,L")
        print("S = 250฿ , M = 350฿,L = 500฿ ")  
        size <- tolower(readLines("stdin",n=1))
    
#Question 4
      print("How many would you like to order?")
          amount <-  as.numeric(readLines("stdin",n=1))
          price <- if(amount>0){
            if(size == "s" ){
              amount * 250
           } else if (size == "m"){
             amount * 350
           } else if (size == "l"){
             amount * 500
           }
          }
            paste("size:",size,"=","Total x",amount, "=",price,"฿")         
    }
    
#Question 5
  drink <- function(){
    print ("Would you like some drink (Only Coke) ? : Please choose Yes or No")
    q5  <- tolower(readLines("stdin",n=1))
    if(q5 == "yes"){
        "Drink : Coke"
      } else if(q5 == "no"){
        "Drink : -"
      } else{
          print("Please choose Yes or No")
        }
  }

#Question 6
  pay <- function(){
    print("How would you like to pay? : Please choose 1,2,3")
    print("1.Cash 2.Visa 3.Debit")
    q6 <- readLines("stdin",n=1)
      if(q6 == 1){
        "Cash"
      } else if(q6 == 2){
      "Visa"
    } else if(q6 == 3){
      "Debit"
    }
        else{
          print("Please choose 1,2,3")
        }
  }
     
#Start for ordering
greeting()
pf <- pizza_flavor()
ps <-price_size()
d <-drink()
p <- pay()
    
#Question 7,8
     print("Would you like to pick up or delivery : Please enter (1 or 2) : 1.Pick up 2. Delivery")
    q7 <- readLines("stdin",n=1)
      if(q7==1){
        print("May We repeat your order,")
        print(paste("You ordered is",pf,ps,": ",d,",Pay by :",p))
        print("--------------------------------------------------------------------------------------")
        print("Confirm your order,Please enter (1 or 2) : 1.Yes,please , 2.No,Thank")
        
        q9 <- readLines("stdin",n=1)
          if(q9==1){
            print("Your food will be ready in 30 minutes, You can come and pick up your order after 30 mins at the restaurant, Thank you")
          }else{
            "Thank you, please come back again."}
        
      }else if (q7==2) {
        print( "Please enter your address")
        q8 <- readLines("stdin",n=1)
        
        print("May I repeat your order,")
        print(paste("You ordered is",pf,ps,": ",d,",Pay by :",p,", Your Address :",q8))
        print("--------------------------------------------------------------------------------------")
        print("Confirm your order,Please enter (1 or 2) : 1.Yes,please , 2.No,Thank")
        q9 <- readLines("stdin",n=1)
        if(q9==1){
        print("Your food will be there in 30 minutes, Thank you")
          }else{
          "Thank you, please come back again."}
      } else {
         print("Please choose 1.Pick up 2. Delivery")
       }
     

   


