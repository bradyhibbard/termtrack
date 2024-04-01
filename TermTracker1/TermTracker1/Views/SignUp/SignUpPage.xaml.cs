using System;
using System.Collections.Generic;
using Xamarin.Forms;
using TermTracker1.Models;

namespace TermTracker1.Views.SignUp
{	
	public partial class SignUpPage : ContentPage
	{	
		public SignUpPage ()
		{
			InitializeComponent ();
            signUpButton.Clicked += OnSignUpButtonClicked;
        }

        private async void OnSignUpButtonClicked(object sender, EventArgs e)
        {
            var firstName = firstNameEntry.Text;
            var lastName = lastNameEntry.Text;
            var username = usernameEntry.Text;
            var email = emailEntry.Text;
            var password = passwordEntry.Text;
            var repeatPassword = repeatPasswordEntry.Text;

            // Basic validation
            if (string.IsNullOrWhiteSpace(firstName) ||
                string.IsNullOrWhiteSpace(lastName) ||
                string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password))
            {
                await DisplayAlert("Error", "Please fill in all fields.", "OK");
                return;
            }

            if (password != repeatPassword)
            {
                await DisplayAlert("Error", "Passwords do not match.", "OK");
                return;
            }

            /// Check for unique username and email
            var existingUser = await App.DatabaseContext.GetUserByUsernameOrEmailAsync(username, email);
            if (existingUser != null)
            {
                if (existingUser.UserName == username)
                {
                    await DisplayAlert("Error", "Username is already taken.", "OK");
                }
                else if (existingUser.Email == email)
                {
                    await DisplayAlert("Error", "Email is already being used.", "OK");
                }
                return;
            }

            // TODO: Add password hashing here

            var newUser = new User
            {
                // Assuming your User class has these properties
                FirstName = firstName,
                LastName = lastName,
                UserName = username,
                Email = email,
                Password = password // Store a hashed password, not the plain text
            };

            var result = await App.DatabaseContext.AddUserAsync(newUser);

            if (result == 1) // SQLite returns the number of rows added; 1 means success
            {
                await DisplayAlert("Success", "Account created successfully.", "OK");
                await Navigation.PopAsync(); // Go back to the login page or to the main page of the app
            }
            else
            {
                await DisplayAlert("Error", "There was a problem creating your account.", "OK");
            }
        }
    }
}

