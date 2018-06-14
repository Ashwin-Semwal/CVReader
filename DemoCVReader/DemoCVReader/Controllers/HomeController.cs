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

        [HttpGet]
        public ActionResult UploadCV(int? id)
        {
            if(!id.HasValue)
            {
                id = 1;
            }
            List<sp_AnalyseSkillSetForTextualInfo_Result> skillsetReport = null;

            string CVtextualInfo = GetCvINfoByCustomerId(id).TextualData;
            skillsetReport = FetchReport(CVtextualInfo);
            ViewBag.PdfFile = GetPdfContent(id);
            return View(skillsetReport);
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


                    Customer NewCustomer = AddCustomer(model);
                    CVInfo cv = new CVInfo();
                    cv.CreatedOn = DateTime.UtcNow;
                    cv.CustomerId = NewCustomer.CustomerId;
                    cv.FileBytes = tempData;
                    cv.Rating = 0;
                    cv.TextualData = CVtextualInfo;
                    CVInfo sav =  AddCVInfo(cv);
                    ViewBag.PdfFile = GetPdfContent(sav.Id);
                

                return View(skillsetReport);
        
            }
            else
            {
                ModelState.AddModelError("", "No File is Choosen");
                return View("Index",model);
            }

        }

        public string GetPdfContent(int? id)
        {
            //id = 1;
            byte[] fileContent = GetCvINfoByCustomerId(id).FileBytes;
            string path = Server.MapPath("~/TempPdf/Random.pdf");
            System.IO.File.WriteAllBytes(path,fileContent);
            return "/TempPdf/Random.pdf";

        }

        private CVInfo GetCvINfoByCustomerId(int? id)
        {
            using (var context = new SoftProEntites())
            {
                if (id.HasValue)
                {
                    return context.CVInfo.Where(cv => cv.CustomerId == id.Value).FirstOrDefault();
                }
                else
                {
                    return null;
                }
            }
        }

        private CVInfo AddCVInfo(CVInfo cv)
        {
            using (var context = new SoftProEntites())
            {
              var cvinfo=  context.CVInfo.Add(cv);
                context.SaveChanges();
                return cvinfo;
            }

        }

        private Customer AddCustomer(CustomerModel model)
        {
            using(var context = new SoftProEntites())
            {
                Customer cust = new Customer();
                cust.EmailId = model.EmailId;
                cust.PasswordHash = model.PasswordHash;
                cust.SaltKey = model.SaltKey;
                cust.Username = model.Username;
                var customer = context.Customer.Add(cust);
                context.SaveChanges();
                return customer;
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