from django.shortcuts import redirect
from functools import wraps

def role_required(allowed_roles):
    def decorator(view_func):
        @wraps(view_func)
        def _wrapped_view(request, *args, **kwargs):
            if not request.user.is_authenticated:
                return redirect('login')
            if hasattr(request.user, 'rol') and request.user.rol in allowed_roles:
                return view_func(request, *args, **kwargs)
            # Opcional: redirige a una página de acceso denegado o home
            return redirect('denied')
        return _wrapped_view
    return decorator