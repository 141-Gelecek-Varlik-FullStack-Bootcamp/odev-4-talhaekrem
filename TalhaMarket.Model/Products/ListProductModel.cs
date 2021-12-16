﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TalhaMarket.Model.Products
{
    public class ListProductModel
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public string DisplayName { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
    }
}
