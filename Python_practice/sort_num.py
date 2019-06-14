# sort number from smallest to largest
def sort_increasing(num_list):
    n = len(num_list); i = 0
    while(i <= n - 2 ):
        j = i + 1
        while(j <= n - 1):
            if(num_list[i] >= num_list[j]):
                tmp = num_list[i]
                num_list[i] = num_list[j]
                num_list[j] = tmp
            j += 1
        i += 1
    return num_list

b = [5,2,67,123457,1234,67455,2,42,467]
print(sort_increasing(b))