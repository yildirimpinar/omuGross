//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OmuGrossMarket
{
    using System;
    using System.Collections.Generic;
    
    public partial class veresiye
    {
        public int satisID { get; set; }
        public int satisTarih { get; set; }
        public int satisMiktar { get; set; }
    
        public virtual musteri musteri { get; set; }
        public virtual perakendeSatis perakendeSatis { get; set; }
    }
}
