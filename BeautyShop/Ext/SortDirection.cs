using System.Collections.Generic;

namespace BeautyShop.Ext
{
    public class SortDirection
    {
        public static readonly SortDirection None = new SortDirection(Ext.SortDirections.None);
        public static readonly SortDirection Ascending = new SortDirection(Ext.SortDirections.Ascending);
        public static readonly SortDirection Descending = new SortDirection(Ext.SortDirections.Descending);
        public static readonly IEnumerable<SortDirection> SortDirections = new List<SortDirection> { None, Ascending, Descending };

        public SortDirections Direction { get; set; }

        private SortDirection(SortDirections direction)
        {
            Direction = direction;
        }

        public override string ToString()
        {
            switch (Direction)
            {
                case Ext.SortDirections.Ascending:
                    return "По возрастанию";
                case Ext.SortDirections.Descending:
                    return "По убыванию";
                default:
                    return "Без сортировки";
            }
        }
    }
}
