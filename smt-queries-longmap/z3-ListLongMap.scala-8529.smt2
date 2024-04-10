; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103972 () Bool)

(assert start!103972)

(declare-fun b!1244464 () Bool)

(declare-fun e!705371 () Bool)

(declare-fun e!705373 () Bool)

(assert (=> b!1244464 (= e!705371 (not e!705373))))

(declare-fun res!830109 () Bool)

(assert (=> b!1244464 (=> res!830109 e!705373)))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244464 (= res!830109 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(declare-datatypes ((array!80064 0))(
  ( (array!80065 (arr!38625 (Array (_ BitVec 32) (_ BitVec 64))) (size!39161 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80064)

(declare-datatypes ((List!27428 0))(
  ( (Nil!27425) (Cons!27424 (h!28633 (_ BitVec 64)) (t!40897 List!27428)) )
))
(declare-fun arrayNoDuplicates!0 (array!80064 (_ BitVec 32) List!27428) Bool)

(assert (=> b!1244464 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27425)))

(declare-datatypes ((Unit!41381 0))(
  ( (Unit!41382) )
))
(declare-fun lt!562754 () Unit!41381)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80064 (_ BitVec 32) (_ BitVec 32)) Unit!41381)

(assert (=> b!1244464 (= lt!562754 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244465 () Bool)

(declare-fun res!830108 () Bool)

(assert (=> b!1244465 (=> (not res!830108) (not e!705371))))

(assert (=> b!1244465 (= res!830108 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27425))))

(declare-fun b!1244466 () Bool)

(declare-fun e!705374 () Unit!41381)

(declare-fun lt!562753 () Unit!41381)

(assert (=> b!1244466 (= e!705374 lt!562753)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80064 List!27428 List!27428 (_ BitVec 32)) Unit!41381)

(assert (=> b!1244466 (= lt!562753 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27424 (select (arr!38625 a!3892) from!3270) Nil!27425) Nil!27425 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244466 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27425)))

(declare-fun res!830105 () Bool)

(declare-fun e!705375 () Bool)

(assert (=> start!103972 (=> (not res!830105) (not e!705375))))

(assert (=> start!103972 (= res!830105 (and (bvslt (size!39161 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39161 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39161 a!3892))))))

(assert (=> start!103972 e!705375))

(declare-fun array_inv!29473 (array!80064) Bool)

(assert (=> start!103972 (array_inv!29473 a!3892)))

(assert (=> start!103972 true))

(declare-fun b!1244467 () Bool)

(assert (=> b!1244467 (= e!705375 e!705371)))

(declare-fun res!830110 () Bool)

(assert (=> b!1244467 (=> (not res!830110) (not e!705371))))

(assert (=> b!1244467 (= res!830110 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562752 () Unit!41381)

(assert (=> b!1244467 (= lt!562752 e!705374)))

(declare-fun c!121864 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244467 (= c!121864 (validKeyInArray!0 (select (arr!38625 a!3892) from!3270)))))

(declare-fun b!1244468 () Bool)

(declare-fun noDuplicate!2006 (List!27428) Bool)

(assert (=> b!1244468 (= e!705373 (noDuplicate!2006 Nil!27425))))

(declare-fun b!1244469 () Bool)

(declare-fun Unit!41383 () Unit!41381)

(assert (=> b!1244469 (= e!705374 Unit!41383)))

(declare-fun b!1244470 () Bool)

(declare-fun res!830106 () Bool)

(assert (=> b!1244470 (=> (not res!830106) (not e!705375))))

(assert (=> b!1244470 (= res!830106 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27425))))

(declare-fun b!1244471 () Bool)

(declare-fun res!830107 () Bool)

(assert (=> b!1244471 (=> (not res!830107) (not e!705375))))

(assert (=> b!1244471 (= res!830107 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39161 a!3892)) (not (= newFrom!287 (size!39161 a!3892)))))))

(assert (= (and start!103972 res!830105) b!1244470))

(assert (= (and b!1244470 res!830106) b!1244471))

(assert (= (and b!1244471 res!830107) b!1244467))

(assert (= (and b!1244467 c!121864) b!1244466))

(assert (= (and b!1244467 (not c!121864)) b!1244469))

(assert (= (and b!1244467 res!830110) b!1244465))

(assert (= (and b!1244465 res!830108) b!1244464))

(assert (= (and b!1244464 (not res!830109)) b!1244468))

(declare-fun m!1146737 () Bool)

(assert (=> b!1244467 m!1146737))

(assert (=> b!1244467 m!1146737))

(declare-fun m!1146739 () Bool)

(assert (=> b!1244467 m!1146739))

(declare-fun m!1146741 () Bool)

(assert (=> b!1244465 m!1146741))

(assert (=> b!1244466 m!1146737))

(declare-fun m!1146743 () Bool)

(assert (=> b!1244466 m!1146743))

(assert (=> b!1244466 m!1146741))

(declare-fun m!1146745 () Bool)

(assert (=> start!103972 m!1146745))

(declare-fun m!1146747 () Bool)

(assert (=> b!1244464 m!1146747))

(declare-fun m!1146749 () Bool)

(assert (=> b!1244464 m!1146749))

(declare-fun m!1146751 () Bool)

(assert (=> b!1244470 m!1146751))

(declare-fun m!1146753 () Bool)

(assert (=> b!1244468 m!1146753))

(check-sat (not b!1244470) (not start!103972) (not b!1244464) (not b!1244467) (not b!1244466) (not b!1244465) (not b!1244468))
(check-sat)
(get-model)

(declare-fun b!1244506 () Bool)

(declare-fun e!705401 () Bool)

(declare-fun contains!7427 (List!27428 (_ BitVec 64)) Bool)

(assert (=> b!1244506 (= e!705401 (contains!7427 Nil!27425 (select (arr!38625 a!3892) newFrom!287)))))

(declare-fun b!1244507 () Bool)

(declare-fun e!705399 () Bool)

(declare-fun e!705400 () Bool)

(assert (=> b!1244507 (= e!705399 e!705400)))

(declare-fun res!830136 () Bool)

(assert (=> b!1244507 (=> (not res!830136) (not e!705400))))

(assert (=> b!1244507 (= res!830136 (not e!705401))))

(declare-fun res!830137 () Bool)

(assert (=> b!1244507 (=> (not res!830137) (not e!705401))))

(assert (=> b!1244507 (= res!830137 (validKeyInArray!0 (select (arr!38625 a!3892) newFrom!287)))))

(declare-fun b!1244508 () Bool)

(declare-fun e!705402 () Bool)

(assert (=> b!1244508 (= e!705400 e!705402)))

(declare-fun c!121870 () Bool)

(assert (=> b!1244508 (= c!121870 (validKeyInArray!0 (select (arr!38625 a!3892) newFrom!287)))))

(declare-fun call!61411 () Bool)

(declare-fun bm!61408 () Bool)

(assert (=> bm!61408 (= call!61411 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!121870 (Cons!27424 (select (arr!38625 a!3892) newFrom!287) Nil!27425) Nil!27425)))))

(declare-fun b!1244510 () Bool)

(assert (=> b!1244510 (= e!705402 call!61411)))

(declare-fun d!137121 () Bool)

(declare-fun res!830135 () Bool)

(assert (=> d!137121 (=> res!830135 e!705399)))

(assert (=> d!137121 (= res!830135 (bvsge newFrom!287 (size!39161 a!3892)))))

(assert (=> d!137121 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27425) e!705399)))

(declare-fun b!1244509 () Bool)

(assert (=> b!1244509 (= e!705402 call!61411)))

(assert (= (and d!137121 (not res!830135)) b!1244507))

(assert (= (and b!1244507 res!830137) b!1244506))

(assert (= (and b!1244507 res!830136) b!1244508))

(assert (= (and b!1244508 c!121870) b!1244509))

(assert (= (and b!1244508 (not c!121870)) b!1244510))

(assert (= (or b!1244509 b!1244510) bm!61408))

(declare-fun m!1146773 () Bool)

(assert (=> b!1244506 m!1146773))

(assert (=> b!1244506 m!1146773))

(declare-fun m!1146775 () Bool)

(assert (=> b!1244506 m!1146775))

(assert (=> b!1244507 m!1146773))

(assert (=> b!1244507 m!1146773))

(declare-fun m!1146777 () Bool)

(assert (=> b!1244507 m!1146777))

(assert (=> b!1244508 m!1146773))

(assert (=> b!1244508 m!1146773))

(assert (=> b!1244508 m!1146777))

(assert (=> bm!61408 m!1146773))

(declare-fun m!1146779 () Bool)

(assert (=> bm!61408 m!1146779))

(assert (=> b!1244464 d!137121))

(declare-fun d!137123 () Bool)

(assert (=> d!137123 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27425)))

(declare-fun lt!562766 () Unit!41381)

(declare-fun choose!39 (array!80064 (_ BitVec 32) (_ BitVec 32)) Unit!41381)

(assert (=> d!137123 (= lt!562766 (choose!39 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (=> d!137123 (bvslt (size!39161 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137123 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287) lt!562766)))

(declare-fun bs!35039 () Bool)

(assert (= bs!35039 d!137123))

(assert (=> bs!35039 m!1146747))

(declare-fun m!1146781 () Bool)

(assert (=> bs!35039 m!1146781))

(assert (=> b!1244464 d!137123))

(declare-fun d!137129 () Bool)

(assert (=> d!137129 (= (validKeyInArray!0 (select (arr!38625 a!3892) from!3270)) (and (not (= (select (arr!38625 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38625 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1244467 d!137129))

(declare-fun d!137131 () Bool)

(declare-fun res!830142 () Bool)

(declare-fun e!705407 () Bool)

(assert (=> d!137131 (=> res!830142 e!705407)))

(get-info :version)

(assert (=> d!137131 (= res!830142 ((_ is Nil!27425) Nil!27425))))

(assert (=> d!137131 (= (noDuplicate!2006 Nil!27425) e!705407)))

(declare-fun b!1244515 () Bool)

(declare-fun e!705408 () Bool)

(assert (=> b!1244515 (= e!705407 e!705408)))

(declare-fun res!830143 () Bool)

(assert (=> b!1244515 (=> (not res!830143) (not e!705408))))

(assert (=> b!1244515 (= res!830143 (not (contains!7427 (t!40897 Nil!27425) (h!28633 Nil!27425))))))

(declare-fun b!1244516 () Bool)

(assert (=> b!1244516 (= e!705408 (noDuplicate!2006 (t!40897 Nil!27425)))))

(assert (= (and d!137131 (not res!830142)) b!1244515))

(assert (= (and b!1244515 res!830143) b!1244516))

(declare-fun m!1146783 () Bool)

(assert (=> b!1244515 m!1146783))

(declare-fun m!1146785 () Bool)

(assert (=> b!1244516 m!1146785))

(assert (=> b!1244468 d!137131))

(declare-fun d!137135 () Bool)

(assert (=> d!137135 (= (array_inv!29473 a!3892) (bvsge (size!39161 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!103972 d!137135))

(declare-fun d!137137 () Bool)

(assert (=> d!137137 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27425)))

(declare-fun lt!562769 () Unit!41381)

(declare-fun choose!80 (array!80064 List!27428 List!27428 (_ BitVec 32)) Unit!41381)

(assert (=> d!137137 (= lt!562769 (choose!80 a!3892 (Cons!27424 (select (arr!38625 a!3892) from!3270) Nil!27425) Nil!27425 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137137 (bvslt (size!39161 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137137 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27424 (select (arr!38625 a!3892) from!3270) Nil!27425) Nil!27425 (bvadd #b00000000000000000000000000000001 from!3270)) lt!562769)))

(declare-fun bs!35040 () Bool)

(assert (= bs!35040 d!137137))

(assert (=> bs!35040 m!1146741))

(declare-fun m!1146787 () Bool)

(assert (=> bs!35040 m!1146787))

(assert (=> b!1244466 d!137137))

(declare-fun b!1244542 () Bool)

(declare-fun e!705431 () Bool)

(assert (=> b!1244542 (= e!705431 (contains!7427 Nil!27425 (select (arr!38625 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244543 () Bool)

(declare-fun e!705429 () Bool)

(declare-fun e!705430 () Bool)

(assert (=> b!1244543 (= e!705429 e!705430)))

(declare-fun res!830160 () Bool)

(assert (=> b!1244543 (=> (not res!830160) (not e!705430))))

(assert (=> b!1244543 (= res!830160 (not e!705431))))

(declare-fun res!830161 () Bool)

(assert (=> b!1244543 (=> (not res!830161) (not e!705431))))

(assert (=> b!1244543 (= res!830161 (validKeyInArray!0 (select (arr!38625 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244544 () Bool)

(declare-fun e!705432 () Bool)

(assert (=> b!1244544 (= e!705430 e!705432)))

(declare-fun c!121876 () Bool)

(assert (=> b!1244544 (= c!121876 (validKeyInArray!0 (select (arr!38625 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun call!61417 () Bool)

(declare-fun bm!61414 () Bool)

(assert (=> bm!61414 (= call!61417 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121876 (Cons!27424 (select (arr!38625 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27425) Nil!27425)))))

(declare-fun b!1244546 () Bool)

(assert (=> b!1244546 (= e!705432 call!61417)))

(declare-fun d!137139 () Bool)

(declare-fun res!830159 () Bool)

(assert (=> d!137139 (=> res!830159 e!705429)))

(assert (=> d!137139 (= res!830159 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39161 a!3892)))))

(assert (=> d!137139 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27425) e!705429)))

(declare-fun b!1244545 () Bool)

(assert (=> b!1244545 (= e!705432 call!61417)))

(assert (= (and d!137139 (not res!830159)) b!1244543))

(assert (= (and b!1244543 res!830161) b!1244542))

(assert (= (and b!1244543 res!830160) b!1244544))

(assert (= (and b!1244544 c!121876) b!1244545))

(assert (= (and b!1244544 (not c!121876)) b!1244546))

(assert (= (or b!1244545 b!1244546) bm!61414))

(declare-fun m!1146791 () Bool)

(assert (=> b!1244542 m!1146791))

(assert (=> b!1244542 m!1146791))

(declare-fun m!1146793 () Bool)

(assert (=> b!1244542 m!1146793))

(assert (=> b!1244543 m!1146791))

(assert (=> b!1244543 m!1146791))

(declare-fun m!1146797 () Bool)

(assert (=> b!1244543 m!1146797))

(assert (=> b!1244544 m!1146791))

(assert (=> b!1244544 m!1146791))

(assert (=> b!1244544 m!1146797))

(assert (=> bm!61414 m!1146791))

(declare-fun m!1146799 () Bool)

(assert (=> bm!61414 m!1146799))

(assert (=> b!1244466 d!137139))

(declare-fun b!1244547 () Bool)

(declare-fun e!705435 () Bool)

(assert (=> b!1244547 (= e!705435 (contains!7427 Nil!27425 (select (arr!38625 a!3892) from!3270)))))

(declare-fun b!1244548 () Bool)

(declare-fun e!705433 () Bool)

(declare-fun e!705434 () Bool)

(assert (=> b!1244548 (= e!705433 e!705434)))

(declare-fun res!830163 () Bool)

(assert (=> b!1244548 (=> (not res!830163) (not e!705434))))

(assert (=> b!1244548 (= res!830163 (not e!705435))))

(declare-fun res!830164 () Bool)

(assert (=> b!1244548 (=> (not res!830164) (not e!705435))))

(assert (=> b!1244548 (= res!830164 (validKeyInArray!0 (select (arr!38625 a!3892) from!3270)))))

(declare-fun b!1244549 () Bool)

(declare-fun e!705436 () Bool)

(assert (=> b!1244549 (= e!705434 e!705436)))

(declare-fun c!121877 () Bool)

(assert (=> b!1244549 (= c!121877 (validKeyInArray!0 (select (arr!38625 a!3892) from!3270)))))

(declare-fun bm!61415 () Bool)

(declare-fun call!61418 () Bool)

(assert (=> bm!61415 (= call!61418 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121877 (Cons!27424 (select (arr!38625 a!3892) from!3270) Nil!27425) Nil!27425)))))

(declare-fun b!1244551 () Bool)

(assert (=> b!1244551 (= e!705436 call!61418)))

(declare-fun d!137143 () Bool)

(declare-fun res!830162 () Bool)

(assert (=> d!137143 (=> res!830162 e!705433)))

(assert (=> d!137143 (= res!830162 (bvsge from!3270 (size!39161 a!3892)))))

(assert (=> d!137143 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27425) e!705433)))

(declare-fun b!1244550 () Bool)

(assert (=> b!1244550 (= e!705436 call!61418)))

(assert (= (and d!137143 (not res!830162)) b!1244548))

(assert (= (and b!1244548 res!830164) b!1244547))

(assert (= (and b!1244548 res!830163) b!1244549))

(assert (= (and b!1244549 c!121877) b!1244550))

(assert (= (and b!1244549 (not c!121877)) b!1244551))

(assert (= (or b!1244550 b!1244551) bm!61415))

(assert (=> b!1244547 m!1146737))

(assert (=> b!1244547 m!1146737))

(declare-fun m!1146801 () Bool)

(assert (=> b!1244547 m!1146801))

(assert (=> b!1244548 m!1146737))

(assert (=> b!1244548 m!1146737))

(assert (=> b!1244548 m!1146739))

(assert (=> b!1244549 m!1146737))

(assert (=> b!1244549 m!1146737))

(assert (=> b!1244549 m!1146739))

(assert (=> bm!61415 m!1146737))

(declare-fun m!1146805 () Bool)

(assert (=> bm!61415 m!1146805))

(assert (=> b!1244470 d!137143))

(assert (=> b!1244465 d!137139))

(check-sat (not bm!61408) (not b!1244515) (not b!1244516) (not b!1244506) (not bm!61415) (not b!1244507) (not d!137123) (not b!1244508) (not bm!61414) (not b!1244542) (not b!1244548) (not d!137137) (not b!1244549) (not b!1244547) (not b!1244543) (not b!1244544))
(check-sat)
