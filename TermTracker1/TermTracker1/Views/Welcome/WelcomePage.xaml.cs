using System;
using System.Linq;
using System.Collections.Generic;
using Xamarin.Forms;
using TermTracker1.Views.Term;
using System.Threading.Tasks;

namespace TermTracker1.Views.Welcome
{	
	public partial class WelcomePage : ContentPage
	{	
		public WelcomePage ()
		{
			InitializeComponent ();

            addTermButton.Clicked += OnAddTermButtonClicked;
        }

		private async void OnAddTermButtonClicked(object sender, EventArgs e)
		{
            // Logic for adding a new term
            await Navigation.PushAsync(new AddTermPage());
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await CheckAndNavigate();
        }

        private async Task CheckAndNavigate()
        {
            var terms = await App.DatabaseContext.GetTermsAsync(); // Replace with your actual method to retrieve terms

            if (terms.Any())
            {
                // If there are any terms, navigate to the TermListPage
                var termListPage = new TermListPage();
                await Navigation.PushAsync(termListPage);
            }
            else
            {
                // If there are no terms, stay on the WelcomePage
            }
        }
    }
}

