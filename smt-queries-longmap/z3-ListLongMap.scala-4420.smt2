; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61076 () Bool)

(assert start!61076)

(declare-fun b!684710 () Bool)

(declare-fun e!389917 () Bool)

(declare-datatypes ((List!13069 0))(
  ( (Nil!13066) (Cons!13065 (h!14110 (_ BitVec 64)) (t!19309 List!13069)) )
))
(declare-fun acc!681 () List!13069)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3591 (List!13069 (_ BitVec 64)) Bool)

(assert (=> b!684710 (= e!389917 (not (contains!3591 acc!681 k0!2843)))))

(declare-fun b!684711 () Bool)

(declare-fun res!450320 () Bool)

(declare-fun e!389924 () Bool)

(assert (=> b!684711 (=> (not res!450320) (not e!389924))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39621 0))(
  ( (array!39622 (arr!18989 (Array (_ BitVec 32) (_ BitVec 64))) (size!19359 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39621)

(assert (=> b!684711 (= res!450320 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19359 a!3626))))))

(declare-fun b!684712 () Bool)

(declare-fun e!389923 () Bool)

(declare-fun lt!314268 () List!13069)

(assert (=> b!684712 (= e!389923 (contains!3591 lt!314268 k0!2843))))

(declare-fun b!684713 () Bool)

(declare-fun res!450322 () Bool)

(assert (=> b!684713 (=> (not res!450322) (not e!389924))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39621 (_ BitVec 32) List!13069) Bool)

(assert (=> b!684713 (= res!450322 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684714 () Bool)

(declare-fun res!450314 () Bool)

(assert (=> b!684714 (=> res!450314 e!389923)))

(declare-fun noDuplicate!860 (List!13069) Bool)

(assert (=> b!684714 (= res!450314 (not (noDuplicate!860 lt!314268)))))

(declare-fun b!684715 () Bool)

(declare-fun res!450317 () Bool)

(assert (=> b!684715 (=> (not res!450317) (not e!389924))))

(assert (=> b!684715 (= res!450317 (noDuplicate!860 acc!681))))

(declare-fun b!684716 () Bool)

(declare-fun res!450328 () Bool)

(assert (=> b!684716 (=> (not res!450328) (not e!389924))))

(assert (=> b!684716 (= res!450328 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13066))))

(declare-fun b!684717 () Bool)

(declare-fun res!450323 () Bool)

(assert (=> b!684717 (=> (not res!450323) (not e!389924))))

(assert (=> b!684717 (= res!450323 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19359 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684718 () Bool)

(declare-datatypes ((Unit!24095 0))(
  ( (Unit!24096) )
))
(declare-fun e!389922 () Unit!24095)

(declare-fun lt!314264 () Unit!24095)

(assert (=> b!684718 (= e!389922 lt!314264)))

(declare-fun lt!314267 () Unit!24095)

(declare-fun lemmaListSubSeqRefl!0 (List!13069) Unit!24095)

(assert (=> b!684718 (= lt!314267 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!194 (List!13069 List!13069) Bool)

(assert (=> b!684718 (subseq!194 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39621 List!13069 List!13069 (_ BitVec 32)) Unit!24095)

(declare-fun $colon$colon!358 (List!13069 (_ BitVec 64)) List!13069)

(assert (=> b!684718 (= lt!314264 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!358 acc!681 (select (arr!18989 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684718 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684719 () Bool)

(declare-fun res!450318 () Bool)

(assert (=> b!684719 (=> res!450318 e!389923)))

(declare-fun lt!314265 () Bool)

(assert (=> b!684719 (= res!450318 lt!314265)))

(declare-fun b!684720 () Bool)

(declare-fun Unit!24097 () Unit!24095)

(assert (=> b!684720 (= e!389922 Unit!24097)))

(declare-fun b!684721 () Bool)

(declare-fun res!450310 () Bool)

(assert (=> b!684721 (=> (not res!450310) (not e!389924))))

(assert (=> b!684721 (= res!450310 (not (contains!3591 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684722 () Bool)

(declare-fun res!450313 () Bool)

(assert (=> b!684722 (=> (not res!450313) (not e!389924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684722 (= res!450313 (validKeyInArray!0 k0!2843))))

(declare-fun b!684723 () Bool)

(declare-fun res!450311 () Bool)

(assert (=> b!684723 (=> res!450311 e!389923)))

(assert (=> b!684723 (= res!450311 (not (subseq!194 acc!681 lt!314268)))))

(declare-fun b!684724 () Bool)

(declare-fun e!389918 () Unit!24095)

(declare-fun Unit!24098 () Unit!24095)

(assert (=> b!684724 (= e!389918 Unit!24098)))

(declare-fun res!450315 () Bool)

(assert (=> start!61076 (=> (not res!450315) (not e!389924))))

(assert (=> start!61076 (= res!450315 (and (bvslt (size!19359 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19359 a!3626))))))

(assert (=> start!61076 e!389924))

(assert (=> start!61076 true))

(declare-fun array_inv!14872 (array!39621) Bool)

(assert (=> start!61076 (array_inv!14872 a!3626)))

(declare-fun b!684725 () Bool)

(declare-fun Unit!24099 () Unit!24095)

(assert (=> b!684725 (= e!389918 Unit!24099)))

(declare-fun lt!314266 () Unit!24095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39621 (_ BitVec 64) (_ BitVec 32)) Unit!24095)

(assert (=> b!684725 (= lt!314266 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684725 false))

(declare-fun b!684726 () Bool)

(declare-fun res!450319 () Bool)

(assert (=> b!684726 (=> (not res!450319) (not e!389924))))

(assert (=> b!684726 (= res!450319 (not (contains!3591 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684727 () Bool)

(declare-fun res!450321 () Bool)

(assert (=> b!684727 (=> (not res!450321) (not e!389924))))

(declare-fun e!389919 () Bool)

(assert (=> b!684727 (= res!450321 e!389919)))

(declare-fun res!450312 () Bool)

(assert (=> b!684727 (=> res!450312 e!389919)))

(declare-fun e!389920 () Bool)

(assert (=> b!684727 (= res!450312 e!389920)))

(declare-fun res!450326 () Bool)

(assert (=> b!684727 (=> (not res!450326) (not e!389920))))

(assert (=> b!684727 (= res!450326 (bvsgt from!3004 i!1382))))

(declare-fun b!684728 () Bool)

(assert (=> b!684728 (= e!389919 e!389917)))

(declare-fun res!450316 () Bool)

(assert (=> b!684728 (=> (not res!450316) (not e!389917))))

(assert (=> b!684728 (= res!450316 (bvsle from!3004 i!1382))))

(declare-fun b!684729 () Bool)

(declare-fun res!450325 () Bool)

(assert (=> b!684729 (=> (not res!450325) (not e!389924))))

(declare-fun arrayContainsKey!0 (array!39621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684729 (= res!450325 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684730 () Bool)

(assert (=> b!684730 (= e!389920 (contains!3591 acc!681 k0!2843))))

(declare-fun b!684731 () Bool)

(declare-fun res!450324 () Bool)

(assert (=> b!684731 (=> res!450324 e!389923)))

(assert (=> b!684731 (= res!450324 (contains!3591 acc!681 k0!2843))))

(declare-fun b!684732 () Bool)

(assert (=> b!684732 (= e!389924 (not e!389923))))

(declare-fun res!450327 () Bool)

(assert (=> b!684732 (=> res!450327 e!389923)))

(assert (=> b!684732 (= res!450327 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!159 (List!13069 (_ BitVec 64)) List!13069)

(assert (=> b!684732 (= (-!159 lt!314268 k0!2843) acc!681)))

(assert (=> b!684732 (= lt!314268 ($colon$colon!358 acc!681 k0!2843))))

(declare-fun lt!314263 () Unit!24095)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13069) Unit!24095)

(assert (=> b!684732 (= lt!314263 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!684732 (subseq!194 acc!681 acc!681)))

(declare-fun lt!314262 () Unit!24095)

(assert (=> b!684732 (= lt!314262 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684732 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314261 () Unit!24095)

(assert (=> b!684732 (= lt!314261 e!389922)))

(declare-fun c!77567 () Bool)

(assert (=> b!684732 (= c!77567 (validKeyInArray!0 (select (arr!18989 a!3626) from!3004)))))

(declare-fun lt!314260 () Unit!24095)

(assert (=> b!684732 (= lt!314260 e!389918)))

(declare-fun c!77568 () Bool)

(assert (=> b!684732 (= c!77568 lt!314265)))

(assert (=> b!684732 (= lt!314265 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684732 (arrayContainsKey!0 (array!39622 (store (arr!18989 a!3626) i!1382 k0!2843) (size!19359 a!3626)) k0!2843 from!3004)))

(assert (= (and start!61076 res!450315) b!684715))

(assert (= (and b!684715 res!450317) b!684721))

(assert (= (and b!684721 res!450310) b!684726))

(assert (= (and b!684726 res!450319) b!684727))

(assert (= (and b!684727 res!450326) b!684730))

(assert (= (and b!684727 (not res!450312)) b!684728))

(assert (= (and b!684728 res!450316) b!684710))

(assert (= (and b!684727 res!450321) b!684716))

(assert (= (and b!684716 res!450328) b!684713))

(assert (= (and b!684713 res!450322) b!684711))

(assert (= (and b!684711 res!450320) b!684722))

(assert (= (and b!684722 res!450313) b!684729))

(assert (= (and b!684729 res!450325) b!684717))

(assert (= (and b!684717 res!450323) b!684732))

(assert (= (and b!684732 c!77568) b!684725))

(assert (= (and b!684732 (not c!77568)) b!684724))

(assert (= (and b!684732 c!77567) b!684718))

(assert (= (and b!684732 (not c!77567)) b!684720))

(assert (= (and b!684732 (not res!450327)) b!684714))

(assert (= (and b!684714 (not res!450314)) b!684719))

(assert (= (and b!684719 (not res!450318)) b!684731))

(assert (= (and b!684731 (not res!450324)) b!684723))

(assert (= (and b!684723 (not res!450311)) b!684712))

(declare-fun m!648489 () Bool)

(assert (=> b!684730 m!648489))

(declare-fun m!648491 () Bool)

(assert (=> b!684725 m!648491))

(declare-fun m!648493 () Bool)

(assert (=> b!684722 m!648493))

(declare-fun m!648495 () Bool)

(assert (=> b!684716 m!648495))

(declare-fun m!648497 () Bool)

(assert (=> b!684718 m!648497))

(declare-fun m!648499 () Bool)

(assert (=> b!684718 m!648499))

(declare-fun m!648501 () Bool)

(assert (=> b!684718 m!648501))

(declare-fun m!648503 () Bool)

(assert (=> b!684718 m!648503))

(assert (=> b!684718 m!648499))

(assert (=> b!684718 m!648501))

(declare-fun m!648505 () Bool)

(assert (=> b!684718 m!648505))

(declare-fun m!648507 () Bool)

(assert (=> b!684718 m!648507))

(declare-fun m!648509 () Bool)

(assert (=> b!684715 m!648509))

(declare-fun m!648511 () Bool)

(assert (=> b!684721 m!648511))

(declare-fun m!648513 () Bool)

(assert (=> b!684723 m!648513))

(declare-fun m!648515 () Bool)

(assert (=> b!684714 m!648515))

(declare-fun m!648517 () Bool)

(assert (=> b!684713 m!648517))

(declare-fun m!648519 () Bool)

(assert (=> b!684726 m!648519))

(declare-fun m!648521 () Bool)

(assert (=> start!61076 m!648521))

(declare-fun m!648523 () Bool)

(assert (=> b!684712 m!648523))

(assert (=> b!684710 m!648489))

(assert (=> b!684732 m!648497))

(assert (=> b!684732 m!648499))

(declare-fun m!648525 () Bool)

(assert (=> b!684732 m!648525))

(declare-fun m!648527 () Bool)

(assert (=> b!684732 m!648527))

(declare-fun m!648529 () Bool)

(assert (=> b!684732 m!648529))

(assert (=> b!684732 m!648505))

(declare-fun m!648531 () Bool)

(assert (=> b!684732 m!648531))

(declare-fun m!648533 () Bool)

(assert (=> b!684732 m!648533))

(assert (=> b!684732 m!648499))

(declare-fun m!648535 () Bool)

(assert (=> b!684732 m!648535))

(declare-fun m!648537 () Bool)

(assert (=> b!684732 m!648537))

(assert (=> b!684732 m!648507))

(declare-fun m!648539 () Bool)

(assert (=> b!684729 m!648539))

(assert (=> b!684731 m!648489))

(check-sat (not b!684725) (not b!684732) (not b!684712) (not b!684716) (not b!684721) (not b!684718) (not b!684714) (not b!684723) (not b!684726) (not start!61076) (not b!684729) (not b!684730) (not b!684713) (not b!684731) (not b!684715) (not b!684722) (not b!684710))
(check-sat)
(get-model)

(declare-fun b!684881 () Bool)

(declare-fun e!389981 () Bool)

(declare-fun call!34027 () Bool)

(assert (=> b!684881 (= e!389981 call!34027)))

(declare-fun b!684883 () Bool)

(declare-fun e!389983 () Bool)

(assert (=> b!684883 (= e!389983 (contains!3591 Nil!13066 (select (arr!18989 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!684884 () Bool)

(declare-fun e!389984 () Bool)

(declare-fun e!389982 () Bool)

(assert (=> b!684884 (= e!389984 e!389982)))

(declare-fun res!450450 () Bool)

(assert (=> b!684884 (=> (not res!450450) (not e!389982))))

(assert (=> b!684884 (= res!450450 (not e!389983))))

(declare-fun res!450451 () Bool)

(assert (=> b!684884 (=> (not res!450451) (not e!389983))))

(assert (=> b!684884 (= res!450451 (validKeyInArray!0 (select (arr!18989 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!684882 () Bool)

(assert (=> b!684882 (= e!389982 e!389981)))

(declare-fun c!77583 () Bool)

(assert (=> b!684882 (= c!77583 (validKeyInArray!0 (select (arr!18989 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94239 () Bool)

(declare-fun res!450449 () Bool)

(assert (=> d!94239 (=> res!450449 e!389984)))

(assert (=> d!94239 (= res!450449 (bvsge #b00000000000000000000000000000000 (size!19359 a!3626)))))

(assert (=> d!94239 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13066) e!389984)))

(declare-fun b!684885 () Bool)

(assert (=> b!684885 (= e!389981 call!34027)))

(declare-fun bm!34024 () Bool)

(assert (=> bm!34024 (= call!34027 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77583 (Cons!13065 (select (arr!18989 a!3626) #b00000000000000000000000000000000) Nil!13066) Nil!13066)))))

(assert (= (and d!94239 (not res!450449)) b!684884))

(assert (= (and b!684884 res!450451) b!684883))

(assert (= (and b!684884 res!450450) b!684882))

(assert (= (and b!684882 c!77583) b!684881))

(assert (= (and b!684882 (not c!77583)) b!684885))

(assert (= (or b!684881 b!684885) bm!34024))

(declare-fun m!648645 () Bool)

(assert (=> b!684883 m!648645))

(assert (=> b!684883 m!648645))

(declare-fun m!648647 () Bool)

(assert (=> b!684883 m!648647))

(assert (=> b!684884 m!648645))

(assert (=> b!684884 m!648645))

(declare-fun m!648649 () Bool)

(assert (=> b!684884 m!648649))

(assert (=> b!684882 m!648645))

(assert (=> b!684882 m!648645))

(assert (=> b!684882 m!648649))

(assert (=> bm!34024 m!648645))

(declare-fun m!648651 () Bool)

(assert (=> bm!34024 m!648651))

(assert (=> b!684716 d!94239))

(declare-fun d!94241 () Bool)

(declare-fun res!450456 () Bool)

(declare-fun e!389989 () Bool)

(assert (=> d!94241 (=> res!450456 e!389989)))

(assert (=> d!94241 (= res!450456 (= (select (arr!18989 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94241 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!389989)))

(declare-fun b!684890 () Bool)

(declare-fun e!389990 () Bool)

(assert (=> b!684890 (= e!389989 e!389990)))

(declare-fun res!450457 () Bool)

(assert (=> b!684890 (=> (not res!450457) (not e!389990))))

(assert (=> b!684890 (= res!450457 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19359 a!3626)))))

(declare-fun b!684891 () Bool)

(assert (=> b!684891 (= e!389990 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94241 (not res!450456)) b!684890))

(assert (= (and b!684890 res!450457) b!684891))

(assert (=> d!94241 m!648645))

(declare-fun m!648653 () Bool)

(assert (=> b!684891 m!648653))

(assert (=> b!684729 d!94241))

(declare-fun d!94243 () Bool)

(assert (=> d!94243 (= ($colon$colon!358 acc!681 (select (arr!18989 a!3626) from!3004)) (Cons!13065 (select (arr!18989 a!3626) from!3004) acc!681))))

(assert (=> b!684718 d!94243))

(declare-fun b!684900 () Bool)

(declare-fun e!390000 () Bool)

(declare-fun e!390002 () Bool)

(assert (=> b!684900 (= e!390000 e!390002)))

(declare-fun res!450466 () Bool)

(assert (=> b!684900 (=> (not res!450466) (not e!390002))))

(get-info :version)

(assert (=> b!684900 (= res!450466 ((_ is Cons!13065) acc!681))))

(declare-fun b!684903 () Bool)

(declare-fun e!390001 () Bool)

(assert (=> b!684903 (= e!390001 (subseq!194 acc!681 (t!19309 acc!681)))))

(declare-fun b!684901 () Bool)

(assert (=> b!684901 (= e!390002 e!390001)))

(declare-fun res!450469 () Bool)

(assert (=> b!684901 (=> res!450469 e!390001)))

(declare-fun e!389999 () Bool)

(assert (=> b!684901 (= res!450469 e!389999)))

(declare-fun res!450468 () Bool)

(assert (=> b!684901 (=> (not res!450468) (not e!389999))))

(assert (=> b!684901 (= res!450468 (= (h!14110 acc!681) (h!14110 acc!681)))))

(declare-fun b!684902 () Bool)

(assert (=> b!684902 (= e!389999 (subseq!194 (t!19309 acc!681) (t!19309 acc!681)))))

(declare-fun d!94245 () Bool)

(declare-fun res!450467 () Bool)

(assert (=> d!94245 (=> res!450467 e!390000)))

(assert (=> d!94245 (= res!450467 ((_ is Nil!13066) acc!681))))

(assert (=> d!94245 (= (subseq!194 acc!681 acc!681) e!390000)))

(assert (= (and d!94245 (not res!450467)) b!684900))

(assert (= (and b!684900 res!450466) b!684901))

(assert (= (and b!684901 res!450468) b!684902))

(assert (= (and b!684901 (not res!450469)) b!684903))

(declare-fun m!648655 () Bool)

(assert (=> b!684903 m!648655))

(declare-fun m!648657 () Bool)

(assert (=> b!684902 m!648657))

(assert (=> b!684718 d!94245))

(declare-fun d!94247 () Bool)

(assert (=> d!94247 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314325 () Unit!24095)

(declare-fun choose!80 (array!39621 List!13069 List!13069 (_ BitVec 32)) Unit!24095)

(assert (=> d!94247 (= lt!314325 (choose!80 a!3626 ($colon$colon!358 acc!681 (select (arr!18989 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94247 (bvslt (size!19359 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94247 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!358 acc!681 (select (arr!18989 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314325)))

(declare-fun bs!20058 () Bool)

(assert (= bs!20058 d!94247))

(assert (=> bs!20058 m!648497))

(assert (=> bs!20058 m!648501))

(declare-fun m!648659 () Bool)

(assert (=> bs!20058 m!648659))

(assert (=> b!684718 d!94247))

(declare-fun d!94249 () Bool)

(assert (=> d!94249 (subseq!194 acc!681 acc!681)))

(declare-fun lt!314328 () Unit!24095)

(declare-fun choose!36 (List!13069) Unit!24095)

(assert (=> d!94249 (= lt!314328 (choose!36 acc!681))))

(assert (=> d!94249 (= (lemmaListSubSeqRefl!0 acc!681) lt!314328)))

(declare-fun bs!20059 () Bool)

(assert (= bs!20059 d!94249))

(assert (=> bs!20059 m!648507))

(declare-fun m!648661 () Bool)

(assert (=> bs!20059 m!648661))

(assert (=> b!684718 d!94249))

(declare-fun b!684904 () Bool)

(declare-fun e!390003 () Bool)

(declare-fun call!34028 () Bool)

(assert (=> b!684904 (= e!390003 call!34028)))

(declare-fun b!684906 () Bool)

(declare-fun e!390005 () Bool)

(assert (=> b!684906 (= e!390005 (contains!3591 acc!681 (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!684907 () Bool)

(declare-fun e!390006 () Bool)

(declare-fun e!390004 () Bool)

(assert (=> b!684907 (= e!390006 e!390004)))

(declare-fun res!450471 () Bool)

(assert (=> b!684907 (=> (not res!450471) (not e!390004))))

(assert (=> b!684907 (= res!450471 (not e!390005))))

(declare-fun res!450472 () Bool)

(assert (=> b!684907 (=> (not res!450472) (not e!390005))))

(assert (=> b!684907 (= res!450472 (validKeyInArray!0 (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!684905 () Bool)

(assert (=> b!684905 (= e!390004 e!390003)))

(declare-fun c!77584 () Bool)

(assert (=> b!684905 (= c!77584 (validKeyInArray!0 (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94251 () Bool)

(declare-fun res!450470 () Bool)

(assert (=> d!94251 (=> res!450470 e!390006)))

(assert (=> d!94251 (= res!450470 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19359 a!3626)))))

(assert (=> d!94251 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390006)))

(declare-fun b!684908 () Bool)

(assert (=> b!684908 (= e!390003 call!34028)))

(declare-fun bm!34025 () Bool)

(assert (=> bm!34025 (= call!34028 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77584 (Cons!13065 (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!94251 (not res!450470)) b!684907))

(assert (= (and b!684907 res!450472) b!684906))

(assert (= (and b!684907 res!450471) b!684905))

(assert (= (and b!684905 c!77584) b!684904))

(assert (= (and b!684905 (not c!77584)) b!684908))

(assert (= (or b!684904 b!684908) bm!34025))

(declare-fun m!648663 () Bool)

(assert (=> b!684906 m!648663))

(assert (=> b!684906 m!648663))

(declare-fun m!648665 () Bool)

(assert (=> b!684906 m!648665))

(assert (=> b!684907 m!648663))

(assert (=> b!684907 m!648663))

(declare-fun m!648667 () Bool)

(assert (=> b!684907 m!648667))

(assert (=> b!684905 m!648663))

(assert (=> b!684905 m!648663))

(assert (=> b!684905 m!648667))

(assert (=> bm!34025 m!648663))

(declare-fun m!648669 () Bool)

(assert (=> bm!34025 m!648669))

(assert (=> b!684718 d!94251))

(declare-fun d!94253 () Bool)

(assert (=> d!94253 (= (array_inv!14872 a!3626) (bvsge (size!19359 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61076 d!94253))

(declare-fun d!94257 () Bool)

(declare-fun lt!314334 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!288 (List!13069) (InoxSet (_ BitVec 64)))

(assert (=> d!94257 (= lt!314334 (select (content!288 acc!681) k0!2843))))

(declare-fun e!390018 () Bool)

(assert (=> d!94257 (= lt!314334 e!390018)))

(declare-fun res!450484 () Bool)

(assert (=> d!94257 (=> (not res!450484) (not e!390018))))

(assert (=> d!94257 (= res!450484 ((_ is Cons!13065) acc!681))))

(assert (=> d!94257 (= (contains!3591 acc!681 k0!2843) lt!314334)))

(declare-fun b!684919 () Bool)

(declare-fun e!390017 () Bool)

(assert (=> b!684919 (= e!390018 e!390017)))

(declare-fun res!450483 () Bool)

(assert (=> b!684919 (=> res!450483 e!390017)))

(assert (=> b!684919 (= res!450483 (= (h!14110 acc!681) k0!2843))))

(declare-fun b!684920 () Bool)

(assert (=> b!684920 (= e!390017 (contains!3591 (t!19309 acc!681) k0!2843))))

(assert (= (and d!94257 res!450484) b!684919))

(assert (= (and b!684919 (not res!450483)) b!684920))

(declare-fun m!648677 () Bool)

(assert (=> d!94257 m!648677))

(declare-fun m!648679 () Bool)

(assert (=> d!94257 m!648679))

(declare-fun m!648681 () Bool)

(assert (=> b!684920 m!648681))

(assert (=> b!684730 d!94257))

(declare-fun d!94265 () Bool)

(declare-fun lt!314335 () Bool)

(assert (=> d!94265 (= lt!314335 (select (content!288 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390020 () Bool)

(assert (=> d!94265 (= lt!314335 e!390020)))

(declare-fun res!450486 () Bool)

(assert (=> d!94265 (=> (not res!450486) (not e!390020))))

(assert (=> d!94265 (= res!450486 ((_ is Cons!13065) acc!681))))

(assert (=> d!94265 (= (contains!3591 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314335)))

(declare-fun b!684921 () Bool)

(declare-fun e!390019 () Bool)

(assert (=> b!684921 (= e!390020 e!390019)))

(declare-fun res!450485 () Bool)

(assert (=> b!684921 (=> res!450485 e!390019)))

(assert (=> b!684921 (= res!450485 (= (h!14110 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!684922 () Bool)

(assert (=> b!684922 (= e!390019 (contains!3591 (t!19309 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94265 res!450486) b!684921))

(assert (= (and b!684921 (not res!450485)) b!684922))

(assert (=> d!94265 m!648677))

(declare-fun m!648683 () Bool)

(assert (=> d!94265 m!648683))

(declare-fun m!648685 () Bool)

(assert (=> b!684922 m!648685))

(assert (=> b!684721 d!94265))

(assert (=> b!684710 d!94257))

(assert (=> b!684731 d!94257))

(declare-fun d!94267 () Bool)

(assert (=> d!94267 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684722 d!94267))

(declare-fun b!684959 () Bool)

(declare-fun e!390049 () List!13069)

(declare-fun e!390051 () List!13069)

(assert (=> b!684959 (= e!390049 e!390051)))

(declare-fun c!77596 () Bool)

(assert (=> b!684959 (= c!77596 (= k0!2843 (h!14110 lt!314268)))))

(declare-fun e!390050 () Bool)

(declare-fun b!684960 () Bool)

(declare-fun lt!314340 () List!13069)

(assert (=> b!684960 (= e!390050 (= (content!288 lt!314340) ((_ map and) (content!288 lt!314268) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun bm!34032 () Bool)

(declare-fun call!34035 () List!13069)

(assert (=> bm!34032 (= call!34035 (-!159 (t!19309 lt!314268) k0!2843))))

(declare-fun d!94269 () Bool)

(assert (=> d!94269 e!390050))

(declare-fun res!450503 () Bool)

(assert (=> d!94269 (=> (not res!450503) (not e!390050))))

(declare-fun size!19362 (List!13069) Int)

(assert (=> d!94269 (= res!450503 (<= (size!19362 lt!314340) (size!19362 lt!314268)))))

(assert (=> d!94269 (= lt!314340 e!390049)))

(declare-fun c!77595 () Bool)

(assert (=> d!94269 (= c!77595 ((_ is Cons!13065) lt!314268))))

(assert (=> d!94269 (= (-!159 lt!314268 k0!2843) lt!314340)))

(declare-fun b!684961 () Bool)

(assert (=> b!684961 (= e!390051 (Cons!13065 (h!14110 lt!314268) call!34035))))

(declare-fun b!684962 () Bool)

(assert (=> b!684962 (= e!390051 call!34035)))

(declare-fun b!684963 () Bool)

(assert (=> b!684963 (= e!390049 Nil!13066)))

(assert (= (and d!94269 c!77595) b!684959))

(assert (= (and d!94269 (not c!77595)) b!684963))

(assert (= (and b!684959 c!77596) b!684962))

(assert (= (and b!684959 (not c!77596)) b!684961))

(assert (= (or b!684962 b!684961) bm!34032))

(assert (= (and d!94269 res!450503) b!684960))

(declare-fun m!648691 () Bool)

(assert (=> b!684960 m!648691))

(declare-fun m!648693 () Bool)

(assert (=> b!684960 m!648693))

(declare-fun m!648695 () Bool)

(assert (=> b!684960 m!648695))

(declare-fun m!648697 () Bool)

(assert (=> bm!34032 m!648697))

(declare-fun m!648699 () Bool)

(assert (=> d!94269 m!648699))

(declare-fun m!648701 () Bool)

(assert (=> d!94269 m!648701))

(assert (=> b!684732 d!94269))

(assert (=> b!684732 d!94245))

(declare-fun d!94273 () Bool)

(declare-fun res!450504 () Bool)

(declare-fun e!390052 () Bool)

(assert (=> d!94273 (=> res!450504 e!390052)))

(assert (=> d!94273 (= res!450504 (= (select (arr!18989 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94273 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390052)))

(declare-fun b!684964 () Bool)

(declare-fun e!390053 () Bool)

(assert (=> b!684964 (= e!390052 e!390053)))

(declare-fun res!450505 () Bool)

(assert (=> b!684964 (=> (not res!450505) (not e!390053))))

(assert (=> b!684964 (= res!450505 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19359 a!3626)))))

(declare-fun b!684965 () Bool)

(assert (=> b!684965 (= e!390053 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94273 (not res!450504)) b!684964))

(assert (= (and b!684964 res!450505) b!684965))

(assert (=> d!94273 m!648663))

(declare-fun m!648703 () Bool)

(assert (=> b!684965 m!648703))

(assert (=> b!684732 d!94273))

(declare-fun d!94275 () Bool)

(assert (=> d!94275 (= (-!159 ($colon$colon!358 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314344 () Unit!24095)

(declare-fun choose!16 ((_ BitVec 64) List!13069) Unit!24095)

(assert (=> d!94275 (= lt!314344 (choose!16 k0!2843 acc!681))))

(assert (=> d!94275 (not (contains!3591 acc!681 k0!2843))))

(assert (=> d!94275 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314344)))

(declare-fun bs!20060 () Bool)

(assert (= bs!20060 d!94275))

(assert (=> bs!20060 m!648533))

(assert (=> bs!20060 m!648533))

(declare-fun m!648729 () Bool)

(assert (=> bs!20060 m!648729))

(declare-fun m!648731 () Bool)

(assert (=> bs!20060 m!648731))

(assert (=> bs!20060 m!648489))

(assert (=> b!684732 d!94275))

(declare-fun d!94285 () Bool)

(declare-fun res!450513 () Bool)

(declare-fun e!390065 () Bool)

(assert (=> d!94285 (=> res!450513 e!390065)))

(assert (=> d!94285 (= res!450513 (= (select (arr!18989 (array!39622 (store (arr!18989 a!3626) i!1382 k0!2843) (size!19359 a!3626))) from!3004) k0!2843))))

(assert (=> d!94285 (= (arrayContainsKey!0 (array!39622 (store (arr!18989 a!3626) i!1382 k0!2843) (size!19359 a!3626)) k0!2843 from!3004) e!390065)))

(declare-fun b!684981 () Bool)

(declare-fun e!390066 () Bool)

(assert (=> b!684981 (= e!390065 e!390066)))

(declare-fun res!450514 () Bool)

(assert (=> b!684981 (=> (not res!450514) (not e!390066))))

(assert (=> b!684981 (= res!450514 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19359 (array!39622 (store (arr!18989 a!3626) i!1382 k0!2843) (size!19359 a!3626)))))))

(declare-fun b!684982 () Bool)

(assert (=> b!684982 (= e!390066 (arrayContainsKey!0 (array!39622 (store (arr!18989 a!3626) i!1382 k0!2843) (size!19359 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94285 (not res!450513)) b!684981))

(assert (= (and b!684981 res!450514) b!684982))

(declare-fun m!648733 () Bool)

(assert (=> d!94285 m!648733))

(declare-fun m!648735 () Bool)

(assert (=> b!684982 m!648735))

(assert (=> b!684732 d!94285))

(assert (=> b!684732 d!94249))

(declare-fun d!94287 () Bool)

(assert (=> d!94287 (= (validKeyInArray!0 (select (arr!18989 a!3626) from!3004)) (and (not (= (select (arr!18989 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18989 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684732 d!94287))

(declare-fun d!94289 () Bool)

(assert (=> d!94289 (= ($colon$colon!358 acc!681 k0!2843) (Cons!13065 k0!2843 acc!681))))

(assert (=> b!684732 d!94289))

(assert (=> b!684732 d!94251))

(declare-fun b!684983 () Bool)

(declare-fun e!390067 () Bool)

(declare-fun call!34039 () Bool)

(assert (=> b!684983 (= e!390067 call!34039)))

(declare-fun e!390069 () Bool)

(declare-fun b!684985 () Bool)

(assert (=> b!684985 (= e!390069 (contains!3591 acc!681 (select (arr!18989 a!3626) from!3004)))))

(declare-fun b!684986 () Bool)

(declare-fun e!390070 () Bool)

(declare-fun e!390068 () Bool)

(assert (=> b!684986 (= e!390070 e!390068)))

(declare-fun res!450516 () Bool)

(assert (=> b!684986 (=> (not res!450516) (not e!390068))))

(assert (=> b!684986 (= res!450516 (not e!390069))))

(declare-fun res!450517 () Bool)

(assert (=> b!684986 (=> (not res!450517) (not e!390069))))

(assert (=> b!684986 (= res!450517 (validKeyInArray!0 (select (arr!18989 a!3626) from!3004)))))

(declare-fun b!684984 () Bool)

(assert (=> b!684984 (= e!390068 e!390067)))

(declare-fun c!77601 () Bool)

(assert (=> b!684984 (= c!77601 (validKeyInArray!0 (select (arr!18989 a!3626) from!3004)))))

(declare-fun d!94291 () Bool)

(declare-fun res!450515 () Bool)

(assert (=> d!94291 (=> res!450515 e!390070)))

(assert (=> d!94291 (= res!450515 (bvsge from!3004 (size!19359 a!3626)))))

(assert (=> d!94291 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390070)))

(declare-fun b!684987 () Bool)

(assert (=> b!684987 (= e!390067 call!34039)))

(declare-fun bm!34036 () Bool)

(assert (=> bm!34036 (= call!34039 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77601 (Cons!13065 (select (arr!18989 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!94291 (not res!450515)) b!684986))

(assert (= (and b!684986 res!450517) b!684985))

(assert (= (and b!684986 res!450516) b!684984))

(assert (= (and b!684984 c!77601) b!684983))

(assert (= (and b!684984 (not c!77601)) b!684987))

(assert (= (or b!684983 b!684987) bm!34036))

(assert (=> b!684985 m!648499))

(assert (=> b!684985 m!648499))

(declare-fun m!648737 () Bool)

(assert (=> b!684985 m!648737))

(assert (=> b!684986 m!648499))

(assert (=> b!684986 m!648499))

(assert (=> b!684986 m!648535))

(assert (=> b!684984 m!648499))

(assert (=> b!684984 m!648499))

(assert (=> b!684984 m!648535))

(assert (=> bm!34036 m!648499))

(declare-fun m!648741 () Bool)

(assert (=> bm!34036 m!648741))

(assert (=> b!684713 d!94291))

(declare-fun b!684990 () Bool)

(declare-fun e!390074 () Bool)

(declare-fun e!390076 () Bool)

(assert (=> b!684990 (= e!390074 e!390076)))

(declare-fun res!450520 () Bool)

(assert (=> b!684990 (=> (not res!450520) (not e!390076))))

(assert (=> b!684990 (= res!450520 ((_ is Cons!13065) lt!314268))))

(declare-fun b!684993 () Bool)

(declare-fun e!390075 () Bool)

(assert (=> b!684993 (= e!390075 (subseq!194 acc!681 (t!19309 lt!314268)))))

(declare-fun b!684991 () Bool)

(assert (=> b!684991 (= e!390076 e!390075)))

(declare-fun res!450523 () Bool)

(assert (=> b!684991 (=> res!450523 e!390075)))

(declare-fun e!390073 () Bool)

(assert (=> b!684991 (= res!450523 e!390073)))

(declare-fun res!450522 () Bool)

(assert (=> b!684991 (=> (not res!450522) (not e!390073))))

(assert (=> b!684991 (= res!450522 (= (h!14110 acc!681) (h!14110 lt!314268)))))

(declare-fun b!684992 () Bool)

(assert (=> b!684992 (= e!390073 (subseq!194 (t!19309 acc!681) (t!19309 lt!314268)))))

(declare-fun d!94295 () Bool)

(declare-fun res!450521 () Bool)

(assert (=> d!94295 (=> res!450521 e!390074)))

(assert (=> d!94295 (= res!450521 ((_ is Nil!13066) acc!681))))

(assert (=> d!94295 (= (subseq!194 acc!681 lt!314268) e!390074)))

(assert (= (and d!94295 (not res!450521)) b!684990))

(assert (= (and b!684990 res!450520) b!684991))

(assert (= (and b!684991 res!450522) b!684992))

(assert (= (and b!684991 (not res!450523)) b!684993))

(declare-fun m!648747 () Bool)

(assert (=> b!684993 m!648747))

(declare-fun m!648749 () Bool)

(assert (=> b!684992 m!648749))

(assert (=> b!684723 d!94295))

(declare-fun d!94299 () Bool)

(declare-fun lt!314349 () Bool)

(assert (=> d!94299 (= lt!314349 (select (content!288 lt!314268) k0!2843))))

(declare-fun e!390080 () Bool)

(assert (=> d!94299 (= lt!314349 e!390080)))

(declare-fun res!450527 () Bool)

(assert (=> d!94299 (=> (not res!450527) (not e!390080))))

(assert (=> d!94299 (= res!450527 ((_ is Cons!13065) lt!314268))))

(assert (=> d!94299 (= (contains!3591 lt!314268 k0!2843) lt!314349)))

(declare-fun b!684996 () Bool)

(declare-fun e!390079 () Bool)

(assert (=> b!684996 (= e!390080 e!390079)))

(declare-fun res!450526 () Bool)

(assert (=> b!684996 (=> res!450526 e!390079)))

(assert (=> b!684996 (= res!450526 (= (h!14110 lt!314268) k0!2843))))

(declare-fun b!684997 () Bool)

(assert (=> b!684997 (= e!390079 (contains!3591 (t!19309 lt!314268) k0!2843))))

(assert (= (and d!94299 res!450527) b!684996))

(assert (= (and b!684996 (not res!450526)) b!684997))

(assert (=> d!94299 m!648693))

(declare-fun m!648757 () Bool)

(assert (=> d!94299 m!648757))

(declare-fun m!648759 () Bool)

(assert (=> b!684997 m!648759))

(assert (=> b!684712 d!94299))

(declare-fun d!94303 () Bool)

(assert (=> d!94303 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314353 () Unit!24095)

(declare-fun choose!13 (array!39621 (_ BitVec 64) (_ BitVec 32)) Unit!24095)

(assert (=> d!94303 (= lt!314353 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94303 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94303 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314353)))

(declare-fun bs!20062 () Bool)

(assert (= bs!20062 d!94303))

(assert (=> bs!20062 m!648539))

(declare-fun m!648765 () Bool)

(assert (=> bs!20062 m!648765))

(assert (=> b!684725 d!94303))

(declare-fun d!94309 () Bool)

(declare-fun res!450554 () Bool)

(declare-fun e!390107 () Bool)

(assert (=> d!94309 (=> res!450554 e!390107)))

(assert (=> d!94309 (= res!450554 ((_ is Nil!13066) lt!314268))))

(assert (=> d!94309 (= (noDuplicate!860 lt!314268) e!390107)))

(declare-fun b!685024 () Bool)

(declare-fun e!390108 () Bool)

(assert (=> b!685024 (= e!390107 e!390108)))

(declare-fun res!450555 () Bool)

(assert (=> b!685024 (=> (not res!450555) (not e!390108))))

(assert (=> b!685024 (= res!450555 (not (contains!3591 (t!19309 lt!314268) (h!14110 lt!314268))))))

(declare-fun b!685025 () Bool)

(assert (=> b!685025 (= e!390108 (noDuplicate!860 (t!19309 lt!314268)))))

(assert (= (and d!94309 (not res!450554)) b!685024))

(assert (= (and b!685024 res!450555) b!685025))

(declare-fun m!648777 () Bool)

(assert (=> b!685024 m!648777))

(declare-fun m!648779 () Bool)

(assert (=> b!685025 m!648779))

(assert (=> b!684714 d!94309))

(declare-fun d!94317 () Bool)

(declare-fun lt!314355 () Bool)

(assert (=> d!94317 (= lt!314355 (select (content!288 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390110 () Bool)

(assert (=> d!94317 (= lt!314355 e!390110)))

(declare-fun res!450557 () Bool)

(assert (=> d!94317 (=> (not res!450557) (not e!390110))))

(assert (=> d!94317 (= res!450557 ((_ is Cons!13065) acc!681))))

(assert (=> d!94317 (= (contains!3591 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314355)))

(declare-fun b!685026 () Bool)

(declare-fun e!390109 () Bool)

(assert (=> b!685026 (= e!390110 e!390109)))

(declare-fun res!450556 () Bool)

(assert (=> b!685026 (=> res!450556 e!390109)))

(assert (=> b!685026 (= res!450556 (= (h!14110 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685027 () Bool)

(assert (=> b!685027 (= e!390109 (contains!3591 (t!19309 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94317 res!450557) b!685026))

(assert (= (and b!685026 (not res!450556)) b!685027))

(assert (=> d!94317 m!648677))

(declare-fun m!648781 () Bool)

(assert (=> d!94317 m!648781))

(declare-fun m!648783 () Bool)

(assert (=> b!685027 m!648783))

(assert (=> b!684726 d!94317))

(declare-fun d!94319 () Bool)

(declare-fun res!450558 () Bool)

(declare-fun e!390111 () Bool)

(assert (=> d!94319 (=> res!450558 e!390111)))

(assert (=> d!94319 (= res!450558 ((_ is Nil!13066) acc!681))))

(assert (=> d!94319 (= (noDuplicate!860 acc!681) e!390111)))

(declare-fun b!685028 () Bool)

(declare-fun e!390112 () Bool)

(assert (=> b!685028 (= e!390111 e!390112)))

(declare-fun res!450559 () Bool)

(assert (=> b!685028 (=> (not res!450559) (not e!390112))))

(assert (=> b!685028 (= res!450559 (not (contains!3591 (t!19309 acc!681) (h!14110 acc!681))))))

(declare-fun b!685029 () Bool)

(assert (=> b!685029 (= e!390112 (noDuplicate!860 (t!19309 acc!681)))))

(assert (= (and d!94319 (not res!450558)) b!685028))

(assert (= (and b!685028 res!450559) b!685029))

(declare-fun m!648785 () Bool)

(assert (=> b!685028 m!648785))

(declare-fun m!648787 () Bool)

(assert (=> b!685029 m!648787))

(assert (=> b!684715 d!94319))

(check-sat (not b!684960) (not b!684884) (not b!685029) (not bm!34024) (not b!684883) (not d!94257) (not d!94299) (not bm!34036) (not b!684984) (not b!684993) (not b!684903) (not b!685024) (not b!685025) (not bm!34025) (not b!684965) (not b!684882) (not b!684905) (not d!94317) (not b!684920) (not b!684891) (not b!685028) (not b!684922) (not b!684997) (not b!684902) (not b!684992) (not bm!34032) (not d!94275) (not b!685027) (not d!94249) (not b!684907) (not d!94265) (not b!684985) (not b!684906) (not d!94269) (not d!94303) (not b!684986) (not b!684982) (not d!94247))
(check-sat)
