from django.conf.urls import include, url

urlpatterns = [
      url(r'^greetings/', include('app1.urls')),
]

