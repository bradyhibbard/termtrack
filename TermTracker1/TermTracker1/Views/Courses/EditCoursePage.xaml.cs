using System;
using System.Collections.Generic;
using Xamarin.Forms;
using TermTracker1.Models;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
namespace TermTracker1.Views.Courses


{
    public partial class EditCoursePage : ContentPage
    {
        private Course _courseToUpdate;

        public EditCoursePage(Course courseToUpdate)
        {
            InitializeComponent();
            _courseToUpdate = courseToUpdate;

            // Populate text boxes with course details for editing
            title.Text = _courseToUpdate.Title;
            startDatePicker.Date = _courseToUpdate.StartDate;
            endDatePicker.Date = _courseToUpdate.EndDate;
            instructorName.Text = _courseToUpdate.InstructorName;
            instructorEmail.Text = _courseToUpdate.InstructorEmail;
            instructorPhone.Text = _courseToUpdate.InstructorPhone;
            descriptionEditor.Text = _courseToUpdate.Description;
            statusPicker.SelectedItem = _courseToUpdate.Status;
        }

        public async void UpdateCourseButton_Clicked(object sender, EventArgs e)
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

            // Update the _courseToUpdate properties with the new values from the UI
            _courseToUpdate.Title = title.Text;
            _courseToUpdate.StartDate = startDatePicker.Date;
            _courseToUpdate.EndDate = endDatePicker.Date;
            _courseToUpdate.InstructorName = instructorName.Text;
            _courseToUpdate.InstructorPhone = instructorPhone.Text;
            _courseToUpdate.InstructorEmail = instructorEmail.Text;
            _courseToUpdate.Description = descriptionEditor.Text;
            _courseToUpdate.Status = statusPicker.SelectedItem.ToString();

            try
            {

                var result = await App.DatabaseContext.UpdateCourseAsync(_courseToUpdate);

                if (result == 1)
                {
                    await DisplayAlert("Success", "Course Updated Successfully.", "OK");
                }
                else
                {
                    throw new Exception("Failed to update the course in the database.");
                }

                // Navigate back or refresh the page
                await Navigation.PopAsync();
            }
            catch (Exception ex)
            {
                // If there was an error updating the course, inform the user
                await DisplayAlert("Update Failed", "An error occurred while updating the course information: " + ex.Message, "OK");
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
