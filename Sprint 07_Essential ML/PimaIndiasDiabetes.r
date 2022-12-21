#install.packages("mlbench")
library(mlbench)
library(caret)
library(dplyr)

#function for split data
train_test_split <- function(data,train_size=0.8){
  set.seed(42)
  n<- nrow(data)
  id<- sample(1:n,size = n*train_size)
  train_data <- data[id,]
  test_data<- data[-id,]
  return(list(train_data,test_data))
}
#ทำนาย ผู้ป่วยโรคเบาหวาน  ห้ามลืมเช็ค Column label

data("PimaIndiansDiabetes")
df  <- PimaIndiansDiabetes
head(df)

glimpse(df)

#Explore data
mean(complete.cases(df))

df%>%
  count(diabetes)%>%
  mutate(pct = n/sum(n))  

#Build model
split_data <- train_test_split(df)
train_data <- split_data[[1]]
test_data <- split_data[[2]]

nrow(train_data) ; nrow(test_data)

set.seed(42)
ctrl <- trainControl(method = "cv",  
                     number = 5,
                     verboseIter = T )

knn_model <- train(diabetes ~.,
               data = train_data,
               method = "knn",
               metric= "Accuracy",     
               trControl = ctrl)
p<- predict(knn_model,newdata= test_data)

mean(p == test_data$diabetes)  

knn_model

# result test accuracy   0.6818182
# models is Good fit: k = 9 
# train accuracy = 0.7346184 vs test accuracy = 0.6818182
