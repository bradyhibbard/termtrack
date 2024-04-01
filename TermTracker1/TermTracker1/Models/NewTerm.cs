using System;
using SQLite;

namespace TermTracker1.Models
{
    public class NewTerm
    {
        [PrimaryKey, AutoIncrement]
        public int TermId { get; set; }

        public string Title { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        // Constructor for creating a new term
        public NewTerm()
        {
        }

        // Constructor with parameters to initialize a new term object
        public NewTerm(string title, DateTime startDate, DateTime endDate)
        {
            Title = title;
            StartDate = startDate;
            EndDate = endDate;
        }
    }
}

