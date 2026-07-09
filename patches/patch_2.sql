-- 1. تحديث هيكل الجدول لإضافة حقول النطق المكتوب والمقاطع الصوتية الجديدة
ALTER TABLE words ADD COLUMN arabic_transliteration TEXT;
ALTER TABLE words ADD COLUMN syllables TEXT;
ALTER TABLE words ADD COLUMN syllables_arabic_guide TEXT;

-- 2. إدخال وتحديث البيانات للمصطلحات الحالية بدليل النطق الجديد
UPDATE words 
SET 
    arabic_transliteration = 'فْرَاكْشَن', 
    syllables = 'Frac·tion', 
    syllables_arabic_guide = 'Frac: فْراكْ | tion: شَن' 
WHERE word = 'Fraction';

UPDATE words 
SET 
    arabic_transliteration = 'دِينُومِنَاتُر', 
    syllables = 'De·nom·i·na·tor', 
    syllables_arabic_guide = 'De: دِي | nom: نُومْ | i: مِـ | na: نَا | tor: تُر' 
WHERE word = 'Denominator';

UPDATE words 
SET 
    arabic_transliteration = 'هَايْبَاتِنْيُوز', 
    syllables = 'Hy·pot·e·nuse', 
    syllables_arabic_guide = 'Hy: هَايْ | pot: بَاتْ | e: ِـ | nuse: نْيُوز' 
WHERE word = 'Hypotenuse';

-- 3. إضافة مصطلح جديد تماماً تم التحقق منه لغويّاً كمثال على التوسّع
INSERT INTO words (
    word, arabic_title, part_of_speech, arabic_transliteration, syllables, syllables_arabic_guide,
    math_definition, general_definition, ipa_us, ipa_uk, example_math_1, example_math_2, 
    example_classroom, common_mistakes, educational_level, category_id
) VALUES (
    'Numerator', 
    'البسط', 
    'Noun', 
    'نُومَرِيتُر', 
    'Nu·mer·a·tor', 
    'Nu: نُو | mer: مَـر | a: ِـ | tor: تُر',
    'The quantitative numeral written above the fractional line, indicating how many parts of the whole are being taken.',
    'A feature or factor that is explicitly measured or counted.',
    '/ˈnuː.mə.reɪ.tər/', 
    '/ˈnjuː.mə.reɪ.tər/',
    'If the numerator increases while the denominator stays constant, the value of the fraction grows.',
    'Identify the variable expression in the numerator of this rational function.',
    '“Look at the fraction three-quarters. Three is our numerator, which means we are counting three out of the four equal parts.”',
    'Ensure you do not stress the first syllable overly flatly; the phonetic flow should rise naturally toward the second transition.',
    'Primary School',
    1
);
