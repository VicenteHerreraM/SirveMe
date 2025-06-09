from django.core.management.base import BaseCommand
from django.core.mail import send_mail
from users.models import CustomUser

class Command(BaseCommand):
    help = 'Envía un recordatorio diario a los cocineros para actualizar el inventario'

    def handle(self, *args, **kwargs):
        cocineros = CustomUser.objects.filter(rol='cocinero')
        for cocinero in cocineros:
            send_mail(
                'Recordatorio: Actualiza el inventario',
                'Hola, recuerda actualizar el inventario de productos hoy.',
                'a.tintor304@gmail.com',
                [cocinero.email],
                fail_silently=False,
            )
        self.stdout.write(self.style.SUCCESS('Recordatorio enviado a cocineros'))