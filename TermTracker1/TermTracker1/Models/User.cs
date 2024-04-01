using System;
using SQLite;

namespace TermTracker1.Models
{
    public class User
    {
        [PrimaryKey, AutoIncrement]
        public int UserId { get; set; }

        [NotNull]
        public string UserName { get; set; }

        [NotNull]
        public string Password { get; set; } // Consider hashing this in a real application

        [NotNull, Unique]
        public string Email { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        // Constructor for creating a new user
        public User()
        {
        }

        // Constructor with parameters to initialize a new user object
        public User(string userName, string password, string email, string firstName, string lastName)
        {
            UserName = userName;
            Password = password; // Remember to hash the password in a real application
            Email = email;
            FirstName = firstName;
            LastName = lastName;
        }
    }
}
