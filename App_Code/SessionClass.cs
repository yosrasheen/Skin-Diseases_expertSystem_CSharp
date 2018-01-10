using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

namespace ExpertTEST
{
    public struct Node
    {
        public int step;
        public long from;
        public string fromTitle;
        public string decision;
        public int type;
       
    }
    public class SessionClass
    {
       public static int Step{
           get
           {
               if (HttpContext.Current.Session["Step"] == null)
               return 0;
               else
                   return int.Parse(HttpContext.Current.Session["Step"].ToString());
           }
           set
           {
               HttpContext.Current.Session["Step"] = value;
           }
       }
       public static System.Collections.Hashtable Flow
       {
           get 
           {
               if (HttpContext.Current.Session["Flow"] == null)
               {
                  HttpContext.Current.Session["Flow"] = new System.Collections.Hashtable();
               }
               return (System.Collections.Hashtable)HttpContext.Current.Session["Flow"]; 

           }
           set
           {
               HttpContext.Current.Session["Flow"] = value;
           }
       }
       public static void AddNode(int s, long f, string d,string t,int tpe)
       {
           Node nd;
           nd.decision = d;
           nd.from = f;
           nd.step = s;
           nd.fromTitle = t;
           nd.type = tpe;
           if (Flow.ContainsKey(s))
               Flow[s] = nd;
           else
               Flow.Add(s, nd);
       }
       public static string getExpertImage()
       {
           if (SessionClass.Flow.Count > 0)
           {
               System.Drawing.Bitmap bm = new System.Drawing.Bitmap(400, SessionClass.Flow.Count*90);
               System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bm);
               g.Clear(System.Drawing.Color.White);
               int x = 100;
               int y = 10;
               System.Drawing.StringFormat f = new System.Drawing.StringFormat();
               f.Alignment = System.Drawing.StringAlignment.Center;
               f.LineAlignment = System.Drawing.StringAlignment.Center;
               System.Drawing.Font font;
               System.Drawing.Drawing2D.LinearGradientBrush b = new System.Drawing.Drawing2D.LinearGradientBrush(new System.Drawing.Point(0, 40), new System.Drawing.Point(30, 130), System.Drawing.Color.GreenYellow, System.Drawing.Color.LemonChiffon);
               for (int i = 0; i < SessionClass.Flow.Count;i++ )
               {
                   if (((Node)SessionClass.Flow[i]).type == 1)
                   {
                       font = new System.Drawing.Font("Arial Unicode MS", 9, System.Drawing.FontStyle.Regular);
                       g.DrawImageUnscaled(System.Drawing.Image.FromFile(HttpContext.Current.Request.MapPath("tskRect.png")), x - 3, y);
                       g.DrawString(((Node)SessionClass.Flow[i]).fromTitle.Substring(0, ((Node)SessionClass.Flow[i]).fromTitle.Length > 56 ? 56 : ((Node)SessionClass.Flow[i]).fromTitle.Length), font, System.Drawing.Brushes.Black, new System.Drawing.Rectangle(x + 35, y + 8, 170, 40), f);
                       y += 85;  
                   }
                   else
                   {
                       font = new System.Drawing.Font("Arial Unicode MS", 10, System.Drawing.FontStyle.Regular);                
                       g.DrawImageUnscaled(System.Drawing.Image.FromFile(HttpContext.Current.Request.MapPath("tskOval.png")), x, y);
                       g.DrawString(((Node)SessionClass.Flow[i]).fromTitle.Substring(0, ((Node)SessionClass.Flow[i]).fromTitle.Length > 52 ? 52 : ((Node)SessionClass.Flow[i]).fromTitle.Length), font, System.Drawing.Brushes.Black, new System.Drawing.Rectangle(x + 30, y + 6, 172, 40), f);
                       y += 85;
                   }
                   if (((Node)SessionClass.Flow[i]).from == -1)
                       break;
               }

               if (SessionClass.Flow.Count > 0)
               {
                   x = 100;
                   y = 10;
                   int y1, y2;
                   for (int i = 1; i < SessionClass.Flow.Count  ; i++)
                   {
                           System.Drawing.Pen p = new System.Drawing.Pen(System.Drawing.Color.Black);
                           p.Width = 1.5F;
                           y1 = (((i) * 50) + y + ((i-1) * 35));
                           y2 = (((i) * 50) + y + ((i) * 35));
                           g.DrawLine(p, 200, y1 + 2, 200, y2);
                           System.Drawing.Point[] pns = new System.Drawing.Point[4];
                           pns[0] = new System.Drawing.Point(195, y2 - 5);
                           pns[1] = new System.Drawing.Point(200, y2);
                           pns[2] = new System.Drawing.Point(205, y2 - 5);
                           pns[3] = new System.Drawing.Point(195, y2 - 5);
                           g.FillPolygon(System.Drawing.Brushes.Black, pns);

                       g.DrawString(((Node)SessionClass.Flow[i-1]).decision.Equals("True")?"Yes":"No", new System.Drawing.Font("Arial Unicode MS", 9, System.Drawing.FontStyle.Regular), System.Drawing.Brushes.Black, new System.Drawing.Point(205, y1 +6));
                           if (((Node)SessionClass.Flow[i]).from == -1)
                               break;
                                 
                   }
               }
               string res = HttpContext.Current.Server.MapPath("Results")+"\\User"+DateTime.Now.ToString("yyyyMMddhhmmss")+".png";
               bm.Save(res, System.Drawing.Imaging.ImageFormat.Png);
               return "Results/"+res.Replace(HttpContext.Current.Server.MapPath("Results")+"\\","");
           }
           return "";
       }
       public static void BindTooltip(ListControl lc)
        {
            for (int i = 0; i < lc.Items.Count; i++)
            {
                lc.Items[i].Attributes.Add("title", lc.Items[i].Text);
            }
        }

    }
  
}