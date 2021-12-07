import numpy as np
import pandas as pd
import os
import json
import sys
os.chdir(r'C:\\xampp\\htdocs\\TVAS_Web\\Upload')  #on Windows
#os.chdir(r'/opt/lampp/htdocs/TVAS/Upload')  #on Linux

class excelFile:
    def __init__(self, name, lc):
        self.name = name
        self.df = pd.read_excel(name)
        self.values = [lc]
        # print (len(self.values))
        self.filterdValues = [] 
        self.addFilterdValues()

    def addFilterdValues(self):
        for x in range(len(self.df)):
            if self.df.loc[x][1] in self.values:
                self.filterdValues.append(self.df.loc[x])

    def getfilterdValues(self):
        return self.filterdValues

fileList = []
dateList = []
finalArray = []
for x in range(len(sys.argv)-1):
    y = x+1
    if (y%2==0):
        fileList.append(sys.argv[y])
    else:
        dateList.append(sys.argv[y])

for k in range(len(fileList)):
    file1 = excelFile(fileList[k],100)
    arr1 = file1.getfilterdValues()
    for x in range(len(arr1)):
        tempRows = []
        for y in  range(2,8):
            tempRows.append(arr1[x][y])
        frequencyObj ={"date":dateList[k],"data":tempRows}
        finalArray.append(frequencyObj)

print (json.dumps(finalArray))



