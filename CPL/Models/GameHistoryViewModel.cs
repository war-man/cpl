﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CPL.Models
{
    public class GameHistoryViewModel
    {
        public int GameId { get; set; }
        public DateTime CreatedDate { get; set; }
        public decimal Amount { get; set; }
        public string Result { get; set; }
        public decimal Balance { get; set; }
        public decimal? Award { get; set; }

        public string GameType { get; set; }
        public string CreatedDateInString { get; set; }
        public string CreatedTimeInString { get; set; }
        public string AmountInString { get; set; }
        public string AwardInString { get; set; }
        public string BalanceInString { get; set; }

        public decimal TotalBalance { get; set; }
        public HoldingPercentageViewModel HoldingPercentage { get; set; }
        public List<WalletChangeViewModel> AssetChange { get; set; }
        public List<WalletChangeViewModel> MonthlyInvest { get; set; }
        public List<WalletChangeViewModel> BonusChange { get; set; }
        public List<GameHistoryViewModel> GameHistories { get; set; }
    }
}
