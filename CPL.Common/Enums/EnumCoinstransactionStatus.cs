﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPL.Common.Enums
{
    public enum EnumCoinstransactionStatus
    {
        [Display(Name = "Pending")]
        PENDING,
        SUCCESS,
        FAIL
    }
}
