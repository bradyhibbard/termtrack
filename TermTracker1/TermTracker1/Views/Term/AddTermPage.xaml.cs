using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using Xamarin.Forms;
using TermTracker1.Models;

namespace TermTracker1.Views.Term
{	
	public partial class AddTermPage : ContentPage
	{	
		public AddTermPage ()
		{
			InitializeComponent ();
		}

        private async void OnSpringTermButtonClicked(object sender, EventArgs e)
        {
            await AddTermAsync("Spring");
        }

        private async void OnSummerTermButtonClicked(object sender, EventArgs e)
        {
            await AddTermAsync("Summer");
        }

        private async void OnFallTermButtonClicked(object sender, EventArgs e)
        {
            await AddTermAsync("Fall");
        }

        private async Task AddTermAsync(string termName)
        {
            // Assuming you have a method in your database context to add a term
            var newTerm = new NewTerm
            {
                Title = termName,

            };

            var addTermDatesPage = new TermDatePage(newTerm);

            await Navigation.PushAsync(addTermDatesPage);

        }
    }
}

