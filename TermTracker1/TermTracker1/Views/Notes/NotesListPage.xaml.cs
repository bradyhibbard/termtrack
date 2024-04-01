using System;
using System.Threading.Tasks;
using Xamarin.Forms;
using TermTracker1.Models;

namespace TermTracker1.Views.Notes
{
    public partial class NotesListPage : ContentPage
    {
        private readonly int _courseId; // Field to store the courseId

        // Constructor that accepts courseId
        public NotesListPage(int courseId)
        {
            InitializeComponent();
            _courseId = courseId; // Set the field with the constructor argument

        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            // Load the course object to set as BindingContext
            var course = await App.DatabaseContext.GetCourseByIdAsync(_courseId);
            if (course != null)
            {
                this.BindingContext = course;
                Title = $"Notes for Course {course.Title}";

                await LoadNotesForCourse();
            }
        }

        private async Task LoadNotesForCourse()
        {
            notesStack.Children.Clear(); // Clear any existing notes from the stack

            // Fetch the notes from the database for the current course
            var notes = await App.DatabaseContext.GetNotesByCourseIdAsync(_courseId);

            // Dynamically create a Button for each note with the note's title as the text
            foreach (var note in notes)
            {
                var noteButton = new Button
                {
                    Text = note.Title,
                    BackgroundColor = Color.Black, // Adjust the color as needed
                    TextColor = Color.White, // Adjust text color as needed
                    CommandParameter = note.NoteId // Pass the note ID as a command parameter
                };

                // Attach the NoteTapped event handler to the Clicked event
                noteButton.Clicked += NoteTapped;

                notesStack.Children.Add(noteButton); // Add the button to the StackLayout
            }
        }

        private async void OnAddNoteButtonClicked(object sender, EventArgs e)
        {
            // Implement logic to navigate to the AddNote page
            // Pass the courseId to the AddNote page constructor if necessary
            var addNotePage = new NotesPage(_courseId);
            await Navigation.PushAsync(addNotePage);
        }

        private async void NoteTapped(object sender, EventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                int noteId = (int)button.CommandParameter;
                var note = await App.DatabaseContext.GetNoteByIdAsync(noteId);
                if (note != null)
                {
                    await Navigation.PushAsync(new NotesDetails(note));
                }
            }
        }
    }
}
