---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Geometric Morphometric method tutorial 1: digitising landmarks ไทย"
subtitle: "สอนวิธีลง landmark ก่อนจะนำไปวิเคราะห์ข้อมูลแบบ Geometric Morphometric"
summary: "เขียนไว้ให้ตัวเองจำได้  และอาจจะเป็นประโยชน์ให้กับผู้อื่น"
authors: [admin]
tags: [tutorial, geometric morphometrics, shape, morphology]
categories: []
date: 2020-12-09T12:58:37+11:00
lastmod: 2020-12-09T12:58:37+11:00
featured: false
draft: false

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

เกริ่นก่อนว่าต้องขอบคุณ Damien Esquerré ที่เตรียมเอกสารชุดนี้เป็นภาษาอังกฤษไว้ให้คนรุ่นหลังได้ใช้  จุดประสงค์ของเอกสารนี้คือเก็บไว้เตือนความจำของผมในอนาคตเวลาที่จะต้องทำ geometric morphometric analysis อีก  โปรแกรมที่จะใช้คือ tps series โดย James Rohlf  คนที่จะใช้งานควรมีความรู้พื้นฐานเล็กน้อยเกี่ยวกับ geometric morphometric 

#### ซอฟแวร์ที่ต้องใช้ 

ก่อนที่จะเริ่มให้ลงโปรแกรมต่อไปนี้ (เฉพาะ WINDOWS  ใครใช้ OS อื่นหาวิธีเอานะครับ):
สามารถดาวโหลดโดยการ Right click -> Save Link As 
* [tpsDig](https://morphmet/tpsdig2w32.exe)  - โปรแกรมหลักในการกำหนด Landmark
* [tpsUtil](https://morphmet/tpsutilw32.exe) - โปรแกรมช่วยจัดการไฟล์
* [tpsRelw](https://morphmet/tpsrelww32.exe) - โปรแกรมสำหรับ Relative warp analysis

#### ภาพถ่ายที่จะวิเคราะห์

ภาพถ่ายของตัวอย่างที่จะใช้ในการวิเคราะห์ควรจะ คม ชัด เห็นตัวอย่างได้อย่างละเอียด ไม่หมืดหรือสว่างเกินไป  ทั้งหมดนี้ก็เพื่่อที่เราจะได้วางต่ำแหน่ง landmark ได้อย่างแม่นยำและสม่ำเสมอ   นอกจากนี้ทุกภาพจะต้องมีมาตราวัดความยาวกำกับ เช่น ไม้บรรทัด  เพราะเราต้องใช้เพื่อวัด Centroid size ซึ่งเป็นข้อมูลสำคัญในการวิเคราะห์ข้อมูลต่อไป

1. จัดการรูปถ่ายไว้ใน folder เดียวกันตั้งชื่อที่จำง่ายๆ (เช่น "lateral" สำหรับมุมข้าง) ชื่อของไฟล์ภาพแต่ละไฟล์ควรที่จะบ่งบอกถึงตัวอย่างนั้นๆ ได้ เช่น `aff-R112321-20201112.jpg` (species-id-date) ประมาณนี้  ไฟล์ภาพแบบนี่จะทำให้ง่ายต่อการแยกแยะภายหน้า  

   แยกรูปจากแต่ละด้านของตัวอย่างออกเช่น
   1. ./Dorsal 
   1. ./Lateral 
   1. ./Ventral 

  *ปรับภาพทั้งหมดให้หันหน้าไปทางเดียวกันจะช่วยให้เวลาจุด landmark ง่ายขึ้น*

<!-- Short code  -->
{{< figure src="../../media_post/folder_str_morphometric.jpg" title="จัด folder และรูปภาพแบบนี้" >}}

2. สร้างไฟล์ข้อมูลใน *tpsUtil* เพื่อที่จะได้สะดวกในการเก็บข้อมูลของภาพทุกภาพที่มี โดยการเปิด *tpsUtil* เลือก `Build file from images` สำหรับ Input ให้เลือก folder ที่เราเก็บภาพไว้  output

3. ก่อนจะเริ่มลง landmark ควรจะพิจารณาให้ดีว่าจะเลือกจุดไหนเป็น landmark  จุดที่ดีคือจุดที่เราสามารถหาได้อย่างสม่ำเสมอและเป็นจุดที่เปรียบเทียบระหว่างตัวอย่างจากต่างสายพันธุ์ได้ (homologous) ยกตัวอย่างเช่นตำแหน่งของขอบตา ครีบบน เกร็ดหน้า ฯลฯ
สำหรับงูดินของผมจะใช้เกร็ดบนใบหน้าเป็นส่วนใหญ่เพราะหาได้ค่อนข้างง่าย  อีกอย่างคือต้องเป็นโครงสร้างของตัวอย่างนั้นๆ ที่เกี่ยวข้องกับสมมติฐานที่ตั้งไว้    ผมเลือก landmark ตามภาพด้านล่างนี้เพราะผมสนใจความโค้งมน (curvature) ของหัวงูเพราะเป็นลักษณะที่แตกต่างระหว่างชนิด

{{< figure src="../../media_post/landmark_diagram.jpg" title="Landmark ของงูดิน *Anilios*" >}}

4. ในโปรแกรม tpsDig2 ให้เปิดไฟล์ .tps ของเราที่เตรียมไว้  จะมีรูปตัวอย่างเราขึ้นหน้าจอ  ลองกดลูกศรสีแดงซ้ายขวาเพิ่อดูรูปตัวอย่าง   

{{< figure src="../../media_post/morpho_1.gif" title="เช็คว่าไฟล์เปิดได้ มีรูปอยู่หันไปทางเดียวกัน" >}}

5. ถ้าทุกอย่างเรียบร้อยดีพร้อมจะลง landmark แล้วต้อง set scale ก่อน ไปที่ Option -> Image tools ให้เลือก tab `Measure` กด Set scale แล้วลากเส้นวัดความยาวกับไม้บรรทัดด้วยระยะที่เหมาะสม   ต้อง set scale สำหรับทุกภาพตัวอย่างเผื่อว่าระยะและตัวอย่างจะแตกต่างกันเล็กน้อย

{{< figure src="../../media_post/morpho_2.gif" title="set scale เสร็จแล้วเริ่มลง landmark ได้เลย!" >}}

6. ลง landmark ที่ตั้งไว้ ! อย่าลืมว่าจำเป็นต้องลงจุด landmark ในลำดับเดียวกันสำหรับทุกตัวอย่าง  ถ้าจุด landmark เล็กไปสามารถเข้าไปแก้ให้ใหญ่ขึ้นได้ใน image tools -> colors -> Lm. color.   ถ้าลง landmark ผิดที่  สามารถลบ landmark ได้โดยคลิกขวา "Delete landmark"  

7. Save บ่อยๆ  ไปที่ File: Save Data และเลือกไฟล์ .tps เดิม  ให้กด overwrite เว้นแต่ว่าจะเพิ่มภาพตัวอย่าง ให้กด Append    Back up ไฟล์ไว้บ่อยๆ เผื่อบางทีอาจจะ overwrite ผิด

8. สำหรับท่านที่มั่นใจว่าระยะ องศา และ มุมกล้องไม่เปลี่ยนสำหรับแต่ละตัวอย่าง  ลองใช้ Template mode ได้เพราะ landmark จะลงใกล้ๆ จุดเดิมทุกครั้งอาจจะย่นเวลาในการทำ landmark ลงได้  

9. หลังจากลง landmark เสร็จทั้งหมด หากเจอ landmark ที่ไม่ต้องการจะใช้  ท่านสามารถโละ landmark นั้นทิ้งได้ในโปรแกรม tpsUtil  ให้เลือก "Delete/Reorder landmarks"  input: .tps file  output: ไฟล์ใหม่   ใน Setup ให้เลือก landmark ที่ท่านต้องการจะโละทิ้ง  ท่านสามารถเปลี่ยนลำดับของ landmark ทั้งหมดได้ด้วยถ้าจำเป็น

10. ตรวจดูว่าขั้นตอนที่ลง landmark มีความผิดพลาดอะไรไหมโดยการใช้ Partial Warps analysis ในโปรแกรม tpsRelw   (ไฟล์ที่จะเปิดในโปรแกรมนี้ต้องมีข้อมูล landmark ครบถ้วนทุกตัวอย่างไม่อย่างนั้นไฟล์จะเปิดไม่ได้)  Data ให้เลือกไฟล์  เสร็จแล้วให้กดปุ่ม "Consensus" ต่อมา "Partial warps" และปุ่มอื่นๆ จนครบ   หากเจอ outlier ให้บันทึกเลข ID ไว้แล้วกลับไปตรวจดูว่าขั้นตอนที่ลง landmark สำหรับตัวอย่างนั้นไม่มีอะไรผิดพลาด

หากท่านเพียงต้องการจะใช้ landmark ธรรมดา จบขั้นตอนนี้ถือว่าเสร็จ   ถ้าต้องการจะใช้ semilandmark ให้ติดตามตอนต่อไป!



