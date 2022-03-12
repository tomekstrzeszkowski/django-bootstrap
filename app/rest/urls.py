from django.urls import path, include

from rest import views

urlpatterns = [
    path("example/", views.ExampleView.as_view()),
]
