import csv
import numpy as np

#Import csv file
reviews = open('userreview.csv', newline='')
reader = csv.reader(reviews, delimiter=",")
userreviews = list(reader)

x = []
y = []
z = []

movie = 'the-emoji-movie'

#Create columns

#list x
for row in userreviews:
    x.append(row[0].split(';')[2]) #list X by author

#list y
for i in userreviews:
    if (i[0].split(';')[0]) == movie:
        y.append(i[0].split(';')[2]) #list y by author for fav movie

#list z
user = 'EpicLadySponge'
for j in userreviews:
    if (j[0].split(';')[2]) == user:
        z.append(j[0].split(';')[0])

np.savetxt("pythonAuthor", z,fmt='% s')

#Create filter favourite movie list Y



#code for terminal: source ~/VE/bin/activate
#code to copy in terminal:time python /home/pi/RSL/filter.py