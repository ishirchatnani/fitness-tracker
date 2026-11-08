# Weight Tracker

Static web app (GitHub Pages) with data in your own Supabase project. Installs to the phone home screen.

## One-time setup

1. **Supabase project.** Reuse the Badge-In project or create a new one at supabase.com.
2. **Tables.** SQL Editor > New query > paste `supabase/schema.sql` > Run. It creates `wt_entries` and `wt_settings`, locked to the signed-in user.
3. **Your login.** Authentication > Users > Add user > email + password, tick "Auto confirm". Then Authentication > Sign In / Providers > turn off "Allow new users to sign up" so nobody else can create an account.
4. **Keys.** Project Settings > API. Copy the Project URL and the `anon` public key into `config.js`. Never use the `service_role` key here.
5. **GitHub Pages.** Push these files to a repo, then Settings > Pages > Deploy from branch `main`, folder `/ (root)`.
6. **Phone.** Open the Pages URL, sign in once, then Share > Add to Home Screen (iPhone) or menu > Install app (Android).

## Notes

- The anon key is public by design. The data is protected by sign-in plus row-level security.
- Edits save instantly to the phone first, then sync. If you are offline they sync when you reconnect.
- `vendor/supabase.js` is supabase-js 2.119.0, bundled so the app does not depend on a CDN.
