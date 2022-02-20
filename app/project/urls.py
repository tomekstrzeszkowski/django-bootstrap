from django.conf.urls import url
from django.http import HttpResponse
from django.urls import path, include


def healthcheck(request):
    """Healthcheck endpoint."""
    from django.db import connection
    import json

    status = {}
    try:
        tables = connection.introspection.table_names()
        status["DB"] = f"ok, tables: {', '.join(tables)}"
    except Exception as e:
        status["DB"] = f"error, {e}"

    return HttpResponse(json.dumps(status), content_type="application/json")


urlpatterns = [
    # url(r"^new-app/", include("new_app.urls")),
    path("healthcheck", healthcheck),
]
