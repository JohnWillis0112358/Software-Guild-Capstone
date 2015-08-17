using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.BLL;
using Blog.MODELS;

namespace Blog.UI.Controllers
{
    public class BlogController : Controller
    {

        // GET: Blog
        public ActionResult Index()
        {
            var blogOp = new BlogOperations();

            var fullblogs = blogOp.GetAllBlogEntries().Where(m => m.EndDate > DateTime.Now || m.EndDate.HasValue == false).ToList();

            //fullblogs.Count

            return View(fullblogs);
        }

        //Create Get Static action, with partial view
        public PartialViewResult GetStaticPages()
        {
            var blogOp = new BlogOperations();
            var staticPages = blogOp.GetStaticEntries();

            return PartialView(staticPages);

        }

        // GET: Blog/Details/5
        public ActionResult Details(int id)
        {
            var blogOp = new BlogOperations();

            return View(blogOp.GetBlogEntry(id));
        }

        // GET: Blog/Create
        public ActionResult Create()
        {
            var blogEntry = new BlogEntry();
            return View(blogEntry);
        }

        // POST: Blog/Create
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(BlogEntry blogEntry)
        {
            try
            {
                var blogOp = new BlogOperations();

                if (User.IsInRole("Admin"))
                {
                    blogEntry.StatusID = 1;
                }
                else
                {
                    blogEntry.StatusID = 3;
                }

                blogOp.CreateBlogEntry(blogEntry);



                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Blog/Edit/5
        public ActionResult Edit(int id)
        {
            var blogOp = new BlogOperations();

            return View(blogOp.GetBlogEntry(id));
        }

        // POST: Blog/Edit/5
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Edit(int id, BlogEntry blogEntry)
        {
            try
            {
                var blogOp = new BlogOperations();
                blogOp.EditBlogEntry(blogEntry);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Blog/Delete/5
        public ActionResult Delete(int id)
        {
            var blogOp = new BlogOperations();

            return View(blogOp.GetBlogEntry(id));
        }

        // POST: Blog/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, BlogEntry blogEntry)
        {
            try
            {
                var blogOp = new BlogOperations();
                blogOp.DeleteBlogEntry(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult BlogSummary()
        {
            return View();
        }

        public ActionResult Blogs()
        {
            var operations = new BlogOperations();


            return View(operations.GetAllBlogEntries());
        }

        //GET: Blog/CreateStatic
        public ActionResult CreateStatic()
        {
            var staticEntry = new StaticEntry();
            return View(staticEntry);
        }

        //POST: Blog/CreateStatic
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult CreateStatic(StaticEntry staticEntry)
        {
            try
            {
                var blogOp = new BlogOperations();

                blogOp.CreateStaticEntry(staticEntry);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //GET: Blog/DeleteStatic
        public ActionResult DeleteStatic(int id)
        {
            var blogOp = new BlogOperations();

            return View(blogOp.GetStaticEntry(id));
        }

        //POST: Blog/DeleteStatic
        [HttpPost]
        public ActionResult DeleteStatic(int id, StaticEntry staticEntry)
        {
            try
            {
                var blogOp = new BlogOperations();
                blogOp.DeleteStaticEntry(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //GET: Blog/EditStatic
        public ActionResult EditStatic(int id)
        {
            var blogOp = new BlogOperations();

            return View(blogOp.GetStaticEntry(id));
        }

        //POST: Blog/EditStatic
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult EditStatic(int id, StaticEntry staticEntry)
        {
            try
            {
                var blogOp = new BlogOperations();
                blogOp.EditStaticEntry(staticEntry);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult GetStaticPage(int id)
        {
            var blogOp = new BlogOperations();
            var getentry = blogOp.GetStaticEntry(id);

            return View(getentry);


        }
    }
}
