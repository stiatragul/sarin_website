---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Geometric Morphometric method tutorial 2: semi landmarks ไทย"
subtitle: "หลังจาก part 1 เรามาลง semi landmark กันใน part 2"
summary: "เขียนไว้ให้ตัวเองจำได้  และอาจจะเป็นประโยชน์ให้กับผู้อื่น"
authors: [admin]
tags: [tutorial, geometric morphometrics, shape, morphology]
categories: []
date: 2020-12-21T08:41:26+11:00
lastmod: 2020-12-21T08:41:26+11:00
featured: false
draft: true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

บทความนี้คือขั้นตอนต่อจาก part 1 "Geometric Morphometric method tutorial 1: digitising landmarks ไทย"

## Semi-landmark 

บางครั้งรูปร่างของตัวอย่างที่เราอยากจะวิเคราะห์คือความนูนหรือเว้า  ในกรณีแบบนี้เราสามารถใช้ semilandmark ได้   ก่อนจะเริ่มต้องแน่ใจก่อนว่าเราสามารถเห็นความนูนหรือเว้าทั้งหมดในภาพ

1. Semilandmark ควรจะมีจุดเริ่มและจบเป็น landmark (เราเรียกพวกจุดนี้ว่า anchor point)  เลือก Pencil tool  เริ่มจากจุดแรกและกดวาดจุดไปเรื่อยๆ จนถึงจุด landmark ที่สอง  เมื่อลงเส้น curve เสร็จให้คลิ๊กขวา 

2. คลิ๊กขวาบนเส้น curve แล้วกด "Resample curve"  เลือก "By length" ณ จุดนี้เลือกใส่เลขของ semilandmark ที่ต้องการจะใช้  ในตัวอย่างผมใช้ 20 จุด   การ Resample by length นี้เพื่อให้ semilandmark มีความห่างเท่ากัน

{{< figure src="../../media_post/morpho_semilandmark_2.gif" title="Semilandmark ของงูดิน *Anilios*" >}}

3. ถ้าต้องการที่จะแก้ไข curve เราสามารถ คลิ๊กที่จุดและเลื่อนได้เลย  หลังจากเลื่อนให้กด "Resample curve" by length อีกครั้ง  หากเส้น curve สั้นหรือยาวเกินไป เราสามารถแก้ไขได้โดยการลากจุดแรกหรือจุดสุดท้าย  หากต้องการที่จะลบให้คลิ๊กขวาแล้วกด "Delete curve point" หากต้องการจะลบทั้ง curve แล้วเริ่มใหม่ให้กด "Delete curve" 

{{< figure src="../../media_post/morpho_semilandmark_3.gif" title="การแก้ไข Semilandmark" >}}

4. เมื่อลง semilandmark เสร็จทุกตัวอย่างเราต้องเตรียม slider file  หลังจาก save ไฟล์ .tps ที่มีทั้ง landmark และ semilandmark เรียบร้อย ให้เปิดโปรแกรม `tpsUtil`  เลือก "Append tps curve to semilandmarks" จาก เมนู Operations   สำหรับ input ให้เลือกไฟล์ .tps  ส่วน output ให้สร้างไฟล์ใหม่  หลังจากนั้นกดปุ่ม Create

5. 