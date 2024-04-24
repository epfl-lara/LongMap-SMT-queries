; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104500 () Bool)

(assert start!104500)

(declare-fun res!831549 () Bool)

(declare-fun e!707152 () Bool)

(assert (=> start!104500 (=> (not res!831549) (not e!707152))))

(declare-datatypes ((array!80224 0))(
  ( (array!80225 (arr!38690 (Array (_ BitVec 32) (_ BitVec 64))) (size!39227 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80224)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104500 (= res!831549 (and (bvslt (size!39227 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39227 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39227 a!3892))))))

(assert (=> start!104500 e!707152))

(declare-fun array_inv!29628 (array!80224) Bool)

(assert (=> start!104500 (array_inv!29628 a!3892)))

(assert (=> start!104500 true))

(declare-fun b!1246873 () Bool)

(declare-fun e!707154 () Bool)

(declare-datatypes ((List!27506 0))(
  ( (Nil!27503) (Cons!27502 (h!28720 (_ BitVec 64)) (t!40967 List!27506)) )
))
(declare-fun lt!563426 () List!27506)

(declare-fun contains!7480 (List!27506 (_ BitVec 64)) Bool)

(assert (=> b!1246873 (= e!707154 (contains!7480 lt!563426 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246874 () Bool)

(declare-fun e!707153 () Bool)

(assert (=> b!1246874 (= e!707152 e!707153)))

(declare-fun res!831543 () Bool)

(assert (=> b!1246874 (=> (not res!831543) (not e!707153))))

(assert (=> b!1246874 (= res!831543 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1246874 (= lt!563426 (Cons!27502 (select (arr!38690 a!3892) from!3270) Nil!27503))))

(declare-fun b!1246875 () Bool)

(declare-fun res!831545 () Bool)

(assert (=> b!1246875 (=> (not res!831545) (not e!707152))))

(assert (=> b!1246875 (= res!831545 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39227 a!3892)) (not (= newFrom!287 (size!39227 a!3892)))))))

(declare-fun b!1246876 () Bool)

(declare-fun res!831546 () Bool)

(assert (=> b!1246876 (=> (not res!831546) (not e!707152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246876 (= res!831546 (validKeyInArray!0 (select (arr!38690 a!3892) from!3270)))))

(declare-fun b!1246877 () Bool)

(declare-fun res!831544 () Bool)

(assert (=> b!1246877 (=> (not res!831544) (not e!707152))))

(declare-fun arrayNoDuplicates!0 (array!80224 (_ BitVec 32) List!27506) Bool)

(assert (=> b!1246877 (= res!831544 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27503))))

(declare-fun b!1246878 () Bool)

(assert (=> b!1246878 (= e!707153 e!707154)))

(declare-fun res!831548 () Bool)

(assert (=> b!1246878 (=> res!831548 e!707154)))

(assert (=> b!1246878 (= res!831548 (contains!7480 lt!563426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246879 () Bool)

(declare-fun res!831547 () Bool)

(assert (=> b!1246879 (=> (not res!831547) (not e!707153))))

(declare-fun noDuplicate!2044 (List!27506) Bool)

(assert (=> b!1246879 (= res!831547 (noDuplicate!2044 lt!563426))))

(assert (= (and start!104500 res!831549) b!1246877))

(assert (= (and b!1246877 res!831544) b!1246875))

(assert (= (and b!1246875 res!831545) b!1246876))

(assert (= (and b!1246876 res!831546) b!1246874))

(assert (= (and b!1246874 res!831543) b!1246879))

(assert (= (and b!1246879 res!831547) b!1246878))

(assert (= (and b!1246878 (not res!831548)) b!1246873))

(declare-fun m!1149223 () Bool)

(assert (=> b!1246874 m!1149223))

(declare-fun m!1149225 () Bool)

(assert (=> b!1246879 m!1149225))

(declare-fun m!1149227 () Bool)

(assert (=> b!1246878 m!1149227))

(declare-fun m!1149229 () Bool)

(assert (=> b!1246873 m!1149229))

(declare-fun m!1149231 () Bool)

(assert (=> b!1246877 m!1149231))

(assert (=> b!1246876 m!1149223))

(assert (=> b!1246876 m!1149223))

(declare-fun m!1149233 () Bool)

(assert (=> b!1246876 m!1149233))

(declare-fun m!1149235 () Bool)

(assert (=> start!104500 m!1149235))

(check-sat (not start!104500) (not b!1246879) (not b!1246876) (not b!1246873) (not b!1246877) (not b!1246878))
(check-sat)
(get-model)

(declare-fun d!137865 () Bool)

(declare-fun res!831596 () Bool)

(declare-fun e!707184 () Bool)

(assert (=> d!137865 (=> res!831596 e!707184)))

(get-info :version)

(assert (=> d!137865 (= res!831596 ((_ is Nil!27503) lt!563426))))

(assert (=> d!137865 (= (noDuplicate!2044 lt!563426) e!707184)))

(declare-fun b!1246926 () Bool)

(declare-fun e!707185 () Bool)

(assert (=> b!1246926 (= e!707184 e!707185)))

(declare-fun res!831597 () Bool)

(assert (=> b!1246926 (=> (not res!831597) (not e!707185))))

(assert (=> b!1246926 (= res!831597 (not (contains!7480 (t!40967 lt!563426) (h!28720 lt!563426))))))

(declare-fun b!1246927 () Bool)

(assert (=> b!1246927 (= e!707185 (noDuplicate!2044 (t!40967 lt!563426)))))

(assert (= (and d!137865 (not res!831596)) b!1246926))

(assert (= (and b!1246926 res!831597) b!1246927))

(declare-fun m!1149265 () Bool)

(assert (=> b!1246926 m!1149265))

(declare-fun m!1149267 () Bool)

(assert (=> b!1246927 m!1149267))

(assert (=> b!1246879 d!137865))

(declare-fun d!137867 () Bool)

(declare-fun lt!563435 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!621 (List!27506) (InoxSet (_ BitVec 64)))

(assert (=> d!137867 (= lt!563435 (select (content!621 lt!563426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707191 () Bool)

(assert (=> d!137867 (= lt!563435 e!707191)))

(declare-fun res!831602 () Bool)

(assert (=> d!137867 (=> (not res!831602) (not e!707191))))

(assert (=> d!137867 (= res!831602 ((_ is Cons!27502) lt!563426))))

(assert (=> d!137867 (= (contains!7480 lt!563426 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563435)))

(declare-fun b!1246932 () Bool)

(declare-fun e!707190 () Bool)

(assert (=> b!1246932 (= e!707191 e!707190)))

(declare-fun res!831603 () Bool)

(assert (=> b!1246932 (=> res!831603 e!707190)))

(assert (=> b!1246932 (= res!831603 (= (h!28720 lt!563426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246933 () Bool)

(assert (=> b!1246933 (= e!707190 (contains!7480 (t!40967 lt!563426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137867 res!831602) b!1246932))

(assert (= (and b!1246932 (not res!831603)) b!1246933))

(declare-fun m!1149269 () Bool)

(assert (=> d!137867 m!1149269))

(declare-fun m!1149271 () Bool)

(assert (=> d!137867 m!1149271))

(declare-fun m!1149273 () Bool)

(assert (=> b!1246933 m!1149273))

(assert (=> b!1246873 d!137867))

(declare-fun d!137869 () Bool)

(declare-fun lt!563436 () Bool)

(assert (=> d!137869 (= lt!563436 (select (content!621 lt!563426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707193 () Bool)

(assert (=> d!137869 (= lt!563436 e!707193)))

(declare-fun res!831604 () Bool)

(assert (=> d!137869 (=> (not res!831604) (not e!707193))))

(assert (=> d!137869 (= res!831604 ((_ is Cons!27502) lt!563426))))

(assert (=> d!137869 (= (contains!7480 lt!563426 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563436)))

(declare-fun b!1246934 () Bool)

(declare-fun e!707192 () Bool)

(assert (=> b!1246934 (= e!707193 e!707192)))

(declare-fun res!831605 () Bool)

(assert (=> b!1246934 (=> res!831605 e!707192)))

(assert (=> b!1246934 (= res!831605 (= (h!28720 lt!563426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246935 () Bool)

(assert (=> b!1246935 (= e!707192 (contains!7480 (t!40967 lt!563426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137869 res!831604) b!1246934))

(assert (= (and b!1246934 (not res!831605)) b!1246935))

(assert (=> d!137869 m!1149269))

(declare-fun m!1149275 () Bool)

(assert (=> d!137869 m!1149275))

(declare-fun m!1149277 () Bool)

(assert (=> b!1246935 m!1149277))

(assert (=> b!1246878 d!137869))

(declare-fun b!1246946 () Bool)

(declare-fun e!707202 () Bool)

(declare-fun call!61556 () Bool)

(assert (=> b!1246946 (= e!707202 call!61556)))

(declare-fun b!1246947 () Bool)

(declare-fun e!707204 () Bool)

(assert (=> b!1246947 (= e!707204 e!707202)))

(declare-fun c!122359 () Bool)

(assert (=> b!1246947 (= c!122359 (validKeyInArray!0 (select (arr!38690 a!3892) from!3270)))))

(declare-fun b!1246948 () Bool)

(declare-fun e!707205 () Bool)

(assert (=> b!1246948 (= e!707205 (contains!7480 Nil!27503 (select (arr!38690 a!3892) from!3270)))))

(declare-fun bm!61553 () Bool)

(assert (=> bm!61553 (= call!61556 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122359 (Cons!27502 (select (arr!38690 a!3892) from!3270) Nil!27503) Nil!27503)))))

(declare-fun b!1246949 () Bool)

(assert (=> b!1246949 (= e!707202 call!61556)))

(declare-fun d!137871 () Bool)

(declare-fun res!831613 () Bool)

(declare-fun e!707203 () Bool)

(assert (=> d!137871 (=> res!831613 e!707203)))

(assert (=> d!137871 (= res!831613 (bvsge from!3270 (size!39227 a!3892)))))

(assert (=> d!137871 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27503) e!707203)))

(declare-fun b!1246950 () Bool)

(assert (=> b!1246950 (= e!707203 e!707204)))

(declare-fun res!831612 () Bool)

(assert (=> b!1246950 (=> (not res!831612) (not e!707204))))

(assert (=> b!1246950 (= res!831612 (not e!707205))))

(declare-fun res!831614 () Bool)

(assert (=> b!1246950 (=> (not res!831614) (not e!707205))))

(assert (=> b!1246950 (= res!831614 (validKeyInArray!0 (select (arr!38690 a!3892) from!3270)))))

(assert (= (and d!137871 (not res!831613)) b!1246950))

(assert (= (and b!1246950 res!831614) b!1246948))

(assert (= (and b!1246950 res!831612) b!1246947))

(assert (= (and b!1246947 c!122359) b!1246949))

(assert (= (and b!1246947 (not c!122359)) b!1246946))

(assert (= (or b!1246949 b!1246946) bm!61553))

(assert (=> b!1246947 m!1149223))

(assert (=> b!1246947 m!1149223))

(assert (=> b!1246947 m!1149233))

(assert (=> b!1246948 m!1149223))

(assert (=> b!1246948 m!1149223))

(declare-fun m!1149279 () Bool)

(assert (=> b!1246948 m!1149279))

(assert (=> bm!61553 m!1149223))

(declare-fun m!1149281 () Bool)

(assert (=> bm!61553 m!1149281))

(assert (=> b!1246950 m!1149223))

(assert (=> b!1246950 m!1149223))

(assert (=> b!1246950 m!1149233))

(assert (=> b!1246877 d!137871))

(declare-fun d!137873 () Bool)

(assert (=> d!137873 (= (validKeyInArray!0 (select (arr!38690 a!3892) from!3270)) (and (not (= (select (arr!38690 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38690 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246876 d!137873))

(declare-fun d!137875 () Bool)

(assert (=> d!137875 (= (array_inv!29628 a!3892) (bvsge (size!39227 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104500 d!137875))

(check-sat (not bm!61553) (not b!1246948) (not b!1246947) (not b!1246927) (not b!1246926) (not b!1246950) (not d!137867) (not d!137869) (not b!1246935) (not b!1246933))
(check-sat)
(get-model)

(declare-fun d!137901 () Bool)

(declare-fun res!831661 () Bool)

(declare-fun e!707258 () Bool)

(assert (=> d!137901 (=> res!831661 e!707258)))

(assert (=> d!137901 (= res!831661 ((_ is Nil!27503) (t!40967 lt!563426)))))

(assert (=> d!137901 (= (noDuplicate!2044 (t!40967 lt!563426)) e!707258)))

(declare-fun b!1247009 () Bool)

(declare-fun e!707259 () Bool)

(assert (=> b!1247009 (= e!707258 e!707259)))

(declare-fun res!831662 () Bool)

(assert (=> b!1247009 (=> (not res!831662) (not e!707259))))

(assert (=> b!1247009 (= res!831662 (not (contains!7480 (t!40967 (t!40967 lt!563426)) (h!28720 (t!40967 lt!563426)))))))

(declare-fun b!1247010 () Bool)

(assert (=> b!1247010 (= e!707259 (noDuplicate!2044 (t!40967 (t!40967 lt!563426))))))

(assert (= (and d!137901 (not res!831661)) b!1247009))

(assert (= (and b!1247009 res!831662) b!1247010))

(declare-fun m!1149319 () Bool)

(assert (=> b!1247009 m!1149319))

(declare-fun m!1149321 () Bool)

(assert (=> b!1247010 m!1149321))

(assert (=> b!1246927 d!137901))

(declare-fun d!137903 () Bool)

(declare-fun lt!563445 () Bool)

(assert (=> d!137903 (= lt!563445 (select (content!621 (t!40967 lt!563426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707261 () Bool)

(assert (=> d!137903 (= lt!563445 e!707261)))

(declare-fun res!831663 () Bool)

(assert (=> d!137903 (=> (not res!831663) (not e!707261))))

(assert (=> d!137903 (= res!831663 ((_ is Cons!27502) (t!40967 lt!563426)))))

(assert (=> d!137903 (= (contains!7480 (t!40967 lt!563426) #b1000000000000000000000000000000000000000000000000000000000000000) lt!563445)))

(declare-fun b!1247011 () Bool)

(declare-fun e!707260 () Bool)

(assert (=> b!1247011 (= e!707261 e!707260)))

(declare-fun res!831664 () Bool)

(assert (=> b!1247011 (=> res!831664 e!707260)))

(assert (=> b!1247011 (= res!831664 (= (h!28720 (t!40967 lt!563426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247012 () Bool)

(assert (=> b!1247012 (= e!707260 (contains!7480 (t!40967 (t!40967 lt!563426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137903 res!831663) b!1247011))

(assert (= (and b!1247011 (not res!831664)) b!1247012))

(declare-fun m!1149323 () Bool)

(assert (=> d!137903 m!1149323))

(declare-fun m!1149325 () Bool)

(assert (=> d!137903 m!1149325))

(declare-fun m!1149327 () Bool)

(assert (=> b!1247012 m!1149327))

(assert (=> b!1246933 d!137903))

(declare-fun d!137905 () Bool)

(declare-fun lt!563446 () Bool)

(assert (=> d!137905 (= lt!563446 (select (content!621 (t!40967 lt!563426)) (h!28720 lt!563426)))))

(declare-fun e!707263 () Bool)

(assert (=> d!137905 (= lt!563446 e!707263)))

(declare-fun res!831665 () Bool)

(assert (=> d!137905 (=> (not res!831665) (not e!707263))))

(assert (=> d!137905 (= res!831665 ((_ is Cons!27502) (t!40967 lt!563426)))))

(assert (=> d!137905 (= (contains!7480 (t!40967 lt!563426) (h!28720 lt!563426)) lt!563446)))

(declare-fun b!1247013 () Bool)

(declare-fun e!707262 () Bool)

(assert (=> b!1247013 (= e!707263 e!707262)))

(declare-fun res!831666 () Bool)

(assert (=> b!1247013 (=> res!831666 e!707262)))

(assert (=> b!1247013 (= res!831666 (= (h!28720 (t!40967 lt!563426)) (h!28720 lt!563426)))))

(declare-fun b!1247014 () Bool)

(assert (=> b!1247014 (= e!707262 (contains!7480 (t!40967 (t!40967 lt!563426)) (h!28720 lt!563426)))))

(assert (= (and d!137905 res!831665) b!1247013))

(assert (= (and b!1247013 (not res!831666)) b!1247014))

(assert (=> d!137905 m!1149323))

(declare-fun m!1149329 () Bool)

(assert (=> d!137905 m!1149329))

(declare-fun m!1149331 () Bool)

(assert (=> b!1247014 m!1149331))

(assert (=> b!1246926 d!137905))

(declare-fun b!1247015 () Bool)

(declare-fun e!707264 () Bool)

(declare-fun call!61563 () Bool)

(assert (=> b!1247015 (= e!707264 call!61563)))

(declare-fun b!1247016 () Bool)

(declare-fun e!707266 () Bool)

(assert (=> b!1247016 (= e!707266 e!707264)))

(declare-fun c!122366 () Bool)

(assert (=> b!1247016 (= c!122366 (validKeyInArray!0 (select (arr!38690 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun e!707267 () Bool)

(declare-fun b!1247017 () Bool)

(assert (=> b!1247017 (= e!707267 (contains!7480 (ite c!122359 (Cons!27502 (select (arr!38690 a!3892) from!3270) Nil!27503) Nil!27503) (select (arr!38690 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun bm!61560 () Bool)

(assert (=> bm!61560 (= call!61563 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!122366 (Cons!27502 (select (arr!38690 a!3892) (bvadd from!3270 #b00000000000000000000000000000001)) (ite c!122359 (Cons!27502 (select (arr!38690 a!3892) from!3270) Nil!27503) Nil!27503)) (ite c!122359 (Cons!27502 (select (arr!38690 a!3892) from!3270) Nil!27503) Nil!27503))))))

(declare-fun b!1247018 () Bool)

(assert (=> b!1247018 (= e!707264 call!61563)))

(declare-fun d!137907 () Bool)

(declare-fun res!831668 () Bool)

(declare-fun e!707265 () Bool)

(assert (=> d!137907 (=> res!831668 e!707265)))

(assert (=> d!137907 (= res!831668 (bvsge (bvadd from!3270 #b00000000000000000000000000000001) (size!39227 a!3892)))))

(assert (=> d!137907 (= (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122359 (Cons!27502 (select (arr!38690 a!3892) from!3270) Nil!27503) Nil!27503)) e!707265)))

(declare-fun b!1247019 () Bool)

(assert (=> b!1247019 (= e!707265 e!707266)))

(declare-fun res!831667 () Bool)

(assert (=> b!1247019 (=> (not res!831667) (not e!707266))))

(assert (=> b!1247019 (= res!831667 (not e!707267))))

(declare-fun res!831669 () Bool)

(assert (=> b!1247019 (=> (not res!831669) (not e!707267))))

(assert (=> b!1247019 (= res!831669 (validKeyInArray!0 (select (arr!38690 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(assert (= (and d!137907 (not res!831668)) b!1247019))

(assert (= (and b!1247019 res!831669) b!1247017))

(assert (= (and b!1247019 res!831667) b!1247016))

(assert (= (and b!1247016 c!122366) b!1247018))

(assert (= (and b!1247016 (not c!122366)) b!1247015))

(assert (= (or b!1247018 b!1247015) bm!61560))

(declare-fun m!1149333 () Bool)

(assert (=> b!1247016 m!1149333))

(assert (=> b!1247016 m!1149333))

(declare-fun m!1149335 () Bool)

(assert (=> b!1247016 m!1149335))

(assert (=> b!1247017 m!1149333))

(assert (=> b!1247017 m!1149333))

(declare-fun m!1149337 () Bool)

(assert (=> b!1247017 m!1149337))

(assert (=> bm!61560 m!1149333))

(declare-fun m!1149339 () Bool)

(assert (=> bm!61560 m!1149339))

(assert (=> b!1247019 m!1149333))

(assert (=> b!1247019 m!1149333))

(assert (=> b!1247019 m!1149335))

(assert (=> bm!61553 d!137907))

(declare-fun d!137909 () Bool)

(declare-fun lt!563447 () Bool)

(assert (=> d!137909 (= lt!563447 (select (content!621 Nil!27503) (select (arr!38690 a!3892) from!3270)))))

(declare-fun e!707269 () Bool)

(assert (=> d!137909 (= lt!563447 e!707269)))

(declare-fun res!831670 () Bool)

(assert (=> d!137909 (=> (not res!831670) (not e!707269))))

(assert (=> d!137909 (= res!831670 ((_ is Cons!27502) Nil!27503))))

(assert (=> d!137909 (= (contains!7480 Nil!27503 (select (arr!38690 a!3892) from!3270)) lt!563447)))

(declare-fun b!1247020 () Bool)

(declare-fun e!707268 () Bool)

(assert (=> b!1247020 (= e!707269 e!707268)))

(declare-fun res!831671 () Bool)

(assert (=> b!1247020 (=> res!831671 e!707268)))

(assert (=> b!1247020 (= res!831671 (= (h!28720 Nil!27503) (select (arr!38690 a!3892) from!3270)))))

(declare-fun b!1247021 () Bool)

(assert (=> b!1247021 (= e!707268 (contains!7480 (t!40967 Nil!27503) (select (arr!38690 a!3892) from!3270)))))

(assert (= (and d!137909 res!831670) b!1247020))

(assert (= (and b!1247020 (not res!831671)) b!1247021))

(declare-fun m!1149341 () Bool)

(assert (=> d!137909 m!1149341))

(assert (=> d!137909 m!1149223))

(declare-fun m!1149343 () Bool)

(assert (=> d!137909 m!1149343))

(assert (=> b!1247021 m!1149223))

(declare-fun m!1149345 () Bool)

(assert (=> b!1247021 m!1149345))

(assert (=> b!1246948 d!137909))

(declare-fun d!137911 () Bool)

(declare-fun lt!563448 () Bool)

(assert (=> d!137911 (= lt!563448 (select (content!621 (t!40967 lt!563426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707271 () Bool)

(assert (=> d!137911 (= lt!563448 e!707271)))

(declare-fun res!831672 () Bool)

(assert (=> d!137911 (=> (not res!831672) (not e!707271))))

(assert (=> d!137911 (= res!831672 ((_ is Cons!27502) (t!40967 lt!563426)))))

(assert (=> d!137911 (= (contains!7480 (t!40967 lt!563426) #b0000000000000000000000000000000000000000000000000000000000000000) lt!563448)))

(declare-fun b!1247022 () Bool)

(declare-fun e!707270 () Bool)

(assert (=> b!1247022 (= e!707271 e!707270)))

(declare-fun res!831673 () Bool)

(assert (=> b!1247022 (=> res!831673 e!707270)))

(assert (=> b!1247022 (= res!831673 (= (h!28720 (t!40967 lt!563426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247023 () Bool)

(assert (=> b!1247023 (= e!707270 (contains!7480 (t!40967 (t!40967 lt!563426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137911 res!831672) b!1247022))

(assert (= (and b!1247022 (not res!831673)) b!1247023))

(assert (=> d!137911 m!1149323))

(declare-fun m!1149347 () Bool)

(assert (=> d!137911 m!1149347))

(declare-fun m!1149349 () Bool)

(assert (=> b!1247023 m!1149349))

(assert (=> b!1246935 d!137911))

(declare-fun d!137913 () Bool)

(declare-fun c!122369 () Bool)

(assert (=> d!137913 (= c!122369 ((_ is Nil!27503) lt!563426))))

(declare-fun e!707274 () (InoxSet (_ BitVec 64)))

(assert (=> d!137913 (= (content!621 lt!563426) e!707274)))

(declare-fun b!1247028 () Bool)

(assert (=> b!1247028 (= e!707274 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1247029 () Bool)

(assert (=> b!1247029 (= e!707274 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28720 lt!563426) true) (content!621 (t!40967 lt!563426))))))

(assert (= (and d!137913 c!122369) b!1247028))

(assert (= (and d!137913 (not c!122369)) b!1247029))

(declare-fun m!1149351 () Bool)

(assert (=> b!1247029 m!1149351))

(assert (=> b!1247029 m!1149323))

(assert (=> d!137869 d!137913))

(assert (=> b!1246947 d!137873))

(assert (=> d!137867 d!137913))

(assert (=> b!1246950 d!137873))

(check-sat (not d!137905) (not d!137903) (not b!1247009) (not b!1247014) (not b!1247010) (not bm!61560) (not d!137909) (not b!1247019) (not b!1247029) (not b!1247017) (not b!1247021) (not b!1247016) (not b!1247023) (not b!1247012) (not d!137911))
(check-sat)
