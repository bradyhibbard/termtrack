﻿using System;
using System.Threading.Tasks;

namespace TermTracker1.Helpers // Replace with your actual namespace
{
    public static class TaskExtensions
    {
        public static async void SafeFireAndForget(this Task task, bool continueOnCapturedContext, Action<Exception> onException = null)
        {
            try
            {
                await task.ConfigureAwait(continueOnCapturedContext);
            }
            catch (Exception ex)
            {
                onException?.Invoke(ex);
            }
        }
    }
}