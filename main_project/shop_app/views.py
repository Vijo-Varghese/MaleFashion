from django.contrib import messages
from django.shortcuts import render,redirect
from django.http import HttpResponse
from datetime import datetime
from . models import* 
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,login,logout

# Create your views here.


def index(request):
    return render(request,'index.html')


def home(request):
    role="buyer"
    products=Products.objects.filter(status="Approved")
    if request.user.is_authenticated:
        if Staff.objects.filter(user=request.user).exists():
            role="staff"
    return render(request,'home.html',{'products':products,'role':role})






def login_user(request):
    if request.method=="POST":
        username=request.POST.get('username')
        password=request.POST.get('password')
        user=authenticate(request,username=username,password=password)
        if user is None:
            messages.info(request,"invalid user")
            return redirect('home')
        if Buyer.objects.filter(user=user).exists():
            login(request,user)
            messages.info(request,"login successful")
            return redirect('home')
        if Staff.objects.filter(user=user).exists():
            login(request,user)
            messages.info(request,"login successful")
            return redirect('home')
        else:
            messages.info(request,"invalid user")
            return redirect('')
    return render(request,'login_user.html')


def logout_user(request):
    logout(request)
    return redirect('home')




def view_user(request):
    category = Category.objects.all()
    
    if request.user.is_authenticated:
        if Staff.objects.filter(user=request.user).exists():
            return render(request,'add_product.html',{'role':'staff','user':request.user,'category':category})
    return redirect('login_user')
    

from django.http import JsonResponse

def load_subcategories(request):
    category_id = request.GET.get('category_id')
    subcategories = Sub_category.objects.filter(category_id=category_id).values('id', 'sub_category_name')
    return JsonResponse(list(subcategories), safe=False)



def add_products(request):
    if request.method == "POST":
        product_name = request.POST.get('product_name')
        brand = request.POST.get('brand')
        price = request.POST.get('price')
        stock = request.POST.get('stock')
        description = request.POST.get('description')
        category_id = request.POST.get('categories')
        subcategory_id = request.POST.get('sub_categories')
        photo = request.FILES.get('photo')
        photo2 = request.FILES.get('photo2')
        photo3 = request.FILES.get('photo3')
        sizes = request.POST.getlist('sizes') 
        size_str = ",".join(sizes) if sizes else ""  
        category_obj = Category.objects.get(id=category_id)
        subcategory_obj = Sub_category.objects.get(id=subcategory_id)
        staff_obj = Staff.objects.get(user=request.user)
        Products.objects.create(product_name=product_name,brand=brand,price=price,stock=stock,description=description,category=category_obj,sub_category=subcategory_obj,image=photo,image2=photo2,image3=photo3,Staff=staff_obj,size=size_str)

        messages.success(request, "Product added successfully!")
        return redirect('view_user') 

    return redirect('view_user') 



def view_products(request):
    staff=Staff.objects.get(user=request.user)
    products=Products.objects.filter(status="Approved",Staff=staff)
    return render(request,'view_products.html',{'products':products})


def profile_products(request,id):
    products=Products.objects.get(id=id)
    return render(request,'profile_products.html',{'products':products})



def update_products(request,id):
    products=Products.objects.get(id=id)
    sizes = products.size.split(",") if products.size else []
    sizes = [s.strip() for s in sizes]
    if products.category.category_name == "Dress":
        allowed_sizes = ["XXL", "XL", "L", "S", "M"]
    elif products.category.category_name == "Shoes":
        allowed_sizes = ["5","6","7", "8", "9", "10"]
    else:
        allowed_sizes = []
    if request.method=="POST":
        product_name=request.POST.get('product_name')
        brand=request.POST.get('brand')
        price=request.POST.get('price')
        stock=request.POST.get('stock')
        description=request.POST.get('description')
        image=request.FILES.get('image')
        image2=request.FILES.get('image2')
        image3=request.FILES.get('image3')
        sizes = request.POST.getlist('size') 
        size_str = ",".join(sizes) if sizes else ""  
        products.product_name=product_name
        products.brand=brand
        products.price=price
        products.stock=stock
        products.description=description
        if image:
            products.image=image
        if image2:
            products.image2=image2
        if image3:
            products.image3=image3
        if size_str:
            products.size=size_str
        products.save()
        
        messages.info(request,"updated succesfully")
        return redirect('view_products')
    return render(request,'update_products.html',{'products':products,'sizes':sizes,'allowed_sizes':allowed_sizes})


def delete_products(request,id):
    products=Products.objects.get(id=id)
    products.delete()
    messages.info(request,"deleted successfully")
    return redirect('view_products')
