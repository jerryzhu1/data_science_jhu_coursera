# CODEBOOK 
<br>
<br>

### Getting the data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
<br>
<br>

### Download and unzip data 
Download and unzip the data, we can get:  
- activity_labels.txt  
- features_info.txt  
- features.txt  
- train/subject_train.txt  
- train/X_train.txt  
- train/y_train.txt  
- test/subject_test.txt  
- test/X_test.txt  
- test/y_test.txt  

<br>
<br>

### Content of files
The file *activity_labels.txt* describes a mapping from the numeric description of the subjects' activities to their meaning. In total there are 6 activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) which correspond to numbers from 1 to 6. The file *features_info.txt* describes the experiment and the variables in detail (I've copied some important details below). The file *features.txt* lists all of the 561 features in one column. The files *train/X_train.txt* and *test/X_test.txt* contain the data for the training and testing set, respectively. The files *train/y_train.txt* and *test/y_test.txt* contain the labels for the training and testing sets, respectivtly and the files *train/subject_train.txt* and *test/subject_test.txt* contain the subjects corresponding to each set.
<br>
<br>

### Information about measured variables (taken from features_info.txt)
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range  
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal  
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean
<br>
<br>

### Clean data 
First, combine the train and test data into a new data frame *data.all*. 
Then, select only those variables that contained the mean or standard deviation for each measurement. 
After that, we replaced the numeric description of activity (1-6) with the corresponding activity descriptors (walking, etc; see above). 
Fourth, appropriately labels the data set with descriptive variable names:  
|old name|new name
- t, changed to TimeDomain  
- f, changed to FrequencyDomain  
- Acc, changed to Accelerometer  
- Gyro, changed to Gyroscope  
- Mag, changed to Magnitude  
- mean, changed to Mean  
- std, changed to StandardDeviation  
<br>
Finally, we calculated the mean for each of the 79 variables, but grouped according to subject and activity type. This resulted in a data-frame with 180 rows (30 subjects with 6 activities each), each of which contained the mean for this subject-activity combination for all 79 variables. The resulting file was written out to *Results.txt*.