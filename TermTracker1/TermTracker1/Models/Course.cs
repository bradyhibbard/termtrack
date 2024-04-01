using System;
using SQLite;
using SQLiteNetExtensions.Attributes;

namespace TermTracker1.Models
{
    public class Course
    {
        [PrimaryKey, AutoIncrement]
        public int CourseId { get; set; }

        [ForeignKey(typeof(NewTerm))]
        public int TermId { get; set; }

        public string Title { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public string Status { get; set; } // Consider using an enum here in the future

        public string InstructorName { get; set; }

        public string InstructorPhone { get; set; }

        public string InstructorEmail { get; set; }

        public string Description { get; set; }

        public string Notes { get; set; } // Optional

        // Constructor for creating a new course
        public Course()
        {
        }

        // Constructor with parameters to initialize a new course object
        public Course(int termId, string title, DateTime startDate, DateTime endDate, string status, string instructorName, string instructorPhone, string instructorEmail, string description, string notes)
        {
            TermId = termId;
            Title = title;
            StartDate = startDate;
            EndDate = endDate;
            Status = status;
            InstructorName = instructorName;
            InstructorPhone = instructorPhone;
            InstructorEmail = instructorEmail;
            Description = description;
            Notes = notes;
        }
    }
}
