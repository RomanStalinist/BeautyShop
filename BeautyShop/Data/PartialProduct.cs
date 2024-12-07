using System;
using System.Collections.Generic;
using System.Linq;

namespace BeautyShop.Data
{
    public partial class Product
    {
        public bool IsNotActive => !IsActive;

        public List<string> PhotoPaths
        {
            get
            {
                using (var context = new BeautyShopEntities())
                return context.ProductPhotoes.Where(pp => pp.ProductID == ID)
                        .Select(pp => pp.PhotoPath)
                        .ToList();
            }
        }
    }
}
