using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using Xamarin.Forms;
using TermTracker1.Models;
using TermTracker1.Views.Courses;

namespace TermTracker1.Views.Term
{	
	public partial class TermListPage : ContentPage
	{	
		public TermListPage ()
		{
			InitializeComponent ();
		}

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await LoadTermsAsync();
        }

        private async Task LoadTermsAsync()
        {
            //Return all terms for student.
            var terms = await App.DatabaseContext.GetTermsAsync();
            termsStack.Children.Clear();

            foreach (var term in terms)
            {
                var termButton = new Button
                {
                    Text = term.Title.ToUpper(),
                    BackgroundColor = Color.Black,
                    TextColor = Color.White
                };

                termButton.Clicked += (sender, args) => { NavigateToTerm(term); };
                termsStack.Children.Add(termButton);
            }
        }

        private async void NavigateToTerm(NewTerm selectedTerm)
        {
            // Navigate to a specific term page, passing the selected term
            var courseDetailsPage = new CourseListPage(selectedTerm);
            await Navigation.PushAsync(courseDetailsPage);
        }

        private async void OnAddTermButtonClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new TermDatePage());
        }
    }
}

