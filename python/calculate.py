import numpy as np
import pandas as pd
import os
import json
import sys
#os.chdir(r'C:\\xampp\\htdocs\\TVAS_Web\\Upload')  #on Windows
os.chdir(r'/opt/lampp/htdocs/TVAS/Upload')  #on Linux

class excelFile:
    def __init__(self, name):
        self.name = name
        self.df = pd.read_excel(name)
        self.values = [50,100,150,200,250,300,350,400,450,500,800,900,1000]
        # print (len(self.values))
        self.filterdValues = [] 
        self.addFilterdValues()

    def addFilterdValues(self):
        for x in range(len(self.df)):
            if self.df.loc[x][1] in self.values:
                self.filterdValues.append(self.df.loc[x])

    def getfilterdValues(self):
        return self.filterdValues

fileName_1 = sys.argv[1]
fileName_2 = sys.argv[2]
labels = ['LV-R','LV-Y','LV-B','HV-R','HV-Y','HV-B']
file1 = excelFile(fileName_1)
file2 = excelFile(fileName_2)
arr1 = file1.getfilterdValues()
arr2 = file2.getfilterdValues()
# print (len(arr1))
# print (len(arr2))
# print ("______________________________")
finalDict = {}
if(len(arr1)==len(arr2)):
    finalArray=[]
    for x in range(len(arr1)):
        tempArr = [arr1[x],arr2[x]]
        # print ("______________________________")
        # print (arr1[x][1])
        tempRows = []
        for y in  range(2,8):
            percentage = abs(round(100*(arr2[x][y]-arr1[x][y])/arr1[x][y]))
            # print (str(arr1[x][y]) + ' ' + str(arr2[x][y]) + ' ' + str(percentage))
            rowDict = {"label":labels[y-2],"val1":arr1[x][y],"val2":arr2[x][y],"percentage":percentage}
            tempRows.append(rowDict)

        frequencyObj ={"frequency":arr1[x][1],"data":tempRows}
        finalArray.append(frequencyObj)

    print (json.dumps(finalArray))


