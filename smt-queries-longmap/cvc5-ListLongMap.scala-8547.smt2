; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104268 () Bool)

(assert start!104268)

(declare-fun b!1245558 () Bool)

(declare-fun e!706299 () Bool)

(declare-datatypes ((List!27481 0))(
  ( (Nil!27478) (Cons!27477 (h!28686 (_ BitVec 64)) (t!40950 List!27481)) )
))
(declare-fun lt!562939 () List!27481)

(declare-fun contains!7447 (List!27481 (_ BitVec 64)) Bool)

(assert (=> b!1245558 (= e!706299 (contains!7447 lt!562939 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245559 () Bool)

(declare-fun res!831021 () Bool)

(declare-fun e!706297 () Bool)

(assert (=> b!1245559 (=> (not res!831021) (not e!706297))))

(declare-datatypes ((array!80190 0))(
  ( (array!80191 (arr!38678 (Array (_ BitVec 32) (_ BitVec 64))) (size!39214 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80190)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245559 (= res!831021 (validKeyInArray!0 (select (arr!38678 a!3892) from!3270)))))

(declare-fun b!1245560 () Bool)

(declare-fun e!706300 () Bool)

(assert (=> b!1245560 (= e!706300 e!706299)))

(declare-fun res!831017 () Bool)

(assert (=> b!1245560 (=> res!831017 e!706299)))

(assert (=> b!1245560 (= res!831017 (contains!7447 lt!562939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245561 () Bool)

(declare-fun res!831018 () Bool)

(assert (=> b!1245561 (=> (not res!831018) (not e!706297))))

(declare-fun arrayNoDuplicates!0 (array!80190 (_ BitVec 32) List!27481) Bool)

(assert (=> b!1245561 (= res!831018 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27478))))

(declare-fun res!831020 () Bool)

(assert (=> start!104268 (=> (not res!831020) (not e!706297))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104268 (= res!831020 (and (bvslt (size!39214 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39214 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39214 a!3892))))))

(assert (=> start!104268 e!706297))

(declare-fun array_inv!29526 (array!80190) Bool)

(assert (=> start!104268 (array_inv!29526 a!3892)))

(assert (=> start!104268 true))

(declare-fun b!1245562 () Bool)

(declare-fun res!831023 () Bool)

(assert (=> b!1245562 (=> (not res!831023) (not e!706297))))

(assert (=> b!1245562 (= res!831023 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39214 a!3892)) (not (= newFrom!287 (size!39214 a!3892)))))))

(declare-fun b!1245563 () Bool)

(declare-fun res!831019 () Bool)

(assert (=> b!1245563 (=> (not res!831019) (not e!706300))))

(declare-fun noDuplicate!2026 (List!27481) Bool)

(assert (=> b!1245563 (= res!831019 (noDuplicate!2026 lt!562939))))

(declare-fun b!1245564 () Bool)

(assert (=> b!1245564 (= e!706297 e!706300)))

(declare-fun res!831022 () Bool)

(assert (=> b!1245564 (=> (not res!831022) (not e!706300))))

(assert (=> b!1245564 (= res!831022 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1245564 (= lt!562939 (Cons!27477 (select (arr!38678 a!3892) from!3270) Nil!27478))))

(assert (= (and start!104268 res!831020) b!1245561))

(assert (= (and b!1245561 res!831018) b!1245562))

(assert (= (and b!1245562 res!831023) b!1245559))

(assert (= (and b!1245559 res!831021) b!1245564))

(assert (= (and b!1245564 res!831022) b!1245563))

(assert (= (and b!1245563 res!831019) b!1245560))

(assert (= (and b!1245560 (not res!831017)) b!1245558))

(declare-fun m!1147587 () Bool)

(assert (=> b!1245560 m!1147587))

(declare-fun m!1147589 () Bool)

(assert (=> b!1245558 m!1147589))

(declare-fun m!1147591 () Bool)

(assert (=> b!1245561 m!1147591))

(declare-fun m!1147593 () Bool)

(assert (=> b!1245559 m!1147593))

(assert (=> b!1245559 m!1147593))

(declare-fun m!1147595 () Bool)

(assert (=> b!1245559 m!1147595))

(declare-fun m!1147597 () Bool)

(assert (=> start!104268 m!1147597))

(assert (=> b!1245564 m!1147593))

(declare-fun m!1147599 () Bool)

(assert (=> b!1245563 m!1147599))

(push 1)

(assert (not b!1245558))

(assert (not b!1245561))

(assert (not b!1245560))

(assert (not start!104268))

(assert (not b!1245563))

(assert (not b!1245559))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137411 () Bool)

(assert (=> d!137411 (= (validKeyInArray!0 (select (arr!38678 a!3892) from!3270)) (and (not (= (select (arr!38678 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38678 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245559 d!137411))

(declare-fun d!137415 () Bool)

(declare-fun lt!562951 () Bool)

(declare-fun content!622 (List!27481) (Set (_ BitVec 64)))

(assert (=> d!137415 (= lt!562951 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!622 lt!562939)))))

(declare-fun e!706343 () Bool)

(assert (=> d!137415 (= lt!562951 e!706343)))

(declare-fun res!831083 () Bool)

(assert (=> d!137415 (=> (not res!831083) (not e!706343))))

(assert (=> d!137415 (= res!831083 (is-Cons!27477 lt!562939))))

(assert (=> d!137415 (= (contains!7447 lt!562939 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562951)))

(declare-fun b!1245627 () Bool)

(declare-fun e!706344 () Bool)

(assert (=> b!1245627 (= e!706343 e!706344)))

(declare-fun res!831082 () Bool)

(assert (=> b!1245627 (=> res!831082 e!706344)))

(assert (=> b!1245627 (= res!831082 (= (h!28686 lt!562939) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245628 () Bool)

(assert (=> b!1245628 (= e!706344 (contains!7447 (t!40950 lt!562939) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137415 res!831083) b!1245627))

(assert (= (and b!1245627 (not res!831082)) b!1245628))

(declare-fun m!1147635 () Bool)

(assert (=> d!137415 m!1147635))

(declare-fun m!1147637 () Bool)

(assert (=> d!137415 m!1147637))

(declare-fun m!1147639 () Bool)

(assert (=> b!1245628 m!1147639))

(assert (=> b!1245560 d!137415))

(declare-fun d!137417 () Bool)

(declare-fun lt!562952 () Bool)

(assert (=> d!137417 (= lt!562952 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!622 lt!562939)))))

(declare-fun e!706345 () Bool)

(assert (=> d!137417 (= lt!562952 e!706345)))

(declare-fun res!831085 () Bool)

(assert (=> d!137417 (=> (not res!831085) (not e!706345))))

(assert (=> d!137417 (= res!831085 (is-Cons!27477 lt!562939))))

(assert (=> d!137417 (= (contains!7447 lt!562939 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562952)))

(declare-fun b!1245629 () Bool)

(declare-fun e!706346 () Bool)

(assert (=> b!1245629 (= e!706345 e!706346)))

(declare-fun res!831084 () Bool)

(assert (=> b!1245629 (=> res!831084 e!706346)))

(assert (=> b!1245629 (= res!831084 (= (h!28686 lt!562939) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245630 () Bool)

(assert (=> b!1245630 (= e!706346 (contains!7447 (t!40950 lt!562939) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137417 res!831085) b!1245629))

(assert (= (and b!1245629 (not res!831084)) b!1245630))

(assert (=> d!137417 m!1147635))

(declare-fun m!1147641 () Bool)

(assert (=> d!137417 m!1147641))

(declare-fun m!1147643 () Bool)

(assert (=> b!1245630 m!1147643))

(assert (=> b!1245558 d!137417))

(declare-fun d!137419 () Bool)

(declare-fun res!831093 () Bool)

(declare-fun e!706355 () Bool)

(assert (=> d!137419 (=> res!831093 e!706355)))

(assert (=> d!137419 (= res!831093 (is-Nil!27478 lt!562939))))

(assert (=> d!137419 (= (noDuplicate!2026 lt!562939) e!706355)))

(declare-fun b!1245640 () Bool)

(declare-fun e!706356 () Bool)

(assert (=> b!1245640 (= e!706355 e!706356)))

(declare-fun res!831094 () Bool)

(assert (=> b!1245640 (=> (not res!831094) (not e!706356))))

(assert (=> b!1245640 (= res!831094 (not (contains!7447 (t!40950 lt!562939) (h!28686 lt!562939))))))

(declare-fun b!1245641 () Bool)

(assert (=> b!1245641 (= e!706356 (noDuplicate!2026 (t!40950 lt!562939)))))

(assert (= (and d!137419 (not res!831093)) b!1245640))

(assert (= (and b!1245640 res!831094) b!1245641))

(declare-fun m!1147649 () Bool)

(assert (=> b!1245640 m!1147649))

(declare-fun m!1147651 () Bool)

(assert (=> b!1245641 m!1147651))

(assert (=> b!1245563 d!137419))

(declare-fun d!137423 () Bool)

(assert (=> d!137423 (= (array_inv!29526 a!3892) (bvsge (size!39214 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104268 d!137423))

(declare-fun b!1245670 () Bool)

(declare-fun e!706381 () Bool)

(declare-fun e!706383 () Bool)

(assert (=> b!1245670 (= e!706381 e!706383)))

(declare-fun c!121962 () Bool)

(assert (=> b!1245670 (= c!121962 (validKeyInArray!0 (select (arr!38678 a!3892) from!3270)))))

(declare-fun b!1245671 () Bool)

(declare-fun call!61494 () Bool)

(assert (=> b!1245671 (= e!706383 call!61494)))

(declare-fun d!137425 () Bool)

(declare-fun res!831117 () Bool)

(declare-fun e!706382 () Bool)

(assert (=> d!137425 (=> res!831117 e!706382)))

(assert (=> d!137425 (= res!831117 (bvsge from!3270 (size!39214 a!3892)))))

(assert (=> d!137425 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27478) e!706382)))

(declare-fun b!1245672 () Bool)

(assert (=> b!1245672 (= e!706382 e!706381)))

(declare-fun res!831116 () Bool)

(assert (=> b!1245672 (=> (not res!831116) (not e!706381))))

(declare-fun e!706384 () Bool)

(assert (=> b!1245672 (= res!831116 (not e!706384))))

(declare-fun res!831115 () Bool)

(assert (=> b!1245672 (=> (not res!831115) (not e!706384))))

(assert (=> b!1245672 (= res!831115 (validKeyInArray!0 (select (arr!38678 a!3892) from!3270)))))

(declare-fun bm!61491 () Bool)

(assert (=> bm!61491 (= call!61494 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121962 (Cons!27477 (select (arr!38678 a!3892) from!3270) Nil!27478) Nil!27478)))))

(declare-fun b!1245673 () Bool)

(assert (=> b!1245673 (= e!706384 (contains!7447 Nil!27478 (select (arr!38678 a!3892) from!3270)))))

(declare-fun b!1245674 () Bool)

(assert (=> b!1245674 (= e!706383 call!61494)))

(assert (= (and d!137425 (not res!831117)) b!1245672))

(assert (= (and b!1245672 res!831115) b!1245673))

(assert (= (and b!1245672 res!831116) b!1245670))

(assert (= (and b!1245670 c!121962) b!1245674))

(assert (= (and b!1245670 (not c!121962)) b!1245671))

(assert (= (or b!1245674 b!1245671) bm!61491))

(assert (=> b!1245670 m!1147593))

(assert (=> b!1245670 m!1147593))

(assert (=> b!1245670 m!1147595))

(assert (=> b!1245672 m!1147593))

(assert (=> b!1245672 m!1147593))

(assert (=> b!1245672 m!1147595))

(assert (=> bm!61491 m!1147593))

(declare-fun m!1147661 () Bool)

(assert (=> bm!61491 m!1147661))

(assert (=> b!1245673 m!1147593))

(assert (=> b!1245673 m!1147593))

(declare-fun m!1147663 () Bool)

(assert (=> b!1245673 m!1147663))

(assert (=> b!1245561 d!137425))

(push 1)

(assert (not b!1245628))

(assert (not b!1245670))

(assert (not b!1245630))

(assert (not b!1245641))

(assert (not b!1245640))

(assert (not d!137415))

(assert (not b!1245672))

(assert (not b!1245673))

(assert (not d!137417))

(assert (not bm!61491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137455 () Bool)

(declare-fun lt!562962 () Bool)

(assert (=> d!137455 (= lt!562962 (set.member (select (arr!38678 a!3892) from!3270) (content!622 Nil!27478)))))

(declare-fun e!706420 () Bool)

(assert (=> d!137455 (= lt!562962 e!706420)))

(declare-fun res!831149 () Bool)

(assert (=> d!137455 (=> (not res!831149) (not e!706420))))

(assert (=> d!137455 (= res!831149 (is-Cons!27477 Nil!27478))))

(assert (=> d!137455 (= (contains!7447 Nil!27478 (select (arr!38678 a!3892) from!3270)) lt!562962)))

(declare-fun b!1245715 () Bool)

(declare-fun e!706421 () Bool)

(assert (=> b!1245715 (= e!706420 e!706421)))

(declare-fun res!831148 () Bool)

(assert (=> b!1245715 (=> res!831148 e!706421)))

(assert (=> b!1245715 (= res!831148 (= (h!28686 Nil!27478) (select (arr!38678 a!3892) from!3270)))))

(declare-fun b!1245716 () Bool)

(assert (=> b!1245716 (= e!706421 (contains!7447 (t!40950 Nil!27478) (select (arr!38678 a!3892) from!3270)))))

(assert (= (and d!137455 res!831149) b!1245715))

(assert (= (and b!1245715 (not res!831148)) b!1245716))

(declare-fun m!1147717 () Bool)

(assert (=> d!137455 m!1147717))

(assert (=> d!137455 m!1147593))

(declare-fun m!1147719 () Bool)

(assert (=> d!137455 m!1147719))

(assert (=> b!1245716 m!1147593))

(declare-fun m!1147721 () Bool)

(assert (=> b!1245716 m!1147721))

(assert (=> b!1245673 d!137455))

(declare-fun d!137457 () Bool)

(declare-fun c!121970 () Bool)

(assert (=> d!137457 (= c!121970 (is-Nil!27478 lt!562939))))

(declare-fun e!706424 () (Set (_ BitVec 64)))

(assert (=> d!137457 (= (content!622 lt!562939) e!706424)))

(declare-fun b!1245721 () Bool)

(assert (=> b!1245721 (= e!706424 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!1245722 () Bool)

(assert (=> b!1245722 (= e!706424 (set.union (set.insert (h!28686 lt!562939) (as set.empty (Set (_ BitVec 64)))) (content!622 (t!40950 lt!562939))))))

(assert (= (and d!137457 c!121970) b!1245721))

