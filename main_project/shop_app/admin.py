from django.contrib import admin

# Register your models here.
from . models import*
admin.site.register(Buyer)
admin.site.register(Staff)
admin.site.register(Category)
admin.site.register(Sub_category)
admin.site.register(Products)
admin.site.register(Cart)

admin.site.register(Feedback)
admin.site.register(Wishlist)
admin.site.register(Checkout)



class BookingAdmin(admin.ModelAdmin):
    list_display = ('buyer','product','quantity','total_amount','status','delivery_status')
    ordering = ('buyer',)
    search_fields = ('buyer__name','product__product_name')
    def get_readonly_fields(self, request, obj=None):
        if request.user.groups.filter(name='Hub').exists():
            return [field.name for field in self.model._meta.fields if field.name!='delivery_status']
        return[]
    
admin.site.register(Booking,BookingAdmin)