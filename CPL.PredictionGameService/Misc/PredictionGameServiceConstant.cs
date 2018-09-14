﻿using Quartz;
using System;
using System.Collections.Generic;
using System.Text;

namespace CPL.PredictionGameService.Misc
{
    public class PredictionGameServiceConstant
    {
        public const string ServiceName = "CPL Prediction Game Service";
        public const string ServiceDescription = "The service to work for prediction game in CPL project";

        public const string PricePredictionBettingIntervalInHour = "PricePredictionBettingIntervalInHour";
        public const string PricePredictionHoldingIntervalInHour = "PricePredictionHoldingIntervalInHour";
        public const string PricePredictionCompareIntervalInMinute = "PricePredictionCompareIntervalInMinute";
        public const string PricePredictionDailyStartTimeInHour = "PricePredictionDailyStartTimeInHour";
        public const string PricePredictionDailyStartTimeInMinute = "PricePredictionDailyStartTimeInMinute";
    }
}
