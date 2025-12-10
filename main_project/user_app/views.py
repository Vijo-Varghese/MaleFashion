from django.contrib import messages
from django.shortcuts import render,redirect
from django.http import HttpResponse
from datetime import datetime
from shop_app.models import *
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,login,logout
import razorpay
client = razorpay.Client(auth=("rzp_test_fCVgGqgcfDm0Lh", "oRfjzp64mC7AOuS2XRL5VeaT"))

# Create your views here.


def register_user(request):
    if request.method=='POST':
        name=request.POST.get('name')
        username=request.POST.get('username')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        address=request.POST.get('address')
        city=request.POST.get('city')
        pincode=request.POST.get('pincode')
        password=request.POST.get('password')
        re_password=request.POST.get('re_password')
        if User.objects.filter(username=name).exists():
            messages.info(request,"user already exists")
            return redirect('home')
        else:
            if password==re_password:
                user=User.objects.create_user(username=username,password=password,email=email)
                user.first_name=name
                user.save()
                buyer=Buyer()
                buyer.user=user
                buyer.name=name
                buyer.email=email
                buyer.phone=phone
                buyer.address=address
                buyer.city=city
                buyer.pincode=pincode
                buyer.save()
                messages.info(request,"sucessfully registered")
                return redirect('home')
            else:
                messages.info(request,"password mismatches,enter properly")
                return redirect('home')
    return render(request,'register_user.html')


# def shop(request):
#     # category=request.GET.get('category')
#     sort = request.GET.get('sort')
#     subcategory = request.GET.get('subcategory')
#     buyer = Buyer.objects.get(user=request.user)
#     wishlist= Wishlist.objects.filter(buyer=buyer).values_list('product_id', flat=True)
#     # if Buyer.objects.filter(user=request.user).exists():

#     products=Products.objects.filter(status="Approved")
#     # if category:
#     #     products=Products.objects.filter(status="Approved",category__category_name=category)
#     if subcategory:
#         products = products.filter(status="Approved",sub_category__sub_category_name=subcategory)
#     if sort == "low":
#         products = products.order_by('price')
#     elif sort == "high":
#         products = products.order_by('-price')
#     return render(request,'shop.html',{'products':products,'wishlist':wishlist})


def shop(request):
    sort = request.GET.get('sort')
    subcategory = request.GET.get('subcategory')
    wishlist = []
    products = Products.objects.filter(status="Approved")
    if request.user.is_authenticated:
        buyer = Buyer.objects.filter(user=request.user).first()
        if buyer:
            wishlist = Wishlist.objects.filter(buyer=buyer).values_list('product_id', flat=True)
    if subcategory:
        products = products.filter(sub_category__sub_category_name=subcategory)
    if sort == "low":
        products = products.order_by('price')
    elif sort == "high":
        products = products.order_by('-price')
    return render(request, 'shop.html', {'products': products,'wishlist': wishlist })
        
        
   

    

def product_details(request,id):
    feedback=Feedback.objects.filter(product=id)
    products=Products.objects.get(id=id)
    sizes = products.size.split(",") if products.size else []
    return render(request,'product_details.html',{'products':products,'sizes':sizes,'feedback':feedback})


def add_cart(request,id):
    products=Products.objects.get(id=id)
    if request.method=='POST':
        stock=request.POST.get('stock')
        total=int(stock)*int(products.price)
        size=request.POST.get('selected_size')
        cart=Cart()
        cart.product=products
        cart.buyer=Buyer.objects.get(user=request.user)
        cart.quantity=stock
        if size:
            cart.size=size
        cart.total_amount=total
        cart.save()
        if products.stock<=0:
            products.stock=0
        else:
            products.stock-=int(cart.quantity)
        products.save()
        return redirect('view_cart')
    return render(request,'product_details.html',{'products':products})



def view_cart(request):
    buyer=Buyer.objects.get(user=request.user)
    cart=Cart.objects.filter(buyer=buyer)
    g_total=0
    for i in cart:
        g_total=g_total+i.total_amount
    return render(request,'view_cart.html',{'cart':cart,'g_total':g_total})



def delete_cart_product(request,id):
    cart=Cart.objects.get(id=id)
    cart.product.stock+=int(cart.quantity)
    cart.product.save()
    cart.delete()
    messages.info(request,"deleted successfully")
    return redirect('view_cart')




from django.http import JsonResponse
import json

def toggle_wishlist(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        product_id = data.get('product_id')

        buyer = Buyer.objects.get(user=request.user) 
        product = Products.objects.get(id=product_id)

        wish = Wishlist.objects.filter(buyer=buyer, product=product)
        if wish.exists():
            wish.delete()
            return JsonResponse({'added': False})
        else:
            Wishlist.objects.create(buyer=buyer, product=product)
            return JsonResponse({'added': True})

def view_wishlist(request):
    buyer=Buyer.objects.get(user=request.user)
    wishlist=Wishlist.objects.filter(buyer=buyer)
    return render(request,'view_wishlist.html',{'wishlist':wishlist})


def check_out(request,id):
    if request.user.is_authenticated:
        buyer=Buyer.objects.get(user=request.user)
        cart=Cart.objects.filter(buyer=buyer)
        g_total=0
        for i in cart:
            g_total=g_total+i.total_amount
        if not Booking.objects.filter(buyer=buyer).exists():
            off='offer'
            offer_price=g_total-(g_total*(20/100))
        else:
            off=None
            offer_price=g_total 
        if request.method=="POST":
            first_name=request.POST.get('first_name')
            last_name=request.POST.get('last_name')
            country=request.POST.get('country')
            address=request.POST.get('address')
            city=request.POST.get('city')
            state=request.POST.get('state')
            pin=request.POST.get('pin')
            phone=request.POST.get('phone')
            email=request.POST.get('email')
            for i in cart:
                checkout=Checkout.objects.create(buyer=buyer,product=i.product,first_name=first_name,last_name=last_name,country=country,address=address,city=city,state=state,pin=pin,phone=phone,email=email,quantity=i.quantity,total_amount=i.total_amount)
                checkout.save()
            DATA = {
            "amount": float(offer_price) * 100,  # Convert to paise
            "currency": "INR",
            "receipt": f"receipt_{request.user.id}",
            "notes": {"key1": "value3", "key2": "value2", "payment_capture": "1"}
            }
            razorpay_order = client.order.create(data=DATA)
            order_id = razorpay_order['id']
            return JsonResponse({'order_id': order_id, 'status': 'order created', 'price':offer_price})
    return render(request,'check_out.html',{'cart':cart,'g_total':g_total,'offer_price':offer_price,'off':off})


def wishlist_delete(request,id):
    wishlist=Wishlist.objects.get(id=id)
    wishlist.delete()
    return redirect('view_wishlist')



from django.views.decorators.csrf import csrf_exempt
from django.core.mail import send_mail
from django.conf import settings
from django.contrib.auth.decorators import login_required
@login_required(login_url='/login')
@csrf_exempt
def payment_success(request,id):
    
    if request.method=="POST":
        
        try:
            buyer=Buyer.objects.get(user=User.objects.get(id=id))
            cart=Cart.objects.filter(buyer=buyer)
            g_total=0
            for i in cart:

                g_total=g_total+i.total_amount
            if not Booking.objects.filter(buyer=buyer).exists():
                off='offer'
                offer_price=g_total-(g_total*(20/100))
            else:
                off=None
                offer_price=g_total 
            discount_ratio = offer_price / g_total if g_total > 0 else 1
            for i in cart:
                discounted_amount = round(i.total_amount * discount_ratio, 2)
                booking=Booking.objects.create(buyer=buyer,product=i.product,quantity=i.quantity,total_amount=discounted_amount,status="Paid")
                booking.save()
            
            print("xxxxxxxxxxxxxxx")

            try:
                html_message = f"""
                <html>
                  <head>
                    <style>
                      body {{
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        color: #333;
                        padding: 20px;
                      }}
                      .container {{
                        width: 80%;
                        margin: auto;
                        background-color: #fff;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                      }}
                      h2 {{
                        color: #4CAF50;
                      }}
                      table {{
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                      }}
                      th, td {{
                        padding: 12px;
                        border: 1px solid #ddd;
                        text-align: left;
                      }}
                      th {{
                        background-color: #f2f2f2;
                      }}
                      .total {{
                        font-size: 1.2em;
                        font-weight: bold;
                        color: #4CAF50;
                      }}
                      .footer {{
                        margin-top: 20px;
                        text-align: center;
                        font-size: 0.9em;
                        color: #999;
                      }}
                    </style>
                  </head>
                  <body>
                    <div class="container">
                      <h2>Make Fashion booking confirmation</h2>
                      <p>Dear {request.user.first_name} {request.user.last_name},</p>
                      <p>Thank you for your order! Your booking has been successfully processed. Below are the details of your booking:</p>

                      <h3>Booking Details</h3>
                      <table>
                        <tr><th>Buyer Name</th><td>{buyer.name}</td></tr>
                        <tr><th>Email</th><td>{buyer.email}</td></tr>
                      </table>

                      <h3>Ordered Products</h3>
                      <table>
                        <tr><th>Product Name</th><th>Quantity</th><th>Total Amount</th></tr>
                        {''.join([f'<tr><td>{i.product.product_name}</td><td>{i.quantity}</td><td>Rs{discounted_amount}</td></tr>' for i in cart])}
                      </table>


                      <div class="footer">
                        <p>Thank you for choosing Male Fashion. If you have any questions or need assistance, feel free to contact us.</p>
                      </div>
                    </div>
                  </body>
                </html>
                """

                send_mail(
                    subject='Male Fashion Booking Confirmation',
                    message='Thank you for your order.',
                    from_email=settings.EMAIL_HOST_USER,
                    recipient_list=[request.user.email],
                    html_message=html_message,
                    fail_silently=False
                )

            except Exception as email_error:
                print("Email error:", email_error)

            cart.delete()  # Empty the cart regardless of email success
            return JsonResponse({'status':'success'})
            
        
        except Exception as main_error:
            print("Main error:", main_error)
            return JsonResponse({'status': 'error', 'message': str(main_error)})
        
    return JsonResponse({'status': 'error', 'message': 'Invalid request method'})



def account(request):
    if Buyer.objects.filter(user=request.user).exists():
        buyer=Buyer.objects.get(user=request.user)
        booking=Booking.objects.filter(buyer=buyer)
        returns = Returnproduct.objects.filter(booking__in=booking).values_list('booking_id', flat=True)
        feedbacks = Feedback.objects.filter(booking__in=booking).values_list('booking_id', flat=True)

        role="buyer"
        context = {
            'booking': booking,
            'role': role,
            'returns': list(returns),
            'feedbacks': list(feedbacks)
        }
    elif Staff.objects.filter(user=request.user).exists():        
        booking=Booking.objects.all()
        role="staff"
        context = {
            'booking': booking,
            'role': role
        }
    return render(request,"account.html",context)

  
def tracking(request,id):
    book = Booking.objects.get(id=id)
    return render(request,'tracking.html',{'book':book})



def feedback(request,id):
    booking=Booking.objects.get(id=id)
    if request.method=="POST":
        feedback=request.POST.get('feedback')
        Feedback.objects.create(feedback=feedback,buyer=booking.buyer,product=booking.product,booking=booking)
        messages.info(request,"Thank you for your feedback")
        return redirect('account')
    return render(request,'feedback.html',{'booking':booking})


def return_pro(request,id):
    booking=Booking.objects.get(id=id)
    if request.method=="POST":
        reason=request.POST.get('reason')
        Returnproduct.objects.create(reason=reason,booking=booking)
        messages.info(request,"Return successfully")
        return redirect('account')
    return render(request,'return_pro.html',{'booking':booking})


def about_us(request):
    return render(request,'about_us.html')




