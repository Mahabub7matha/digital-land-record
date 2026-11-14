import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = { title: "ডিজিটাল ভূমি তথ্য", description: "ব্যক্তিগত ভূমি তথ্য ও QR Code ব্যবস্থাপনা" };
export default function RootLayout({children}:{children:React.ReactNode}) {
  return <html lang="bn"><body>{children}</body></html>;
}