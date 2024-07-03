# urls.py
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ItemViewSet, RegionViewSet, WilayatViewSet, CategorySiteViewSet, items_by_category, wilayat_by_category

router = DefaultRouter()
router.register(r'items', ItemViewSet)
router.register(r'regions', RegionViewSet)
router.register(r'wilayat', WilayatViewSet)
router.register(r'categories', CategorySiteViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('items/category/<str:category>/', items_by_category, name='items_by_category'),
    path('wilayat/category/<str:category>/', wilayat_by_category, name='wilayat_by_category'),
]





