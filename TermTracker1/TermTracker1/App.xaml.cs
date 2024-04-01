using System;
using System.IO;
using Xamarin.Essentials;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using TermTracker1.Helpers;

namespace TermTracker1
{
    public partial class App : Application
    {

        public static DatabaseContext DatabaseContext { get; private set; }


        public App ()
        {
            InitializeComponent();

            // Get the path to the database file
            string dbPath = Path.Combine(FileSystem.AppDataDirectory, "TermTracker.db3");
            DatabaseContext = new DatabaseContext(dbPath);
            DatabaseContext.InitializeDatabaseAsync().SafeFireAndForget(false);

            MainPage = new NavigationPage(new TermTracker1.Views.Login.LoginPage());
        }

        protected override void OnStart ()
        {
        }

        protected override void OnSleep ()
        {
        }

        protected override void OnResume ()
        {
        }
    }
}

