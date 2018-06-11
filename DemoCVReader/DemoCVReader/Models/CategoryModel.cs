using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.WebPages.Html;

namespace DemoCVReader.Models
{

    public class SkillModel
    {

        public string CategoryID { get; set; }     

        [Required(ErrorMessage="Skill Name is Required")]
        [Display(Name="Skill Name")]
        public string Skill_name { get; set; }

        [Required(ErrorMessage = "Skill Description is Required")]
        [Display(Name = "Skill Description")]
        public string Skill_description { get; set; }

        [Range(1,10)]
        [Required(ErrorMessage = "Please select a Rating")]
        [Display(Name = "Rating")]
        public int Skill_rating{ get; set; }


        public IEnumerable<Category> GetAllCategories()
        {
            using(var context = new SoftProEntites())
            {
                IEnumerable<Category> items = context.Category.ToList();
                return items;
            }
        }
    }


}