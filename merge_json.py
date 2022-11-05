import os
import json
import time

path = "C:\\Users\\ncezh\\Desktop\\work\\dataset"
path_merges = "C:\\Users\\ncezh\\Desktop\\work\\dataset\\here"

file_list = os.listdir(path)
json_list = []
data_list = []
out_time = time.strftime("%m_%d_%H_%M")

for file in file_list:
    if file.endswith(".json"):
        json_list.append(file)
print(json_list)
print(f"the amount of json：{len(json_list)}")

i = 1
if not os.path.exists(path_merges):
    os.mkdir(path_merges)
with open(os.path.join(path_merges, f'merges_{out_time}.json'),"w",encoding="utf-8") as f1:
    for json_file in json_list:
        json_path = os.path.join(path, json_file)
        with open(json_path, 'r') as f:
            locals()['json_data' + str(i)]= f.read()
            locals()['data_' + str(i)] = json.loads(locals()['json_data' + str(i)].strip())
            data_list = data_list + list(locals()['data_' + str(i)].items())
            i += 1

        data = dict(data_list)
        json_data = json.dumps(data, ensure_ascii=False)
        print(json_data)


        f1.write(json_data)

f1.close()


