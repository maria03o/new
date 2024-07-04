from rest_framework import serializers
from .models import Item, Region, Wilayat , CategorySite

class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = '__all__'

class RegionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Region
        fields = '__all__'

class WilayatSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wilayat
        fields = '__all__'
       

class CategorySiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = CategorySite
        fields = '__all__'       