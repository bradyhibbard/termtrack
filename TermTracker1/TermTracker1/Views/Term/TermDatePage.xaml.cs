using System;
using TermTracker1.Models;
using Xamarin.Forms;

namespace TermTracker1.Views.Term
{
    public partial class TermDatePage : ContentPage


    {

        private NewTerm _termToEdit;

        public TermDatePage(NewTerm termToEdit)
        {
            InitializeComponent();
            _termToEdit = termToEdit;

            Title = $"Add {_termToEdit.Title} Term Dates";
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            // Perform date validation and assignment
            var startDate = startDatePicker.Date;
            var endDate = endDatePicker.Date;

            if (startDate > endDate)
            {
                await DisplayAlert("Error", "Start date must be before end date.", "OK");
                return;
            }

            if ((endDate - startDate).TotalDays > (4 * 30)) // 4 months approximation
            {
                await DisplayAlert("Error", "Term duration must be no more than four months.", "OK");
                return;
            }

            // If validation passes, assign dates and save
            _termToEdit.StartDate = startDate;
            _termToEdit.EndDate = endDate;

            // Assuming you have a method to add the term to the database
            var result = await App.DatabaseContext.AddTermAsync(_termToEdit);

            if (result == 1)
            {
                // If successful, navigate to the term list
                await DisplayAlert("Success", "Term dates have been set.", "OK");
                await Navigation.PushAsync(new TermListPage());
            }
            else
            {
                await DisplayAlert("Error", "There was a problem saving the term dates.", "OK");
            }
        }
    }
}
