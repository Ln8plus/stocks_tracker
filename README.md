# stocks_tracker

A new Flutter project.



Stocks Page is fully functional as of 21/11/20
Connected the app to restDB and app is able to fetch the data from
there using a rest API get function(tested the function works with desktop API Testers)
Fails on browser API testers due to http 401(unauthorized) & CORS error


Tried using Firebase & then SQFLITE but their implementations were not what I had in mind
Firebase: Didn't provide any structured query language so I wasn't able to find any way to
filter data for a search function. Auth was necessary not an option.

SQFLITE: Was able to load data from .db file in the app but nested SQL queries weren't working
for some reason.

