//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Parfume_shop
{
    using System;
    using System.Collections.Generic;
    
    public partial class Orders
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Orders()
        {
            this.OrdersComposition = new HashSet<OrdersComposition>();
        }
    
        public int Order_ID { get; set; }
        public System.DateTime Order_date { get; set; }
        public System.DateTime Delivery_date { get; set; }
        public string Client_FIO { get; set; }
        public int Receipt_Code { get; set; }
        public string Status { get; set; }
        public int PointOfIssue_id { get; set; }
    
        public virtual PointOfIssue PointOfIssue { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrdersComposition> OrdersComposition { get; set; }
    }
}
