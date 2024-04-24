; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93216 () Bool)

(assert start!93216)

(declare-fun b!1056577 () Bool)

(declare-fun e!600547 () Bool)

(declare-datatypes ((List!22308 0))(
  ( (Nil!22305) (Cons!22304 (h!23522 (_ BitVec 64)) (t!31607 List!22308)) )
))
(declare-fun contains!6205 (List!22308 (_ BitVec 64)) Bool)

(assert (=> b!1056577 (= e!600547 (not (contains!6205 Nil!22305 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1056578 () Bool)

(declare-fun e!600545 () Bool)

(declare-fun e!600550 () Bool)

(assert (=> b!1056578 (= e!600545 e!600550)))

(declare-fun res!704630 () Bool)

(assert (=> b!1056578 (=> (not res!704630) (not e!600550))))

(declare-datatypes ((array!66607 0))(
  ( (array!66608 (arr!32026 (Array (_ BitVec 32) (_ BitVec 64))) (size!32563 (_ BitVec 32))) )
))
(declare-fun lt!466228 () array!66607)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056578 (= res!704630 (arrayContainsKey!0 lt!466228 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66607)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056578 (= lt!466228 (array!66608 (store (arr!32026 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32563 a!3488)))))

(declare-fun lt!466226 () (_ BitVec 32))

(declare-fun e!600546 () Bool)

(declare-fun b!1056579 () Bool)

(assert (=> b!1056579 (= e!600546 (arrayContainsKey!0 a!3488 k0!2747 lt!466226))))

(declare-fun b!1056580 () Bool)

(declare-fun res!704631 () Bool)

(assert (=> b!1056580 (=> (not res!704631) (not e!600545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056580 (= res!704631 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056581 () Bool)

(declare-fun res!704638 () Bool)

(assert (=> b!1056581 (=> (not res!704638) (not e!600545))))

(declare-fun arrayNoDuplicates!0 (array!66607 (_ BitVec 32) List!22308) Bool)

(assert (=> b!1056581 (= res!704638 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22305))))

(declare-fun b!1056582 () Bool)

(declare-fun e!600549 () Bool)

(declare-fun e!600551 () Bool)

(assert (=> b!1056582 (= e!600549 e!600551)))

(declare-fun res!704637 () Bool)

(assert (=> b!1056582 (=> res!704637 e!600551)))

(assert (=> b!1056582 (= res!704637 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32563 a!3488)))))

(assert (=> b!1056582 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34579 0))(
  ( (Unit!34580) )
))
(declare-fun lt!466229 () Unit!34579)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66607 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34579)

(assert (=> b!1056582 (= lt!466229 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466226 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1056582 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22305)))

(declare-fun lt!466227 () Unit!34579)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66607 (_ BitVec 32) (_ BitVec 32)) Unit!34579)

(assert (=> b!1056582 (= lt!466227 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1056583 () Bool)

(assert (=> b!1056583 (= e!600551 e!600547)))

(declare-fun res!704636 () Bool)

(assert (=> b!1056583 (=> (not res!704636) (not e!600547))))

(assert (=> b!1056583 (= res!704636 (not (contains!6205 Nil!22305 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1056584 () Bool)

(declare-fun e!600552 () Bool)

(assert (=> b!1056584 (= e!600552 e!600546)))

(declare-fun res!704628 () Bool)

(assert (=> b!1056584 (=> res!704628 e!600546)))

(assert (=> b!1056584 (= res!704628 (bvsle lt!466226 i!1381))))

(declare-fun b!1056586 () Bool)

(declare-fun res!704633 () Bool)

(assert (=> b!1056586 (=> (not res!704633) (not e!600545))))

(assert (=> b!1056586 (= res!704633 (= (select (arr!32026 a!3488) i!1381) k0!2747))))

(declare-fun b!1056587 () Bool)

(declare-fun e!600553 () Bool)

(assert (=> b!1056587 (= e!600553 (not e!600549))))

(declare-fun res!704632 () Bool)

(assert (=> b!1056587 (=> res!704632 e!600549)))

(assert (=> b!1056587 (= res!704632 (bvsle lt!466226 i!1381))))

(assert (=> b!1056587 e!600552))

(declare-fun res!704635 () Bool)

(assert (=> b!1056587 (=> (not res!704635) (not e!600552))))

(assert (=> b!1056587 (= res!704635 (= (select (store (arr!32026 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466226) k0!2747))))

(declare-fun b!1056588 () Bool)

(assert (=> b!1056588 (= e!600550 e!600553)))

(declare-fun res!704634 () Bool)

(assert (=> b!1056588 (=> (not res!704634) (not e!600553))))

(assert (=> b!1056588 (= res!704634 (not (= lt!466226 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66607 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056588 (= lt!466226 (arrayScanForKey!0 lt!466228 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056585 () Bool)

(declare-fun res!704629 () Bool)

(assert (=> b!1056585 (=> res!704629 e!600551)))

(declare-fun noDuplicate!1564 (List!22308) Bool)

(assert (=> b!1056585 (= res!704629 (not (noDuplicate!1564 Nil!22305)))))

(declare-fun res!704639 () Bool)

(assert (=> start!93216 (=> (not res!704639) (not e!600545))))

(assert (=> start!93216 (= res!704639 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32563 a!3488)) (bvslt (size!32563 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93216 e!600545))

(assert (=> start!93216 true))

(declare-fun array_inv!24808 (array!66607) Bool)

(assert (=> start!93216 (array_inv!24808 a!3488)))

(assert (= (and start!93216 res!704639) b!1056581))

(assert (= (and b!1056581 res!704638) b!1056580))

(assert (= (and b!1056580 res!704631) b!1056586))

(assert (= (and b!1056586 res!704633) b!1056578))

(assert (= (and b!1056578 res!704630) b!1056588))

(assert (= (and b!1056588 res!704634) b!1056587))

(assert (= (and b!1056587 res!704635) b!1056584))

(assert (= (and b!1056584 (not res!704628)) b!1056579))

(assert (= (and b!1056587 (not res!704632)) b!1056582))

(assert (= (and b!1056582 (not res!704637)) b!1056585))

(assert (= (and b!1056585 (not res!704629)) b!1056583))

(assert (= (and b!1056583 res!704636) b!1056577))

(declare-fun m!976937 () Bool)

(assert (=> b!1056586 m!976937))

(declare-fun m!976939 () Bool)

(assert (=> b!1056577 m!976939))

(declare-fun m!976941 () Bool)

(assert (=> b!1056587 m!976941))

(declare-fun m!976943 () Bool)

(assert (=> b!1056587 m!976943))

(declare-fun m!976945 () Bool)

(assert (=> start!93216 m!976945))

(declare-fun m!976947 () Bool)

(assert (=> b!1056588 m!976947))

(declare-fun m!976949 () Bool)

(assert (=> b!1056581 m!976949))

(declare-fun m!976951 () Bool)

(assert (=> b!1056579 m!976951))

(declare-fun m!976953 () Bool)

(assert (=> b!1056582 m!976953))

(declare-fun m!976955 () Bool)

(assert (=> b!1056582 m!976955))

(declare-fun m!976957 () Bool)

(assert (=> b!1056582 m!976957))

(declare-fun m!976959 () Bool)

(assert (=> b!1056582 m!976959))

(declare-fun m!976961 () Bool)

(assert (=> b!1056578 m!976961))

(assert (=> b!1056578 m!976941))

(declare-fun m!976963 () Bool)

(assert (=> b!1056583 m!976963))

(declare-fun m!976965 () Bool)

(assert (=> b!1056585 m!976965))

(declare-fun m!976967 () Bool)

(assert (=> b!1056580 m!976967))

(check-sat (not b!1056578) (not b!1056588) (not b!1056581) (not b!1056577) (not b!1056585) (not b!1056583) (not b!1056580) (not b!1056582) (not start!93216) (not b!1056579))
(check-sat)
(get-model)

(declare-fun d!128611 () Bool)

(declare-fun res!704716 () Bool)

(declare-fun e!600612 () Bool)

(assert (=> d!128611 (=> res!704716 e!600612)))

(get-info :version)

(assert (=> d!128611 (= res!704716 ((_ is Nil!22305) Nil!22305))))

(assert (=> d!128611 (= (noDuplicate!1564 Nil!22305) e!600612)))

(declare-fun b!1056665 () Bool)

(declare-fun e!600613 () Bool)

(assert (=> b!1056665 (= e!600612 e!600613)))

(declare-fun res!704717 () Bool)

(assert (=> b!1056665 (=> (not res!704717) (not e!600613))))

(assert (=> b!1056665 (= res!704717 (not (contains!6205 (t!31607 Nil!22305) (h!23522 Nil!22305))))))

(declare-fun b!1056666 () Bool)

(assert (=> b!1056666 (= e!600613 (noDuplicate!1564 (t!31607 Nil!22305)))))

(assert (= (and d!128611 (not res!704716)) b!1056665))

(assert (= (and b!1056665 res!704717) b!1056666))

(declare-fun m!977033 () Bool)

(assert (=> b!1056665 m!977033))

(declare-fun m!977035 () Bool)

(assert (=> b!1056666 m!977035))

(assert (=> b!1056585 d!128611))

(declare-fun d!128613 () Bool)

(declare-fun res!704722 () Bool)

(declare-fun e!600618 () Bool)

(assert (=> d!128613 (=> res!704722 e!600618)))

(assert (=> d!128613 (= res!704722 (= (select (arr!32026 a!3488) lt!466226) k0!2747))))

(assert (=> d!128613 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466226) e!600618)))

(declare-fun b!1056671 () Bool)

(declare-fun e!600619 () Bool)

(assert (=> b!1056671 (= e!600618 e!600619)))

(declare-fun res!704723 () Bool)

(assert (=> b!1056671 (=> (not res!704723) (not e!600619))))

(assert (=> b!1056671 (= res!704723 (bvslt (bvadd lt!466226 #b00000000000000000000000000000001) (size!32563 a!3488)))))

(declare-fun b!1056672 () Bool)

(assert (=> b!1056672 (= e!600619 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466226 #b00000000000000000000000000000001)))))

(assert (= (and d!128613 (not res!704722)) b!1056671))

(assert (= (and b!1056671 res!704723) b!1056672))

(declare-fun m!977037 () Bool)

(assert (=> d!128613 m!977037))

(declare-fun m!977039 () Bool)

(assert (=> b!1056672 m!977039))

(assert (=> b!1056579 d!128613))

(declare-fun d!128615 () Bool)

(declare-fun res!704731 () Bool)

(declare-fun e!600631 () Bool)

(assert (=> d!128615 (=> res!704731 e!600631)))

(assert (=> d!128615 (= res!704731 (bvsge #b00000000000000000000000000000000 (size!32563 a!3488)))))

(assert (=> d!128615 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22305) e!600631)))

(declare-fun b!1056683 () Bool)

(declare-fun e!600629 () Bool)

(declare-fun e!600630 () Bool)

(assert (=> b!1056683 (= e!600629 e!600630)))

(declare-fun c!107444 () Bool)

(assert (=> b!1056683 (= c!107444 (validKeyInArray!0 (select (arr!32026 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056684 () Bool)

(declare-fun e!600628 () Bool)

(assert (=> b!1056684 (= e!600628 (contains!6205 Nil!22305 (select (arr!32026 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056685 () Bool)

(declare-fun call!44864 () Bool)

(assert (=> b!1056685 (= e!600630 call!44864)))

(declare-fun bm!44861 () Bool)

(assert (=> bm!44861 (= call!44864 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107444 (Cons!22304 (select (arr!32026 a!3488) #b00000000000000000000000000000000) Nil!22305) Nil!22305)))))

(declare-fun b!1056686 () Bool)

(assert (=> b!1056686 (= e!600631 e!600629)))

(declare-fun res!704730 () Bool)

(assert (=> b!1056686 (=> (not res!704730) (not e!600629))))

(assert (=> b!1056686 (= res!704730 (not e!600628))))

(declare-fun res!704732 () Bool)

(assert (=> b!1056686 (=> (not res!704732) (not e!600628))))

(assert (=> b!1056686 (= res!704732 (validKeyInArray!0 (select (arr!32026 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056687 () Bool)

(assert (=> b!1056687 (= e!600630 call!44864)))

(assert (= (and d!128615 (not res!704731)) b!1056686))

(assert (= (and b!1056686 res!704732) b!1056684))

(assert (= (and b!1056686 res!704730) b!1056683))

(assert (= (and b!1056683 c!107444) b!1056685))

(assert (= (and b!1056683 (not c!107444)) b!1056687))

(assert (= (or b!1056685 b!1056687) bm!44861))

(declare-fun m!977041 () Bool)

(assert (=> b!1056683 m!977041))

(assert (=> b!1056683 m!977041))

(declare-fun m!977043 () Bool)

(assert (=> b!1056683 m!977043))

(assert (=> b!1056684 m!977041))

(assert (=> b!1056684 m!977041))

(declare-fun m!977045 () Bool)

(assert (=> b!1056684 m!977045))

(assert (=> bm!44861 m!977041))

(declare-fun m!977047 () Bool)

(assert (=> bm!44861 m!977047))

(assert (=> b!1056686 m!977041))

(assert (=> b!1056686 m!977041))

(assert (=> b!1056686 m!977043))

(assert (=> b!1056581 d!128615))

(declare-fun d!128617 () Bool)

(assert (=> d!128617 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056580 d!128617))

(declare-fun d!128619 () Bool)

(declare-fun lt!466256 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!532 (List!22308) (InoxSet (_ BitVec 64)))

(assert (=> d!128619 (= lt!466256 (select (content!532 Nil!22305) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!600637 () Bool)

(assert (=> d!128619 (= lt!466256 e!600637)))

(declare-fun res!704738 () Bool)

(assert (=> d!128619 (=> (not res!704738) (not e!600637))))

(assert (=> d!128619 (= res!704738 ((_ is Cons!22304) Nil!22305))))

(assert (=> d!128619 (= (contains!6205 Nil!22305 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466256)))

(declare-fun b!1056692 () Bool)

(declare-fun e!600636 () Bool)

(assert (=> b!1056692 (= e!600637 e!600636)))

(declare-fun res!704737 () Bool)

(assert (=> b!1056692 (=> res!704737 e!600636)))

(assert (=> b!1056692 (= res!704737 (= (h!23522 Nil!22305) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1056693 () Bool)

(assert (=> b!1056693 (= e!600636 (contains!6205 (t!31607 Nil!22305) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128619 res!704738) b!1056692))

(assert (= (and b!1056692 (not res!704737)) b!1056693))

(declare-fun m!977049 () Bool)

(assert (=> d!128619 m!977049))

(declare-fun m!977051 () Bool)

(assert (=> d!128619 m!977051))

(declare-fun m!977053 () Bool)

(assert (=> b!1056693 m!977053))

(assert (=> b!1056577 d!128619))

(declare-fun d!128623 () Bool)

(declare-fun res!704739 () Bool)

(declare-fun e!600638 () Bool)

(assert (=> d!128623 (=> res!704739 e!600638)))

(assert (=> d!128623 (= res!704739 (= (select (arr!32026 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k0!2747))))

(assert (=> d!128623 (= (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!600638)))

(declare-fun b!1056694 () Bool)

(declare-fun e!600639 () Bool)

(assert (=> b!1056694 (= e!600638 e!600639)))

(declare-fun res!704740 () Bool)

(assert (=> b!1056694 (=> (not res!704740) (not e!600639))))

(assert (=> b!1056694 (= res!704740 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32563 a!3488)))))

(declare-fun b!1056695 () Bool)

(assert (=> b!1056695 (= e!600639 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128623 (not res!704739)) b!1056694))

(assert (= (and b!1056694 res!704740) b!1056695))

(declare-fun m!977055 () Bool)

(assert (=> d!128623 m!977055))

(declare-fun m!977057 () Bool)

(assert (=> b!1056695 m!977057))

(assert (=> b!1056582 d!128623))

(declare-fun d!128627 () Bool)

(assert (=> d!128627 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!466259 () Unit!34579)

(declare-fun choose!114 (array!66607 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34579)

(assert (=> d!128627 (= lt!466259 (choose!114 a!3488 k0!2747 lt!466226 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128627 (bvsge lt!466226 #b00000000000000000000000000000000)))

(assert (=> d!128627 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466226 (bvadd #b00000000000000000000000000000001 i!1381)) lt!466259)))

(declare-fun bs!30954 () Bool)

(assert (= bs!30954 d!128627))

(assert (=> bs!30954 m!976953))

(declare-fun m!977059 () Bool)

(assert (=> bs!30954 m!977059))

(assert (=> b!1056582 d!128627))

(declare-fun d!128631 () Bool)

(declare-fun res!704750 () Bool)

(declare-fun e!600653 () Bool)

(assert (=> d!128631 (=> res!704750 e!600653)))

(assert (=> d!128631 (= res!704750 (bvsge i!1381 (size!32563 a!3488)))))

(assert (=> d!128631 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22305) e!600653)))

(declare-fun b!1056706 () Bool)

(declare-fun e!600651 () Bool)

(declare-fun e!600652 () Bool)

(assert (=> b!1056706 (= e!600651 e!600652)))

(declare-fun c!107447 () Bool)

(assert (=> b!1056706 (= c!107447 (validKeyInArray!0 (select (arr!32026 a!3488) i!1381)))))

(declare-fun b!1056707 () Bool)

(declare-fun e!600650 () Bool)

(assert (=> b!1056707 (= e!600650 (contains!6205 Nil!22305 (select (arr!32026 a!3488) i!1381)))))

(declare-fun b!1056708 () Bool)

(declare-fun call!44867 () Bool)

(assert (=> b!1056708 (= e!600652 call!44867)))

(declare-fun bm!44864 () Bool)

(assert (=> bm!44864 (= call!44867 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107447 (Cons!22304 (select (arr!32026 a!3488) i!1381) Nil!22305) Nil!22305)))))

(declare-fun b!1056709 () Bool)

(assert (=> b!1056709 (= e!600653 e!600651)))

(declare-fun res!704747 () Bool)

(assert (=> b!1056709 (=> (not res!704747) (not e!600651))))

(assert (=> b!1056709 (= res!704747 (not e!600650))))

(declare-fun res!704751 () Bool)

(assert (=> b!1056709 (=> (not res!704751) (not e!600650))))

(assert (=> b!1056709 (= res!704751 (validKeyInArray!0 (select (arr!32026 a!3488) i!1381)))))

(declare-fun b!1056710 () Bool)

(assert (=> b!1056710 (= e!600652 call!44867)))

(assert (= (and d!128631 (not res!704750)) b!1056709))

(assert (= (and b!1056709 res!704751) b!1056707))

(assert (= (and b!1056709 res!704747) b!1056706))

(assert (= (and b!1056706 c!107447) b!1056708))

(assert (= (and b!1056706 (not c!107447)) b!1056710))

(assert (= (or b!1056708 b!1056710) bm!44864))

(assert (=> b!1056706 m!976937))

(assert (=> b!1056706 m!976937))

(declare-fun m!977061 () Bool)

(assert (=> b!1056706 m!977061))

(assert (=> b!1056707 m!976937))

(assert (=> b!1056707 m!976937))

(declare-fun m!977063 () Bool)

(assert (=> b!1056707 m!977063))

(assert (=> bm!44864 m!976937))

(declare-fun m!977065 () Bool)

(assert (=> bm!44864 m!977065))

(assert (=> b!1056709 m!976937))

(assert (=> b!1056709 m!976937))

(assert (=> b!1056709 m!977061))

(assert (=> b!1056582 d!128631))

(declare-fun d!128633 () Bool)

(assert (=> d!128633 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22305)))

(declare-fun lt!466262 () Unit!34579)

(declare-fun choose!39 (array!66607 (_ BitVec 32) (_ BitVec 32)) Unit!34579)

(assert (=> d!128633 (= lt!466262 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128633 (bvslt (size!32563 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128633 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!466262)))

(declare-fun bs!30955 () Bool)

(assert (= bs!30955 d!128633))

(assert (=> bs!30955 m!976957))

(declare-fun m!977079 () Bool)

(assert (=> bs!30955 m!977079))

(assert (=> b!1056582 d!128633))

(declare-fun d!128639 () Bool)

(assert (=> d!128639 (= (array_inv!24808 a!3488) (bvsge (size!32563 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93216 d!128639))

(declare-fun d!128641 () Bool)

(declare-fun res!704765 () Bool)

(declare-fun e!600668 () Bool)

(assert (=> d!128641 (=> res!704765 e!600668)))

(assert (=> d!128641 (= res!704765 (= (select (arr!32026 lt!466228) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128641 (= (arrayContainsKey!0 lt!466228 k0!2747 #b00000000000000000000000000000000) e!600668)))

(declare-fun b!1056728 () Bool)

(declare-fun e!600669 () Bool)

(assert (=> b!1056728 (= e!600668 e!600669)))

(declare-fun res!704766 () Bool)

(assert (=> b!1056728 (=> (not res!704766) (not e!600669))))

(assert (=> b!1056728 (= res!704766 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32563 lt!466228)))))

(declare-fun b!1056729 () Bool)

(assert (=> b!1056729 (= e!600669 (arrayContainsKey!0 lt!466228 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128641 (not res!704765)) b!1056728))

(assert (= (and b!1056728 res!704766) b!1056729))

(declare-fun m!977085 () Bool)

(assert (=> d!128641 m!977085))

(declare-fun m!977087 () Bool)

(assert (=> b!1056729 m!977087))

(assert (=> b!1056578 d!128641))

(declare-fun d!128645 () Bool)

(declare-fun lt!466265 () Bool)

(assert (=> d!128645 (= lt!466265 (select (content!532 Nil!22305) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!600671 () Bool)

(assert (=> d!128645 (= lt!466265 e!600671)))

(declare-fun res!704768 () Bool)

(assert (=> d!128645 (=> (not res!704768) (not e!600671))))

(assert (=> d!128645 (= res!704768 ((_ is Cons!22304) Nil!22305))))

(assert (=> d!128645 (= (contains!6205 Nil!22305 #b0000000000000000000000000000000000000000000000000000000000000000) lt!466265)))

(declare-fun b!1056730 () Bool)

(declare-fun e!600670 () Bool)

(assert (=> b!1056730 (= e!600671 e!600670)))

(declare-fun res!704767 () Bool)

(assert (=> b!1056730 (=> res!704767 e!600670)))

(assert (=> b!1056730 (= res!704767 (= (h!23522 Nil!22305) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1056731 () Bool)

(assert (=> b!1056731 (= e!600670 (contains!6205 (t!31607 Nil!22305) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128645 res!704768) b!1056730))

(assert (= (and b!1056730 (not res!704767)) b!1056731))

(assert (=> d!128645 m!977049))

(declare-fun m!977089 () Bool)

(assert (=> d!128645 m!977089))

(declare-fun m!977091 () Bool)

(assert (=> b!1056731 m!977091))

(assert (=> b!1056583 d!128645))

(declare-fun d!128647 () Bool)

(declare-fun lt!466273 () (_ BitVec 32))

(assert (=> d!128647 (and (or (bvslt lt!466273 #b00000000000000000000000000000000) (bvsge lt!466273 (size!32563 lt!466228)) (and (bvsge lt!466273 #b00000000000000000000000000000000) (bvslt lt!466273 (size!32563 lt!466228)))) (bvsge lt!466273 #b00000000000000000000000000000000) (bvslt lt!466273 (size!32563 lt!466228)) (= (select (arr!32026 lt!466228) lt!466273) k0!2747))))

(declare-fun e!600704 () (_ BitVec 32))

(assert (=> d!128647 (= lt!466273 e!600704)))

(declare-fun c!107453 () Bool)

(assert (=> d!128647 (= c!107453 (= (select (arr!32026 lt!466228) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32563 lt!466228)) (bvslt (size!32563 lt!466228) #b01111111111111111111111111111111))))

(assert (=> d!128647 (= (arrayScanForKey!0 lt!466228 k0!2747 #b00000000000000000000000000000000) lt!466273)))

(declare-fun b!1056768 () Bool)

(assert (=> b!1056768 (= e!600704 #b00000000000000000000000000000000)))

(declare-fun b!1056769 () Bool)

(assert (=> b!1056769 (= e!600704 (arrayScanForKey!0 lt!466228 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128647 c!107453) b!1056768))

(assert (= (and d!128647 (not c!107453)) b!1056769))

(declare-fun m!977117 () Bool)

(assert (=> d!128647 m!977117))

(assert (=> d!128647 m!977085))

(declare-fun m!977119 () Bool)

(assert (=> b!1056769 m!977119))

(assert (=> b!1056588 d!128647))

(check-sat (not b!1056666) (not d!128619) (not d!128633) (not b!1056769) (not b!1056693) (not d!128627) (not bm!44864) (not b!1056707) (not b!1056665) (not b!1056684) (not b!1056709) (not b!1056686) (not bm!44861) (not b!1056695) (not b!1056731) (not d!128645) (not b!1056672) (not b!1056706) (not b!1056729) (not b!1056683))
(check-sat)
