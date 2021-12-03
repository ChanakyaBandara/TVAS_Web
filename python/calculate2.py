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
voltageLabels = ['LV','LV','LV','HV','HV','HV']
Phaseabels = ['R','Y','B','R','Y','B']
categeries = [[100,200,300,400,500],[50.150,250,350],[800,900,1000]]
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
    calArray = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
    calArraySize = [0,0,0]
    for x in range(len(arr1)):
        catIndex = -1 # (0-LF , 1-HF , 2-50Hz)
        if arr1[x][1] in categeries[0]:
            catIndex = 0
            calArraySize[0] += 1
        if arr1[x][1] in categeries[1]:
            catIndex = 1
            calArraySize[1] += 1
        if arr1[x][1] in categeries[2]:
            catIndex = 2
            calArraySize[2] += 1
        for y in  range(2,8):
            percentage = abs(round(100*(arr2[x][y]-arr1[x][y])/arr1[x][y]))
            # print (str(arr1[x][y]) + ' ' + str(arr2[x][y]) + ' ' + str(percentage))
            #rowDict = {"frequency":arr1[x][1],"voltage":voltageLabels[y-2],"phase":Phaseabels[y-2],"val1":arr1[x][y],"val2":arr2[x][y],"percentage":percentage}
            #finalArray.append(rowDict)
            calArray[y-2][catIndex] += percentage
    # print(calArray)  
    for x in range(len(calArraySize)):
        for y in range(len(calArray)):
            calArray[y][x] = round(calArray[y][x]/calArraySize[x])
    # print(calArray)  
    for x in range(6):
        rowDict = {"voltage":voltageLabels[x],"phase":Phaseabels[x],"LF":calArray[x][0],"HF":calArray[x][1],"FF":calArray[x][2]}
        finalArray.append(rowDict)

    print (json.dumps(finalArray))


