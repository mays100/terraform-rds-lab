פרויקט Terraform RDS Lab - פריסת בסיס נתונים MySQL ב-AWS
🚀 מטרת הפרויקט
מטרת פרויקט זה היא להשתמש ב-Terraform כדי לפרוס בסיס נתונים מסוג Amazon RDS MySQL (בתצורת Multi-AZ), כולל כל רכיבי הרשת הדרושים (VPC, Subnets, Security Groups) כדי לאפשר קישוריות משרת ווב עתידי.

✅ דרישות קדם
לפני תחילת העבודה, ווידוא שהדברים הבאים מותקנים ומוגדרים במערכת שלך:

Terraform: גרסה v1.3.0 ומעלה.

AWS CLI: מוגדר עם פרטי כניסה והרשאות מתאימות לחשבון ה-AWS שלך.

📁 מבנה הפרויקט
הפרויקט בנוי במודולים כדי לשמור על סדר וארגון. מבנה התיקיות הוא כדלקמן:

terraform-rds-lab/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── db_subnet_group/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── rds/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── README.md

🛠️ הגדרה והרצה
בצע את השלבים הבאים בטרמינל (שורת הפקודה) מתוך תיקיית השורש של הפרויקט (terraform-rds-lab/):

עדכון פרטי התחברות (חובה!):
פתח את הקובץ terraform.tfvars ועדכן את הסיסמה עבור db_password לסיסמה חזקה משלך.

db_password = "YourStrongPassword123!" # *** שנה/י סיסמה זו! ***

נווט לתיקיית הפרויקט:
ודא שאתה נמצא בתיקיית השורש של הפרויקט בטרמינל. לדוגמה:

cd C:\Users\User\Desktop\aws\sql\terraform-rds-lab

אתחול Terraform:
פקודה זו מורידה את הפרובידרים והמודולים הנדרשים. יש להריץ אותה פעם אחת בתחילת העבודה או לאחר שינויים במבנה המודולים.

terraform init

תכנון הפריסה:
פקודה זו מציגה תוכנית מפורטת של כל המשאבים ש-Terraform יצור, ישנה או ימחק. מומלץ לבדוק את הפלט היטב.

terraform plan

החלת השינויים:
פקודה זו מבצעת בפועל את הפריסה ב-AWS. תתבקש/י לאשר על ידי הקלדת yes. שים/י לב שפריסת RDS יכולה לקחת מספר דקות.

terraform apply

בדיקת פלטים:
לאחר השלמת terraform apply, הפלטים שהוגדרו בקובץ outputs.tf יוצגו. ניתן להציג אותם שוב בכל עת באמצעות:

terraform output

פלטים אלו יכללו את ה-endpoint של בסיס הנתונים, שיהיה נחוץ להתחברות.

troubleshooting 🆘 פתרון בעיות נפוצות
להלן מספר בעיות נפוצות שאיתן התמודדת (ואחרות) ופתרונותיהן:

1. terraform' is not recognized as an internal or external command
הבעיה: מערכת ההפעלה לא מוצאת את קובץ ההפעלה של Terraform.

הפתרון:

וודא/י ש-Terraform מותקן: הוריד/י את terraform.exe מאתר HashiCorp והצב/י אותו בתיקייה ייעודית (לדוגמה, C:\terraform).

הוסף/י ל-PATH של המערכת: וודא/י שהנתיב לתיקייה זו נוסף למשתנה הסביבה Path במערכת ההפעלה Windows (דרך "Edit the system environment variables").

רענן/י את הטרמינל: סגור/י את כל חלונות שורת הפקודה הפתוחים ופתח/י חלון חדש לחלוטין לאחר שינוי ה-PATH.

2. Terraform initialized in an empty directory! The directory has no Terraform configuration files.
הבעיה: Terraform לא מוצא קבצי .tf בתיקייה הנוכחית.

הפתרון:

נווט/י לתיקייה הנכונה: וודא/י שאתה נמצא/ת בתיקיית השורש של הפרויקט (terraform-rds-lab) כשאתה מריץ/ה את הפקודות.

בדוק/י שמות קבצים: וודא/י שכל קבצי הקונפיגורציה (main.tf, variables.tf, outputs.tf, provider.tf, terraform.tfvars) אכן מסתיימים ב-.tf (או .tfvars) ואינם מכילים סיומות כפולות כמו .tf.txt. יש להפעיל הצגת סיומות קבצים ב-File Explorer כדי לוודא זאת.

3. Error: Retrieving AWS account details... InvalidClientTokenId: The security token included in the request is invalid.
הבעיה: בעיית אימות מול AWS. Terraform לא מצליח להתחבר לחשבון ה-AWS שלך בגלל פרטי כניסה לא תקינים או חוסר הרשאות.

הפתרון:

הגדר/י מחדש את פרטי ה-AWS CLI:

הריץ/י aws configure בטרמינל והכנס/י מחדש את ה-AWS Access Key ID ואת ה-AWS Secret Access Key שלך. וודא/י שפרטים אלו נכונים ופעילים (מומלץ ליצור מפתחות חדשים ב-AWS IAM Console).

ודא/י שה-Default region name (לדוגמה, eu-central-1) תואם ל-region שהוגדר בקובצי ה-Terraform.

וודא/י הרשאות IAM מספקות:

לכי ל-AWS Management Console -> IAM -> Users -> המשתמש שלך.

בלשונית "Permissions", וודא/י שלמשתמש יש מדיניות שמקנה לו הרשאות מספיקות ליצירת משאבי VPC ו-RDS. עבור מטלות למידה, מדיניות AdministratorAccess תפתור זאת.

רענן/י את הטרמינל: לאחר שינויים בפרטי AWS CLI או הרשאות IAM, סגור/י את כל חלונות שורת הפקודה ופתח/י חלון חדש לפני שתנסה/י שוב terraform plan.

🤝 צעדים הבאים
לאחר פריסה מוצלחת של בסיס הנתונים, השלבים הבאים כוללים בדרך כלל:

פריסת שרת ווב (לדוגמה, EC2 Instance) באותו VPC.

הגדרת Security Groups מתאימים לשרת הווב ול-RDS כדי לאפשר תקשורת ביניהם.

התקנת אפליקציית ווב על השרת שתתחבר לבסיס הנתונים.
