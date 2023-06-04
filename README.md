# flutter_auth

Flutter authentication flow using Provider and GoRouter.

## Details

This is a simple Flutter app that serves to showcase how a robust authentication flow can be implemented using Provider and GoRouter. This can be used as a template when building apps that require authentication. Inspiration was taken from [here](https://blog.ishangavidusha.com/flutter-authentication-flow-with-go-router-and-provider).

Advantages:
- Shows a splash screen when the app is initializing and the user's authentication state is unknown.
- Once the authentication state is known, the user is automatically redirected towards either the onboarding page (for non-authenticated users), or the home page.
- Allows users to navigate pages for which authentication is not needed with ease.
- Pages that should only be displayed to authenticated users redirect unauthenticated users to the onboarding page.
- Pages that should only be displayed to unauthenticated users redirect authenticated users to the home page.
- Automatically redirects users to the onboarding/home pages when the authentication state changes (i.e., through a log in or log out event).
- Users can be logged out from anywhere in the app without having to explicitly redirect them to the onboarding page afterwards.
- It is easily extensible.