﻿using CPL.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace CPL.Mapping
{
    public class LotteryPrizeMap : IEntityTypeConfiguration<LotteryPrize>
    {
        public void Configure(EntityTypeBuilder<LotteryPrize> builder)
        {
            // Primary Key
            builder.HasKey(t => t.Id);

            // Table & Column Mappings
            builder.ToTable("LotteryPrize");
            builder.Property(t => t.Id).HasColumnName("Id");
            builder.Property(t => t.Name).HasColumnName("Name");
            builder.Property(t => t.Value).HasColumnName("Value");
            builder.Property(t => t.LotteryId).HasColumnName("LotteryId");
            builder.Property(t => t.Volume).HasColumnName("Volume");
            builder.Property(t => t.Color).HasColumnName("Color");

            //Relationship
            builder.HasOne(x => x.Lottery)
                .WithMany(x => x.LotteryPrizes)
                .HasForeignKey(x => x.LotteryId);
        }
    }
}
