﻿using CPL.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CPL.Models
{
    public class PaymentViewModel
    {
        public int Id { get; set; }
        public int SysUserId { get; set; }
        public decimal Amount { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public decimal Tier1DirectSale { get; set; }
        public decimal Tier2SaleToTier1Sale { get; set; }
        public decimal Tier3SaleToTier1Sale { get; set; }
        public int Tier1DirectRate { get; set; }
        public int Tier2SaleToTier1Rate { get; set; }
        public int Tier3SaleToTier1Rate { get; set; }
    }
}
