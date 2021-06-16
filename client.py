import click
import socket
from tkinterify import tkinterify

HOST = "Fa2y"
PORT = 31337

SOCK = None


def recvall(sock):
    BUFF_SIZE = 4096  # 4 KiB
    data = b''
    while True:
        part = sock.recv(BUFF_SIZE)
        data += part
        if len(part) < BUFF_SIZE:
            # either 0 or end of data
            break
    return data


def sendCommand(cmd):
    SOCK.sendall(cmd.encode())
    data = recvall(SOCK)
    return data


@click.group()
def cli():
    pass


@click.command()
def init():
    global SOCK
    try:
        SOCK = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        SOCK.connect((HOST, PORT))
        print("Socket successfully created")
    except socket.error as err:
        print("socket creation failed with error %s" % (err))


@click.command()
@click.argument('args')
def echo(args):
    data = sendCommand(f'echo {args}')
    print(data.decode())


@click.command()
@click.argument('args')
def exec(args):
    data = sendCommand(f'exec {args}')
    print(data.decode())


@click.command()
def bye():
    sendCommand('bye')
    print("Disconnected From Server!\nPS: run init to reconnect.")


@click.command()
def help():
    print('''------------------------------------
help           prints this help message
echo msg       echo back the message `msg` sent
exec msg       execute the mysql query in `msg` and echo back the results
bye            Close the connection
------------------------------------''')


cli.add_command(echo)
cli.add_command(help)
cli.add_command(exec)
cli.add_command(init)
cli.add_command(bye)
# initializing
cli.commands['init'].invoke(cli.commands['init'].make_context(
                            "tkinter", []))

tkinterify(cli)
