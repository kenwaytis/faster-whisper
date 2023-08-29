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

