package analizadorsintactcarrito;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class AnalizadorSintactCarrito {

    public static void main(String[] args) throws Exception {
        //checkLexer();
        generar();
        //generarLexerCarrito();
    }
    
        public static void generarLexerCarrito() {
        String ruta = "C:\\Users\\lmeji\\OneDrive\\Documentos\\NetBeansProjects\\AnalizadorSintactCarrito\\src\\analizadorsintactcarrito\\entradaCarrito.jflex";
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);  
    }
        public static void checkLexer(){
        frmCarrito ventana = new frmCarrito();
        ventana.setVisible(true);
    }
    public static void generar()throws IOException, Exception {
        String path0 ="C:\\Users\\lmeji\\OneDrive\\Documentos\\NetBeansProjects\\AnalizadorSintactCarrito\\";
        String path = path0 + "src\\analizadorsintactcarrito\\";
        String rutaC = path + "entradaCupCarrito.jflex"; // Scanner lexico
        String fileG ="Syntactic.java"; //Parser sintactico
        String[] rutaS = {"-parser", "Syntactic",path + "GrammarCarrito.cup" };
        File archivo;
        archivo = new File(rutaC);
        JFlex.Main.generate(archivo);
        System.out.println("Fin Lexico");
        java_cup.Main.main(rutaS);
        System.out.println("ruta---");
        Path ruteSym = Paths.get(path + "sym.java");
        if (Files.exists(ruteSym)){
            Files.delete(ruteSym);
        }

        Files.move(Paths.get(path0 + "sym.java"), Paths.get(path + "sym.java"));
        
        Path rutaSin =Paths.get(path+fileG);
        if(Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        
        Files.move(Paths.get(path0 +fileG), Paths.get(path+fileG));
        
    }
    
}
