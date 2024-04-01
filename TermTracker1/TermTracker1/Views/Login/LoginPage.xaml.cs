using System;
using System.Collections.Generic;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using TermTracker1.Models;
using TermTracker1.Views.Welcome;
using TermTracker1.Views.SignUp;


namespace TermTracker1.Views.Login
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : ContentPage
    {
        public LoginPage()
        {
            InitializeComponent();

            loginButton.Clicked += OnLoginButtonClicked;
            signUpButton.Clicked += OnSignUpButtonClicked;
        }

        private async void OnLoginButtonClicked(object sender, EventArgs e)
        {
            //Logic for Loggin In.
            string enteredUsername = usernameEntry.Text;
            string enteredPassword = passwordEntry.Text;

            // Assuming you have a method in DatabaseContext like:
            // public Task<User> GetUserByCredentialsAsync(string username, string password);
            User user = await App.DatabaseContext.GetUserByCredentialsAsync(enteredUsername, enteredPassword);

            if (user != null)
            {
                // User found, credentials are correct. Navigate to the WelcomePage.
                await Navigation.PushAsync(new WelcomePage());
            }
            else
            {
                // User not found, credentials are incorrect, show an error message.
                await DisplayAlert("Login Failed", "Incorrect username or password.", "OK");
            }
        }


        private void OnSignUpButtonClicked(object sender, EventArgs e)
        {
            // Navigate to sign-up page or logic
            Navigation.PushAsync(new SignUpPage());
        }
    }
}


