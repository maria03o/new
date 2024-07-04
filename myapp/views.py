# views.py
from rest_framework import viewsets
from rest_framework import serializers
from .models import Item, Region, Wilayat, CategorySite
from .serializers import ItemSerializer, RegionSerializer, WilayatSerializer, CategorySiteSerializer
from django.shortcuts import render

class ItemViewSet(viewsets.ModelViewSet):
    queryset = Item.objects.all()
    serializer_class = ItemSerializer

class RegionViewSet(viewsets.ModelViewSet):
    queryset = Region.objects.all()
    serializer_class = RegionSerializer

class WilayatViewSet(viewsets.ModelViewSet):
    queryset = Wilayat.objects.all()
    serializer_class = WilayatSerializer

class CategorySiteViewSet(viewsets.ModelViewSet):
    queryset = CategorySite.objects.all()
    serializer_class = CategorySiteSerializer
    

def items_by_category(request, category, wilaya=None):
    items = Item.objects.filter(category__category=category)
    if wilaya:
        items = items.filter(wilaya__name=wilaya)  # Adjust the field name accordingly
    return render(request, 'items_list.html', {'items': items})

def wilayat_by_category(request, category):
    wilayat = Wilayat.objects.filter(category__category=category).distinct()
    return render(request, 'wilayat_list.html', {'wilayat': wilayat})





def upload_view(request):
    if request.method == 'POST':
        form = UploadForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('upload_success')
    else:
        form = UploadForm()
    return render(request, 'upload.html', {'form': form})

def upload_success(request):
    return render(request, 'upload_success.html')
