using System;
using System.Collections.Generic;

using Xamarin.Forms;
using TermTracker1.Models;
using TermTracker1.Views.Assessment;
using System.Threading.Tasks;
using TermTracker1.Views.Notes;

namespace TermTracker1.Views.Courses
{	
	public partial class CourseDetailPage : ContentPage
	{


        public CourseDetailPage(Course selectedCourse)
        {
            InitializeComponent();
            BindingContext = selectedCourse;

        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            // Load or refresh the course details
            await LoadCourseDetailsAsync();
        }

        private async Task LoadCourseDetailsAsync()
        {
            // Assuming you have a method to get the latest details of the course
            // And your selectedCourse has an Id property to identify the course
            var updatedCourse = await App.DatabaseContext.GetCourseByIdAsync(((Course)BindingContext).CourseId);

            if (updatedCourse != null)
            {
                BindingContext = updatedCourse; // This should update your UI if the properties are correctly data-bound
            }

            // Load assessments
            var performanceAssessment = await App.DatabaseContext.GetAssessmentByCourseAndTypeAsync(((Course)BindingContext).CourseId, AssessmentType.Performance);
            var objectiveAssessment = await App.DatabaseContext.GetAssessmentByCourseAndTypeAsync(((Course)BindingContext).CourseId, AssessmentType.Objective);

            // Update Labels
            performanceAssessmentTitle.Text = performanceAssessment?.Title ?? "N/A";
            performanceAssessmentScore.Text = performanceAssessment?.Score.ToString() ?? "N/A";
            objectiveAssessmentTitle.Text = objectiveAssessment?.Title ?? "N/A";
            objectiveAssessmentScore.Text = objectiveAssessment?.Score.ToString() ?? "N/A";

            // Change button text based on assessment existence
            addPerformanceAssessmentButton.Text = performanceAssessment != null ? "Edit Assessment" : "Add Assessment";
            addObjectiveAssessmentButton.Text = objectiveAssessment != null ? "Edit Assessment" : "Add Assessment";
        }

        private async void OnDeleteCourseClicked(object sender, EventArgs e)
        {
            bool isConfirmed = await DisplayAlert("Confirm Delete", "Are you sure you want to delete this course?", "Yes", "No");
            if (isConfirmed)
            {
                // Assuming you have a method in your DatabaseContext to delete a course by its ID
                var result = await App.DatabaseContext.DeleteCourseAsync(BindingContext as Course);

                if (result > 0) // Check if the delete was successful
                {
                    await DisplayAlert("Success", "The course has been deleted.", "OK");
                    await Navigation.PopAsync(); // Go back to the previous page
                }
                else
                {
                    await DisplayAlert("Error", "There was an error deleting the course.", "OK");
                }
            }
        }

        private async void OnNotesClicked(object sender, EventArgs e)
        {
            // Assuming 'NotesListPage' requires the current course's ID to display the relevant notes
            var course = BindingContext as Course; // Cast the BindingContext to your Course model
            if (course != null)
            {
                var notesPage = new NotesListPage(course.CourseId); // Create the NotesListPage with the course's ID
                await Navigation.PushAsync(notesPage); // Push the NotesListPage onto the navigation stack
            }
            else
            {
                await DisplayAlert("Error", "Unable to retrieve course details.", "OK");
            }
        }


        private async void OnEditClassDetailsClicked(object sender, EventArgs e)
        {
            // Navigate to EditCoursePage with course details for editing
            await Navigation.PushAsync(new EditCoursePage((Course)BindingContext));
        }


        private async void OnAddAssessmentOneClicked(object sender, EventArgs e)
        {
            // This might be a performance assessment type
            await NavigateToAddOrEditAssessment(AssessmentType.Performance);
        }

        private async void OnAddAssessmentTwoClicked(object sender, EventArgs e)
        {
            // This might be an objective assessment type
            await NavigateToAddOrEditAssessment(AssessmentType.Objective);
        }

        private async Task NavigateToAddOrEditAssessment(AssessmentType assessmentType)
        {
            // Check if the assessment already exists
            var existingAssessment = await App.DatabaseContext.GetAssessmentByCourseAndTypeAsync(((Course)BindingContext).CourseId, assessmentType);

            if (existingAssessment != null)
            {
                // If the assessment exists, navigate to the AddAssessment page for editing
                var addAssessmentPage = new AddAssessment(((Course)BindingContext).CourseId, assessmentType, existingAssessment);
                await Navigation.PushAsync(addAssessmentPage);
            }
            else
            {
                // If the assessment doesn't exist, navigate to the AddAssessment page to add a new one
                await Navigation.PushAsync(new AddAssessment(((Course)BindingContext).CourseId, assessmentType));
            }
        }

    }

}

