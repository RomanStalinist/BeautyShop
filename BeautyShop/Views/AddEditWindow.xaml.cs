using BeautyShop.Data;

namespace BeautyShop.Views
{
    public partial class AddEditWindow
    {
        private readonly Product _product;

        public AddEditWindow(Product product = null)
        {
            InitializeComponent();
            _product = product ?? new Product();
            DataContext = _product;
        }
    }
}
