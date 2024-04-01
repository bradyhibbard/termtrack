using System;
using System.Collections.Generic;
using Xamarin.Forms;
using TermTracker1.Models;
using System.Linq;
using System.Text.RegularExpressions;

namespace TermTracker1.Views.Courses
{	
	public partial class AddCoursePage : ContentPage
	{
        private NewTerm _selectedTerm;

		public AddCoursePage (NewTerm selectedTerm)
		{
			InitializeComponent ();
            statusPicker.SelectedIndex = 0; // Set the default value to "Plan to take"
            _selectedTerm = selectedTerm;
        }

        private async void AddClassButton_Clicked(object sender, EventArgs e)
        {

            // Validate the Email and Phone number before proceeding
            if (!IsValidEmail(instructorEmail.Text))
            {
                await DisplayAlert("Invalid Input", "Please enter a valid email address.", "OK");
                return;
            }

            if (!IsValidPhoneNumber(instructorPhone.Text))
            {
                await DisplayAlert("Invalid Input", "Please enter a valid phone number with 10 digits.", "OK");
                return;
            }

            var courseStartDate = startDatePicker.Date;
            var courseEndDate = endDatePicker.Date;

            if (courseStartDate > courseEndDate)
            {
                await DisplayAlert("Invalid Date", "The course start date cannot be after the course end date.", "OK");
                return;
            }

            // Validate that the course dates fall within the term's start and end dates
            if (courseStartDate < _selectedTerm.StartDate || courseEndDate > _selectedTerm.EndDate)
            {
                await DisplayAlert("Invalid Date", "Course dates must fall within the term's start and end dates.", "OK");
                return;
            }

            var newClass = new Course
            {
                Title = courseTitleEntry.Text,
                TermId = _selectedTerm.TermId,
                StartDate = startDatePicker.Date,
                EndDate = endDatePicker.Date,
                InstructorName = instructorName.Text,
                InstructorEmail = instructorEmail.Text,
                InstructorPhone = instructorPhone.Text,
                Description = classDescription.Text,
                Status = (string)statusPicker.SelectedItem
            };

            try
            {
                // Save the newClass to your database
                int result = await App.DatabaseContext.AddCourseAsync(newClass);
                if (result == 1) // Assuming InsertAsync returns 1 on success
                {
                    // Optionally, inform the user that the class was added successfully
                    await DisplayAlert("Success", "The class has been added.", "OK");
                    await Navigation.PopAsync();

                }
                else
                {
                    // Handle the case where the insert operation did not return 1
                    await DisplayAlert("Error", "There was an error adding the class.", "OK");
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that may occur during the insert operation
                await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }

        }

        // Method to validate an email address
        private bool IsValidEmail(string email)
        {
            return Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$");
        }

        // Method to validate a phone number
        private bool IsValidPhoneNumber(string phone)
        {
            return phone.All(char.IsDigit) && phone.Length == 10;
        }
    }
}

