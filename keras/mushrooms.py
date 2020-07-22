import pandas as pd
import numpy as np

from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split

#1.Read the mushrooms dataset
dataset = pd.read_csv('mushrooms.csv')

#2.Split features and results
X = dataset.iloc[:,1:23].values
y = dataset.iloc[:,0]

#3. Encoding labels properly
#class
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)
print("edible?")
print(labelencoder_y.inverse_transform([0,1]))

#Encode a label from the given array on the given column
# and print the original classes set for checking purposes
def labelEncode(array, column, classNumber):
    labelencoder = LabelEncoder()
    array[:,column] = labelencoder.fit_transform(array[:,column])
    print(labelencoder.inverse_transform(range(classNumber)))

#cap-shape
print("cap shape")
labelEncode(X,0,6)
# cap-surface
print("cap surface")
labelEncode(X,1,4)
# cap-color
print("cap color")
labelEncode(X,2,10)
# bruises
print("bruises?")
labelEncode(X,3,2)
# odor
print("odor")
labelEncode(X,4,9)
# gill-attachment
print("gill attachment")
labelEncode(X,5,2)
# gill-spacing
print("gill spacing")
labelEncode(X,6,2)
# gill-size
print("gill size")
labelEncode(X,7,2)
# gill-color
print("gill color")
labelEncode(X,8,12)
# stalk-shape
print("stalk shape")
labelEncode(X,9,2)
# stalk-root
print("stalk root")
labelEncode(X,10,5)
# stalk-surface-above-ring
print("stalk surface (above ring)")
labelEncode(X,11,4)
# stalk-surface-below-ring
print("stalk surface (bellow ring)")
labelEncode(X,12,4)
# stalk-color-above-ring
print("stalk color (above ring)")
labelEncode(X,13,9)
# stalk-color-below-ring
print("stalk color (bellow ring)")
labelEncode(X,14,9)
# veil-type
print("veil type")
labelEncode(X,15,1)
# veil-color
print("veil color")
labelEncode(X,16,4)
# ring-number
print("ring number")
labelEncode(X,17,3)
# ring-type
print("ring type")
labelEncode(X,18,5)
# spore-print-color
print("spore print color")
labelEncode(X,19,9)
# population
print("population")
labelEncode(X,20,6)
# habitat
print("habitat")
labelEncode(X,21,7)

#4. Fix columns that has a boolean set of values.
X = X.astype(np.float32)
y = y.astype(np.float32)

#5. Split data into traingin and test sets
X_train,X_test,y_train,y_test = train_test_split(X,y,
    test_size = 0.25, random_state = 0)

#6. FNN model
model = Sequential()
model.add(Dense(12,input_dim=22, activation='relu'))
model.add(Dense(8, activation='relu'))
model.add(Dense(1, activation='sigmoid'))

#7. Compile and train model
model.compile(loss='binary_crossentropy', optimizer = 'adam', metrics = ['accuracy'])
model.fit(X_train,y_train,epochs=20, batch_size = 10, validation_data = (X_test,y_test))
