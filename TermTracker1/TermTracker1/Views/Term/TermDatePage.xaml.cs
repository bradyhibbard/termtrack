using System;
using System.Threading.Tasks;
using TermTracker1.Models;
using Xamarin.Forms;

namespace TermTracker1.Views.Term
{
    public partial class TermDatePage : ContentPage

    {
        private NewTerm _newTerm;

        private bool _isEditMode;

        public TermDatePage(NewTerm newTerm)
        {
            InitializeComponent();
            _newTerm = newTerm ?? throw new ArgumentNullException(nameof(newTerm));

            termTitleEntry.Text = _newTerm.Title;
            startDatePicker.Date = _newTerm.StartDate;
            endDatePicker.Date = _newTerm.EndDate;

            _isEditMode = true;
        }

        public TermDatePage()
        {
            InitializeComponent();
            _newTerm = new NewTerm();
            _isEditMode = false;
        }


        private async Task SaveNewTerm()
        {


            // Perform date validation and assignment
            var startDate = startDatePicker.Date;
            var endDate = endDatePicker.Date;
            string title = termTitleEntry.Text;

            if (startDate > endDate)
            {
                await DisplayAlert("Error", "Start date must be before end date.", "OK");
                return;
            }

            if ((endDate - startDate).TotalDays > (4 * 31)) // 4 months approximation
            {
                await DisplayAlert("Error", "Term duration must be no more than four months.", "OK");
                return;
            }

            // If validation passes, assign dates and save
            _newTerm.StartDate = startDate;
            _newTerm.EndDate = endDate;
            _newTerm.Title = title;

            // Add new term to database
            var result = await App.DatabaseContext.AddTermAsync(_newTerm);

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

        private async Task EditNewTerm()
        {

            // Perform date validation and assignment
            var startDate = startDatePicker.Date;
            var endDate = endDatePicker.Date;
            string title = termTitleEntry.Text;

            if (startDate > endDate)
            {
                await DisplayAlert("Error", "Start date must be before end date.", "OK");
                return;
            }

            if ((endDate - startDate).TotalDays > (4 * 31)) // 4 months approximation
            {
                await DisplayAlert("Error", "Term duration must be no more than four months.", "OK");
                return;
            }

            // If validation passes, assign dates and save
            _newTerm.StartDate = startDate;
            _newTerm.EndDate = endDate;
            _newTerm.Title = title;

            // Update Term in database
            var result = await App.DatabaseContext.UpdateTermAsync(_newTerm);

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

        private async void OnSaveClicked(object sender, EventArgs e)
        {

            if (_isEditMode == true)
            {
                await EditNewTerm();
            }
            else
            {
                await SaveNewTerm();
            }
        }

    }
}
