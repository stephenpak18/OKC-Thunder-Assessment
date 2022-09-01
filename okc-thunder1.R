# Using tidyverse
require("tidyverse")

# Uploading the CSV
sxx <- read.csv("shots_data.csv")

# Viewing the data
View(sxx)

# Getting only y data > 7.8 ft
sxx$y2 <- ifelse(sxx$y > 7.8, sxx$y, NA)

# Using pythagorean theorem to calculate shot distance
sxx$pytha_y <- ifelse(sxx$y2 > 0, sxx$y2^2, NA)
sxx$pytha_x <- sxx$x^2
sxx$sq <- sqrt(sxx$pytha_y+sxx$pytha_x)

# Identifying each shot type
sxx$type <- ifelse(sxx$sq >= 23.75 & sxx$y > 7.8, 'NC3',
            ifelse(sxx$y <= 7.8 & (sxx$x >= 22 | sxx$x <= -22), 'C3', '2PT'))


# Calculating Team A's total shots
sum(sxx$team == 'Team A' & 
      (sxx$type == 'NC3' | sxx$type == 'C3' | sxx$type == '2PT'))
# result is 280

# Calculating Team A's shot distribution for NC3
sum(sxx$type == 'NC3' & sxx$team == 'Team A')
# result is 68
68/280
# result is 0.243

# Calculating Team A's shot distribution for C3
sum(sxx$type == 'C3' & sxx$team == 'Team A')
# result is 18
18/280
# result is 0.064

# Calculating Team A's shot distribution for 2PT
sum(sxx$type == '2PT' & sxx$team == 'Team A')
# result is 194
194/280
# result is 0.693


# Calculating Team B's total shots
sum(sxx$team == 'Team B' & 
      (sxx$type == 'NC3' | sxx$type == 'C3' | sxx$type == '2PT'))
# result is 224

# Calculating Team B's shot distribution for NC3
sum(sxx$type == 'NC3' & sxx$team == 'Team B')
# result is 62
62/224
# result is 0.277

# Calculating Team B's shot distribution for C3
sum(sxx$type == 'C3' & sxx$team == 'Team B')
# result is 12
12/224
# result is 0.054

# Calculating Team B's shot distribution for 2PT
sum(sxx$type == '2PT' & sxx$team == 'Team B')
# result is 150
150/224
# result is 0.670


# Calculating eFG% for Team A in NC3 shot zone
sum(sxx$type == 'NC3' & sxx$fgmade == 1 & sxx$team == 'Team A') * 1.5
# result is 31.5
sum(sxx$type == 'NC3' & sxx$team == 'Team A') 
# result is 68
31.5/68
# eFG% is 0.463

# Calculating eFG% for Team A in C3 shot zone
sum(sxx$type == 'C3' & sxx$fgmade == 1 & sxx$team == 'Team A') * 1.5
# result is 13.5
sum(sxx$type == 'C3' & sxx$team == 'Team A') 
# result is 18
13.5/18
# result is 0.750

# Calculating eFG% for Team A in 2PT shot zone
sum(sxx$type == '2PT' & sxx$fgmade == 1 & sxx$team == 'Team A')
# result is 95
sum(sxx$type == '2PT' & sxx$team == 'Team A') 
# result is 194
95/194
# result is 0.490

# Calculating eFG% for Team B in NC3 shot zone
sum(sxx$type == 'NC3' & sxx$fgmade == 1 & sxx$team == 'Team B') * 1.5
# result is 31.5
sum(sxx$type == 'NC3' & sxx$team == 'Team B') 
# result is 62
31.5/62
# result is 0.508

# Calculating eFG% for Team B in C3 shot zone
sum(sxx$type == 'C3' & sxx$fgmade == 1 & sxx$team == 'Team B') * 1.5
# result is 6
sum(sxx$type == 'C3' & sxx$team == 'Team B') 
# result is 12
6/12
# result is 0.500

# Calculating eFG% for Team B in 2PT shot zone
sum(sxx$type == '2PT' & sxx$fgmade == 1 & sxx$team == 'Team B')
# result is 67
sum(sxx$type == '2PT' & sxx$team == 'Team B') 
# result is 150
67/150
# result is 0.447