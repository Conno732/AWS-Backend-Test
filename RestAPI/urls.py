from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("sendMsg", views.sendMsg, name="sendMsg"),
]