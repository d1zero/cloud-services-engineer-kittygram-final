from django.contrib import admin
from .models import Achievement, Cat, AchievementCat

admin.site.register(Achievement)
admin.site.register(Cat)
admin.site.register(AchievementCat)
