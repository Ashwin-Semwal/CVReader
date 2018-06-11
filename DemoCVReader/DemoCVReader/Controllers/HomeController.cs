using DemoCVReader.Models;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace DemoCVReader.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            CustomerModel cust = new CustomerModel();
            return View(cust);
        }

        [HttpPost]
        public ActionResult UploadCV(CustomerModel model)
        {
            HttpPostedFileBase claimFile = Request.Files["cvfile"];
            if(model.Username.Length < 5)
            {
                ModelState.AddModelError("", "Please Ensure your Username must follow the rules.");
                return View("Index", model);               
            }
            if (model.Password.Length < 5)
            {
                ModelState.AddModelError("", "Please Ensure your Password must follow the rules.");
                return View("Index", model);
            }
            if (!claimFile.ContentType.Contains("pdf"))
            {
                ModelState.AddModelError("", "Please Upload a valid pdf file.");
                return View("Index", model);
            }

            if (!IsValidEmail(model.EmailId))
            {
                ModelState.AddModelError("", "Email is not a valid Email.");
                return View("Index", model);
            }

            if(claimFile.ContentLength <= 0)
            {
                ModelState.AddModelError("", "Please Upload A file.");
                return View("Index", model);
            }


            if (claimFile != null)
            {
                byte[] tempData = new byte[claimFile.ContentLength];
                claimFile.InputStream.Read(tempData, 0, claimFile.ContentLength);

                List<sp_AnalyseSkillSetForTextualInfo_Result> skillsetReport = null;
                    string CVtextualInfo = ParsePdf(tempData);
                    skillsetReport = FetchReport(CVtextualInfo);
                

              

                return View(skillsetReport);
        
            }
            else
            {
                ModelState.AddModelError("", "No File is Choosen");
                return View("Index",model);
            }

        }

        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private List<sp_AnalyseSkillSetForTextualInfo_Result> FetchReport(string CVtextualInfo)
        {
         
            using(var context = new SoftProEntites())
            {

                var result = context.sp_AnalyseSkillSetForTextualInfo(CVtextualInfo).ToList();
                return result;
            }
        }


        public string ParsePdf(byte[] file)
        {

            using (PdfReader reader = new PdfReader(file))
            {
                StringBuilder sb = new StringBuilder();

                ITextExtractionStrategy strategy = new SimpleTextExtractionStrategy();
                for (int page = 0; page < reader.NumberOfPages; page++)
                {
                    string text = PdfTextExtractor.GetTextFromPage(reader, page + 1, strategy);
                    if (!string.IsNullOrWhiteSpace(text))
                    {
                        sb.Append(Encoding.UTF8.GetString(ASCIIEncoding.Convert(Encoding.Default, Encoding.UTF8, Encoding.Default.GetBytes(text))));
                    }
                }

                return sb.ToString();
            }
        }

        
       
    }
}