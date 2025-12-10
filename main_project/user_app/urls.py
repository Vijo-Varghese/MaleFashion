from . import views
from django.urls import path




urlpatterns = [
        path('register_user/',views.register_user,name='register_user'),
        path('shop/',views.shop,name='shop'),
        path('product_details/<int:id>',views.product_details,name='product_details'),
        path('add_cart/<int:id>',views.add_cart,name='add_cart'),
        path('view_cart/',views.view_cart,name='view_cart'),
        path('delete_cart_product/<int:id>',views.delete_cart_product,name='delete_cart_product'),
        path('toggle-wishlist/', views.toggle_wishlist, name='toggle_wishlist'),
        path('view_wishlist/', views.view_wishlist, name='view_wishlist'),
        path('check_out/<int:id>',views.check_out,name='check_out'),
        path('wishlist_delete/<int:id>',views.wishlist_delete,name='wishlist_delete'),
        path('payment_success/<int:id>',views.payment_success,name='payment_success'),
        path('account/',views.account,name='account'),
        path('tracking/<int:id>',views.tracking,name='tracking'),
        path('feedback/<int:id>',views.feedback,name='feedback'),
        path('return_pro/<int:id>',views.return_pro,name='return_pro'),
        path('about_us/',views.about_us,name='about_us'),

        
]