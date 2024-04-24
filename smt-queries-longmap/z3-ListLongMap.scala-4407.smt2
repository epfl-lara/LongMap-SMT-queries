; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60846 () Bool)

(assert start!60846)

(declare-fun b!682280 () Bool)

(declare-fun res!448245 () Bool)

(declare-fun e!388763 () Bool)

(assert (=> b!682280 (=> (not res!448245) (not e!388763))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39531 0))(
  ( (array!39532 (arr!18946 (Array (_ BitVec 32) (_ BitVec 64))) (size!19310 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39531)

(assert (=> b!682280 (= res!448245 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19310 a!3626))))))

(declare-fun b!682281 () Bool)

(declare-datatypes ((Unit!23901 0))(
  ( (Unit!23902) )
))
(declare-fun e!388758 () Unit!23901)

(declare-fun Unit!23903 () Unit!23901)

(assert (=> b!682281 (= e!388758 Unit!23903)))

(declare-fun b!682282 () Bool)

(declare-fun e!388764 () Bool)

(declare-fun e!388759 () Bool)

(assert (=> b!682282 (= e!388764 e!388759)))

(declare-fun res!448248 () Bool)

(assert (=> b!682282 (=> (not res!448248) (not e!388759))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!682282 (= res!448248 (bvsle from!3004 i!1382))))

(declare-fun b!682283 () Bool)

(declare-fun Unit!23904 () Unit!23901)

(assert (=> b!682283 (= e!388758 Unit!23904)))

(declare-fun lt!313522 () Unit!23901)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39531 (_ BitVec 64) (_ BitVec 32)) Unit!23901)

(assert (=> b!682283 (= lt!313522 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682283 false))

(declare-fun b!682284 () Bool)

(declare-datatypes ((List!12894 0))(
  ( (Nil!12891) (Cons!12890 (h!13938 (_ BitVec 64)) (t!19126 List!12894)) )
))
(declare-fun acc!681 () List!12894)

(declare-fun contains!3546 (List!12894 (_ BitVec 64)) Bool)

(assert (=> b!682284 (= e!388759 (not (contains!3546 acc!681 k0!2843)))))

(declare-fun b!682285 () Bool)

(declare-fun res!448240 () Bool)

(assert (=> b!682285 (=> (not res!448240) (not e!388763))))

(assert (=> b!682285 (= res!448240 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19310 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682286 () Bool)

(declare-fun res!448244 () Bool)

(assert (=> b!682286 (=> (not res!448244) (not e!388763))))

(assert (=> b!682286 (= res!448244 e!388764)))

(declare-fun res!448249 () Bool)

(assert (=> b!682286 (=> res!448249 e!388764)))

(declare-fun e!388762 () Bool)

(assert (=> b!682286 (= res!448249 e!388762)))

(declare-fun res!448242 () Bool)

(assert (=> b!682286 (=> (not res!448242) (not e!388762))))

(assert (=> b!682286 (= res!448242 (bvsgt from!3004 i!1382))))

(declare-fun b!682287 () Bool)

(declare-fun res!448246 () Bool)

(assert (=> b!682287 (=> (not res!448246) (not e!388763))))

(assert (=> b!682287 (= res!448246 (not (contains!3546 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682288 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39531 (_ BitVec 32) List!12894) Bool)

(assert (=> b!682288 (= e!388763 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))))

(declare-fun lt!313525 () Unit!23901)

(declare-fun e!388761 () Unit!23901)

(assert (=> b!682288 (= lt!313525 e!388761)))

(declare-fun c!77389 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682288 (= c!77389 (validKeyInArray!0 (select (arr!18946 a!3626) from!3004)))))

(declare-fun lt!313523 () Unit!23901)

(assert (=> b!682288 (= lt!313523 e!388758)))

(declare-fun c!77390 () Bool)

(declare-fun arrayContainsKey!0 (array!39531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682288 (= c!77390 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682288 (arrayContainsKey!0 (array!39532 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626)) k0!2843 from!3004)))

(declare-fun b!682289 () Bool)

(declare-fun lt!313524 () Unit!23901)

(assert (=> b!682289 (= e!388761 lt!313524)))

(declare-fun lt!313521 () Unit!23901)

(declare-fun lemmaListSubSeqRefl!0 (List!12894) Unit!23901)

(assert (=> b!682289 (= lt!313521 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!155 (List!12894 List!12894) Bool)

(assert (=> b!682289 (subseq!155 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39531 List!12894 List!12894 (_ BitVec 32)) Unit!23901)

(declare-fun $colon$colon!317 (List!12894 (_ BitVec 64)) List!12894)

(assert (=> b!682289 (= lt!313524 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!317 acc!681 (select (arr!18946 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682289 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682290 () Bool)

(declare-fun res!448241 () Bool)

(assert (=> b!682290 (=> (not res!448241) (not e!388763))))

(assert (=> b!682290 (= res!448241 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682291 () Bool)

(declare-fun res!448250 () Bool)

(assert (=> b!682291 (=> (not res!448250) (not e!388763))))

(assert (=> b!682291 (= res!448250 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12891))))

(declare-fun b!682292 () Bool)

(declare-fun res!448247 () Bool)

(assert (=> b!682292 (=> (not res!448247) (not e!388763))))

(assert (=> b!682292 (= res!448247 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682293 () Bool)

(assert (=> b!682293 (= e!388762 (contains!3546 acc!681 k0!2843))))

(declare-fun b!682294 () Bool)

(declare-fun res!448239 () Bool)

(assert (=> b!682294 (=> (not res!448239) (not e!388763))))

(declare-fun noDuplicate!820 (List!12894) Bool)

(assert (=> b!682294 (= res!448239 (noDuplicate!820 acc!681))))

(declare-fun res!448243 () Bool)

(assert (=> start!60846 (=> (not res!448243) (not e!388763))))

(assert (=> start!60846 (= res!448243 (and (bvslt (size!19310 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19310 a!3626))))))

(assert (=> start!60846 e!388763))

(assert (=> start!60846 true))

(declare-fun array_inv!14805 (array!39531) Bool)

(assert (=> start!60846 (array_inv!14805 a!3626)))

(declare-fun b!682295 () Bool)

(declare-fun res!448252 () Bool)

(assert (=> b!682295 (=> (not res!448252) (not e!388763))))

(assert (=> b!682295 (= res!448252 (not (contains!3546 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682296 () Bool)

(declare-fun Unit!23905 () Unit!23901)

(assert (=> b!682296 (= e!388761 Unit!23905)))

(declare-fun b!682297 () Bool)

(declare-fun res!448251 () Bool)

(assert (=> b!682297 (=> (not res!448251) (not e!388763))))

(assert (=> b!682297 (= res!448251 (validKeyInArray!0 k0!2843))))

(assert (= (and start!60846 res!448243) b!682294))

(assert (= (and b!682294 res!448239) b!682295))

(assert (= (and b!682295 res!448252) b!682287))

(assert (= (and b!682287 res!448246) b!682286))

(assert (= (and b!682286 res!448242) b!682293))

(assert (= (and b!682286 (not res!448249)) b!682282))

(assert (= (and b!682282 res!448248) b!682284))

(assert (= (and b!682286 res!448244) b!682291))

(assert (= (and b!682291 res!448250) b!682290))

(assert (= (and b!682290 res!448241) b!682280))

(assert (= (and b!682280 res!448245) b!682297))

(assert (= (and b!682297 res!448251) b!682292))

(assert (= (and b!682292 res!448247) b!682285))

(assert (= (and b!682285 res!448240) b!682288))

(assert (= (and b!682288 c!77390) b!682283))

(assert (= (and b!682288 (not c!77390)) b!682281))

(assert (= (and b!682288 c!77389) b!682289))

(assert (= (and b!682288 (not c!77389)) b!682296))

(declare-fun m!647527 () Bool)

(assert (=> b!682284 m!647527))

(declare-fun m!647529 () Bool)

(assert (=> b!682283 m!647529))

(declare-fun m!647531 () Bool)

(assert (=> b!682290 m!647531))

(declare-fun m!647533 () Bool)

(assert (=> b!682295 m!647533))

(declare-fun m!647535 () Bool)

(assert (=> b!682287 m!647535))

(declare-fun m!647537 () Bool)

(assert (=> b!682291 m!647537))

(declare-fun m!647539 () Bool)

(assert (=> b!682288 m!647539))

(declare-fun m!647541 () Bool)

(assert (=> b!682288 m!647541))

(declare-fun m!647543 () Bool)

(assert (=> b!682288 m!647543))

(declare-fun m!647545 () Bool)

(assert (=> b!682288 m!647545))

(assert (=> b!682288 m!647541))

(declare-fun m!647547 () Bool)

(assert (=> b!682288 m!647547))

(declare-fun m!647549 () Bool)

(assert (=> b!682288 m!647549))

(assert (=> b!682293 m!647527))

(declare-fun m!647551 () Bool)

(assert (=> b!682292 m!647551))

(declare-fun m!647553 () Bool)

(assert (=> b!682297 m!647553))

(declare-fun m!647555 () Bool)

(assert (=> b!682294 m!647555))

(declare-fun m!647557 () Bool)

(assert (=> start!60846 m!647557))

(assert (=> b!682289 m!647539))

(assert (=> b!682289 m!647541))

(declare-fun m!647559 () Bool)

(assert (=> b!682289 m!647559))

(declare-fun m!647561 () Bool)

(assert (=> b!682289 m!647561))

(assert (=> b!682289 m!647541))

(assert (=> b!682289 m!647559))

(declare-fun m!647563 () Bool)

(assert (=> b!682289 m!647563))

(declare-fun m!647565 () Bool)

(assert (=> b!682289 m!647565))

(check-sat (not start!60846) (not b!682288) (not b!682297) (not b!682294) (not b!682293) (not b!682292) (not b!682287) (not b!682284) (not b!682290) (not b!682283) (not b!682291) (not b!682289) (not b!682295))
(check-sat)
(get-model)

(declare-fun d!94173 () Bool)

(declare-fun res!448344 () Bool)

(declare-fun e!388818 () Bool)

(assert (=> d!94173 (=> res!448344 e!388818)))

(assert (=> d!94173 (= res!448344 (bvsge from!3004 (size!19310 a!3626)))))

(assert (=> d!94173 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388818)))

(declare-fun b!682416 () Bool)

(declare-fun e!388817 () Bool)

(declare-fun call!33999 () Bool)

(assert (=> b!682416 (= e!388817 call!33999)))

(declare-fun b!682417 () Bool)

(declare-fun e!388815 () Bool)

(assert (=> b!682417 (= e!388815 e!388817)))

(declare-fun c!77405 () Bool)

(assert (=> b!682417 (= c!77405 (validKeyInArray!0 (select (arr!18946 a!3626) from!3004)))))

(declare-fun bm!33996 () Bool)

(assert (=> bm!33996 (= call!33999 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77405 (Cons!12890 (select (arr!18946 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!682418 () Bool)

(assert (=> b!682418 (= e!388817 call!33999)))

(declare-fun b!682419 () Bool)

(assert (=> b!682419 (= e!388818 e!388815)))

(declare-fun res!448343 () Bool)

(assert (=> b!682419 (=> (not res!448343) (not e!388815))))

(declare-fun e!388816 () Bool)

(assert (=> b!682419 (= res!448343 (not e!388816))))

(declare-fun res!448345 () Bool)

(assert (=> b!682419 (=> (not res!448345) (not e!388816))))

(assert (=> b!682419 (= res!448345 (validKeyInArray!0 (select (arr!18946 a!3626) from!3004)))))

(declare-fun b!682420 () Bool)

(assert (=> b!682420 (= e!388816 (contains!3546 acc!681 (select (arr!18946 a!3626) from!3004)))))

(assert (= (and d!94173 (not res!448344)) b!682419))

(assert (= (and b!682419 res!448345) b!682420))

(assert (= (and b!682419 res!448343) b!682417))

(assert (= (and b!682417 c!77405) b!682416))

(assert (= (and b!682417 (not c!77405)) b!682418))

(assert (= (or b!682416 b!682418) bm!33996))

(assert (=> b!682417 m!647541))

(assert (=> b!682417 m!647541))

(assert (=> b!682417 m!647547))

(assert (=> bm!33996 m!647541))

(declare-fun m!647647 () Bool)

(assert (=> bm!33996 m!647647))

(assert (=> b!682419 m!647541))

(assert (=> b!682419 m!647541))

(assert (=> b!682419 m!647547))

(assert (=> b!682420 m!647541))

(assert (=> b!682420 m!647541))

(declare-fun m!647649 () Bool)

(assert (=> b!682420 m!647649))

(assert (=> b!682290 d!94173))

(declare-fun d!94175 () Bool)

(assert (=> d!94175 (= ($colon$colon!317 acc!681 (select (arr!18946 a!3626) from!3004)) (Cons!12890 (select (arr!18946 a!3626) from!3004) acc!681))))

(assert (=> b!682289 d!94175))

(declare-fun b!682436 () Bool)

(declare-fun e!388834 () Bool)

(assert (=> b!682436 (= e!388834 (subseq!155 acc!681 (t!19126 acc!681)))))

(declare-fun b!682433 () Bool)

(declare-fun e!388833 () Bool)

(declare-fun e!388832 () Bool)

(assert (=> b!682433 (= e!388833 e!388832)))

(declare-fun res!448361 () Bool)

(assert (=> b!682433 (=> (not res!448361) (not e!388832))))

(get-info :version)

(assert (=> b!682433 (= res!448361 ((_ is Cons!12890) acc!681))))

(declare-fun d!94179 () Bool)

(declare-fun res!448359 () Bool)

(assert (=> d!94179 (=> res!448359 e!388833)))

(assert (=> d!94179 (= res!448359 ((_ is Nil!12891) acc!681))))

(assert (=> d!94179 (= (subseq!155 acc!681 acc!681) e!388833)))

(declare-fun b!682435 () Bool)

(declare-fun e!388831 () Bool)

(assert (=> b!682435 (= e!388831 (subseq!155 (t!19126 acc!681) (t!19126 acc!681)))))

(declare-fun b!682434 () Bool)

(assert (=> b!682434 (= e!388832 e!388834)))

(declare-fun res!448360 () Bool)

(assert (=> b!682434 (=> res!448360 e!388834)))

(assert (=> b!682434 (= res!448360 e!388831)))

(declare-fun res!448358 () Bool)

(assert (=> b!682434 (=> (not res!448358) (not e!388831))))

(assert (=> b!682434 (= res!448358 (= (h!13938 acc!681) (h!13938 acc!681)))))

(assert (= (and d!94179 (not res!448359)) b!682433))

(assert (= (and b!682433 res!448361) b!682434))

(assert (= (and b!682434 res!448358) b!682435))

(assert (= (and b!682434 (not res!448360)) b!682436))

(declare-fun m!647653 () Bool)

(assert (=> b!682436 m!647653))

(declare-fun m!647655 () Bool)

(assert (=> b!682435 m!647655))

(assert (=> b!682289 d!94179))

(declare-fun d!94185 () Bool)

(assert (=> d!94185 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313564 () Unit!23901)

(declare-fun choose!80 (array!39531 List!12894 List!12894 (_ BitVec 32)) Unit!23901)

(assert (=> d!94185 (= lt!313564 (choose!80 a!3626 ($colon$colon!317 acc!681 (select (arr!18946 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94185 (bvslt (size!19310 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94185 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!317 acc!681 (select (arr!18946 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!313564)))

(declare-fun bs!20037 () Bool)

(assert (= bs!20037 d!94185))

(assert (=> bs!20037 m!647539))

(assert (=> bs!20037 m!647559))

(declare-fun m!647667 () Bool)

(assert (=> bs!20037 m!647667))

(assert (=> b!682289 d!94185))

(declare-fun d!94191 () Bool)

(assert (=> d!94191 (subseq!155 acc!681 acc!681)))

(declare-fun lt!313570 () Unit!23901)

(declare-fun choose!36 (List!12894) Unit!23901)

(assert (=> d!94191 (= lt!313570 (choose!36 acc!681))))

(assert (=> d!94191 (= (lemmaListSubSeqRefl!0 acc!681) lt!313570)))

(declare-fun bs!20039 () Bool)

(assert (= bs!20039 d!94191))

(assert (=> bs!20039 m!647565))

(declare-fun m!647675 () Bool)

(assert (=> bs!20039 m!647675))

(assert (=> b!682289 d!94191))

(declare-fun d!94197 () Bool)

(declare-fun res!448377 () Bool)

(declare-fun e!388852 () Bool)

(assert (=> d!94197 (=> res!448377 e!388852)))

(assert (=> d!94197 (= res!448377 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19310 a!3626)))))

(assert (=> d!94197 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!388852)))

(declare-fun b!682451 () Bool)

(declare-fun e!388851 () Bool)

(declare-fun call!34000 () Bool)

(assert (=> b!682451 (= e!388851 call!34000)))

(declare-fun b!682452 () Bool)

(declare-fun e!388849 () Bool)

(assert (=> b!682452 (= e!388849 e!388851)))

(declare-fun c!77406 () Bool)

(assert (=> b!682452 (= c!77406 (validKeyInArray!0 (select (arr!18946 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!33997 () Bool)

(assert (=> bm!33997 (= call!34000 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77406 (Cons!12890 (select (arr!18946 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!682453 () Bool)

(assert (=> b!682453 (= e!388851 call!34000)))

(declare-fun b!682454 () Bool)

(assert (=> b!682454 (= e!388852 e!388849)))

(declare-fun res!448376 () Bool)

(assert (=> b!682454 (=> (not res!448376) (not e!388849))))

(declare-fun e!388850 () Bool)

(assert (=> b!682454 (= res!448376 (not e!388850))))

(declare-fun res!448378 () Bool)

(assert (=> b!682454 (=> (not res!448378) (not e!388850))))

(assert (=> b!682454 (= res!448378 (validKeyInArray!0 (select (arr!18946 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682455 () Bool)

(assert (=> b!682455 (= e!388850 (contains!3546 acc!681 (select (arr!18946 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94197 (not res!448377)) b!682454))

(assert (= (and b!682454 res!448378) b!682455))

(assert (= (and b!682454 res!448376) b!682452))

(assert (= (and b!682452 c!77406) b!682451))

(assert (= (and b!682452 (not c!77406)) b!682453))

(assert (= (or b!682451 b!682453) bm!33997))

(declare-fun m!647677 () Bool)

(assert (=> b!682452 m!647677))

(assert (=> b!682452 m!647677))

(declare-fun m!647679 () Bool)

(assert (=> b!682452 m!647679))

(assert (=> bm!33997 m!647677))

(declare-fun m!647681 () Bool)

(assert (=> bm!33997 m!647681))

(assert (=> b!682454 m!647677))

(assert (=> b!682454 m!647677))

(assert (=> b!682454 m!647679))

(assert (=> b!682455 m!647677))

(assert (=> b!682455 m!647677))

(declare-fun m!647683 () Bool)

(assert (=> b!682455 m!647683))

(assert (=> b!682289 d!94197))

(assert (=> b!682288 d!94197))

(declare-fun d!94199 () Bool)

(assert (=> d!94199 (= (validKeyInArray!0 (select (arr!18946 a!3626) from!3004)) (and (not (= (select (arr!18946 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18946 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682288 d!94199))

(declare-fun d!94201 () Bool)

(declare-fun res!448399 () Bool)

(declare-fun e!388875 () Bool)

(assert (=> d!94201 (=> res!448399 e!388875)))

(assert (=> d!94201 (= res!448399 (= (select (arr!18946 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94201 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388875)))

(declare-fun b!682480 () Bool)

(declare-fun e!388876 () Bool)

(assert (=> b!682480 (= e!388875 e!388876)))

(declare-fun res!448400 () Bool)

(assert (=> b!682480 (=> (not res!448400) (not e!388876))))

(assert (=> b!682480 (= res!448400 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19310 a!3626)))))

(declare-fun b!682481 () Bool)

(assert (=> b!682481 (= e!388876 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94201 (not res!448399)) b!682480))

(assert (= (and b!682480 res!448400) b!682481))

(assert (=> d!94201 m!647677))

(declare-fun m!647699 () Bool)

(assert (=> b!682481 m!647699))

(assert (=> b!682288 d!94201))

(declare-fun d!94211 () Bool)

(declare-fun res!448401 () Bool)

(declare-fun e!388877 () Bool)

(assert (=> d!94211 (=> res!448401 e!388877)))

(assert (=> d!94211 (= res!448401 (= (select (arr!18946 (array!39532 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626))) from!3004) k0!2843))))

(assert (=> d!94211 (= (arrayContainsKey!0 (array!39532 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626)) k0!2843 from!3004) e!388877)))

(declare-fun b!682482 () Bool)

(declare-fun e!388878 () Bool)

(assert (=> b!682482 (= e!388877 e!388878)))

(declare-fun res!448402 () Bool)

(assert (=> b!682482 (=> (not res!448402) (not e!388878))))

(assert (=> b!682482 (= res!448402 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19310 (array!39532 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626)))))))

(declare-fun b!682483 () Bool)

(assert (=> b!682483 (= e!388878 (arrayContainsKey!0 (array!39532 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94211 (not res!448401)) b!682482))

(assert (= (and b!682482 res!448402) b!682483))

(declare-fun m!647701 () Bool)

(assert (=> d!94211 m!647701))

(declare-fun m!647703 () Bool)

(assert (=> b!682483 m!647703))

(assert (=> b!682288 d!94211))

(declare-fun d!94213 () Bool)

(declare-fun lt!313579 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!281 (List!12894) (InoxSet (_ BitVec 64)))

(assert (=> d!94213 (= lt!313579 (select (content!281 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388901 () Bool)

(assert (=> d!94213 (= lt!313579 e!388901)))

(declare-fun res!448423 () Bool)

(assert (=> d!94213 (=> (not res!448423) (not e!388901))))

(assert (=> d!94213 (= res!448423 ((_ is Cons!12890) acc!681))))

(assert (=> d!94213 (= (contains!3546 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313579)))

(declare-fun b!682509 () Bool)

(declare-fun e!388902 () Bool)

(assert (=> b!682509 (= e!388901 e!388902)))

(declare-fun res!448422 () Bool)

(assert (=> b!682509 (=> res!448422 e!388902)))

(assert (=> b!682509 (= res!448422 (= (h!13938 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!682510 () Bool)

(assert (=> b!682510 (= e!388902 (contains!3546 (t!19126 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94213 res!448423) b!682509))

(assert (= (and b!682509 (not res!448422)) b!682510))

(declare-fun m!647717 () Bool)

(assert (=> d!94213 m!647717))

(declare-fun m!647719 () Bool)

(assert (=> d!94213 m!647719))

(declare-fun m!647721 () Bool)

(assert (=> b!682510 m!647721))

(assert (=> b!682287 d!94213))

(declare-fun d!94219 () Bool)

(assert (=> d!94219 (= (array_inv!14805 a!3626) (bvsge (size!19310 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60846 d!94219))

(declare-fun d!94223 () Bool)

(assert (=> d!94223 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682297 d!94223))

(declare-fun d!94225 () Bool)

(declare-fun lt!313580 () Bool)

(assert (=> d!94225 (= lt!313580 (select (content!281 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388905 () Bool)

(assert (=> d!94225 (= lt!313580 e!388905)))

(declare-fun res!448427 () Bool)

(assert (=> d!94225 (=> (not res!448427) (not e!388905))))

(assert (=> d!94225 (= res!448427 ((_ is Cons!12890) acc!681))))

(assert (=> d!94225 (= (contains!3546 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313580)))

(declare-fun b!682513 () Bool)

(declare-fun e!388906 () Bool)

(assert (=> b!682513 (= e!388905 e!388906)))

(declare-fun res!448426 () Bool)

(assert (=> b!682513 (=> res!448426 e!388906)))

(assert (=> b!682513 (= res!448426 (= (h!13938 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!682514 () Bool)

(assert (=> b!682514 (= e!388906 (contains!3546 (t!19126 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94225 res!448427) b!682513))

(assert (= (and b!682513 (not res!448426)) b!682514))

(assert (=> d!94225 m!647717))

(declare-fun m!647727 () Bool)

(assert (=> d!94225 m!647727))

(declare-fun m!647729 () Bool)

(assert (=> b!682514 m!647729))

(assert (=> b!682295 d!94225))

(declare-fun d!94229 () Bool)

(declare-fun lt!313581 () Bool)

(assert (=> d!94229 (= lt!313581 (select (content!281 acc!681) k0!2843))))

(declare-fun e!388907 () Bool)

(assert (=> d!94229 (= lt!313581 e!388907)))

(declare-fun res!448429 () Bool)

(assert (=> d!94229 (=> (not res!448429) (not e!388907))))

(assert (=> d!94229 (= res!448429 ((_ is Cons!12890) acc!681))))

(assert (=> d!94229 (= (contains!3546 acc!681 k0!2843) lt!313581)))

(declare-fun b!682515 () Bool)

(declare-fun e!388908 () Bool)

(assert (=> b!682515 (= e!388907 e!388908)))

(declare-fun res!448428 () Bool)

(assert (=> b!682515 (=> res!448428 e!388908)))

(assert (=> b!682515 (= res!448428 (= (h!13938 acc!681) k0!2843))))

(declare-fun b!682516 () Bool)

(assert (=> b!682516 (= e!388908 (contains!3546 (t!19126 acc!681) k0!2843))))

(assert (= (and d!94229 res!448429) b!682515))

(assert (= (and b!682515 (not res!448428)) b!682516))

(assert (=> d!94229 m!647717))

(declare-fun m!647731 () Bool)

(assert (=> d!94229 m!647731))

(declare-fun m!647733 () Bool)

(assert (=> b!682516 m!647733))

(assert (=> b!682284 d!94229))

(declare-fun d!94231 () Bool)

(assert (=> d!94231 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313585 () Unit!23901)

(declare-fun choose!13 (array!39531 (_ BitVec 64) (_ BitVec 32)) Unit!23901)

(assert (=> d!94231 (= lt!313585 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94231 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94231 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313585)))

(declare-fun bs!20040 () Bool)

(assert (= bs!20040 d!94231))

(assert (=> bs!20040 m!647551))

(declare-fun m!647753 () Bool)

(assert (=> bs!20040 m!647753))

(assert (=> b!682283 d!94231))

(declare-fun d!94243 () Bool)

(declare-fun res!448455 () Bool)

(declare-fun e!388937 () Bool)

(assert (=> d!94243 (=> res!448455 e!388937)))

(assert (=> d!94243 (= res!448455 ((_ is Nil!12891) acc!681))))

(assert (=> d!94243 (= (noDuplicate!820 acc!681) e!388937)))

(declare-fun b!682548 () Bool)

(declare-fun e!388938 () Bool)

(assert (=> b!682548 (= e!388937 e!388938)))

(declare-fun res!448456 () Bool)

(assert (=> b!682548 (=> (not res!448456) (not e!388938))))

(assert (=> b!682548 (= res!448456 (not (contains!3546 (t!19126 acc!681) (h!13938 acc!681))))))

(declare-fun b!682549 () Bool)

(assert (=> b!682549 (= e!388938 (noDuplicate!820 (t!19126 acc!681)))))

(assert (= (and d!94243 (not res!448455)) b!682548))

(assert (= (and b!682548 res!448456) b!682549))

(declare-fun m!647769 () Bool)

(assert (=> b!682548 m!647769))

(declare-fun m!647772 () Bool)

(assert (=> b!682549 m!647772))

(assert (=> b!682294 d!94243))

(assert (=> b!682293 d!94229))

(declare-fun d!94253 () Bool)

(declare-fun res!448457 () Bool)

(declare-fun e!388939 () Bool)

(assert (=> d!94253 (=> res!448457 e!388939)))

(assert (=> d!94253 (= res!448457 (= (select (arr!18946 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94253 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388939)))

(declare-fun b!682550 () Bool)

(declare-fun e!388940 () Bool)

(assert (=> b!682550 (= e!388939 e!388940)))

(declare-fun res!448458 () Bool)

(assert (=> b!682550 (=> (not res!448458) (not e!388940))))

(assert (=> b!682550 (= res!448458 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19310 a!3626)))))

(declare-fun b!682551 () Bool)

(assert (=> b!682551 (= e!388940 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94253 (not res!448457)) b!682550))

(assert (= (and b!682550 res!448458) b!682551))

(declare-fun m!647775 () Bool)

(assert (=> d!94253 m!647775))

(declare-fun m!647777 () Bool)

(assert (=> b!682551 m!647777))

(assert (=> b!682292 d!94253))

(declare-fun d!94259 () Bool)

(declare-fun res!448462 () Bool)

(declare-fun e!388946 () Bool)

(assert (=> d!94259 (=> res!448462 e!388946)))

(assert (=> d!94259 (= res!448462 (bvsge #b00000000000000000000000000000000 (size!19310 a!3626)))))

(assert (=> d!94259 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12891) e!388946)))

(declare-fun b!682554 () Bool)

(declare-fun e!388945 () Bool)

(declare-fun call!34009 () Bool)

(assert (=> b!682554 (= e!388945 call!34009)))

(declare-fun b!682555 () Bool)

(declare-fun e!388943 () Bool)

(assert (=> b!682555 (= e!388943 e!388945)))

(declare-fun c!77415 () Bool)

(assert (=> b!682555 (= c!77415 (validKeyInArray!0 (select (arr!18946 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34006 () Bool)

(assert (=> bm!34006 (= call!34009 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77415 (Cons!12890 (select (arr!18946 a!3626) #b00000000000000000000000000000000) Nil!12891) Nil!12891)))))

(declare-fun b!682556 () Bool)

(assert (=> b!682556 (= e!388945 call!34009)))

(declare-fun b!682557 () Bool)

(assert (=> b!682557 (= e!388946 e!388943)))

(declare-fun res!448461 () Bool)

(assert (=> b!682557 (=> (not res!448461) (not e!388943))))

(declare-fun e!388944 () Bool)

(assert (=> b!682557 (= res!448461 (not e!388944))))

(declare-fun res!448463 () Bool)

(assert (=> b!682557 (=> (not res!448463) (not e!388944))))

(assert (=> b!682557 (= res!448463 (validKeyInArray!0 (select (arr!18946 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!682558 () Bool)

(assert (=> b!682558 (= e!388944 (contains!3546 Nil!12891 (select (arr!18946 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94259 (not res!448462)) b!682557))

(assert (= (and b!682557 res!448463) b!682558))

(assert (= (and b!682557 res!448461) b!682555))

(assert (= (and b!682555 c!77415) b!682554))

(assert (= (and b!682555 (not c!77415)) b!682556))

(assert (= (or b!682554 b!682556) bm!34006))

(assert (=> b!682555 m!647775))

(assert (=> b!682555 m!647775))

(declare-fun m!647785 () Bool)

(assert (=> b!682555 m!647785))

(assert (=> bm!34006 m!647775))

(declare-fun m!647787 () Bool)

(assert (=> bm!34006 m!647787))

(assert (=> b!682557 m!647775))

(assert (=> b!682557 m!647775))

(assert (=> b!682557 m!647785))

(assert (=> b!682558 m!647775))

(assert (=> b!682558 m!647775))

(declare-fun m!647789 () Bool)

(assert (=> b!682558 m!647789))

(assert (=> b!682291 d!94259))

(check-sat (not d!94225) (not b!682417) (not bm!34006) (not b!682454) (not b!682435) (not bm!33996) (not d!94185) (not b!682516) (not bm!33997) (not b!682452) (not d!94229) (not b!682514) (not b!682557) (not b!682558) (not b!682436) (not b!682420) (not d!94213) (not b!682549) (not b!682481) (not d!94231) (not b!682555) (not b!682510) (not b!682551) (not b!682455) (not b!682419) (not b!682483) (not d!94191) (not b!682548))
(check-sat)
