using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace prova_2.Models
{
    public class todocontext : DbContext
    {
        public todocontext(DbContextOptions<todocontext> options)
            : base(options)
        {

        }

        public DbSet<todoitems> TodoItems { get; set; } = null!;

    }
}
