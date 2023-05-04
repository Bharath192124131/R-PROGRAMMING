table1 <- matrix(1:12, nrow = 3, ncol = 4)
table2 <- matrix(13:24, nrow = 3, ncol = 4)
arr <- array(c(table1, table2), dim = c(3, 4, 2))
print(arr)
