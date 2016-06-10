import pandas as pd

test = pd.read_csv("test.csv")
nrow = test.shape[0]
output = []
for i in range(0, nrow):
	print i, nrow
	y = (test.Sequence[i].split(","))
	y = map(int, y)
	output.append(max(set(y), key=y.count))

submit = pd.read_csv("sample_submission.csv")
submit["Last"] = output
submit.to_csv("output.csv", index=False)