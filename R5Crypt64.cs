using System;
using RGiesecke.DllExport;

namespace R5Crypt64
{
    public class R5Crypt64
    {
        //static PDFManipulate pdfmanipulate = new PDFManipulate();

        [DllExport("TestMethod")]
        static int TestMethod(string input)
        {   
            int result = 0;
            if (input != null) { result = 100; };
            if (input == "Hello") { result = 555; };
            
            return result;
        }

        /*
        [DllExport]
        static int ConvertImageToPDF(string ImageFile,string OutputFileName){
            int result = 0;

            if (pdfmanipulate.ConvertImageToPdf(ImageFile, OutputFileName)) { result = 1;};
            
            return result;
        }
        */

        #region R5CryptUtil
        static AESCryptUtil aesCryptUtil;
        //public string password;

        [DllExport]
        public static bool R5InitCryptConf(string password)
        {
            aesCryptUtil = new AESCryptUtil();
            aesCryptUtil.SetPassword(password);
            return true;
        }

        [DllExport]
        public static bool R5FinalCryptConf() 
        {
            aesCryptUtil = null;
            return true;
        }

        [DllExport]
        //public void R5CryptEncrypt(Boolean IsEof,Byte Buf,int DataSize,int BufSize){ }
        public static bool R5CryptEncrypt(string PlainText, out string EncryptText)
        {
            EncryptText = aesCryptUtil.Encrypt(PlainText, aesCryptUtil.GetPassword());
            return true;
        }

        [DllExport]
        //public void R5CryptDecrypt(Boolean IsEof,Byte Buf,int DataSize) { }
        public static bool R5CryptDecrypt(string CipherText, out string PlainText)
        {
            PlainText = aesCryptUtil.Decrypt(CipherText, aesCryptUtil.GetPassword());
            return true;
        }
        #endregion
    }
}
