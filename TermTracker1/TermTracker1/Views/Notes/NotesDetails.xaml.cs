using System;
using System.Collections.Generic;
using Xamarin.Essentials;
using Xamarin.Forms;
using TermTracker1.Models;

namespace TermTracker1.Views.Notes
{	
	public partial class NotesDetails : ContentPage
	{

        private Note _note;


		public NotesDetails (Note note)
		{
            InitializeComponent();
            _note = note;
            InitializeNoteDetails(note);
            BindingContext = _note;
        }

        private async void InitializeNoteDetails(Note note)
        {
            var course = await App.DatabaseContext.GetCourseByIdAsync(note.CourseId);
            if (course != null)
            {
                note.CourseTitle = course.Title;
                note.StartDate = course.StartDate;
                note.EndDate = course.EndDate;
                BindingContext = note; // Assign the note with course details to BindingContext
            }
        }

        private async void OnShareNoteClicked(object sender, EventArgs e)
        {
            // Get the current note's title and content
            var noteTitle = Title;
            var noteContent = Content;

            // Combine the title and content into a single string for sharing
            var shareText = $"Title: {noteTitle}\n\nContent:\n{noteContent}";

            // Create a new ShareTextRequest and populate it with your data
            var request = new ShareTextRequest
            {
                Subject = noteTitle,
                Text = shareText,
                Title = "Share Note"
            };

            // Use the Share API to open the share dialog
            await Share.RequestAsync(request);
        }

        private async void EditNoteClicked(object sender, EventArgs e)
        {
            // Assuming _note is the current note being displayed on the details page
            await Navigation.PushAsync(new NotesPage(_note));
        }

        private async void DeleteNoteClicked(object sender, EventArgs e)
        {
            var confirm = await DisplayAlert("Confirm Delete", "Are you sure you want to delete this note?", "Yes", "No");
            if (confirm)
            {
                await App.DatabaseContext.DeleteNoteAsync(_note);
                // Handle the UI post-delete (e.g., navigate back)
                await DisplayAlert("Deleted", "The note has been deleted.", "OK");
                await Navigation.PopAsync(); // Assuming you want to go back to the previous page
            }
        }

    }
}

