from django.shortcuts import render
from django.http import HttpResponse
from .models import ChatMessage
from django.template import loader
from django.http import HttpResponseNotFound
from django.views.decorators.csrf import csrf_exempt

def index(request):
    chat_log = ChatMessage.objects.all()
    
    #response = "<br>".join([m.msg for m in chat_log])
    return HttpResponse(chat_log, status=200)

@csrf_exempt
def sendMsg(request):
    if request.method != "POST":
        return HttpResponseNotFound("Use a POST request")
    
    new_msg = ChatMessage(msg=request.POST["msg"])
    new_msg.save()
    return HttpResponse(status=204)
    
