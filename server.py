import MySQLdb
from tabulate import tabulate
import sys
import socket
import threading
from base64 import b64encode
import zlib

HOST = 'Fa2y'
PORT = 31337

CMDS_USAGE = b'''------------------------------------
help           prints this help message
echo msg       echo back the message `msg` sent
exec msg       execute the mysql query in `msg` and echo back the results
bye            Close the connection
------------------------------------
'''


class ClientThread(threading.Thread):
    def __init__(self, clientAddress, clientsocket):
        threading.Thread.__init__(self)
        self.clAddr = clientAddress
        self.csocket = clientsocket
        print("New connection added: ", clientAddress)

    def run(self):
        try:
            while True:
                msg = self.csocket.recv(1024).strip(b'\n')
                if msg == b'bye':
                    print(f"Client {self.clAddr} Disconnected")
                    break
                elif msg == b'help':
                    self.csocket.send(CMDS_USAGE)
                elif msg.startswith(b'echo'):
                    self.csocket.send(
                        ' '.join(msg.decode().split(' ')[1:]).encode()+b'\n')
                elif msg.startswith(b'exec'):
                    try:
                        CURSOR.execute(
                            ' '.join(msg.decode().split(' ')[1:]).encode()+b'\n')
                        self.csocket.send(drawResult(CURSOR)+b'\n')
                    except MySQLdb.ProgrammingError as pe:
                        self.csocket.send(str(pe).encode()+b'\n')
                else:
                    self.csocket.send(b"Command Not Found, try `help`.\n")
            self.csocket.close()
        except KeyboardInterrupt:
            self.csocket.close()


def drawResult(cur):
    table = cur.fetchall()
    headers = [head[0] for head in cur.description]
    return tabulate(table, headers, tablefmt="pretty").encode()


def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT))
        print(f"LISTING ON:{HOST}:{PORT}")
        while True:
            s.listen()
            conn, addr = s.accept()
            newthread = ClientThread(addr, conn)
            newthread.start()


if __name__ == '__main__':
    DB = MySQLdb.connect("localhost", "mysqltp", "mysqlpassword", "Network")
    CURSOR = DB.cursor()
    try:
        main()
    except KeyboardInterrupt as e:
        CURSOR.close()
        print("GoodBye!")
        sys.exit()
