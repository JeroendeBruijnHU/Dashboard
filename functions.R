
#Lowest value of the last week
lowestValueLastWeek <- function(scoreSet) {
  tryCatch(
    expr = {
      lowestValue <- 6
      scoreSetLength <- length(scoreSet)
      #Check if there's at least week's worth of data
      if(scoreSetLength > 6) {
        for(i in seq(6,0,-1)) {
          index <- scoreSetLength-i
          if (scoreSet[index] < lowestValue) {
            lowestValue <- scoreSet[index]
          }
        }
      } 
      #In case there's no data
      else if(scoreSetLength == 0) {}
      #In case there's not a week's worth of data
      else if(scoreSetLength < 7) {
        for(i in seq((scoreSetLength-1),0,-1)) {
          index <- scoreSetLength-i
          if (scoreSet[index] < lowestValue) {
            lowestValue <- scoreSet[index]
          }
        }
      }
      #Check wheter the lowestValue variable has been changed
      if(lowestValue == 6) {
        return(format(round(0, 2), nsmall = 2))
      } else {
        return(format(round(lowestValue, 2), nsmall = 2)) 
      }
    },
    #In case of an error
    error = function(e) {
      message('Runs into an error')
      print(e)
    },
    #In case of a warning
    warning = function(w) {
      message('Runs into a warning')
      print(w)
    },
    #Upon finishing the function
    finally = {
      message('Alright and done')
    }
    
  )
}
scoreT <- c(3,3,3,4,6,4,2,4)
sprintf("Lowest value of last week: %s", lowestValueLastWeek(scoreT))


#Calculate average value LAST WEEK
averageLastWeek <- function(scoreSet) {
  sumValue <- 0
  scoreSetLength <- length(scoreSet)
  #Check if the there is at least a week's worth of data
  if(scoreSetLength > 6) {
    for(i in seq(6,0,-1)) {
      index <- scoreSetLength-i
      sumValue <- sumValue + scoreSet[index]
    }
    return(format(round(sumValue/7, 2), nsmall = 2))
  } 
  #In case there's not a week's worth of data, but where there's still at least 1 point of data
  else if(scoreSetLength < 7 && scoreSetLength > 0) {
    for(i in seq(scoreSetLength-1,0,-1)) {
      index <- scoreSetLength-i
      sumValue <- sumValue + scoreSet[index]
    }
    return(format(round(sumValue/scoreSetLength, 2), nsmall=2))
  } else {return(format(round(0, 2), nsmall = 2))}
}
scoreT <- c()
print(averageLastWeek(scoreT))


#Calculate average value PER week
averagePerWeek <- function(scoreSet) {
  #Declare variables needed further in the function
  sumValue <- 0
  scoreSetLength <- length(scoreSet)
  dayInWeek <- 1
  weekAverage <- 0
  averageList <- c()
  temporaryList <- c()
  #Loop through list with all the values
  for(i_index in seq(0, scoreSetLength, 1)) {
    temporaryList <- c(temporaryList, scoreSet[i_index])
    dayInWeek <- dayInWeek + 1
    #Devide the list up in groups of 7
    if (dayInWeek == 8) {
      for(i_value in temporaryList) {
        sumValue <- sumValue + i_value
      }
      weekAverage <- sumValue / length(temporaryList)
      temporaryList <- c()
      averageList <- c(averageList, format(round(weekAverage, 2), nsmall=2))
      dayInWeek <- 1
      sumValue <- 0
    }
  }
  return(averageList)
}
scoreT <- c(3,4,3,4,4,3,2,2,2,1,3,4,5,4,5,3,2,2,2,1,1,2,3,2,3,4,5,4,4,3,2,2,3,1,2,4,3,3,3,2,1,2,2,2,3,4,5,5,4,4,4,3,2,3,2,1,2,2,3,3,3,4,3,3,4,5,4,4,2,2,2,3,4,5,4,3,3,2)
print(averagePerWeek(scoreT))

