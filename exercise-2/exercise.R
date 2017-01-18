install.packages("stringr")
library("stringr")

# Exercise 2: `*apply()`

# Create a *list* of 10 random numbers. Use the `runif` function to make a vector of random numbers,
# then use `as.list()` to convert that to a list.
rand.num <- as.list(runif(10, min = 0, max = 1))

# Use `lapply()` to apply the `round()` function to each number, rounding it to the nearest .1
rand.num <- lapply(rand.num, round, 1)


## Bonus

# Create a variable 'sentence' that has contains a sentence of text (go for something longish).
# Make it lowercase
sentence <- "I REMEMBER that first day. I left him at a Greyhound statin West of Santa Fe. We were 
  seventeen and it was sweet and it was true."
sentence <- lapply(sentence, tolower)
sentence

# Use the `strsplit()` function to split the sentence into vector of letters.
# Hint: split on `""` to split on everything
# Note: this will return a _list_ with 1 element (which is the vector of letters)
l.list <- lapply(sentence, strsplit, '""')

# Extract the vector of letters from the resulting list
ltrs <- sentence[[1]]

# Use the `unique()` function to get a vector unique letters
l.unique <- lapply(ltrs, unique)

# Define a function CountOccurances that takes in two parameters: a letter and a vector letters.
# The function should return how many times that letter occurs in the vector
# Hint: use a filter!
Count0Occurences <- function(letter, vector.letters) {
  return(lapply(vector.letters, str_count, pattern = letter))
}

# Call your CountOccurances() function to see how many times the letter 'e' is in your sentence.
Count0Occurences('e', ltrs)
Count0Occurences('g', ltrs)
# Use `sapply()` to apply your CountOccurances() function to each unique letter in the vector to determine its frequency!
# Convert the result into a list (using `as.list`).
freq <- as.list(sapply(l.unique, Count0Occurences,ltrs))

# Print the resulting list of frequencies
print(freq)
