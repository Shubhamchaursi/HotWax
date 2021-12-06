package com.company;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

        public class Main {

            public static void main(String[] args) throws IOException {
                String urlfilepath = "Home\\HotWax\\Assignment1\\url.txt";
                String wordsfilepath = "Home\\HotWax\\Assignment1\\word.txt";

                FileReader fr = new FileReader(urlfilepath);
                BufferedReader br = new BufferedReader(fr);
                String readUrls = br.readLine();

                FileReader fr1 = new FileReader(wordsfilepath);
                BufferedReader br1 = new BufferedReader(fr1);
                ArrayList<String> wordStr = new ArrayList<>();
                while (br1.readLine() != null) {
                    String readWords = br1.readLine();
                    wordStr.add(readWords);
                }
                while (readUrls != null) {
                    try {
                        System.out.println(readUrls);
                        URL url1 = new URL(readUrls);
                        URLConnection urlConnection = url1.openConnection();
                        InputStream stream = urlConnection.getInputStream();
                        {
                            CharArrayWriter cw = new CharArrayWriter();
                            cw.write("");
                            int url;
                            while ((url = stream.read()) != -1) {
                                char ch = (char) url;
                                cw.append(ch);
                            }
                            String str = cw.toString();
                            String[] start = str.split(" ");
                            for (String s : wordStr) {
                                int count = 0;
                                for (int j = 0; j < 200; j++) {
                                    if (start[j].compareTo(s) == 0) {
                                        count++;
                                    }
                                }
                                System.out.println(s + " " + count);
                            }
                        }
                    } catch (MalformedURLException malformedURLException) {
                        malformedURLException.printStackTrace();
                    } catch (FileNotFoundException fileNotFoundException) {
                        fileNotFoundException.printStackTrace();
                    } catch (IOException ioException) {
                        ioException.printStackTrace();
                    }
                }
            }
        }

