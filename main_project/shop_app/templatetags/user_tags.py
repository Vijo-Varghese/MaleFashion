from django import template
from shop_app. models import Buyer,Staff
register=template.Library()
@register.filter
def is_buyer(user):
    return Buyer.objects.filter(user=user).exists()

@register.filter
def is_staff(user):
    return Staff.objects.filter(user=user).exists()