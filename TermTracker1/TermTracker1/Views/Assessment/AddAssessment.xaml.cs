using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xamarin.Forms;
using TermTracker1.Models;
using Plugin.LocalNotification;

namespace TermTracker1.Views.Assessment
{	
	public partial class AddAssessment : ContentPage
	{

        private int _courseId;
        private NewAssessment _existingAssessment;
        private bool _isEditMode;
        private AssessmentType _assessmentType;


		public AddAssessment (int courseId, AssessmentType assessmentType, NewAssessment existingAssessment = null)
		{
			InitializeComponent ();
            _courseId = courseId;
            _courseId = courseId;
            _assessmentType = assessmentType;

            if (existingAssessment != null)
            {
                SetAssessment(existingAssessment);
            }
            else
            {
                _isEditMode = false;
                deleteButton.IsVisible = false;
            }
        }


        public async Task ScheduleAssessmentNotification(NewAssessment assessment, string notificationTimeOption)
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
                    timeBeforeNotification = TimeSpan.Zero; // Default case if the option is unrecognized
                    break;
            }

            if (timeBeforeNotification != TimeSpan.Zero)

            {
                var notifyTime = assessment.DueDate.Add(timeBeforeNotification);

                // Ensure we're not setting a notification in the past
                if (notifyTime > DateTime.Now)
                {
                    var notification = new NotificationRequest
                    {
                        NotificationId = assessment.AssessmentId,
                        Title = $"Upcoming Assessment: {assessment.Title}",
                        Description = $"Your assessment '{assessment.Title}' is due on {assessment.DueDate:MM/dd/yyyy}.",
                        Schedule = new NotificationRequestSchedule
                        {
                            NotifyTime = notifyTime
                        }
                    };

                    await NotificationCenter.Current.Show(notification);
                }
            }
            else
            {
                await DisplayAlert("Error","Unable to Add Notification.", "Ok");
            }
        }



        public void SetAssessment(NewAssessment assessment)
        {
            _existingAssessment = assessment;
            _isEditMode = true;

            // Pre-fill the entries with the existing assessment data
            title.Text = assessment.Title;
            dateTakenPicker.Date = assessment.DueDate;
            score.Text = assessment.Score.ToString();

            notificationPicker.SelectedItem = assessment.NotificationTimeOption;

            // Show the delete button
            deleteButton.IsVisible = true;
        }

        public async Task saveNew()
        {
            // Validate title
            var titleText = title.Text;
            if (string.IsNullOrWhiteSpace(title.ToString()))
            {
                await DisplayAlert("Validation Error", "Please enter an assessment title.", "OK");
                return;
            }

            // Validate dateTaken using DatePicker
            var dateTaken = dateTakenPicker.Date;

            // Validate score
            var scoreText = score.Text;
            if (!int.TryParse(scoreText, out int parsedScore) || parsedScore < 0)
            {
                await DisplayAlert("Validation Error", "Please enter a valid score.", "OK");
                return;
            }

            var notificationOption = notificationPicker.SelectedItem as string;

            // Create a new Assessment object
            var newAssessment = new NewAssessment
            {
                Title = titleText,
                DueDate = dateTaken,
                Score = parsedScore,
                CourseId = _courseId,
                Type = _assessmentType,
                NotificationTimeOption = notificationOption

            };

            // Save the assessment to the database
            var result = await App.DatabaseContext.AddAssessmentAsync(newAssessment);

            if (result == 1)
            {

                if (!string.IsNullOrEmpty(notificationOption))
                {
                    await ScheduleAssessmentNotification(newAssessment, notificationOption);
                }

                await DisplayAlert("Success", "Assessment updated and reminder updated successfully.", "OK");
                await Navigation.PopAsync();
            }
            else
            {
                await DisplayAlert("Error", "There was an error saving the assessment.", "OK");
            }

        }

        public async Task saveEdit()
        {
            // Validate title
            var titleText = title.Text;
            if (string.IsNullOrWhiteSpace(titleText))
            {
                await DisplayAlert("Validation Error", "Please enter an assessment title.", "OK");
                return;
            }

            // Validate dateTaken using DatePicker
            var dateTaken = dateTakenPicker.Date;

            // Validate score
            var scoreText = score.Text;
            if (!int.TryParse(scoreText, out int parsedScore) || parsedScore < 0)
            {
                await DisplayAlert("Validation Error", "Please enter a valid score.", "OK");
                return;
            }

            var notificationOption = notificationPicker.SelectedItem as string;

            // Update the existing Assessment object
            _existingAssessment.Title = titleText;
            _existingAssessment.DueDate = dateTaken;
            _existingAssessment.Score = parsedScore;
            _existingAssessment.NotificationTimeOption = notificationOption;

            // Save the changes to the database
            var result = await App.DatabaseContext.UpdateAssessmentAsync(_existingAssessment);

            if (result == 1)
            {


                if (!string.IsNullOrEmpty(notificationOption))
                {
                    await ScheduleAssessmentNotification(_existingAssessment, notificationOption);
                }

                await DisplayAlert("Success", "Assessment updated and reminder updated successfully.", "OK");
                await Navigation.PopAsync(); // Navigate back to the previous page
            }
            else
            {
                await DisplayAlert("Error", "There was an error updating the assessment.", "OK");
            }

        }

        public async void OnAddAssessmentClicked(object sender, EventArgs e)
        {
            if (!_isEditMode)
            {
                await saveNew();
            }
            else
            {
                await saveEdit();
            }
        }

        private async void OnDeleteAssessmentClicked(object sender, EventArgs e)
        {
            bool isConfirmed = await DisplayAlert("Confirm Delete", "Are you sure you want to delete this assessment?", "Yes", "No");
            if (isConfirmed)
            {
                // Call method to delete the assessment
                var result = await App.DatabaseContext.DeleteAssessmentAsync(_existingAssessment);
                if (result == 1)
                {
                    await DisplayAlert("Success", "Assessment deleted successfully.", "OK");
                    await Navigation.PopAsync();
                }
                else
                {
                    await DisplayAlert("Error", "There was an error deleting the assessment.", "OK");
                }
            }
        }
    }
}

