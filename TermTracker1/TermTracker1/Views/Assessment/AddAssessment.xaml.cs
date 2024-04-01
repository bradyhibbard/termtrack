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
                // Optionally, hide the delete button if not in edit mode
                deleteButton.IsVisible = false;
            }
        }


        public async Task ScheduleAssessmentNotification(NewAssessment assessment)
        {
            var notification = new NotificationRequest
            {
                NotificationId = assessment.AssessmentId, // Unique ID for the notification
                Title = $"Upcoming Assessment: {assessment.Title}",
                Description = $"Your assessment '{assessment.Title}' is due on {assessment.DueDate:MM/dd/yyyy}.",
                Schedule = new NotificationRequestSchedule
                {
                    NotifyTime = assessment.DueDate.AddDays(-7) // 1 week before the due date
                }
            };

            await NotificationCenter.Current.Show(notification);
        }


        public void SetAssessment(NewAssessment assessment)
        {
            _existingAssessment = assessment;
            _isEditMode = true;

            // Pre-fill the entries with the existing assessment data
            title.Text = assessment.Title;
            dateTakenPicker.Date = assessment.DueDate; // Assuming you're using a DatePicker
            score.Text = assessment.Score.ToString();

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

            // Create a new Assessment object
            var newAssessment = new NewAssessment
            {
                Title = titleText,
                DueDate = dateTaken,
                Score = parsedScore,
                // You'll need to set CourseId and Type depending on your logic, passed when navigating to this page
                CourseId = _courseId, // Placeholder, set this from your navigation parameter
                Type = _assessmentType

            };

            // Save the assessment to the database
            var result = await App.DatabaseContext.AddAssessmentAsync(newAssessment);

            if (result == 1)
            {
                await ScheduleAssessmentNotification(newAssessment);
                await DisplayAlert("Success", "Assessment added and reminder set successfully.", "OK");
                await Navigation.PopAsync(); // Navigate back to the previous page
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

            // Update the existing Assessment object
            _existingAssessment.Title = titleText;
            _existingAssessment.DueDate = dateTaken;
            _existingAssessment.Score = parsedScore;

            // Save the changes to the database
            var result = await App.DatabaseContext.UpdateAssessmentAsync(_existingAssessment);

            if (result == 1)
            {
                await ScheduleAssessmentNotification(_existingAssessment);
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
                // Call your method to delete the assessment
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

