using System;
using System.Collections.Generic;
using Xamarin.Forms;
using TermTracker1.Models;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Plugin.LocalNotification;

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
            notificationPicker.SelectedItem = _courseToUpdate.NotificationTimeOption;
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
            _courseToUpdate.NotificationTimeOption = notificationPicker.SelectedItem.ToString();

            try
            {

                var result = await App.DatabaseContext.UpdateCourseAsync(_courseToUpdate);

                if (result == 1)
                {
                    string notificationOption = notificationPicker.SelectedItem.ToString();
                    await ScheduleCourseNotification(_courseToUpdate, notificationOption);

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

        private async Task ScheduleCourseNotification(Course course, string notificationTimeOption)
        {
            // Determine the time to notify based on the user's choice
            TimeSpan timeBeforeNotification;
            switch (notificationTimeOption)
            {
                case "1 day before":
                    timeBeforeNotification = TimeSpan.FromDays(-1);
                    break;
                case "2 days before":
                    timeBeforeNotification = TimeSpan.FromDays(-2);
                    break;
                case "1 week before":
                    timeBeforeNotification = TimeSpan.FromDays(-7);
                    break;
                case "2 weeks before":
                    timeBeforeNotification = TimeSpan.FromDays(-14);
                    break;
                default:
                    // Handle the default case, maybe log an error or set a default time
                    timeBeforeNotification = TimeSpan.Zero;
                    break;
            }

            if (timeBeforeNotification != TimeSpan.Zero)
            {
                DateTime notifyTime = course.StartDate.Add(timeBeforeNotification);

                // Ensure we're not setting a notification in the past
                if (notifyTime > DateTime.Now)
                {
                    // Create and schedule your notification
                    var notification = new NotificationRequest
                    {
                        NotificationId = course.CourseId,
                        Title = $"Upcoming Course: {course.Title}",
                        Description = $"Your course '{course.Title}' starts on {course.StartDate:MM/dd/yyyy}.",
                        Schedule = new NotificationRequestSchedule
                        {
                            NotifyTime = notifyTime
                        }
                    };

                    // Schedule the notification
                    await NotificationCenter.Current.Show(notification);
                }
            }
            else
            {
                await DisplayAlert("Error", "Unable to Set Alert", "OK");
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
