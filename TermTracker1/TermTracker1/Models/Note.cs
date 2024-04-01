using System;
using SQLite;
using SQLiteNetExtensions.Attributes;

namespace TermTracker1.Models
{
    public class Note
    {
        [PrimaryKey, AutoIncrement]
        public int NoteId { get; set; }
        
        [ForeignKey(typeof(Course))]
        public int CourseId { get; set; }

        public string Title { get; set; }
        
        public string Content { get; set; }

        public string CourseTitle { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        // Optional constructor
        public Note()
        {
        }

        // Optional constructor with parameters to initialize a new Note object
        public Note(int courseId, string title, string content)
        {
            CourseId = courseId;
            Title = title;
            Content = content;
        }
    }
}
