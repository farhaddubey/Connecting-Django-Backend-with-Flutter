from api import views
from django.urls import path

urlpatterns = [
     path('student/', views.StudentList.as_view()),
     
]
