//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DemoCVReader
{
    using System;
    using System.Collections.Generic;
    
    public partial class CVInfo
    {
        public int Id { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public string TextualData { get; set; }
        public Nullable<short> Rating { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public byte[] FileBytes { get; set; }
    
        public virtual Customer Customer { get; set; }
    }
}
