# Works on python3 only
import time
import random
import pika

def gen_random():
    # F1 = Customer Identity file number
    #cif = random.randrange(1000000000, 1000099999, 1)
    seeder=random.randrange(1,2000)
    random.seed(seeder)
    cif = random.randrange(1201400000, 1201499999, 1)
    random.seed()
    # F2 Transaction code
    list = ['D', 'W']
    trx_code = random.choice(list)
    # F3 Amount transacted
    amt = random.randrange(1, 2000, 1)
    # ^F4 timestamp of transaction
    txn_ts = int(time.time())
    
    return(cif, trx_code, amt, txn_ts)

def publish_mq(msg):
    connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
    channel = connection.channel()
    channel.queue_declare(queue='prod')
    channel.basic_publish(exchange='',
                      routing_key='prod',
                      body=msg)
    connection.close()

if __name__ == '__main__':
    while True:
        msg = ''
        cif, trx_code, amt, txn_ts = gen_random()
        #msg = 
        time.sleep(0.5)
        msg = "%s|%s|%s|%s" % (txn_ts, cif, trx_code, amt)
        #print(cif, trx_code, amt, txn_ts, sep='|')
        print(msg)
        publish_mq(msg)
