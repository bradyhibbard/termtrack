using SQLite;
using SQLiteAsyncConnection = SQLite.SQLiteAsyncConnection;
using SQLiteNetExtensionsAsync.Extensions;
using TermTracker1.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using System;

public class DatabaseContext
{
    private readonly SQLiteAsyncConnection _database;

    public DatabaseContext(string dbPath)
    {
        _database = new SQLiteAsyncConnection(dbPath);
        _ = InitializeDatabaseAsync();
    }

    public async Task InitializeDatabaseAsync()
    {
        await _database.CreateTableAsync<NewTerm>().ConfigureAwait(false);
        await _database.CreateTableAsync<Course>().ConfigureAwait(false);
        await _database.CreateTableAsync<NewAssessment>().ConfigureAwait(false);
        await _database.CreateTableAsync<User>().ConfigureAwait(false);
        await _database.CreateTableAsync<Note>().ConfigureAwait(false);
        // Add additional table creation calls if needed.

        await CreateTestUserAsync();
    }

    //Adding a test account for testing purposes of the app

    private async Task CreateTestUserAsync()
    {
        // Check if the test user already exists
        var testUser = await _database.Table<User>().Where(u => u.UserName == "test").FirstOrDefaultAsync().ConfigureAwait(false);
        if (testUser == null)
        {
            // Create and insert the test user
            testUser = new User
            {
                UserName = "test",
                Password = "test" // Note: Storing passwords as plain text is insecure!
            };
            await AddUserAsync(testUser);
        }
    }

    public async Task<User> GetUserByCredentialsAsync(string username, string password)
    {
        // This is insecure as we're using plain text for passwords.
        // You should hash the password and compare it to a stored hash.
        return await _database.Table<User>()
            .Where(u => u.UserName == username && u.Password == password)
            .FirstOrDefaultAsync()
            .ConfigureAwait(false);
    }

    public async Task<User> GetUserByUsernameOrEmailAsync(string username, string email)
    {
        return await _database.Table<User>()
                              .Where(u => u.UserName == username || u.Email == email)
                              .FirstOrDefaultAsync();
    }

    public async Task<List<Course>> GetCoursesForTermAsync(int termId)
    {
        // foreign key 'TermId' in the 'Course'
        return await _database.Table<Course>()
                             .Where(c => c.TermId == termId)
                             .ToListAsync();
    }

    // CRUD operations for Terms

    public async Task<List<NewTerm>> GetTermsAsync()
    {
        return await _database.Table<NewTerm>().ToListAsync().ConfigureAwait(false);
    }

    public async Task<NewTerm> GetTermAsync(int id)
    {
        // If you have relationships and need to load children as well, use GetWithChildrenAsync
        return await _database.GetWithChildrenAsync<NewTerm>(id).ConfigureAwait(false);
    }

    public async Task<int> AddTermAsync(NewTerm term)
    {
        // If the Term has related objects you want to insert as well, use InsertWithChildrenAsync
        return await _database.InsertAsync(term).ConfigureAwait(false);
    }

    public async Task<int> UpdateTermAsync(NewTerm term)
    {
        // For updating with related objects, use UpdateWithChildrenAsync
        return await _database.UpdateAsync(term).ConfigureAwait(false);
    }

    public async Task<int> DeleteTermAsync(NewTerm term)
    {
        return await _database.DeleteAsync(term).ConfigureAwait(false);
    }

    public async Task<NewTerm> GetTermByIdAsync(int id)
    {
        // Retrieve a specific term by ID
        return await _database.Table<NewTerm>().FirstOrDefaultAsync(t => t.TermId == id);
    }


    // CRUD operations for Courses

    public async Task<List<Course>> GetCoursesAsync()
    {
        return await _database.Table<Course>().ToListAsync().ConfigureAwait(false);
    }

    public async Task<Course> GetCourseAsync(int id)
    {
        return await _database.GetWithChildrenAsync<Course>(id).ConfigureAwait(false);
    }

    public async Task<int> AddCourseAsync(Course course)
    {
        return await _database.InsertAsync(course).ConfigureAwait(false);
    }

    public async Task<int> UpdateCourseAsync(Course course)
    {
        return await _database.UpdateAsync(course).ConfigureAwait(false);
    }

    public async Task<int> DeleteCourseAsync(Course course)
    {
        return await _database.DeleteAsync(course).ConfigureAwait(false);
    }
    public Task<Course> GetCourseByIdAsync(int courseId)
    {
        return _database.Table<Course>().Where(c => c.CourseId == courseId).FirstOrDefaultAsync();
    }

    // CRUD operations for Assessments

    public async Task<List<NewAssessment>> GetAssessmentsAsync()
    {
        return await _database.Table<NewAssessment>().ToListAsync().ConfigureAwait(false);
    }

    public async Task<NewAssessment> GetAssessmentAsync(int id)
    {
        return await _database.GetWithChildrenAsync<NewAssessment>(id).ConfigureAwait(false);
    }

    public async Task<int> AddAssessmentAsync(NewAssessment assessment)
    {
        return await _database.InsertAsync(assessment).ConfigureAwait(false);
    }

    public async Task<int> UpdateAssessmentAsync(NewAssessment assessment)
    {
        return await _database.UpdateAsync(assessment).ConfigureAwait(false);
    }

    public async Task<int> DeleteAssessmentAsync(NewAssessment assessment)
    {
        return await _database.DeleteAsync(assessment).ConfigureAwait(false);

    }

    public Task<NewAssessment> GetAssessmentByCourseAndTypeAsync(int courseId, AssessmentType assessmentType)
    {
        // This is an example using SQLite-async
        return _database.Table<NewAssessment>()
            .FirstOrDefaultAsync(a => a.CourseId == courseId && a.Type == assessmentType);
    }

    // CRUD operations for Users

    public async Task<List<User>> GetUsersAsync()
    {
        return await _database.Table<User>().ToListAsync().ConfigureAwait(false);
    }

    public async Task<User> GetUserAsync(int id)
    {
        return await _database.FindAsync<User>(id).ConfigureAwait(false);
    }

    public async Task<int> AddUserAsync(User user)
    {
        return await _database.InsertAsync(user).ConfigureAwait(false);
    }

    public async Task<int> UpdateUserAsync(User user)
    {
        return await _database.UpdateAsync(user).ConfigureAwait(false);
    }

    public async Task<int> DeleteUserAsync(User user)
    {
        return await _database.DeleteAsync(user).ConfigureAwait(false);
    }

    // CRUD operations for Notes

    public async Task<List<Note>> GetNotesAsync()
    {
        return await _database.Table<Note>().ToListAsync().ConfigureAwait(false);
    }

    public async Task<Note> GetNoteAsync(int id)
    {
        return await _database.FindAsync<Note>(id).ConfigureAwait(false);
    }

    public async Task<int> AddNoteAsync(Note note)
    {
        return await _database.InsertAsync(note).ConfigureAwait(false);
    }

    public async Task<int> UpdateNoteAsync(Note note)
    {
        return await _database.UpdateAsync(note).ConfigureAwait(false);
    }

    public async Task<int> DeleteNoteAsync(Note note)
    {
        return await _database.DeleteAsync(note).ConfigureAwait(false);

    }

    public Task<List<Note>> GetNotesByCourseIdAsync(int courseId)
    {
        return _database.Table<Note>().Where(n => n.CourseId == courseId).ToListAsync();
    }

    public Task<Note> GetNoteByIdAsync(int id)
    {
        // Assuming you have a Note class that corresponds to your database table
        return _database.Table<Note>().Where(i => i.NoteId == id).FirstOrDefaultAsync();
    }



    // ... similar methods for the other models

}
