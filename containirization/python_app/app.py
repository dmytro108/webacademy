from flask import Flask, jsonify
import redis

app = Flask(__name__)
redis_client = redis.StrictRedis(host='127.0.0.1', port=6379, db=0)

@app.route('/redis/<key_name>', methods=['GET'])
def get_redis_value(key_name):
    try:
        value = redis_client.get(key_name)
        if value is None:
            return jsonify({'error': f'Key "{key_name}" not found'}), 404
        return jsonify({'key': key_name, 'value': value.decode('utf-8')})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
