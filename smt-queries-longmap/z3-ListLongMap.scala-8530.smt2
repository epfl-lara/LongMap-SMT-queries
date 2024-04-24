; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104244 () Bool)

(assert start!104244)

(declare-fun b!1245922 () Bool)

(declare-fun res!830736 () Bool)

(declare-fun e!706337 () Bool)

(assert (=> b!1245922 (=> (not res!830736) (not e!706337))))

(declare-datatypes ((array!80105 0))(
  ( (array!80106 (arr!38639 (Array (_ BitVec 32) (_ BitVec 64))) (size!39176 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80105)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27455 0))(
  ( (Nil!27452) (Cons!27451 (h!28669 (_ BitVec 64)) (t!40916 List!27455)) )
))
(declare-fun arrayNoDuplicates!0 (array!80105 (_ BitVec 32) List!27455) Bool)

(assert (=> b!1245922 (= res!830736 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27452))))

(declare-fun b!1245923 () Bool)

(declare-fun e!706339 () Bool)

(assert (=> b!1245923 (= e!706337 (not e!706339))))

(declare-fun res!830734 () Bool)

(assert (=> b!1245923 (=> res!830734 e!706339)))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245923 (= res!830734 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(assert (=> b!1245923 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27452)))

(declare-datatypes ((Unit!41360 0))(
  ( (Unit!41361) )
))
(declare-fun lt!563276 () Unit!41360)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80105 (_ BitVec 32) (_ BitVec 32)) Unit!41360)

(assert (=> b!1245923 (= lt!563276 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun res!830733 () Bool)

(declare-fun e!706336 () Bool)

(assert (=> start!104244 (=> (not res!830733) (not e!706336))))

(assert (=> start!104244 (= res!830733 (and (bvslt (size!39176 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39176 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39176 a!3892))))))

(assert (=> start!104244 e!706336))

(declare-fun array_inv!29577 (array!80105) Bool)

(assert (=> start!104244 (array_inv!29577 a!3892)))

(assert (=> start!104244 true))

(declare-fun b!1245924 () Bool)

(declare-fun e!706334 () Unit!41360)

(declare-fun lt!563274 () Unit!41360)

(assert (=> b!1245924 (= e!706334 lt!563274)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80105 List!27455 List!27455 (_ BitVec 32)) Unit!41360)

(assert (=> b!1245924 (= lt!563274 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27451 (select (arr!38639 a!3892) from!3270) Nil!27452) Nil!27452 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1245924 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27452)))

(declare-fun b!1245925 () Bool)

(declare-fun e!706338 () Bool)

(assert (=> b!1245925 (= e!706339 e!706338)))

(declare-fun res!830738 () Bool)

(assert (=> b!1245925 (=> (not res!830738) (not e!706338))))

(declare-fun contains!7463 (List!27455 (_ BitVec 64)) Bool)

(assert (=> b!1245925 (= res!830738 (not (contains!7463 Nil!27452 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245926 () Bool)

(declare-fun res!830737 () Bool)

(assert (=> b!1245926 (=> (not res!830737) (not e!706336))))

(assert (=> b!1245926 (= res!830737 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39176 a!3892)) (not (= newFrom!287 (size!39176 a!3892)))))))

(declare-fun b!1245927 () Bool)

(assert (=> b!1245927 (= e!706336 e!706337)))

(declare-fun res!830732 () Bool)

(assert (=> b!1245927 (=> (not res!830732) (not e!706337))))

(assert (=> b!1245927 (= res!830732 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!563275 () Unit!41360)

(assert (=> b!1245927 (= lt!563275 e!706334)))

(declare-fun c!122287 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245927 (= c!122287 (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1245928 () Bool)

(declare-fun Unit!41362 () Unit!41360)

(assert (=> b!1245928 (= e!706334 Unit!41362)))

(declare-fun b!1245929 () Bool)

(assert (=> b!1245929 (= e!706338 (not (contains!7463 Nil!27452 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245930 () Bool)

(declare-fun res!830735 () Bool)

(assert (=> b!1245930 (=> res!830735 e!706339)))

(declare-fun noDuplicate!2026 (List!27455) Bool)

(assert (=> b!1245930 (= res!830735 (not (noDuplicate!2026 Nil!27452)))))

(declare-fun b!1245931 () Bool)

(declare-fun res!830739 () Bool)

(assert (=> b!1245931 (=> (not res!830739) (not e!706336))))

(assert (=> b!1245931 (= res!830739 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27452))))

(assert (= (and start!104244 res!830733) b!1245931))

(assert (= (and b!1245931 res!830739) b!1245926))

(assert (= (and b!1245926 res!830737) b!1245927))

(assert (= (and b!1245927 c!122287) b!1245924))

(assert (= (and b!1245927 (not c!122287)) b!1245928))

(assert (= (and b!1245927 res!830732) b!1245922))

(assert (= (and b!1245922 res!830736) b!1245923))

(assert (= (and b!1245923 (not res!830734)) b!1245930))

(assert (= (and b!1245930 (not res!830735)) b!1245925))

(assert (= (and b!1245925 res!830738) b!1245929))

(declare-fun m!1148481 () Bool)

(assert (=> b!1245931 m!1148481))

(declare-fun m!1148483 () Bool)

(assert (=> b!1245927 m!1148483))

(assert (=> b!1245927 m!1148483))

(declare-fun m!1148485 () Bool)

(assert (=> b!1245927 m!1148485))

(assert (=> b!1245924 m!1148483))

(declare-fun m!1148487 () Bool)

(assert (=> b!1245924 m!1148487))

(declare-fun m!1148489 () Bool)

(assert (=> b!1245924 m!1148489))

(declare-fun m!1148491 () Bool)

(assert (=> b!1245923 m!1148491))

(declare-fun m!1148493 () Bool)

(assert (=> b!1245923 m!1148493))

(declare-fun m!1148495 () Bool)

(assert (=> b!1245930 m!1148495))

(declare-fun m!1148497 () Bool)

(assert (=> b!1245925 m!1148497))

(declare-fun m!1148499 () Bool)

(assert (=> b!1245929 m!1148499))

(assert (=> b!1245922 m!1148489))

(declare-fun m!1148501 () Bool)

(assert (=> start!104244 m!1148501))

(check-sat (not b!1245927) (not b!1245922) (not b!1245925) (not b!1245923) (not b!1245931) (not b!1245924) (not b!1245929) (not start!104244) (not b!1245930))
(check-sat)
(get-model)

(declare-fun b!1246002 () Bool)

(declare-fun e!706384 () Bool)

(declare-fun e!706385 () Bool)

(assert (=> b!1246002 (= e!706384 e!706385)))

(declare-fun res!830794 () Bool)

(assert (=> b!1246002 (=> (not res!830794) (not e!706385))))

(declare-fun e!706386 () Bool)

(assert (=> b!1246002 (= res!830794 (not e!706386))))

(declare-fun res!830796 () Bool)

(assert (=> b!1246002 (=> (not res!830796) (not e!706386))))

(assert (=> b!1246002 (= res!830796 (validKeyInArray!0 (select (arr!38639 a!3892) newFrom!287)))))

(declare-fun d!137629 () Bool)

(declare-fun res!830795 () Bool)

(assert (=> d!137629 (=> res!830795 e!706384)))

(assert (=> d!137629 (= res!830795 (bvsge newFrom!287 (size!39176 a!3892)))))

(assert (=> d!137629 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27452) e!706384)))

(declare-fun b!1246003 () Bool)

(assert (=> b!1246003 (= e!706386 (contains!7463 Nil!27452 (select (arr!38639 a!3892) newFrom!287)))))

(declare-fun b!1246004 () Bool)

(declare-fun e!706387 () Bool)

(declare-fun call!61493 () Bool)

(assert (=> b!1246004 (= e!706387 call!61493)))

(declare-fun b!1246005 () Bool)

(assert (=> b!1246005 (= e!706385 e!706387)))

(declare-fun c!122296 () Bool)

(assert (=> b!1246005 (= c!122296 (validKeyInArray!0 (select (arr!38639 a!3892) newFrom!287)))))

(declare-fun b!1246006 () Bool)

(assert (=> b!1246006 (= e!706387 call!61493)))

(declare-fun bm!61490 () Bool)

(assert (=> bm!61490 (= call!61493 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!122296 (Cons!27451 (select (arr!38639 a!3892) newFrom!287) Nil!27452) Nil!27452)))))

(assert (= (and d!137629 (not res!830795)) b!1246002))

(assert (= (and b!1246002 res!830796) b!1246003))

(assert (= (and b!1246002 res!830794) b!1246005))

(assert (= (and b!1246005 c!122296) b!1246004))

(assert (= (and b!1246005 (not c!122296)) b!1246006))

(assert (= (or b!1246004 b!1246006) bm!61490))

(declare-fun m!1148547 () Bool)

(assert (=> b!1246002 m!1148547))

(assert (=> b!1246002 m!1148547))

(declare-fun m!1148549 () Bool)

(assert (=> b!1246002 m!1148549))

(assert (=> b!1246003 m!1148547))

(assert (=> b!1246003 m!1148547))

(declare-fun m!1148551 () Bool)

(assert (=> b!1246003 m!1148551))

(assert (=> b!1246005 m!1148547))

(assert (=> b!1246005 m!1148547))

(assert (=> b!1246005 m!1148549))

(assert (=> bm!61490 m!1148547))

(declare-fun m!1148553 () Bool)

(assert (=> bm!61490 m!1148553))

(assert (=> b!1245923 d!137629))

(declare-fun d!137631 () Bool)

(assert (=> d!137631 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27452)))

(declare-fun lt!563297 () Unit!41360)

(declare-fun choose!39 (array!80105 (_ BitVec 32) (_ BitVec 32)) Unit!41360)

(assert (=> d!137631 (= lt!563297 (choose!39 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (=> d!137631 (bvslt (size!39176 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137631 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287) lt!563297)))

(declare-fun bs!35066 () Bool)

(assert (= bs!35066 d!137631))

(assert (=> bs!35066 m!1148491))

(declare-fun m!1148555 () Bool)

(assert (=> bs!35066 m!1148555))

(assert (=> b!1245923 d!137631))

(declare-fun b!1246007 () Bool)

(declare-fun e!706388 () Bool)

(declare-fun e!706389 () Bool)

(assert (=> b!1246007 (= e!706388 e!706389)))

(declare-fun res!830797 () Bool)

(assert (=> b!1246007 (=> (not res!830797) (not e!706389))))

(declare-fun e!706390 () Bool)

(assert (=> b!1246007 (= res!830797 (not e!706390))))

(declare-fun res!830799 () Bool)

(assert (=> b!1246007 (=> (not res!830799) (not e!706390))))

(assert (=> b!1246007 (= res!830799 (validKeyInArray!0 (select (arr!38639 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun d!137635 () Bool)

(declare-fun res!830798 () Bool)

(assert (=> d!137635 (=> res!830798 e!706388)))

(assert (=> d!137635 (= res!830798 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39176 a!3892)))))

(assert (=> d!137635 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27452) e!706388)))

(declare-fun b!1246008 () Bool)

(assert (=> b!1246008 (= e!706390 (contains!7463 Nil!27452 (select (arr!38639 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246009 () Bool)

(declare-fun e!706391 () Bool)

(declare-fun call!61494 () Bool)

(assert (=> b!1246009 (= e!706391 call!61494)))

(declare-fun b!1246010 () Bool)

(assert (=> b!1246010 (= e!706389 e!706391)))

(declare-fun c!122297 () Bool)

(assert (=> b!1246010 (= c!122297 (validKeyInArray!0 (select (arr!38639 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246011 () Bool)

(assert (=> b!1246011 (= e!706391 call!61494)))

(declare-fun bm!61491 () Bool)

(assert (=> bm!61491 (= call!61494 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!122297 (Cons!27451 (select (arr!38639 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27452) Nil!27452)))))

(assert (= (and d!137635 (not res!830798)) b!1246007))

(assert (= (and b!1246007 res!830799) b!1246008))

(assert (= (and b!1246007 res!830797) b!1246010))

(assert (= (and b!1246010 c!122297) b!1246009))

(assert (= (and b!1246010 (not c!122297)) b!1246011))

(assert (= (or b!1246009 b!1246011) bm!61491))

(declare-fun m!1148557 () Bool)

(assert (=> b!1246007 m!1148557))

(assert (=> b!1246007 m!1148557))

(declare-fun m!1148559 () Bool)

(assert (=> b!1246007 m!1148559))

(assert (=> b!1246008 m!1148557))

(assert (=> b!1246008 m!1148557))

(declare-fun m!1148561 () Bool)

(assert (=> b!1246008 m!1148561))

(assert (=> b!1246010 m!1148557))

(assert (=> b!1246010 m!1148557))

(assert (=> b!1246010 m!1148559))

(assert (=> bm!61491 m!1148557))

(declare-fun m!1148563 () Bool)

(assert (=> bm!61491 m!1148563))

(assert (=> b!1245922 d!137635))

(declare-fun d!137637 () Bool)

(assert (=> d!137637 (= (array_inv!29577 a!3892) (bvsge (size!39176 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104244 d!137637))

(declare-fun d!137639 () Bool)

(assert (=> d!137639 (= (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)) (and (not (= (select (arr!38639 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38639 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245927 d!137639))

(declare-fun d!137643 () Bool)

(declare-fun lt!563300 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!610 (List!27455) (InoxSet (_ BitVec 64)))

(assert (=> d!137643 (= lt!563300 (select (content!610 Nil!27452) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706403 () Bool)

(assert (=> d!137643 (= lt!563300 e!706403)))

(declare-fun res!830810 () Bool)

(assert (=> d!137643 (=> (not res!830810) (not e!706403))))

(get-info :version)

(assert (=> d!137643 (= res!830810 ((_ is Cons!27451) Nil!27452))))

(assert (=> d!137643 (= (contains!7463 Nil!27452 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563300)))

(declare-fun b!1246022 () Bool)

(declare-fun e!706402 () Bool)

(assert (=> b!1246022 (= e!706403 e!706402)))

(declare-fun res!830811 () Bool)

(assert (=> b!1246022 (=> res!830811 e!706402)))

(assert (=> b!1246022 (= res!830811 (= (h!28669 Nil!27452) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246023 () Bool)

(assert (=> b!1246023 (= e!706402 (contains!7463 (t!40916 Nil!27452) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137643 res!830810) b!1246022))

(assert (= (and b!1246022 (not res!830811)) b!1246023))

(declare-fun m!1148569 () Bool)

(assert (=> d!137643 m!1148569))

(declare-fun m!1148571 () Bool)

(assert (=> d!137643 m!1148571))

(declare-fun m!1148573 () Bool)

(assert (=> b!1246023 m!1148573))

(assert (=> b!1245925 d!137643))

(declare-fun b!1246034 () Bool)

(declare-fun e!706412 () Bool)

(declare-fun e!706413 () Bool)

(assert (=> b!1246034 (= e!706412 e!706413)))

(declare-fun res!830818 () Bool)

(assert (=> b!1246034 (=> (not res!830818) (not e!706413))))

(declare-fun e!706414 () Bool)

(assert (=> b!1246034 (= res!830818 (not e!706414))))

(declare-fun res!830820 () Bool)

(assert (=> b!1246034 (=> (not res!830820) (not e!706414))))

(assert (=> b!1246034 (= res!830820 (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)))))

(declare-fun d!137647 () Bool)

(declare-fun res!830819 () Bool)

(assert (=> d!137647 (=> res!830819 e!706412)))

(assert (=> d!137647 (= res!830819 (bvsge from!3270 (size!39176 a!3892)))))

(assert (=> d!137647 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27452) e!706412)))

(declare-fun b!1246035 () Bool)

(assert (=> b!1246035 (= e!706414 (contains!7463 Nil!27452 (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1246036 () Bool)

(declare-fun e!706415 () Bool)

(declare-fun call!61495 () Bool)

(assert (=> b!1246036 (= e!706415 call!61495)))

(declare-fun b!1246037 () Bool)

(assert (=> b!1246037 (= e!706413 e!706415)))

(declare-fun c!122300 () Bool)

(assert (=> b!1246037 (= c!122300 (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1246038 () Bool)

(assert (=> b!1246038 (= e!706415 call!61495)))

(declare-fun bm!61492 () Bool)

(assert (=> bm!61492 (= call!61495 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122300 (Cons!27451 (select (arr!38639 a!3892) from!3270) Nil!27452) Nil!27452)))))

(assert (= (and d!137647 (not res!830819)) b!1246034))

(assert (= (and b!1246034 res!830820) b!1246035))

(assert (= (and b!1246034 res!830818) b!1246037))

(assert (= (and b!1246037 c!122300) b!1246036))

(assert (= (and b!1246037 (not c!122300)) b!1246038))

(assert (= (or b!1246036 b!1246038) bm!61492))

(assert (=> b!1246034 m!1148483))

(assert (=> b!1246034 m!1148483))

(assert (=> b!1246034 m!1148485))

(assert (=> b!1246035 m!1148483))

(assert (=> b!1246035 m!1148483))

(declare-fun m!1148575 () Bool)

(assert (=> b!1246035 m!1148575))

(assert (=> b!1246037 m!1148483))

(assert (=> b!1246037 m!1148483))

(assert (=> b!1246037 m!1148485))

(assert (=> bm!61492 m!1148483))

(declare-fun m!1148577 () Bool)

(assert (=> bm!61492 m!1148577))

(assert (=> b!1245931 d!137647))

(declare-fun d!137649 () Bool)

(assert (=> d!137649 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27452)))

(declare-fun lt!563303 () Unit!41360)

(declare-fun choose!80 (array!80105 List!27455 List!27455 (_ BitVec 32)) Unit!41360)

(assert (=> d!137649 (= lt!563303 (choose!80 a!3892 (Cons!27451 (select (arr!38639 a!3892) from!3270) Nil!27452) Nil!27452 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137649 (bvslt (size!39176 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137649 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27451 (select (arr!38639 a!3892) from!3270) Nil!27452) Nil!27452 (bvadd #b00000000000000000000000000000001 from!3270)) lt!563303)))

(declare-fun bs!35067 () Bool)

(assert (= bs!35067 d!137649))

(assert (=> bs!35067 m!1148489))

(declare-fun m!1148581 () Bool)

(assert (=> bs!35067 m!1148581))

(assert (=> b!1245924 d!137649))

(assert (=> b!1245924 d!137635))

(declare-fun d!137651 () Bool)

(declare-fun lt!563304 () Bool)

(assert (=> d!137651 (= lt!563304 (select (content!610 Nil!27452) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706421 () Bool)

(assert (=> d!137651 (= lt!563304 e!706421)))

(declare-fun res!830824 () Bool)

(assert (=> d!137651 (=> (not res!830824) (not e!706421))))

(assert (=> d!137651 (= res!830824 ((_ is Cons!27451) Nil!27452))))

(assert (=> d!137651 (= (contains!7463 Nil!27452 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563304)))

(declare-fun b!1246044 () Bool)

(declare-fun e!706420 () Bool)

(assert (=> b!1246044 (= e!706421 e!706420)))

(declare-fun res!830825 () Bool)

(assert (=> b!1246044 (=> res!830825 e!706420)))

(assert (=> b!1246044 (= res!830825 (= (h!28669 Nil!27452) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246045 () Bool)

(assert (=> b!1246045 (= e!706420 (contains!7463 (t!40916 Nil!27452) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137651 res!830824) b!1246044))

(assert (= (and b!1246044 (not res!830825)) b!1246045))

(assert (=> d!137651 m!1148569))

(declare-fun m!1148585 () Bool)

(assert (=> d!137651 m!1148585))

(declare-fun m!1148587 () Bool)

(assert (=> b!1246045 m!1148587))

(assert (=> b!1245929 d!137651))

(declare-fun d!137657 () Bool)

(declare-fun res!830834 () Bool)

(declare-fun e!706430 () Bool)

(assert (=> d!137657 (=> res!830834 e!706430)))

(assert (=> d!137657 (= res!830834 ((_ is Nil!27452) Nil!27452))))

(assert (=> d!137657 (= (noDuplicate!2026 Nil!27452) e!706430)))

(declare-fun b!1246054 () Bool)

(declare-fun e!706431 () Bool)

(assert (=> b!1246054 (= e!706430 e!706431)))

(declare-fun res!830835 () Bool)

(assert (=> b!1246054 (=> (not res!830835) (not e!706431))))

(assert (=> b!1246054 (= res!830835 (not (contains!7463 (t!40916 Nil!27452) (h!28669 Nil!27452))))))

(declare-fun b!1246055 () Bool)

(assert (=> b!1246055 (= e!706431 (noDuplicate!2026 (t!40916 Nil!27452)))))

(assert (= (and d!137657 (not res!830834)) b!1246054))

(assert (= (and b!1246054 res!830835) b!1246055))

(declare-fun m!1148589 () Bool)

(assert (=> b!1246054 m!1148589))

(declare-fun m!1148591 () Bool)

(assert (=> b!1246055 m!1148591))

(assert (=> b!1245930 d!137657))

(check-sat (not b!1246010) (not bm!61491) (not b!1246008) (not b!1246003) (not bm!61490) (not b!1246034) (not b!1246037) (not b!1246023) (not bm!61492) (not d!137643) (not b!1246005) (not b!1246055) (not d!137651) (not b!1246054) (not b!1246002) (not b!1246007) (not d!137649) (not d!137631) (not b!1246045) (not b!1246035))
(check-sat)
