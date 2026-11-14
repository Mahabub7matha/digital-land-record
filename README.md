# ডিজিটাল ভূমি তথ্য — ওয়েব অ্যাপ MVP

বাংলা ভাষার ব্যক্তিগত ভূমি তথ্য ব্যবস্থাপনা অ্যাপ। একজন মালিকের একাধিক জমির রেকর্ড, দলিল/খতিয়ান আপলোড, স্বতন্ত্র QR URL এবং QR স্ক্যান করে পাবলিক রেকর্ড দেখা যায়।

## প্রয়োজন
- Node.js 20 বা তার পরের সংস্করণ
- Supabase account/project
- Vercel account (অনলাইনে প্রকাশের জন্য)

## ১) Supabase প্রস্তুত করুন
1. Supabase-এ নতুন project তৈরি করুন।
2. SQL Editor খুলে `supabase/schema.sql`-এর সম্পূর্ণ SQL চালান।
3. Authentication > Providers-এ Email provider চালু রাখুন।
4. Authentication > Settings-এ public sign-up বন্ধ রাখুন। অ্যাডমিনের জন্য Dashboard থেকে Users > Add user দিয়ে একটি নির্দিষ্ট অ্যাকাউন্ট তৈরি করুন।
5. Project Settings > API থেকে Project URL এবং anon/public key কপি করুন।

**গুরুত্বপূর্ণ:** এই MVP-তে QR স্ক্যানকারীরা সব রেকর্ড ও আপলোড করা ফাইল দেখতে পারবে। Supabase Storage bucket public। সংবেদনশীল পরিচয়পত্র/স্বাক্ষর/ব্যক্তিগত তথ্য আপলোড করবেন না। SQL policy-তে authenticated users-কে admin ধরা হয়েছে; public sign-up বন্ধ রাখুন এবং কেবল আপনার নির্দিষ্ট অ্যাকাউন্ট তৈরি করুন। বহু অ্যাডমিন বা আরও কঠোর নিরাপত্তার জন্য user-id-ভিত্তিক admin allowlist যোগ করা উচিত।

## ২) লোকাল কম্পিউটারে চালান
```bash
npm install
cp .env.example .env.local
```
`.env.local`-এ Supabase URL, anon key এবং site URL বসান।
```bash
npm run dev
```
তারপর `http://localhost:3000` খুলুন।

## ৩) Vercel-এ অনলাইনে প্রকাশ
1. এই ZIP GitHub repository-তে আপলোড করুন।
2. Vercel-এ Import Project করে repository নির্বাচন করুন।
3. Environment Variables-এ `.env.example`-এর তিনটি মান বসান।
4. Deploy করুন।
5. Deploy হওয়ার পর `NEXT_PUBLIC_SITE_URL`-এ আপনার live domain দিন এবং পুনরায় deploy করুন।

## বর্তমান সংস্করণে
- বাংলা landing page ও admin login
- জমির তথ্য যোগ করা
- Dashboard-এ জমির তালিকা ও অনুসন্ধান
- জমির QR Code তৈরি ও পাবলিক URL
- PDF/ছবি upload
- QR public page-এ জমির তথ্য ও documents দেখা
- Print action

## পরবর্তী উন্নয়ন
- পূর্ণ edit form ও নিরাপদ delete confirmation
- একাধিক দাগ/খতিয়ান/দলিলের পৃথক তালিকা
- A4-এ QR কার্ডের পরিমার্জিত print layout
- Excel/PDF export
- activity log, backup/restore, admin allowlist
- upload করা ফাইল delete করলে Storage থেকেও মুছে ফেলা

## ডেটা ও আইনগত সতর্কতা
এই সফটওয়্যার কেবল আপনার দেওয়া তথ্য প্রদর্শন করে। এটি সরকারি ভূমি রেকর্ড যাচাই, দলিলের সত্যতা বা মালিকানা নিশ্চিত করে না। QR URL প্রকাশ করলে যে কেউ সেই রেকর্ড ও ফাইল দেখতে পারবে।
