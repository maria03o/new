# models.py
#long description
#temp w9tach mftoha et t9dr tkon mftoha tjr

from django.db import models

class Region(models.Model):
    REGION_CHOICES = [
        ('Mountainous', 'Mountainous Region'),
        ('Coastal', 'Coastal Region'),
        ('Desert', 'Desert Region'),
        ('Forest', 'Forest Region')
    ]
    region_type = models.CharField(max_length=20, choices=REGION_CHOICES, unique=True)
    name = models.CharField(max_length=100)
    
    description = models.TextField()

    def __str__(self):
        return self.name

class CategorySite(models.Model):
    CATEGORY_CHOICES = [
        ('for_you', 'For You'),
        ('culture', 'Culture'),
        ('nature', 'Nature'),
        ('hotel', 'Hotel'),
        ('food', 'Food')
    ]
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES, unique=True)

    def __str__(self):
        return self.category
    
class Wilayat(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    picture = models.ImageField(upload_to='images/')
    category = models.ForeignKey(CategorySite, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
    
class Item(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2, default=0.0)
    rating = models.DecimalField(max_digits=3, decimal_places=1, default=0.0)
    item_type = models.CharField(max_length=100)
    full_description = models.TextField()
    highlight = models.TextField()
    url = models.URLField(max_length=500)
    time_string = models.TextField()
    picture = models.ImageField(upload_to='images/')
    picture1 = models.ImageField(upload_to='images/', blank=True, null=True)
    picture2 = models.ImageField(upload_to='images/', blank=True, null=True)
    picture3 = models.ImageField(upload_to='images/', blank=True, null=True)
    picture4 = models.ImageField(upload_to='images/', blank=True, null=True)
    region = models.ForeignKey(Region, on_delete=models.CASCADE)
    wilayat = models.ForeignKey(Wilayat, on_delete=models.CASCADE)
    category = models.ForeignKey(CategorySite, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
 

class Upload(models.Model):
    name = models.CharField(max_length=100, default='Default Name')
    id = models.AutoField(primary_key=True)
    description = models.TextField(default='Default description')
    title = models.CharField(max_length=100)
    image = models.ImageField(upload_to='images/')
    file = models.FileField(upload_to='files/')

    def __str__(self):
        return self.name