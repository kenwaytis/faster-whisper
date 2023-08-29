from faster_whisper import WhisperModel
import base64
from fastapi import FastAPI
from pydantic import BaseModel
from loguru import logger
import json
import time

model_size = "large-v2"
model = WhisperModel(model_size, device="cuda", compute_type="float16")

app = FastAPI()

class Audio(BaseModel):
    audio: str

async def b64_decode(b64_file):
    file_data = base64.b64decode(b64_file)
    return file_data
