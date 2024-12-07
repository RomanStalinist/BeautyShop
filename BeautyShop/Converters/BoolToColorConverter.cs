using System;
using System.Globalization;
using System.Windows.Data;
using System.Windows.Media;

namespace BeautyShop.Converters
{
    public class BoolToColorConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
            => value is bool b && b ? Brushes.Transparent : Brushes.LightGray;

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
            => value is Brush b && b == Brushes.Transparent;
    }
}
