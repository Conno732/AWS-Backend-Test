from django.db import models

class ChatMessage(models.Model):
    msg = models.CharField(max_length=100)

    def __str__(self):
        return self.msg
    