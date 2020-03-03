﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Exo_API.Repositories
{
    public interface ILocalRepository<TKey,T> : IRepository<TKey,T> where T : class
    {
    }
}