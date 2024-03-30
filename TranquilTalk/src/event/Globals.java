package event;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Globals {

    /**
     * @return the myEmail
     */
    public static String getMyEmail() {
        return myEmail;
    }

    /**
     * @param aMyEmail the myEmail to set
     */
    public static void setMyEmail(String aMyEmail) {
        myEmail = aMyEmail.toLowerCase();
    }
    
    public static Globals instance;
    public static Socket socket;
    public static InetAddress ip;
    public static DataInputStream dis;
    public static DataOutputStream dos;
    public static Lock myWriteLock;
    private static String myEmail;

    public static void initGlobals(){
        try{
            ip = InetAddress.getByName("localhost");
            socket = new Socket(ip, 5059);
            dis = new DataInputStream(socket.getInputStream());
            dos = new DataOutputStream(socket.getOutputStream());
            myWriteLock = new ReentrantLock();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static Globals getInstance() {
        if (instance == null) {
            instance = new Globals();
        }
        return instance;
    }
    
    private Globals() {

    }
}
