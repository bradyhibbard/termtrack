using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xamarin.Forms;
using TermTracker1.Models;
using TermTracker1.Views.Term;
using Plugin.LocalNotification;

namespace TermTracker1.Views.Courses
{

	public partial class CourseListPage : ContentPage
	{
        public NewTerm SelectedTerm { get; private set; }

        public CourseListPage (NewTerm selectedTerm)
		{
			InitializeComponent ();
            SelectedTerm = selectedTerm;
            BindingContext = this;
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await LoadCoursesAsync();
        }

        private async Task LoadCoursesAsync()
        {
            coursesStack.Children.Clear();
            var courses = await App.DatabaseContext.GetCoursesForTermAsync(SelectedTerm.TermId);

            foreach (var course in courses)
            {
                var courseItem = new StackLayout { Orientation = StackOrientation.Horizontal };
                var courseButton = new Button { Text = course.Title, BackgroundColor = Color.Black, TextColor = Color.White };
                var statusLabel = new Label { Text = course.Status, VerticalOptions = LayoutOptions.Center };

                courseButton.Clicked += (sender, e) => OnCourseButtonClicked(course);

                courseItem.Children.Add(courseButton);
                courseItem.Children.Add(statusLabel);

                coursesStack.Children.Add(courseItem);

                // Schedule a notification for 1 week before the course starts
                if (course.StartDate > DateTime.Now.AddDays(7))
                {
                    var notification = new NotificationRequest
                    {
                        NotificationId = course.CourseId, // Unique ID for the notification
                        Title = $"Course Starting Soon: {course.Title}",
                        Description = $"{course.Title} starts on {course.StartDate:MM/dd/yyyy}",
                        Schedule = { NotifyTime = course.StartDate.AddDays(-7) } // 1 week before
                    };

                    await NotificationCenter.Current.Show(notification);
                }

                // Schedule a notification for 1 week before the course ends
                if (course.EndDate > DateTime.Now.AddDays(7))
                {
                    var notification = new NotificationRequest
                    {
                        NotificationId = course.CourseId + 10000,
                        Title = $"Course Ending Soon: {course.Title}",
                        Description = $"{course.Title} ends on {course.EndDate:MM/dd/yyyy}",
                        Schedule = { NotifyTime = course.EndDate.AddDays(-7) } // 1 week before
                    };

                    await NotificationCenter.Current.Show(notification);
                }

            }

            addCourseButton.IsEnabled = courses.Count < 6;

        }

        private async void OnCourseButtonClicked(Course selectedCourse)
        {
            var courseDetailPage = new CourseDetailPage(selectedCourse);
            await Navigation.PushAsync(courseDetailPage);
        }


        private async void OnAddCourseButtonClicked(object sender, EventArgs e)
        {
            // Create a new instance of the AddCoursePage
            var addCoursePage = new AddCoursePage(SelectedTerm);

            // Push the AddCoursePage onto the navigation stack
            await Navigation.PushAsync(addCoursePage);
        }

        private async void OnDeleteTermButtonClicked(object sender, EventArgs e)
        {
            bool isConfirmed = await DisplayAlert("Confirm Delete",
                                                  "Are you sure you want to delete this term and all associated courses?",
                                                  "Yes", "No");

            if (isConfirmed)
            {
                // Assuming you have a DeleteTermAsync method in your database context
                var result = await App.DatabaseContext.DeleteTermAsync(SelectedTerm);

                if (result > 0) // In SQLite, a successful delete returns the number of rows affected
                {
                    await DisplayAlert("Success", "The term has been deleted.", "OK");
                    // Navigate back to the previous page or refresh the terms list
                    await Navigation.PopAsync();
                }
                else
                {
                    await DisplayAlert("Error", "There was a problem deleting the term.", "OK");
                }
            }
        }

    }
}

