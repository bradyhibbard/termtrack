using Xamarin.Forms;
using System;
using TermTracker1.Models;


namespace TermTracker1.Views.Notes
{
    public partial class NotesPage : ContentPage
    {
        private int _courseId;
        private Note _existingNote;

        public NotesPage(int courseId)
        {
            InitializeComponent();
            _courseId = courseId;
        }

        // Overloaded constructor for editing an existing note
        public NotesPage(Note note) : this(note.CourseId)
        {
            _existingNote = note; // Set the existing note
            noteTitleEntry.Text = note.Title; // Assuming noteTitleEntry is the Entry in your XAML
            noteContentEditor.Text = note.Content; // Assuming noteContentEditor is the Editor in your XAML
        }

        private void OnShareNotesClicked(object sender, EventArgs e)
        {
            // Logic to share the notes
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            string noteTitle = noteTitleEntry.Text;
            string noteContent = noteContentEditor.Text;

            if (string.IsNullOrWhiteSpace(noteTitle) || string.IsNullOrWhiteSpace(noteContent))
            {
                await DisplayAlert("Validation Error", "Both title and content are required to save a note.", "OK");
                return;
            }

            var noteToSave = _existingNote ?? new Note
            {
                CourseId = _courseId, // Set CourseId if it's a new note
            };

            noteToSave.Title = noteTitle;
            noteToSave.Content = noteContent;

            int result;
            if (_existingNote != null)
            {
                // Update the existing note
                result = await App.DatabaseContext.UpdateNoteAsync(noteToSave);
            }
            else
            {
                // Add a new note
                result = await App.DatabaseContext.AddNoteAsync(noteToSave);
            }

            // Check the result of the save or update operation
            if (result > 0) // Assuming a successful save or update returns a positive integer
            {
                await DisplayAlert("Success", "Your note has been saved.", "OK");
                await Navigation.PopAsync(); // Go back to the list or details page
            }
            else
            {
                await DisplayAlert("Error", "There was an error saving the note.", "OK");
            }

        }

        private async void OnDeleteNoteClicked(object sender, EventArgs e)
        {
            // Logic to delete the note
            bool confirm = await DisplayAlert("Confirm Delete", "Are you sure you want to delete this note?", "Yes", "No");
            if (confirm)
            {
                // Proceed with deletion
                // Display success message
                await DisplayAlert("Deleted", "Your note has been deleted.", "OK");
                await Navigation.PopAsync(); // Go back to the previous page
            }
        }
    }
}
