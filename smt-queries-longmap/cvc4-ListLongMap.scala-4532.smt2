; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62718 () Bool)

(assert start!62718)

(declare-fun b!707929 () Bool)

(declare-fun res!471694 () Bool)

(declare-fun e!398329 () Bool)

(assert (=> b!707929 (=> (not res!471694) (not e!398329))))

(declare-datatypes ((List!13369 0))(
  ( (Nil!13366) (Cons!13365 (h!14410 (_ BitVec 64)) (t!19654 List!13369)) )
))
(declare-fun acc!652 () List!13369)

(declare-fun contains!3946 (List!13369 (_ BitVec 64)) Bool)

(assert (=> b!707929 (= res!471694 (not (contains!3946 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707930 () Bool)

(declare-fun res!471702 () Bool)

(assert (=> b!707930 (=> (not res!471702) (not e!398329))))

(declare-datatypes ((array!40346 0))(
  ( (array!40347 (arr!19328 (Array (_ BitVec 32) (_ BitVec 64))) (size!19715 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40346)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun noDuplicate!1193 (List!13369) Bool)

(declare-fun $colon$colon!502 (List!13369 (_ BitVec 64)) List!13369)

(assert (=> b!707930 (= res!471702 (noDuplicate!1193 ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969))))))

(declare-fun b!707931 () Bool)

(declare-fun res!471686 () Bool)

(assert (=> b!707931 (=> (not res!471686) (not e!398329))))

(declare-fun newAcc!49 () List!13369)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!356 (List!13369 (_ BitVec 64)) List!13369)

(assert (=> b!707931 (= res!471686 (= (-!356 newAcc!49 k!2824) acc!652))))

(declare-fun b!707933 () Bool)

(declare-fun res!471687 () Bool)

(assert (=> b!707933 (=> (not res!471687) (not e!398329))))

(assert (=> b!707933 (= res!471687 (noDuplicate!1193 acc!652))))

(declare-fun b!707934 () Bool)

(declare-fun res!471689 () Bool)

(assert (=> b!707934 (=> (not res!471689) (not e!398329))))

(declare-fun arrayContainsKey!0 (array!40346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707934 (= res!471689 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707935 () Bool)

(declare-fun res!471698 () Bool)

(assert (=> b!707935 (=> (not res!471698) (not e!398329))))

(declare-fun subseq!391 (List!13369 List!13369) Bool)

(assert (=> b!707935 (= res!471698 (subseq!391 acc!652 newAcc!49))))

(declare-fun b!707936 () Bool)

(declare-fun res!471688 () Bool)

(assert (=> b!707936 (=> (not res!471688) (not e!398329))))

(declare-fun arrayNoDuplicates!0 (array!40346 (_ BitVec 32) List!13369) Bool)

(assert (=> b!707936 (= res!471688 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707937 () Bool)

(declare-fun res!471700 () Bool)

(assert (=> b!707937 (=> (not res!471700) (not e!398329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707937 (= res!471700 (validKeyInArray!0 k!2824))))

(declare-fun b!707938 () Bool)

(declare-fun res!471690 () Bool)

(assert (=> b!707938 (=> (not res!471690) (not e!398329))))

(assert (=> b!707938 (= res!471690 (not (contains!3946 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707939 () Bool)

(declare-fun res!471696 () Bool)

(assert (=> b!707939 (=> (not res!471696) (not e!398329))))

(assert (=> b!707939 (= res!471696 (not (contains!3946 acc!652 k!2824)))))

(declare-fun b!707940 () Bool)

(declare-fun res!471701 () Bool)

(assert (=> b!707940 (=> (not res!471701) (not e!398329))))

(assert (=> b!707940 (= res!471701 (validKeyInArray!0 (select (arr!19328 a!3591) from!2969)))))

(declare-fun b!707941 () Bool)

(declare-fun res!471699 () Bool)

(assert (=> b!707941 (=> (not res!471699) (not e!398329))))

(assert (=> b!707941 (= res!471699 (noDuplicate!1193 newAcc!49))))

(declare-fun b!707942 () Bool)

(declare-fun res!471695 () Bool)

(assert (=> b!707942 (=> (not res!471695) (not e!398329))))

(assert (=> b!707942 (= res!471695 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707943 () Bool)

(assert (=> b!707943 (= e!398329 (not (noDuplicate!1193 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969)))))))

(declare-fun b!707944 () Bool)

(declare-fun res!471693 () Bool)

(assert (=> b!707944 (=> (not res!471693) (not e!398329))))

(assert (=> b!707944 (= res!471693 (contains!3946 newAcc!49 k!2824))))

(declare-fun b!707932 () Bool)

(declare-fun res!471685 () Bool)

(assert (=> b!707932 (=> (not res!471685) (not e!398329))))

(assert (=> b!707932 (= res!471685 (not (contains!3946 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!471697 () Bool)

(assert (=> start!62718 (=> (not res!471697) (not e!398329))))

(assert (=> start!62718 (= res!471697 (and (bvslt (size!19715 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19715 a!3591))))))

(assert (=> start!62718 e!398329))

(assert (=> start!62718 true))

(declare-fun array_inv!15124 (array!40346) Bool)

(assert (=> start!62718 (array_inv!15124 a!3591)))

(declare-fun b!707945 () Bool)

(declare-fun res!471692 () Bool)

(assert (=> b!707945 (=> (not res!471692) (not e!398329))))

(assert (=> b!707945 (= res!471692 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19715 a!3591)))))

(declare-fun b!707946 () Bool)

(declare-fun res!471691 () Bool)

(assert (=> b!707946 (=> (not res!471691) (not e!398329))))

(assert (=> b!707946 (= res!471691 (not (contains!3946 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62718 res!471697) b!707933))

(assert (= (and b!707933 res!471687) b!707941))

(assert (= (and b!707941 res!471699) b!707929))

(assert (= (and b!707929 res!471694) b!707938))

(assert (= (and b!707938 res!471690) b!707934))

(assert (= (and b!707934 res!471689) b!707939))

(assert (= (and b!707939 res!471696) b!707937))

(assert (= (and b!707937 res!471700) b!707936))

(assert (= (and b!707936 res!471688) b!707935))

(assert (= (and b!707935 res!471698) b!707944))

(assert (= (and b!707944 res!471693) b!707931))

(assert (= (and b!707931 res!471686) b!707946))

(assert (= (and b!707946 res!471691) b!707932))

(assert (= (and b!707932 res!471685) b!707945))

(assert (= (and b!707945 res!471692) b!707940))

(assert (= (and b!707940 res!471701) b!707942))

(assert (= (and b!707942 res!471695) b!707930))

(assert (= (and b!707930 res!471702) b!707943))

(declare-fun m!665379 () Bool)

(assert (=> b!707944 m!665379))

(declare-fun m!665381 () Bool)

(assert (=> b!707941 m!665381))

(declare-fun m!665383 () Bool)

(assert (=> b!707929 m!665383))

(declare-fun m!665385 () Bool)

(assert (=> b!707946 m!665385))

(declare-fun m!665387 () Bool)

(assert (=> b!707937 m!665387))

(declare-fun m!665389 () Bool)

(assert (=> b!707934 m!665389))

(declare-fun m!665391 () Bool)

(assert (=> b!707935 m!665391))

(declare-fun m!665393 () Bool)

(assert (=> b!707938 m!665393))

(declare-fun m!665395 () Bool)

(assert (=> b!707931 m!665395))

(declare-fun m!665397 () Bool)

(assert (=> b!707940 m!665397))

(assert (=> b!707940 m!665397))

(declare-fun m!665399 () Bool)

(assert (=> b!707940 m!665399))

(declare-fun m!665401 () Bool)

(assert (=> b!707932 m!665401))

(assert (=> b!707930 m!665397))

(assert (=> b!707930 m!665397))

(declare-fun m!665403 () Bool)

(assert (=> b!707930 m!665403))

(assert (=> b!707930 m!665403))

(declare-fun m!665405 () Bool)

(assert (=> b!707930 m!665405))

(declare-fun m!665407 () Bool)

(assert (=> b!707936 m!665407))

(declare-fun m!665409 () Bool)

(assert (=> b!707933 m!665409))

(assert (=> b!707943 m!665397))

(assert (=> b!707943 m!665397))

(declare-fun m!665411 () Bool)

(assert (=> b!707943 m!665411))

(assert (=> b!707943 m!665411))

(declare-fun m!665413 () Bool)

(assert (=> b!707943 m!665413))

(declare-fun m!665415 () Bool)

(assert (=> b!707939 m!665415))

(declare-fun m!665417 () Bool)

(assert (=> start!62718 m!665417))

(push 1)

(assert (not b!707930))

(assert (not b!707932))

(assert (not b!707943))

(assert (not b!707935))

(assert (not b!707941))

(assert (not b!707940))

(assert (not b!707939))

(assert (not b!707929))

(assert (not b!707946))

(assert (not b!707936))

(assert (not start!62718))

(assert (not b!707934))

(assert (not b!707937))

(assert (not b!707931))

(assert (not b!707938))

(assert (not b!707944))

(assert (not b!707933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!708017 () Bool)

(declare-fun e!398398 () List!13369)

(declare-fun call!34379 () List!13369)

(assert (=> b!708017 (= e!398398 call!34379)))

(declare-fun d!96613 () Bool)

(declare-fun e!398397 () Bool)

(assert (=> d!96613 e!398397))

(declare-fun res!471765 () Bool)

(assert (=> d!96613 (=> (not res!471765) (not e!398397))))

(declare-fun lt!318046 () List!13369)

(declare-fun size!19716 (List!13369) Int)

(assert (=> d!96613 (= res!471765 (<= (size!19716 lt!318046) (size!19716 newAcc!49)))))

(declare-fun e!398399 () List!13369)

(assert (=> d!96613 (= lt!318046 e!398399)))

(declare-fun c!78494 () Bool)

(assert (=> d!96613 (= c!78494 (is-Cons!13365 newAcc!49))))

(assert (=> d!96613 (= (-!356 newAcc!49 k!2824) lt!318046)))

(declare-fun b!708018 () Bool)

(assert (=> b!708018 (= e!398398 (Cons!13365 (h!14410 newAcc!49) call!34379))))

(declare-fun bm!34376 () Bool)

(assert (=> bm!34376 (= call!34379 (-!356 (t!19654 newAcc!49) k!2824))))

(declare-fun b!708019 () Bool)

(assert (=> b!708019 (= e!398399 e!398398)))

(declare-fun c!78493 () Bool)

(assert (=> b!708019 (= c!78493 (= k!2824 (h!14410 newAcc!49)))))

(declare-fun b!708020 () Bool)

(assert (=> b!708020 (= e!398399 Nil!13366)))

(declare-fun b!708021 () Bool)

(declare-fun content!336 (List!13369) (Set (_ BitVec 64)))

(assert (=> b!708021 (= e!398397 (= (content!336 lt!318046) (setminus (content!336 newAcc!49) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(assert (= (and d!96613 c!78494) b!708019))

(assert (= (and d!96613 (not c!78494)) b!708020))

(assert (= (and b!708019 c!78493) b!708017))

(assert (= (and b!708019 (not c!78493)) b!708018))

(assert (= (or b!708017 b!708018) bm!34376))

(assert (= (and d!96613 res!471765) b!708021))

(declare-fun m!665473 () Bool)

(assert (=> d!96613 m!665473))

(declare-fun m!665475 () Bool)

(assert (=> d!96613 m!665475))

(declare-fun m!665477 () Bool)

(assert (=> bm!34376 m!665477))

(declare-fun m!665479 () Bool)

(assert (=> b!708021 m!665479))

(declare-fun m!665481 () Bool)

(assert (=> b!708021 m!665481))

(declare-fun m!665483 () Bool)

(assert (=> b!708021 m!665483))

(assert (=> b!707931 d!96613))

(declare-fun d!96645 () Bool)

(declare-fun lt!318052 () Bool)

(assert (=> d!96645 (= lt!318052 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!336 newAcc!49)))))

(declare-fun e!398414 () Bool)

(assert (=> d!96645 (= lt!318052 e!398414)))

(declare-fun res!471775 () Bool)

(assert (=> d!96645 (=> (not res!471775) (not e!398414))))

(assert (=> d!96645 (= res!471775 (is-Cons!13365 newAcc!49))))

(assert (=> d!96645 (= (contains!3946 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318052)))

(declare-fun b!708038 () Bool)

(declare-fun e!398413 () Bool)

(assert (=> b!708038 (= e!398414 e!398413)))

(declare-fun res!471774 () Bool)

(assert (=> b!708038 (=> res!471774 e!398413)))

(assert (=> b!708038 (= res!471774 (= (h!14410 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708039 () Bool)

(assert (=> b!708039 (= e!398413 (contains!3946 (t!19654 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96645 res!471775) b!708038))

(assert (= (and b!708038 (not res!471774)) b!708039))

(assert (=> d!96645 m!665481))

(declare-fun m!665489 () Bool)

(assert (=> d!96645 m!665489))

(declare-fun m!665491 () Bool)

(assert (=> b!708039 m!665491))

(assert (=> b!707932 d!96645))

(declare-fun d!96649 () Bool)

(declare-fun res!471788 () Bool)

(declare-fun e!398429 () Bool)

(assert (=> d!96649 (=> res!471788 e!398429)))

(assert (=> d!96649 (= res!471788 (is-Nil!13366 ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969))))))

(assert (=> d!96649 (= (noDuplicate!1193 ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969))) e!398429)))

(declare-fun b!708056 () Bool)

(declare-fun e!398430 () Bool)

(assert (=> b!708056 (= e!398429 e!398430)))

(declare-fun res!471789 () Bool)

(assert (=> b!708056 (=> (not res!471789) (not e!398430))))

(assert (=> b!708056 (= res!471789 (not (contains!3946 (t!19654 ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969))) (h!14410 ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969))))))))

(declare-fun b!708057 () Bool)

(assert (=> b!708057 (= e!398430 (noDuplicate!1193 (t!19654 ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969)))))))

(assert (= (and d!96649 (not res!471788)) b!708056))

(assert (= (and b!708056 res!471789) b!708057))

(declare-fun m!665493 () Bool)

(assert (=> b!708056 m!665493))

(declare-fun m!665495 () Bool)

(assert (=> b!708057 m!665495))

(assert (=> b!707930 d!96649))

(declare-fun d!96651 () Bool)

(assert (=> d!96651 (= ($colon$colon!502 acc!652 (select (arr!19328 a!3591) from!2969)) (Cons!13365 (select (arr!19328 a!3591) from!2969) acc!652))))

(assert (=> b!707930 d!96651))

(declare-fun d!96653 () Bool)

(declare-fun res!471791 () Bool)

(declare-fun e!398434 () Bool)

(assert (=> d!96653 (=> res!471791 e!398434)))

(assert (=> d!96653 (= res!471791 (is-Nil!13366 newAcc!49))))

(assert (=> d!96653 (= (noDuplicate!1193 newAcc!49) e!398434)))

(declare-fun b!708063 () Bool)

(declare-fun e!398435 () Bool)

(assert (=> b!708063 (= e!398434 e!398435)))

(declare-fun res!471792 () Bool)

(assert (=> b!708063 (=> (not res!471792) (not e!398435))))

(assert (=> b!708063 (= res!471792 (not (contains!3946 (t!19654 newAcc!49) (h!14410 newAcc!49))))))

(declare-fun b!708064 () Bool)

(assert (=> b!708064 (= e!398435 (noDuplicate!1193 (t!19654 newAcc!49)))))

(assert (= (and d!96653 (not res!471791)) b!708063))

(assert (= (and b!708063 res!471792) b!708064))

(declare-fun m!665509 () Bool)

(assert (=> b!708063 m!665509))

(declare-fun m!665511 () Bool)

(assert (=> b!708064 m!665511))

(assert (=> b!707941 d!96653))

(declare-fun d!96657 () Bool)

(declare-fun res!471806 () Bool)

(declare-fun e!398450 () Bool)

(assert (=> d!96657 (=> res!471806 e!398450)))

(assert (=> d!96657 (= res!471806 (= (select (arr!19328 a!3591) from!2969) k!2824))))

(assert (=> d!96657 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!398450)))

(declare-fun b!708080 () Bool)

(declare-fun e!398451 () Bool)

(assert (=> b!708080 (= e!398450 e!398451)))

(declare-fun res!471807 () Bool)

(assert (=> b!708080 (=> (not res!471807) (not e!398451))))

(assert (=> b!708080 (= res!471807 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19715 a!3591)))))

(declare-fun b!708081 () Bool)

(assert (=> b!708081 (= e!398451 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96657 (not res!471806)) b!708080))

(assert (= (and b!708080 res!471807) b!708081))

(assert (=> d!96657 m!665397))

(declare-fun m!665519 () Bool)

(assert (=> b!708081 m!665519))

(assert (=> b!707934 d!96657))

(declare-fun d!96663 () Bool)

(declare-fun res!471808 () Bool)

(declare-fun e!398452 () Bool)

(assert (=> d!96663 (=> res!471808 e!398452)))

(assert (=> d!96663 (= res!471808 (is-Nil!13366 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))))))

(assert (=> d!96663 (= (noDuplicate!1193 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))) e!398452)))

(declare-fun b!708082 () Bool)

(declare-fun e!398453 () Bool)

(assert (=> b!708082 (= e!398452 e!398453)))

(declare-fun res!471809 () Bool)

(assert (=> b!708082 (=> (not res!471809) (not e!398453))))

(assert (=> b!708082 (= res!471809 (not (contains!3946 (t!19654 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))) (h!14410 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969))))))))

(declare-fun b!708083 () Bool)

(assert (=> b!708083 (= e!398453 (noDuplicate!1193 (t!19654 ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969)))))))

(assert (= (and d!96663 (not res!471808)) b!708082))

(assert (= (and b!708082 res!471809) b!708083))

(declare-fun m!665521 () Bool)

(assert (=> b!708082 m!665521))

(declare-fun m!665523 () Bool)

(assert (=> b!708083 m!665523))

(assert (=> b!707943 d!96663))

(declare-fun d!96665 () Bool)

(assert (=> d!96665 (= ($colon$colon!502 newAcc!49 (select (arr!19328 a!3591) from!2969)) (Cons!13365 (select (arr!19328 a!3591) from!2969) newAcc!49))))

(assert (=> b!707943 d!96665))

(declare-fun d!96667 () Bool)

(declare-fun lt!318054 () Bool)

(assert (=> d!96667 (= lt!318054 (member k!2824 (content!336 newAcc!49)))))

(declare-fun e!398455 () Bool)

(assert (=> d!96667 (= lt!318054 e!398455)))

(declare-fun res!471811 () Bool)

(assert (=> d!96667 (=> (not res!471811) (not e!398455))))

(assert (=> d!96667 (= res!471811 (is-Cons!13365 newAcc!49))))

(assert (=> d!96667 (= (contains!3946 newAcc!49 k!2824) lt!318054)))

(declare-fun b!708084 () Bool)

(declare-fun e!398454 () Bool)

(assert (=> b!708084 (= e!398455 e!398454)))

(declare-fun res!471810 () Bool)

(assert (=> b!708084 (=> res!471810 e!398454)))

(assert (=> b!708084 (= res!471810 (= (h!14410 newAcc!49) k!2824))))

(declare-fun b!708085 () Bool)

(assert (=> b!708085 (= e!398454 (contains!3946 (t!19654 newAcc!49) k!2824))))

(assert (= (and d!96667 res!471811) b!708084))

(assert (= (and b!708084 (not res!471810)) b!708085))

(assert (=> d!96667 m!665481))

(declare-fun m!665525 () Bool)

(assert (=> d!96667 m!665525))

(declare-fun m!665527 () Bool)

(assert (=> b!708085 m!665527))

(assert (=> b!707944 d!96667))

(declare-fun d!96669 () Bool)

(declare-fun res!471812 () Bool)

(declare-fun e!398456 () Bool)

(assert (=> d!96669 (=> res!471812 e!398456)))

(assert (=> d!96669 (= res!471812 (is-Nil!13366 acc!652))))

(assert (=> d!96669 (= (noDuplicate!1193 acc!652) e!398456)))

(declare-fun b!708086 () Bool)

(declare-fun e!398457 () Bool)

(assert (=> b!708086 (= e!398456 e!398457)))

(declare-fun res!471813 () Bool)

(assert (=> b!708086 (=> (not res!471813) (not e!398457))))

(assert (=> b!708086 (= res!471813 (not (contains!3946 (t!19654 acc!652) (h!14410 acc!652))))))

(declare-fun b!708087 () Bool)

(assert (=> b!708087 (= e!398457 (noDuplicate!1193 (t!19654 acc!652)))))

(assert (= (and d!96669 (not res!471812)) b!708086))

(assert (= (and b!708086 res!471813) b!708087))

(declare-fun m!665529 () Bool)

(assert (=> b!708086 m!665529))

(declare-fun m!665531 () Bool)

(assert (=> b!708087 m!665531))

(assert (=> b!707933 d!96669))

(declare-fun d!96671 () Bool)

(assert (=> d!96671 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707937 d!96671))

(declare-fun d!96673 () Bool)

(declare-fun lt!318059 () Bool)

(assert (=> d!96673 (= lt!318059 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!336 newAcc!49)))))

(declare-fun e!398468 () Bool)

(assert (=> d!96673 (= lt!318059 e!398468)))

(declare-fun res!471819 () Bool)

(assert (=> d!96673 (=> (not res!471819) (not e!398468))))

(assert (=> d!96673 (= res!471819 (is-Cons!13365 newAcc!49))))

(assert (=> d!96673 (= (contains!3946 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318059)))

(declare-fun b!708100 () Bool)

(declare-fun e!398467 () Bool)

(assert (=> b!708100 (= e!398468 e!398467)))

(declare-fun res!471818 () Bool)

(assert (=> b!708100 (=> res!471818 e!398467)))

(assert (=> b!708100 (= res!471818 (= (h!14410 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708101 () Bool)

(assert (=> b!708101 (= e!398467 (contains!3946 (t!19654 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96673 res!471819) b!708100))

(assert (= (and b!708100 (not res!471818)) b!708101))

(assert (=> d!96673 m!665481))

(declare-fun m!665533 () Bool)

(assert (=> d!96673 m!665533))

(declare-fun m!665535 () Bool)

(assert (=> b!708101 m!665535))

(assert (=> b!707946 d!96673))

(declare-fun b!708128 () Bool)

(declare-fun e!398494 () Bool)

(declare-fun e!398493 () Bool)

(assert (=> b!708128 (= e!398494 e!398493)))

(declare-fun res!471844 () Bool)

(assert (=> b!708128 (=> res!471844 e!398493)))

(declare-fun e!398492 () Bool)

(assert (=> b!708128 (= res!471844 e!398492)))

(declare-fun res!471841 () Bool)

(assert (=> b!708128 (=> (not res!471841) (not e!398492))))

(assert (=> b!708128 (= res!471841 (= (h!14410 acc!652) (h!14410 newAcc!49)))))

(declare-fun b!708129 () Bool)

(assert (=> b!708129 (= e!398492 (subseq!391 (t!19654 acc!652) (t!19654 newAcc!49)))))

(declare-fun b!708127 () Bool)

(declare-fun e!398495 () Bool)

(assert (=> b!708127 (= e!398495 e!398494)))

(declare-fun res!471842 () Bool)

(assert (=> b!708127 (=> (not res!471842) (not e!398494))))

(assert (=> b!708127 (= res!471842 (is-Cons!13365 newAcc!49))))

(declare-fun b!708130 () Bool)

(assert (=> b!708130 (= e!398493 (subseq!391 acc!652 (t!19654 newAcc!49)))))

(declare-fun d!96675 () Bool)

(declare-fun res!471843 () Bool)

(assert (=> d!96675 (=> res!471843 e!398495)))

(assert (=> d!96675 (= res!471843 (is-Nil!13366 acc!652))))

(assert (=> d!96675 (= (subseq!391 acc!652 newAcc!49) e!398495)))

(assert (= (and d!96675 (not res!471843)) b!708127))

(assert (= (and b!708127 res!471842) b!708128))

(assert (= (and b!708128 res!471841) b!708129))

(assert (= (and b!708128 (not res!471844)) b!708130))

(declare-fun m!665569 () Bool)

(assert (=> b!708129 m!665569))

(declare-fun m!665571 () Bool)

(assert (=> b!708130 m!665571))

(assert (=> b!707935 d!96675))

(declare-fun b!708160 () Bool)

(declare-fun e!398521 () Bool)

(declare-fun e!398523 () Bool)

(assert (=> b!708160 (= e!398521 e!398523)))

(declare-fun res!471864 () Bool)

(assert (=> b!708160 (=> (not res!471864) (not e!398523))))

(declare-fun e!398522 () Bool)

(assert (=> b!708160 (= res!471864 (not e!398522))))

(declare-fun res!471866 () Bool)

(assert (=> b!708160 (=> (not res!471866) (not e!398522))))

(assert (=> b!708160 (= res!471866 (validKeyInArray!0 (select (arr!19328 a!3591) from!2969)))))

(declare-fun b!708161 () Bool)

(assert (=> b!708161 (= e!398522 (contains!3946 acc!652 (select (arr!19328 a!3591) from!2969)))))

(declare-fun d!96689 () Bool)

(declare-fun res!471865 () Bool)

(assert (=> d!96689 (=> res!471865 e!398521)))

(assert (=> d!96689 (= res!471865 (bvsge from!2969 (size!19715 a!3591)))))

(assert (=> d!96689 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398521)))

(declare-fun c!78515 () Bool)

(declare-fun call!34394 () Bool)

(declare-fun bm!34391 () Bool)

(assert (=> bm!34391 (= call!34394 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78515 (Cons!13365 (select (arr!19328 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708162 () Bool)

(declare-fun e!398520 () Bool)

(assert (=> b!708162 (= e!398523 e!398520)))

(assert (=> b!708162 (= c!78515 (validKeyInArray!0 (select (arr!19328 a!3591) from!2969)))))

(declare-fun b!708163 () Bool)

(assert (=> b!708163 (= e!398520 call!34394)))

(declare-fun b!708164 () Bool)

(assert (=> b!708164 (= e!398520 call!34394)))

(assert (= (and d!96689 (not res!471865)) b!708160))

(assert (= (and b!708160 res!471866) b!708161))

(assert (= (and b!708160 res!471864) b!708162))

(assert (= (and b!708162 c!78515) b!708163))

(assert (= (and b!708162 (not c!78515)) b!708164))

(assert (= (or b!708163 b!708164) bm!34391))

(assert (=> b!708160 m!665397))

(assert (=> b!708160 m!665397))

(assert (=> b!708160 m!665399))

(assert (=> b!708161 m!665397))

(assert (=> b!708161 m!665397))

(declare-fun m!665589 () Bool)

(assert (=> b!708161 m!665589))

(assert (=> bm!34391 m!665397))

(declare-fun m!665591 () Bool)

(assert (=> bm!34391 m!665591))

(assert (=> b!708162 m!665397))

(assert (=> b!708162 m!665397))

(assert (=> b!708162 m!665399))

(assert (=> b!707936 d!96689))

(declare-fun d!96705 () Bool)

(declare-fun lt!318066 () Bool)

(assert (=> d!96705 (= lt!318066 (member k!2824 (content!336 acc!652)))))

(declare-fun e!398527 () Bool)

(assert (=> d!96705 (= lt!318066 e!398527)))

(declare-fun res!471870 () Bool)

(assert (=> d!96705 (=> (not res!471870) (not e!398527))))

(assert (=> d!96705 (= res!471870 (is-Cons!13365 acc!652))))

(assert (=> d!96705 (= (contains!3946 acc!652 k!2824) lt!318066)))

(declare-fun b!708167 () Bool)

(declare-fun e!398526 () Bool)

(assert (=> b!708167 (= e!398527 e!398526)))

(declare-fun res!471869 () Bool)

(assert (=> b!708167 (=> res!471869 e!398526)))

(assert (=> b!708167 (= res!471869 (= (h!14410 acc!652) k!2824))))

(declare-fun b!708168 () Bool)

(assert (=> b!708168 (= e!398526 (contains!3946 (t!19654 acc!652) k!2824))))

(assert (= (and d!96705 res!471870) b!708167))

(assert (= (and b!708167 (not res!471869)) b!708168))

(declare-fun m!665593 () Bool)

(assert (=> d!96705 m!665593))

(declare-fun m!665595 () Bool)

(assert (=> d!96705 m!665595))

(declare-fun m!665597 () Bool)

(assert (=> b!708168 m!665597))

(assert (=> b!707939 d!96705))

(declare-fun d!96709 () Bool)

(assert (=> d!96709 (= (validKeyInArray!0 (select (arr!19328 a!3591) from!2969)) (and (not (= (select (arr!19328 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19328 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707940 d!96709))

(declare-fun d!96711 () Bool)

(declare-fun lt!318068 () Bool)

(assert (=> d!96711 (= lt!318068 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!336 acc!652)))))

(declare-fun e!398531 () Bool)

(assert (=> d!96711 (= lt!318068 e!398531)))

(declare-fun res!471874 () Bool)

(assert (=> d!96711 (=> (not res!471874) (not e!398531))))

(assert (=> d!96711 (= res!471874 (is-Cons!13365 acc!652))))

(assert (=> d!96711 (= (contains!3946 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318068)))

(declare-fun b!708171 () Bool)

(declare-fun e!398530 () Bool)

(assert (=> b!708171 (= e!398531 e!398530)))

(declare-fun res!471873 () Bool)

(assert (=> b!708171 (=> res!471873 e!398530)))

(assert (=> b!708171 (= res!471873 (= (h!14410 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708172 () Bool)

(assert (=> b!708172 (= e!398530 (contains!3946 (t!19654 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96711 res!471874) b!708171))

(assert (= (and b!708171 (not res!471873)) b!708172))

(assert (=> d!96711 m!665593))

(declare-fun m!665603 () Bool)

(assert (=> d!96711 m!665603))

(declare-fun m!665605 () Bool)

(assert (=> b!708172 m!665605))

(assert (=> b!707929 d!96711))

(declare-fun d!96713 () Bool)

(declare-fun lt!318069 () Bool)

(assert (=> d!96713 (= lt!318069 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!336 acc!652)))))

(declare-fun e!398533 () Bool)

(assert (=> d!96713 (= lt!318069 e!398533)))

(declare-fun res!471876 () Bool)

(assert (=> d!96713 (=> (not res!471876) (not e!398533))))

(assert (=> d!96713 (= res!471876 (is-Cons!13365 acc!652))))

(assert (=> d!96713 (= (contains!3946 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318069)))

(declare-fun b!708173 () Bool)

(declare-fun e!398532 () Bool)

(assert (=> b!708173 (= e!398533 e!398532)))

(declare-fun res!471875 () Bool)

(assert (=> b!708173 (=> res!471875 e!398532)))

(assert (=> b!708173 (= res!471875 (= (h!14410 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708174 () Bool)

(assert (=> b!708174 (= e!398532 (contains!3946 (t!19654 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96713 res!471876) b!708173))

(assert (= (and b!708173 (not res!471875)) b!708174))

(assert (=> d!96713 m!665593))

(declare-fun m!665607 () Bool)

(assert (=> d!96713 m!665607))

(declare-fun m!665609 () Bool)

(assert (=> b!708174 m!665609))

(assert (=> b!707938 d!96713))

(declare-fun d!96715 () Bool)

(assert (=> d!96715 (= (array_inv!15124 a!3591) (bvsge (size!19715 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62718 d!96715))

(push 1)

(assert (not b!708168))

(assert (not bm!34391))

(assert (not b!708086))

(assert (not b!708064))

(assert (not b!708082))

(assert (not b!708039))

(assert (not d!96705))

(assert (not b!708085))

(assert (not b!708130))

(assert (not d!96645))

(assert (not b!708081))

(assert (not b!708174))

(assert (not d!96613))

(assert (not bm!34376))

(assert (not b!708161))

(assert (not b!708172))

(assert (not b!708101))

(assert (not b!708162))

(assert (not d!96673))

(assert (not b!708063))

(assert (not b!708021))

(assert (not d!96711))

(assert (not b!708057))

(assert (not b!708087))

(assert (not b!708056))

(assert (not d!96667))

(assert (not b!708129))

(assert (not b!708160))

(assert (not d!96713))

(assert (not b!708083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

