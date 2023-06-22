from django.shortcuts import render
from django.http import HttpResponse
from .models import ChatMessage
from django.template import loader
from django.http import HttpResponseNotFound
from django.views.decorators.csrf import csrf_exempt

def index(request):
    chat_log = ChatMessage.objects.all()
    template = loader.get_template("/var/www/sampleapp/AWS-Backend-Test/RestAPI/Templates/index.html")
    context = {
        "output" : chat_log,
    }
    return HttpResponse(template.render(context, request))

@csrf_exempt
def sendMsg(request):
    if request.method != "POST":
        return HttpResponseNotFound("Use a POST request")
    
    new_msg = ChatMessage(msg=request.POST["msg"])
    new_msg.save()
    return HttpResponse(status=204)
    
