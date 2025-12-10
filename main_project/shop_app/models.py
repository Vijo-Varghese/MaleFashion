from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.core.mail import send_mail
from django.conf import settings
import random
import string
from datetime import date
# Create your models here.

class Buyer(models.Model):
    def __str__(self):
        return self.name
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    name=models.CharField(max_length=100,null=True,blank=True)
    email=models.EmailField(null=True,blank=True)
    phone=models.BigIntegerField(null=True,blank=True)
    address=models.CharField(max_length=100,null=True,blank=True)
    city=models.CharField(max_length=100,null=True,blank=True)
    pincode=models.IntegerField(null=True,blank=True)


class Staff(models.Model):
    def __str__(self):
        return self.name
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    name=models.CharField(max_length=100,null=True,blank=True)
    email=models.EmailField(null=True,blank=True)
    phone=models.BigIntegerField(null=True,blank=True)
    
    def save(self, *args, **kwargs):
        new = self.pk is None  # Detect if this is a new record
        super().save(*args, **kwargs)

        if new:
            # Generate password
            password = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
            
            # Set password to linked user
            self.user.set_password(password)
            self.user.save()

            # Send login details email
            subject = "Your Staff Account - Male Fashion"
            message = (
                f"Hello {self.name},\n\n"
                f"Your staff account has been successfully created!\n\n"
                f"Login Details:\n"
                f"Username: {self.user.username}\n"
                f"Password: {password}\n\n"
                f"Please login and change your password immediately.\n\n"
                f"Regards,\nMale Fashion Team"
            )

            send_mail(subject, message, settings.EMAIL_HOST_USER, [self.email])
        super().save(*args,**kwargs)


class Category(models.Model):
    def __str__(self):
        return self.category_name
    category_name=models.CharField(max_length=100,null=True,blank=True)

class Sub_category(models.Model):
    def __str__(self):
        return self.sub_category_name
    category=models.ForeignKey(Category,on_delete=models.CASCADE)
    sub_category_name=models.CharField(max_length=100,null=True,blank=True)


class Products(models.Model):
    def __str__(self):
        return self.product_name
    STATUS_CHOICES=[('Pending','Pending'),('Approved','Approved'),('Rejected','Rejected')]
    product_name=models.CharField(max_length=100,null=True,blank=True)
    Staff=models.ForeignKey(Staff,on_delete=models.CASCADE)
    category=models.ForeignKey(Category,on_delete=models.CASCADE)
    sub_category=models.ForeignKey(Sub_category,on_delete=models.CASCADE)
    brand=models.CharField(max_length=100,null=True,blank=True)
    price=models.IntegerField(null=True,blank=True)
    stock=models.IntegerField(null=True,blank=True)
    description=models.TextField(null=True,blank=True)
    image=models.ImageField(upload_to='media',null=True,blank=True)
    image2=models.ImageField(upload_to='media',null=True,blank=True)
    image3=models.ImageField(upload_to='media',null=True,blank=True)
    size=models.CharField(max_length=100,null=True,blank=True)
    status=models.CharField(max_length=100,choices=STATUS_CHOICES,default='pending')


class Cart(models.Model):
    buyer = models.ForeignKey(Buyer, on_delete=models.CASCADE)  
    product = models.ForeignKey(Products, on_delete=models.CASCADE) 
    quantity = models.IntegerField(null=True, blank=True) 
    total_amount = models.FloatField(null=True, blank=True) 
    size=models.CharField(max_length=100,null=True,blank=True)

class Booking(models.Model):
    def __str__(self):
        return self.buyer.user.first_name
    delivery_choices=[('Confirmed','Confirmed'),('Shipped','Shipped'),('Out For Delivery','Out For Delivery'),('Delivered','Delivered')]
    STATUS_CHOICES=[('Pending','Pending'),('Paid','Paid'),('Cancel','Cancel')]
    buyer=models.ForeignKey(Buyer,on_delete=models.CASCADE)
    product=models.ForeignKey(Products,on_delete=models.CASCADE)
    quantity=models.IntegerField(null=True,blank=True)
    total_amount=models.FloatField(null=True,blank=True)
    status=models.CharField(max_length=100,choices=STATUS_CHOICES,default='pending')
    delivery_status = models.CharField(max_length=100,choices=delivery_choices,default='Confirmed')
    date = models.DateTimeField(auto_now_add=True)
    delivered_at = models.DateField(null=True, blank=True)
    def save(self,*args,**kwargs):
        if self.pk:
            old=Booking.objects.get(pk=self.pk)
            if old.delivery_status!=self.delivery_status:
                send_mail("delivery stated changed",f"dear{self.buyer.user.first_name},Your product {self.delivery_status}",settings.EMAIL_HOST_USER,[self.buyer.email])
        if self.delivery_status == "Delivered" and not self.delivered_at:
            self.delivered_at = date.today()        
        super().save(*args,**kwargs)


class Feedback(models.Model):
    def __str__(self):
        return self.buyer.user.first_name
    buyer=models.ForeignKey(Buyer,on_delete=models.CASCADE)
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    product=models.ForeignKey(Products,on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100,null=True,blank=True)
    date=models.DateField(default=timezone.now)



class Wishlist(models.Model):
    def __str__(self):
        return self.product.product_name
    buyer = models.ForeignKey(Buyer, on_delete=models.CASCADE)
    product = models.ForeignKey(Products, on_delete=models.CASCADE)



class Checkout(models.Model):
    def __str__(self):
        return self.first_name
    buyer = models.ForeignKey(Buyer, on_delete=models.CASCADE)
    product = models.ForeignKey(Products, on_delete=models.CASCADE)
    first_name=models.CharField(max_length=100,null=True,blank=True)
    last_name=models.CharField(max_length=100,null=True,blank=True)
    email=models.EmailField(null=True,blank=True)
    phone=models.BigIntegerField(null=True,blank=True)
    address=models.TextField(null=True,blank=True)
    country=models.CharField(max_length=100,null=True,blank=True)
    state=models.CharField(max_length=100,null=True,blank=True)
    city=models.CharField(max_length=100,null=True,blank=True)
    pin=models.IntegerField(null=True,blank=True)
    quantity = models.IntegerField(null=True, blank=True) 
    total_amount = models.FloatField(null=True, blank=True) 



class Returnproduct(models.Model):
    def __str__(self):
        return self.booking.product.product_name
    booking=models.ForeignKey(Booking,on_delete=models.CASCADE)
    reason=models.CharField(max_length=100,null=True,blank=True)
    date=models.DateField(auto_now_add=True)
    


    def save(self, *args, **kwargs):
        is_new = self.pk is None   
        super().save(*args, **kwargs)

        if is_new:
            user = self.booking.buyer.user
            product = self.booking.product.product_name

            subject = "Return Request Received"
            message = (
                f"Hello {user.first_name},\n\n"
                f"We have received your return request for:\n"
                f"Product: {product}\n"
                f"Reason: {self.reason}\n"
                f"Date: {self.date}\n\n"
                f"Our team will review your request and update you soon.\n\n"
                f"Thank you for shopping with us.\n"
                f"- Male Fashion Team"
            )

            send_mail(subject, message, settings.EMAIL_HOST_USER, [user.email])


    






