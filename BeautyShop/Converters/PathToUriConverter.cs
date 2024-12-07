using System;
using System.Globalization;
using System.Windows.Data;

namespace BeautyShop.Converters
{
    public class PathToUriConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
            => new Uri(value is string s ? $"/Assets/{s}" : "/Assets/picture.png", UriKind.Relative);

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
