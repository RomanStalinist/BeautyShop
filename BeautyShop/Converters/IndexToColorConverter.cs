using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;
using System.Windows.Media;

namespace BeautyShop.Converters
{
    public class IndexToColorConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int selectedIndex && parameter is string photoPath)
            {
                // Определите, равен ли индекс текущему
                return selectedIndex.ToString() == photoPath ? 
                    new SolidColorBrush((Color)Application.Current.Resources["AccentColor"]) : 
                    Brushes.Black; // Цвет для неактивных
            }
            return Brushes.Black; // Или дефолтный цвет
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
