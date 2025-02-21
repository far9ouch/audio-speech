from flask import Flask, render_template, request, send_file, jsonify
from zyphra import ZyphraClient
import os
from io import BytesIO
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

app = Flask(__name__)

# Configure environment
app.config['ENV'] = os.getenv('FLASK_ENV', 'production')
app.config['DEBUG'] = False if app.config['ENV'] == 'production' else True
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'your-secret-key-here')

# Configure API key
ZYPHRA_API_KEY = os.getenv('ZYPHRA_API_KEY')

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        try:
            # Get form data
            text = request.form['text']
            language = request.form['language']
            speaking_rate = float(request.form['speaking_rate'])
            output_format = request.form['format']

            # Initialize Zyphra client
            client = ZyphraClient(api_key=ZYPHRA_API_KEY)

            # Generate speech
            audio_data = client.audio.speech.create(
                text=text,
                language_iso_code=language,
                mime_type=f"audio/{output_format}",
                speaking_rate=speaking_rate
            )

            # Create BytesIO object from audio data
            audio_io = BytesIO(audio_data)
            
            # Return the audio file
            return send_file(
                audio_io,
                mimetype=f'audio/{output_format}',
                as_attachment=True,
                download_name=f'AUDAA_speech.{output_format}'
            )

        except Exception as e:
            app.logger.error(f"Error generating speech: {str(e)}")
            return render_template('index.html', error=str(e))

    return render_template('index.html')

@app.route('/api/preview', methods=['POST'])
def preview():
    try:
        text = request.json['text']
        language = request.json['language']
        speaking_rate = float(request.json['speaking_rate'])
        
        client = ZyphraClient(api_key=ZYPHRA_API_KEY)
        
        # Generate a short preview
        preview_text = text[:100] + "..." if len(text) > 100 else text
        audio_data = client.audio.speech.create(
            text=preview_text,
            language_iso_code=language,
            mime_type="audio/mp3",
            speaking_rate=speaking_rate
        )
        
        # Convert to base64 for frontend playback
        import base64
        audio_base64 = base64.b64encode(audio_data).decode('utf-8')
        return jsonify({'success': True, 'audio': audio_base64})
    
    except Exception as e:
        app.logger.error(f"Error generating preview: {str(e)}")
        return jsonify({'success': False, 'error': str(e)})

@app.errorhandler(404)
def not_found(e):
    return render_template('index.html'), 404

@app.errorhandler(500)
def server_error(e):
    app.logger.error(f"Server error: {str(e)}")
    return render_template('index.html', error="Internal server error occurred"), 500

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port) 