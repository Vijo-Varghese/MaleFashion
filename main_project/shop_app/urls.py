from . import views
from django.urls import path




urlpatterns = [
    path('',views.home,name='home'),
    path('index/',views.index,name='index'),

    path('login_user/',views.login_user,name='login_user'),
    path('logout_user/',views.logout_user,name='logout_user'),
    path('view_user/',views.view_user,name='view_user'),
    path('ajax/load-subcategories/', views.load_subcategories, name='ajax_load_subcategories'),
    path('add_products/', views.add_products, name='add_products'),
    path('view_products/', views.view_products, name='view_products'),
    path('profile_products/<int:id>', views.profile_products, name='profile_products'),
    path('update_products/<int:id>', views.update_products, name='update_products'),
    path('delete_products/<int:id>', views.delete_products, name='delete_products'),

]