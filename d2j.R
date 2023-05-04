a = airquality
print(class(a))
b=a[with(a,order(Ozone,Wind)),]
print(b)
