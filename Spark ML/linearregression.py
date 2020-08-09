#Spark ML hands-on

from pyspark.ml.regression import LinearRegression
#from pyspark.ml.classification import LogisticRegression

# Define LinearRegression algorithm
lr = LinearRegression()


from pyspark.ml.linalg import Vectors


# Prepare training data from a list of (label, features) tuples.
training = spark.createDataFrame([
    (1.0, Vectors.dense([0.0, 1.1, 22])),
    (0.0, Vectors.dense([2.0, 1.0, 33])),
    (0.0, Vectors.dense([2.0, 1.3, 1.0])),
    (1.0, Vectors.dense([0.0, 1.2, 0.5]))], ["label", "features"])

test = spark.createDataFrame([
    (1.0, Vectors.dense([-1.0, 1.5, 1.3])),
    (0.0, Vectors.dense([3.0, 2.0, -0.1])),
    (1.0, Vectors.dense([0.0, 2.2, -1.5]))], ["label", "features"])
    
    


modelA = lr.fit(training)

# Make predictions
predictionsA = modelA.transform(test)

#from sklearn.metrics import MSE, R2, accuracy_score
#accuracy_score(actual,pred)

from pyspark.ml.evaluation import RegressionEvaluator

evaluator = RegressionEvaluator(metricName="rmse")
RMSE = evaluator.evaluate(predictionsA)
print("ModelA: Root Mean Squared Error = " + str(RMSE))
# ModelA: Root Mean Squared Error = 128.602026843
