using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;

namespace EnvioMail
{
    public class envioGmail
    {
        public string sendMail(string ReciverMail, string url)
        {
            MailMessage msg = new MailMessage();

            msg.From = new MailAddress("2016hads19@gmail.com");
            msg.To.Add(ReciverMail);
            msg.Subject = "Confirmación HADS ";
            msg.Body = "Para confirmar tu cuenta sigue este enlace " + url;
            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = true;
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new NetworkCredential("2016hads19@gmail.com", ******);
            client.Timeout = 20000;
            try
            {
                client.Send(msg);
                return "Mail has been successfully sent!";
            }
            catch (Exception ex)
            {
                return "Fail Has error" + ex.Message;
            }
            finally
            {
                msg.Dispose();
            }
        }
    }
}
