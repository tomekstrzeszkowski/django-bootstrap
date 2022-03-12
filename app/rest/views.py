from rest_framework.views import APIView
from rest_framework.response import Response


class ExampleView(APIView):
    def get(self, request, format=None):
        return Response({"OK": True})

    def post(self, request, format=None):
        return Response({"OK": True})
