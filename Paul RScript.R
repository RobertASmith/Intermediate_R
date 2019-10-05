

#  # # # # # # # # # #  # # # # # # # # # # # #  # # # # # # # # # #  # # # # # # # # # # # 
## custom functions ----- 

# functions are the building blocks of R
# R has some base functions (e.g. mean(), sum(), round(), etc)
# and there are numerous packages that provide many more functions
# However, we often want to do things for which no function exist
# so we need to create our own functions.

add_five = function(x){
  temp = x + 5
  return(temp)      
}

add_five(x = 3)
add_five(20)   # short form

temp        # NOTE: temp_res only existed temporarily within the function
            # Only the bits within return() are given to the global enviroment
add_five()  # Also note: if we do not supply an argument, we get an error 


# setting default values for function parameter can be useful
add_five = function(x = 0){ # note: we dont have to call it x, but can use any name!
  temp_res = x + 5
  return(temp_res)        
}

add_five()    # when no argument is provided, the function uses the default
add_five(x=50)  # when an argument is provided, it overwrites the default

# we can use functions within functions
add_five_squared = function(y){
  temp_1 = add_five(x=y)
  temp_2 = temp_1^2
  return(temp_2)
}

add_five_squared(5)


# a function can have multiple arguments and outputs:
add_numbers = function(x,y){
  res = x+y
  return(res)
}



## exercise

# create a function 'miles_to_km' that translates miles in km (1km = 0.621 miles)
# how many km are 5,13, and 60 miles?

miles_to_km = function(km){
  miles = km * 0.621
  return(miles)
}

miles_to_km(5)
miles_to_km(13)

# why would you ever want to write a custom function?
# Coding principle: never write code more than once!

# This is the main principle of building packages in R:
# People use existing functions, combine and adjust them, and thereby create new functions.




#  # # # # # # # # # #  # # # # # # # # # # # #  # # # # # # # # # #  # # # # # # # # # # # 
# if statements ---- 


# if statements tell R whether some commands should be executed, or not 

# For example,if the statement within the brackets (1+1 == 2) is TRUE
# we want to display some text
if(1+1 == 2){
  print("This statement is TRUE")
}

# If the condition is not satisfied, nothing happens
if(100 < 3){
  print("This statement is TRUE")
}

# NOTE: if() takes a logical as argument (TRUE or FALSE)


# the if command is followed by two kinds of brackets:
# the statement within the normal brackets is evalauted (is it TRUE?)
# If it is TRUE, all code within the curly brackets is run

# In this case, 'foo' is not equal to 'foo', and the two lines are ignored
if("foo" == "foo"){ 
  print("line 1")
  print("line 2")
}

# here, the opposite case
if("foo" == "bar"){ 
  print("line 1")
  print("line 2")
}

# We can add an else statement, to specify what should happen if the condition is not satisfied

if("foo" == "bar"){                
  print("line 1")
  print("line 2")
} else {      # NOTE: else command must be in the same line as the } !!!
  print("This statement is false!")          
}


# if statements are useful to use within functions!

abs_value = function(num){
  if(num<0){
    res = -1 * num
  } else {
    res = num
  }
  return(res)
}

abs_value(-2)
abs_value(5)


## Exercise 
# create a function 'careful_division'
# that takes two numbers nom and den and divides them
# but ONLY if den is not zero
# if den is zero, display an error message  (use the print() function)

careful_division = function(nom,den){
  if(den != 0){
    res = nom/den
    return(res)
  } else {
    print("error")
  }
}

careful_division(1,2)
careful_division(1,0)


#  # # # # # # # # # #  # # # # # # # # # # # #  # # # # # # # # # #  # # # # # # # # # # # 
## loops  ----

# R has many ways to do loops!
# there is a 'family' of functions that can be used in different circumstances:
# apply, lapply, sapply, eapply, mapply, etc
# the most intuitive way, however, is the for loop

# loops perform commands multiple time

for(i in 1:5){  # 1:5 is short for c(1,2,3,4,5)
  print(i)
}

# the for statement consists of two brackets
# the first specifies the iterations
# each time the code is run, i takes a different value
# note: it doesnt have to be i but you can use any name
# on the right side of the bracket, we have the set of values i should take/loop through
# 'in' is just part of the for command, sepearting the i from the set of values

for(j in 5:10){  # 5:10 is short for c(5,6,7,8,9,10)
  print(j)
}

for(name in c("yoda","rey","luke")){  # 5:10 is short for c(5,6,7,8,9,10)
  print(name)
}


# this is useful because often, we need to do the same or similar operations multiple times:
# say, we want to add all numbers from 1 to 100
# inefficient:
# sum_1_100 = 1+2+3+4+5+6....

sum_1_100 = 0 # initialise object
for(i in 1:100){  # 1:5 is short for c(1,2,3,4,5)
  sum_1_100 = sum_1_100 + i
}
sum_1_100



sum_1_100 = 0 # initialise object
for(i in 1:100){  # 1:5 is short for c(1,2,3,4,5)
  # use print() to see what is going on within the loop
  print(paste(sum_1_100,"+",i))     # note: paste() is a function to combine strings 
  sum_1_100 = sum_1_100 + i         # add whatever i is to sum_1_100
}
sum_1_100

    # Note: of course, this code is still very inefficient
    # to add all numbers between a and 100 you can use:
    sum(1:100)

    
    
# # exercise
# create a vector of jedis, named Luke, rey, yoda
# use a loop to say 'hi' to each of them
# use paste("hi",name) for that!
    
jedis = c("Luke","Rey","Yoda")
for(name in jedis){  
  print(  paste("Hi",name)  )
}



# we can also store the results within a for loop
# say, we want to create a multiplication table for 6

count_numbers = c() # We create an empty object
count_numbers       # it exists, but has no content

for(i in 1:10){
  temp = 6 * i
  count_numbers = c(count_numbers, temp)  
}

count_numbers

# we can use indices to 'loop through' vectors

# While is very similar to for loops
# they repetitively run the code within the curly brackets
# as long as their parameter is TRUE

start_value = 1
while(start_value < 8){
  print(start_value) # using print within loops is useful to see what is going on inside
  start_value = start_value + 1
}
start_value # when start_value became 8, the while loop was terminated


# We can do the same with data frames

head(mtcars)

dim(mtcars) # dim useful command when looping over a dataframe
dim(mtcars)[1]   # gives us the number of rows
dim(mtcars)[2]   # gives us the number of columns
1:dim(mtcars)[2] # i.e. gives us an index for each column in the dataframe

# To loop over the columns and compute the mean for each we can use:
col_means = c()
for(col in 1:dim(mtcars)[2]){
  temp = mean(mtcars[,col])
  col_means = c(col_means,temp)
}

col_means

## nested loops ----- 

# example 1

for(i in 1:3){
  for(j in 1:3){
    cat("\n",i,"*",j,"=",i*j)
  }
}

## example 2

hats = c("green hat","red cap","white hat")
shoes = c("red shoes","blue shoes","pink shoes")
possible_combinations = c()

for(hat in hats){
  for(shoe in shoes){
    possible_combinations = c(possible_combinations,paste(hat,"+",shoe))
  }
}
possible_combinations

## EXERCISE: putting it all together

# 1. create a function roll_dice that gives you ONE random number
# between 1 and 6
# Use the function sample() for that (set the parameter n = 1)

# 2. create a loop to roll the dice 100 times and store the 
# outcomes in a vector: 'eyes'
# How many sixes have you rolled?

# 3. create another loop to roll the dice until you roll a six
# record how many times you have to roll the dice

# 4. take the loop from 3, and only count the throws that 
# show a 1 (ignore 2,3,4 and 5), and stop when 6.


# 1
roll_dice = function(){
  spots = c(1,2,3,4,5,6)
  outcome = sample(x = spots,size = 1)
  return(outcome)
}

roll_dice()

# 2
eyes = c()
for(i in 1:100){
  eyes = c(eyes,roll_dice())
}

eyes
sum(eyes==6)


# 3
isSix = F
rollCounter = 0
while(!isSix){
  isSix = roll_dice() == 6
  rollCounter = rollCounter +1
}
rollCounter

# 4
isSix = F
rollCounter = 0
while(!isSix){
  res = roll_dice()
  if(res == 1){
    rollCounter = rollCounter+1  
  }
  isSix = roll_dice() == 6
}
  rollCounter
  
