using System;
using SQLite;
using SQLiteNetExtensions.Attributes;

namespace TermTracker1.Models
{

    public enum AssessmentType
    {
        Performance, // This might correspond to 0
        Objective    // This might correspond to 1
    }

    public class NewAssessment
    {
        [PrimaryKey, AutoIncrement]
        public int AssessmentId { get; set; }

        [ForeignKey(typeof(Course))]
        public int CourseId { get; set; }

        public string Title { get; set; }

        public DateTime DueDate { get; set; }

        // You might want to use an enum for assessment types
        public AssessmentType Type { get; set; }

        public string NotificationTimeOption { get; set; }

        public int Score { get; set; }

        public string Notes { get; set; } // Optional

        // Constructor for creating a new assessment
        public NewAssessment()
        {
        }

        // Constructor with parameters to initialize a new assessment object
        public NewAssessment(int courseId, string title, DateTime dueDate, int score, string notes)
        {
            CourseId = courseId;
            Title = title;
            DueDate = dueDate;
            Score = score;
            Notes = notes;
        }
    }
}


