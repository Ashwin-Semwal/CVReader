using DemoCVReader.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoCVReader.Controllers
{
    public class CategoryController : Controller
    {
        //
        // GET: /Category/
        public ActionResult Index()
        {
            using (var context = new SoftProEntites())
            {
                List<Category> result = context.Category.Include("SkillSet").ToList();
                return View(result);
            }
        }


        public ActionResult AddNewSkills()
        {
            SkillModel model = new SkillModel();
            return View(model);
        }

       [HttpPost]
        public ActionResult AddNewSkills(SkillModel model)
        {
            if (ModelState.IsValid)
            {
                using (var context = new SoftProEntites())
                {
                    int categoryID = Convert.ToInt16(model.CategoryID);
                    context.sp_CreateNewSkillSet(categoryID, null, null, model.Skill_name, model.Skill_description, model.Skill_rating.ToString());
                }
                return RedirectToAction("Index", "Category");
            }
            else
            {
                ModelState.AddModelError("", "Please correct your inputs.");
                return View(model);
        
            }

        }


        public ActionResult AddCategory()
         {
             return View();
         }

        [HttpPost]
        public ActionResult AddCategory(Category model)
        {
            using(var context = new SoftProEntites())
            {
                context.Category.Add(model);
                context.SaveChanges();
            }
            return View(model);
        }
       
	}
}