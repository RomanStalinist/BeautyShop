using BeautyShop.Data;
using BeautyShop.Ext;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace BeautyShop.Views
{
    public partial class MainWindow
    {
        public MainWindow()
        {
            InitializeComponent();
            using (var context = new BeautyShopEntities())
            {
                ProductsList.ItemsSource = context.Products.ToList();
                ManufacturerBox.ItemsSource = new List<Manufacturer> { new Manufacturer { Name = "Все" } }
                    .Concat(context.Manufacturers.ToList());
                SortBox.ItemsSource = SortDirection.SortDirections.ToList();

                ManufacturerBox.SelectedItem = ManufacturerBox.Items[0];
                SortBox.SelectedItem = SortBox.Items[0];
            }
        }

        private async void QueryBox_TextChanged(object sender, TextChangedEventArgs e) => await UpdateListView();

        private async void ManufacturerBox_SelectionChanged(object sender, SelectionChangedEventArgs e) => await UpdateListView();

        private async void SortBox_SelectionChanged(object sender, SelectionChangedEventArgs e) => await UpdateListView();

        private async Task UpdateListView()
        {
            var text = QueryBox.Text;
            IQueryable<Product> products = null;

            using (var context = new BeautyShopEntities())
            {
                products = context.Products;
                var allProductsCount = await products.CountAsync();
                
                products = products.Where(p => p.Title.StartsWith(text));

                if (SortBox.SelectedItem is SortDirection sort)
                    if (sort.Direction is SortDirections.Ascending)
                        products = products.OrderBy(p => p.Cost);
                    else if (sort.Direction is SortDirections.Descending)
                        products = products.OrderByDescending(p => p.Cost);

                if (ManufacturerBox.SelectedItem is Manufacturer manufacturer && manufacturer.ID != 0)
                    products = products.Where(p => p.ManufacturerID == manufacturer.ID);


                var foundProductsCount = await products.CountAsync();
                ProductsList.ItemsSource = await products.ToListAsync();
                StatusBox.Text = $"Найдено {foundProductsCount} из {allProductsCount} продуктов";
            }
        }

        private async void EditMenuItem_Click(object sender, RoutedEventArgs e)
        {
            if (!TryGetProductFromMenuItem(sender, out var product)) return;
            new AddEditWindow(product).ShowDialog();
            await UpdateListView();
        }

        private async void DeleteMenuItem_Click(object sender, RoutedEventArgs e)
        {

            if (!TryGetIdFromMenuItem(sender, out var id)) return;
            using (var context = new BeautyShopEntities())
            {
                var product = await context.Products.FirstAsync(p => p.ID == id);

                if (id != 0 && !(MessageBox.Show(
                    $"Вы уверены, что хотите удалить \"{product.Title}\"?",
                    "Подтверждение",
                    MessageBoxButton.YesNo,
                    MessageBoxImage.Question) is MessageBoxResult.Yes)) return;

                context.Products.Remove(product);
                await context.SaveChangesAsync();
                await UpdateListView();
            }
        }

        private bool TryGetIdFromMenuItem(object sender, out int id)
        {
            if (!(sender is MenuItem mi))
            {
                id = 0;
                return false;
            }

            if (!(mi.Tag is int tag))
            {
                id = 0;
                return false;
            }
            
            id = tag;
            return true;
        }

        private bool TryGetProductFromMenuItem(object sender, out Product product)
        {
            if (!(sender is MenuItem mi))
            {
                product = null;
                return false;
            }

            if (!(mi.Tag is Product tag))
            {
                product = null;
                return false;
            }

            product = tag;
            return true;
        }
    }
}
