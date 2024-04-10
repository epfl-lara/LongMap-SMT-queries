; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63028 () Bool)

(assert start!63028)

(declare-fun b!710336 () Bool)

(declare-fun res!473770 () Bool)

(declare-fun e!399703 () Bool)

(assert (=> b!710336 (=> (not res!473770) (not e!399703))))

(declare-datatypes ((List!13385 0))(
  ( (Nil!13382) (Cons!13381 (h!14426 (_ BitVec 64)) (t!19685 List!13385)) )
))
(declare-fun lt!318322 () List!13385)

(declare-fun noDuplicate!1209 (List!13385) Bool)

(assert (=> b!710336 (= res!473770 (noDuplicate!1209 lt!318322))))

(declare-fun b!710337 () Bool)

(declare-fun res!473783 () Bool)

(declare-fun e!399702 () Bool)

(assert (=> b!710337 (=> (not res!473783) (not e!399702))))

(declare-fun newAcc!49 () List!13385)

(declare-fun contains!3962 (List!13385 (_ BitVec 64)) Bool)

(assert (=> b!710337 (= res!473783 (not (contains!3962 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710338 () Bool)

(declare-fun res!473789 () Bool)

(assert (=> b!710338 (=> (not res!473789) (not e!399703))))

(declare-fun lt!318323 () List!13385)

(assert (=> b!710338 (= res!473789 (not (contains!3962 lt!318323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710339 () Bool)

(declare-fun res!473768 () Bool)

(assert (=> b!710339 (=> (not res!473768) (not e!399702))))

(declare-datatypes ((array!40393 0))(
  ( (array!40394 (arr!19344 (Array (_ BitVec 32) (_ BitVec 64))) (size!19742 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40393)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!710339 (= res!473768 (validKeyInArray!0 (select (arr!19344 a!3591) from!2969)))))

(declare-fun b!710340 () Bool)

(declare-fun res!473778 () Bool)

(assert (=> b!710340 (=> (not res!473778) (not e!399702))))

(declare-fun acc!652 () List!13385)

(assert (=> b!710340 (= res!473778 (not (contains!3962 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710341 () Bool)

(declare-fun res!473791 () Bool)

(assert (=> b!710341 (=> (not res!473791) (not e!399702))))

(declare-fun arrayNoDuplicates!0 (array!40393 (_ BitVec 32) List!13385) Bool)

(assert (=> b!710341 (= res!473791 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!710342 () Bool)

(declare-fun res!473779 () Bool)

(assert (=> b!710342 (=> (not res!473779) (not e!399702))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!372 (List!13385 (_ BitVec 64)) List!13385)

(assert (=> b!710342 (= res!473779 (= (-!372 newAcc!49 k!2824) acc!652))))

(declare-fun b!710344 () Bool)

(declare-fun res!473776 () Bool)

(assert (=> b!710344 (=> (not res!473776) (not e!399702))))

(assert (=> b!710344 (= res!473776 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19742 a!3591)))))

(declare-fun b!710345 () Bool)

(declare-fun res!473771 () Bool)

(assert (=> b!710345 (=> (not res!473771) (not e!399702))))

(assert (=> b!710345 (= res!473771 (validKeyInArray!0 k!2824))))

(declare-fun b!710346 () Bool)

(declare-fun res!473784 () Bool)

(assert (=> b!710346 (=> (not res!473784) (not e!399702))))

(declare-fun arrayContainsKey!0 (array!40393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!710346 (= res!473784 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!710347 () Bool)

(declare-fun res!473777 () Bool)

(assert (=> b!710347 (=> (not res!473777) (not e!399702))))

(assert (=> b!710347 (= res!473777 (not (contains!3962 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710348 () Bool)

(assert (=> b!710348 (= e!399702 e!399703)))

(declare-fun res!473790 () Bool)

(assert (=> b!710348 (=> (not res!473790) (not e!399703))))

(assert (=> b!710348 (= res!473790 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!518 (List!13385 (_ BitVec 64)) List!13385)

(assert (=> b!710348 (= lt!318322 ($colon$colon!518 newAcc!49 (select (arr!19344 a!3591) from!2969)))))

(assert (=> b!710348 (= lt!318323 ($colon$colon!518 acc!652 (select (arr!19344 a!3591) from!2969)))))

(declare-fun b!710349 () Bool)

(declare-fun res!473772 () Bool)

(assert (=> b!710349 (=> (not res!473772) (not e!399702))))

(assert (=> b!710349 (= res!473772 (contains!3962 newAcc!49 k!2824))))

(declare-fun b!710350 () Bool)

(declare-fun res!473788 () Bool)

(assert (=> b!710350 (=> (not res!473788) (not e!399703))))

(assert (=> b!710350 (= res!473788 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710351 () Bool)

(declare-fun res!473774 () Bool)

(assert (=> b!710351 (=> (not res!473774) (not e!399702))))

(assert (=> b!710351 (= res!473774 (noDuplicate!1209 newAcc!49))))

(declare-fun b!710352 () Bool)

(declare-fun res!473781 () Bool)

(assert (=> b!710352 (=> (not res!473781) (not e!399703))))

(assert (=> b!710352 (= res!473781 (not (contains!3962 lt!318323 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710353 () Bool)

(declare-fun res!473785 () Bool)

(assert (=> b!710353 (=> (not res!473785) (not e!399702))))

(declare-fun subseq!407 (List!13385 List!13385) Bool)

(assert (=> b!710353 (= res!473785 (subseq!407 acc!652 newAcc!49))))

(declare-fun b!710354 () Bool)

(assert (=> b!710354 (= e!399703 (not (subseq!407 lt!318323 lt!318322)))))

(declare-fun b!710343 () Bool)

(declare-fun res!473775 () Bool)

(assert (=> b!710343 (=> (not res!473775) (not e!399703))))

(assert (=> b!710343 (= res!473775 (noDuplicate!1209 lt!318323))))

(declare-fun res!473787 () Bool)

(assert (=> start!63028 (=> (not res!473787) (not e!399702))))

(assert (=> start!63028 (= res!473787 (and (bvslt (size!19742 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19742 a!3591))))))

(assert (=> start!63028 e!399702))

(assert (=> start!63028 true))

(declare-fun array_inv!15140 (array!40393) Bool)

(assert (=> start!63028 (array_inv!15140 a!3591)))

(declare-fun b!710355 () Bool)

(declare-fun res!473773 () Bool)

(assert (=> b!710355 (=> (not res!473773) (not e!399703))))

(assert (=> b!710355 (= res!473773 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318323))))

(declare-fun b!710356 () Bool)

(declare-fun res!473786 () Bool)

(assert (=> b!710356 (=> (not res!473786) (not e!399702))))

(assert (=> b!710356 (= res!473786 (noDuplicate!1209 acc!652))))

(declare-fun b!710357 () Bool)

(declare-fun res!473780 () Bool)

(assert (=> b!710357 (=> (not res!473780) (not e!399702))))

(assert (=> b!710357 (= res!473780 (not (contains!3962 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710358 () Bool)

(declare-fun res!473782 () Bool)

(assert (=> b!710358 (=> (not res!473782) (not e!399702))))

(assert (=> b!710358 (= res!473782 (not (contains!3962 acc!652 k!2824)))))

(declare-fun b!710359 () Bool)

(declare-fun res!473769 () Bool)

(assert (=> b!710359 (=> (not res!473769) (not e!399703))))

(assert (=> b!710359 (= res!473769 (not (contains!3962 lt!318323 k!2824)))))

(assert (= (and start!63028 res!473787) b!710356))

(assert (= (and b!710356 res!473786) b!710351))

(assert (= (and b!710351 res!473774) b!710340))

(assert (= (and b!710340 res!473778) b!710357))

(assert (= (and b!710357 res!473780) b!710346))

(assert (= (and b!710346 res!473784) b!710358))

(assert (= (and b!710358 res!473782) b!710345))

(assert (= (and b!710345 res!473771) b!710341))

(assert (= (and b!710341 res!473791) b!710353))

(assert (= (and b!710353 res!473785) b!710349))

(assert (= (and b!710349 res!473772) b!710342))

(assert (= (and b!710342 res!473779) b!710337))

(assert (= (and b!710337 res!473783) b!710347))

(assert (= (and b!710347 res!473777) b!710344))

(assert (= (and b!710344 res!473776) b!710339))

(assert (= (and b!710339 res!473768) b!710348))

(assert (= (and b!710348 res!473790) b!710343))

(assert (= (and b!710343 res!473775) b!710336))

(assert (= (and b!710336 res!473770) b!710338))

(assert (= (and b!710338 res!473789) b!710352))

(assert (= (and b!710352 res!473781) b!710350))

(assert (= (and b!710350 res!473788) b!710359))

(assert (= (and b!710359 res!473769) b!710355))

(assert (= (and b!710355 res!473773) b!710354))

(declare-fun m!667489 () Bool)

(assert (=> b!710343 m!667489))

(declare-fun m!667491 () Bool)

(assert (=> b!710358 m!667491))

(declare-fun m!667493 () Bool)

(assert (=> b!710347 m!667493))

(declare-fun m!667495 () Bool)

(assert (=> b!710339 m!667495))

(assert (=> b!710339 m!667495))

(declare-fun m!667497 () Bool)

(assert (=> b!710339 m!667497))

(assert (=> b!710348 m!667495))

(assert (=> b!710348 m!667495))

(declare-fun m!667499 () Bool)

(assert (=> b!710348 m!667499))

(assert (=> b!710348 m!667495))

(declare-fun m!667501 () Bool)

(assert (=> b!710348 m!667501))

(declare-fun m!667503 () Bool)

(assert (=> b!710357 m!667503))

(declare-fun m!667505 () Bool)

(assert (=> b!710355 m!667505))

(declare-fun m!667507 () Bool)

(assert (=> b!710338 m!667507))

(declare-fun m!667509 () Bool)

(assert (=> b!710340 m!667509))

(declare-fun m!667511 () Bool)

(assert (=> b!710353 m!667511))

(declare-fun m!667513 () Bool)

(assert (=> b!710356 m!667513))

(declare-fun m!667515 () Bool)

(assert (=> b!710345 m!667515))

(declare-fun m!667517 () Bool)

(assert (=> b!710346 m!667517))

(declare-fun m!667519 () Bool)

(assert (=> b!710354 m!667519))

(declare-fun m!667521 () Bool)

(assert (=> b!710349 m!667521))

(declare-fun m!667523 () Bool)

(assert (=> b!710342 m!667523))

(declare-fun m!667525 () Bool)

(assert (=> b!710350 m!667525))

(declare-fun m!667527 () Bool)

(assert (=> b!710351 m!667527))

(declare-fun m!667529 () Bool)

(assert (=> b!710337 m!667529))

(declare-fun m!667531 () Bool)

(assert (=> b!710341 m!667531))

(declare-fun m!667533 () Bool)

(assert (=> b!710359 m!667533))

(declare-fun m!667535 () Bool)

(assert (=> b!710352 m!667535))

(declare-fun m!667537 () Bool)

(assert (=> b!710336 m!667537))

(declare-fun m!667539 () Bool)

(assert (=> start!63028 m!667539))

(push 1)

(assert (not b!710353))

(assert (not b!710343))

(assert (not b!710355))

(assert (not b!710358))

(assert (not b!710342))

(assert (not b!710350))

(assert (not b!710336))

(assert (not b!710356))

(assert (not b!710359))

(assert (not b!710349))

(assert (not b!710352))

(assert (not start!63028))

(assert (not b!710346))

(assert (not b!710357))

(assert (not b!710338))

(assert (not b!710337))

(assert (not b!710341))

(assert (not b!710351))

(assert (not b!710348))

(assert (not b!710340))

(assert (not b!710345))

(assert (not b!710347))

(assert (not b!710339))

(assert (not b!710354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97381 () Bool)

(declare-fun lt!318345 () Bool)

(declare-fun content!349 (List!13385) (Set (_ BitVec 64)))

(assert (=> d!97381 (= lt!318345 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!349 lt!318323)))))

(declare-fun e!399763 () Bool)

(assert (=> d!97381 (= lt!318345 e!399763)))

(declare-fun res!473976 () Bool)

(assert (=> d!97381 (=> (not res!473976) (not e!399763))))

(assert (=> d!97381 (= res!473976 (is-Cons!13381 lt!318323))))

(assert (=> d!97381 (= (contains!3962 lt!318323 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318345)))

(declare-fun b!710544 () Bool)

(declare-fun e!399764 () Bool)

(assert (=> b!710544 (= e!399763 e!399764)))

(declare-fun res!473977 () Bool)

(assert (=> b!710544 (=> res!473977 e!399764)))

(assert (=> b!710544 (= res!473977 (= (h!14426 lt!318323) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710545 () Bool)

(assert (=> b!710545 (= e!399764 (contains!3962 (t!19685 lt!318323) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97381 res!473976) b!710544))

(assert (= (and b!710544 (not res!473977)) b!710545))

(declare-fun m!667673 () Bool)

(assert (=> d!97381 m!667673))

(declare-fun m!667675 () Bool)

(assert (=> d!97381 m!667675))

(declare-fun m!667677 () Bool)

(assert (=> b!710545 m!667677))

(assert (=> b!710352 d!97381))

(declare-fun b!710568 () Bool)

(declare-fun e!399789 () Bool)

(declare-fun e!399787 () Bool)

(assert (=> b!710568 (= e!399789 e!399787)))

(declare-fun res!473996 () Bool)

(assert (=> b!710568 (=> (not res!473996) (not e!399787))))

(assert (=> b!710568 (= res!473996 (is-Cons!13381 lt!318322))))

(declare-fun b!710571 () Bool)

(declare-fun e!399788 () Bool)

(assert (=> b!710571 (= e!399788 (subseq!407 lt!318323 (t!19685 lt!318322)))))

(declare-fun d!97391 () Bool)

(declare-fun res!474000 () Bool)

(assert (=> d!97391 (=> res!474000 e!399789)))

(assert (=> d!97391 (= res!474000 (is-Nil!13382 lt!318323))))

(assert (=> d!97391 (= (subseq!407 lt!318323 lt!318322) e!399789)))

(declare-fun b!710570 () Bool)

(declare-fun e!399790 () Bool)

(assert (=> b!710570 (= e!399790 (subseq!407 (t!19685 lt!318323) (t!19685 lt!318322)))))

(declare-fun b!710569 () Bool)

(assert (=> b!710569 (= e!399787 e!399788)))

(declare-fun res!474001 () Bool)

(assert (=> b!710569 (=> res!474001 e!399788)))

(assert (=> b!710569 (= res!474001 e!399790)))

(declare-fun res!473998 () Bool)

(assert (=> b!710569 (=> (not res!473998) (not e!399790))))

(assert (=> b!710569 (= res!473998 (= (h!14426 lt!318323) (h!14426 lt!318322)))))

(assert (= (and d!97391 (not res!474000)) b!710568))

(assert (= (and b!710568 res!473996) b!710569))

(assert (= (and b!710569 res!473998) b!710570))

(assert (= (and b!710569 (not res!474001)) b!710571))

(declare-fun m!667689 () Bool)

(assert (=> b!710571 m!667689))

(declare-fun m!667691 () Bool)

(assert (=> b!710570 m!667691))

(assert (=> b!710354 d!97391))

(declare-fun b!710576 () Bool)

(declare-fun e!399795 () Bool)

(declare-fun e!399793 () Bool)

(assert (=> b!710576 (= e!399795 e!399793)))

(declare-fun res!474004 () Bool)

(assert (=> b!710576 (=> (not res!474004) (not e!399793))))

(assert (=> b!710576 (= res!474004 (is-Cons!13381 newAcc!49))))

(declare-fun b!710579 () Bool)

(declare-fun e!399794 () Bool)

(assert (=> b!710579 (= e!399794 (subseq!407 acc!652 (t!19685 newAcc!49)))))

(declare-fun d!97397 () Bool)

(declare-fun res!474006 () Bool)

(assert (=> d!97397 (=> res!474006 e!399795)))

(assert (=> d!97397 (= res!474006 (is-Nil!13382 acc!652))))

(assert (=> d!97397 (= (subseq!407 acc!652 newAcc!49) e!399795)))

(declare-fun b!710578 () Bool)

(declare-fun e!399796 () Bool)

(assert (=> b!710578 (= e!399796 (subseq!407 (t!19685 acc!652) (t!19685 newAcc!49)))))

(declare-fun b!710577 () Bool)

(assert (=> b!710577 (= e!399793 e!399794)))

(declare-fun res!474007 () Bool)

(assert (=> b!710577 (=> res!474007 e!399794)))

(assert (=> b!710577 (= res!474007 e!399796)))

(declare-fun res!474005 () Bool)

(assert (=> b!710577 (=> (not res!474005) (not e!399796))))

(assert (=> b!710577 (= res!474005 (= (h!14426 acc!652) (h!14426 newAcc!49)))))

(assert (= (and d!97397 (not res!474006)) b!710576))

(assert (= (and b!710576 res!474004) b!710577))

(assert (= (and b!710577 res!474005) b!710578))

(assert (= (and b!710577 (not res!474007)) b!710579))

(declare-fun m!667693 () Bool)

(assert (=> b!710579 m!667693))

(declare-fun m!667695 () Bool)

(assert (=> b!710578 m!667695))

(assert (=> b!710353 d!97397))

(declare-fun d!97399 () Bool)

(declare-fun res!474018 () Bool)

(declare-fun e!399807 () Bool)

(assert (=> d!97399 (=> res!474018 e!399807)))

(assert (=> d!97399 (= res!474018 (= (select (arr!19344 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97399 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399807)))

(declare-fun b!710590 () Bool)

(declare-fun e!399808 () Bool)

(assert (=> b!710590 (= e!399807 e!399808)))

(declare-fun res!474019 () Bool)

(assert (=> b!710590 (=> (not res!474019) (not e!399808))))

(assert (=> b!710590 (= res!474019 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19742 a!3591)))))

(declare-fun b!710591 () Bool)

(assert (=> b!710591 (= e!399808 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97399 (not res!474018)) b!710590))

(assert (= (and b!710590 res!474019) b!710591))

(declare-fun m!667713 () Bool)

(assert (=> d!97399 m!667713))

(declare-fun m!667715 () Bool)

(assert (=> b!710591 m!667715))

(assert (=> b!710350 d!97399))

(declare-fun d!97407 () Bool)

(assert (=> d!97407 (= (array_inv!15140 a!3591) (bvsge (size!19742 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63028 d!97407))

(declare-fun d!97409 () Bool)

(declare-fun lt!318350 () Bool)

(assert (=> d!97409 (= lt!318350 (set.member k!2824 (content!349 newAcc!49)))))

(declare-fun e!399813 () Bool)

(assert (=> d!97409 (= lt!318350 e!399813)))

(declare-fun res!474023 () Bool)

(assert (=> d!97409 (=> (not res!474023) (not e!399813))))

(assert (=> d!97409 (= res!474023 (is-Cons!13381 newAcc!49))))

(assert (=> d!97409 (= (contains!3962 newAcc!49 k!2824) lt!318350)))

(declare-fun b!710597 () Bool)

(declare-fun e!399814 () Bool)

(assert (=> b!710597 (= e!399813 e!399814)))

(declare-fun res!474024 () Bool)

(assert (=> b!710597 (=> res!474024 e!399814)))

(assert (=> b!710597 (= res!474024 (= (h!14426 newAcc!49) k!2824))))

(declare-fun b!710598 () Bool)

(assert (=> b!710598 (= e!399814 (contains!3962 (t!19685 newAcc!49) k!2824))))

(assert (= (and d!97409 res!474023) b!710597))

(assert (= (and b!710597 (not res!474024)) b!710598))

(declare-fun m!667717 () Bool)

(assert (=> d!97409 m!667717))

(declare-fun m!667719 () Bool)

(assert (=> d!97409 m!667719))

(declare-fun m!667721 () Bool)

(assert (=> b!710598 m!667721))

(assert (=> b!710349 d!97409))

(declare-fun d!97411 () Bool)

(declare-fun res!474038 () Bool)

(declare-fun e!399829 () Bool)

(assert (=> d!97411 (=> res!474038 e!399829)))

(assert (=> d!97411 (= res!474038 (is-Nil!13382 newAcc!49))))

(assert (=> d!97411 (= (noDuplicate!1209 newAcc!49) e!399829)))

(declare-fun b!710614 () Bool)

(declare-fun e!399830 () Bool)

(assert (=> b!710614 (= e!399829 e!399830)))

(declare-fun res!474039 () Bool)

(assert (=> b!710614 (=> (not res!474039) (not e!399830))))

(assert (=> b!710614 (= res!474039 (not (contains!3962 (t!19685 newAcc!49) (h!14426 newAcc!49))))))

(declare-fun b!710615 () Bool)

(assert (=> b!710615 (= e!399830 (noDuplicate!1209 (t!19685 newAcc!49)))))

(assert (= (and d!97411 (not res!474038)) b!710614))

(assert (= (and b!710614 res!474039) b!710615))

(declare-fun m!667731 () Bool)

(assert (=> b!710614 m!667731))

(declare-fun m!667733 () Bool)

(assert (=> b!710615 m!667733))

(assert (=> b!710351 d!97411))

(declare-fun d!97417 () Bool)

(declare-fun lt!318352 () Bool)

(assert (=> d!97417 (= lt!318352 (set.member k!2824 (content!349 acc!652)))))

(declare-fun e!399833 () Bool)

(assert (=> d!97417 (= lt!318352 e!399833)))

(declare-fun res!474042 () Bool)

(assert (=> d!97417 (=> (not res!474042) (not e!399833))))

(assert (=> d!97417 (= res!474042 (is-Cons!13381 acc!652))))

(assert (=> d!97417 (= (contains!3962 acc!652 k!2824) lt!318352)))

(declare-fun b!710618 () Bool)

(declare-fun e!399834 () Bool)

(assert (=> b!710618 (= e!399833 e!399834)))

(declare-fun res!474043 () Bool)

(assert (=> b!710618 (=> res!474043 e!399834)))

(assert (=> b!710618 (= res!474043 (= (h!14426 acc!652) k!2824))))

(declare-fun b!710619 () Bool)

(assert (=> b!710619 (= e!399834 (contains!3962 (t!19685 acc!652) k!2824))))

(assert (= (and d!97417 res!474042) b!710618))

(assert (= (and b!710618 (not res!474043)) b!710619))

(declare-fun m!667739 () Bool)

(assert (=> d!97417 m!667739))

(declare-fun m!667743 () Bool)

(assert (=> d!97417 m!667743))

(declare-fun m!667747 () Bool)

(assert (=> b!710619 m!667747))

(assert (=> b!710358 d!97417))

(declare-fun d!97421 () Bool)

(declare-fun res!474044 () Bool)

(declare-fun e!399835 () Bool)

(assert (=> d!97421 (=> res!474044 e!399835)))

(assert (=> d!97421 (= res!474044 (is-Nil!13382 lt!318322))))

(assert (=> d!97421 (= (noDuplicate!1209 lt!318322) e!399835)))

(declare-fun b!710620 () Bool)

(declare-fun e!399836 () Bool)

(assert (=> b!710620 (= e!399835 e!399836)))

(declare-fun res!474046 () Bool)

(assert (=> b!710620 (=> (not res!474046) (not e!399836))))

(assert (=> b!710620 (= res!474046 (not (contains!3962 (t!19685 lt!318322) (h!14426 lt!318322))))))

(declare-fun b!710621 () Bool)

(assert (=> b!710621 (= e!399836 (noDuplicate!1209 (t!19685 lt!318322)))))

(assert (= (and d!97421 (not res!474044)) b!710620))

(assert (= (and b!710620 res!474046) b!710621))

(declare-fun m!667751 () Bool)

(assert (=> b!710620 m!667751))

(declare-fun m!667753 () Bool)

(assert (=> b!710621 m!667753))

(assert (=> b!710336 d!97421))

(declare-fun d!97423 () Bool)

(declare-fun lt!318354 () Bool)

(assert (=> d!97423 (= lt!318354 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!349 acc!652)))))

(declare-fun e!399839 () Bool)

(assert (=> d!97423 (= lt!318354 e!399839)))

(declare-fun res!474048 () Bool)

(assert (=> d!97423 (=> (not res!474048) (not e!399839))))

(assert (=> d!97423 (= res!474048 (is-Cons!13381 acc!652))))

(assert (=> d!97423 (= (contains!3962 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318354)))

(declare-fun b!710624 () Bool)

(declare-fun e!399840 () Bool)

(assert (=> b!710624 (= e!399839 e!399840)))

(declare-fun res!474049 () Bool)

(assert (=> b!710624 (=> res!474049 e!399840)))

(assert (=> b!710624 (= res!474049 (= (h!14426 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710625 () Bool)

(assert (=> b!710625 (= e!399840 (contains!3962 (t!19685 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97423 res!474048) b!710624))

(assert (= (and b!710624 (not res!474049)) b!710625))

(assert (=> d!97423 m!667739))

(declare-fun m!667759 () Bool)

(assert (=> d!97423 m!667759))

(declare-fun m!667761 () Bool)

(assert (=> b!710625 m!667761))

(assert (=> b!710357 d!97423))

(declare-fun d!97429 () Bool)

(declare-fun lt!318355 () Bool)

(assert (=> d!97429 (= lt!318355 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!349 lt!318323)))))

(declare-fun e!399841 () Bool)

(assert (=> d!97429 (= lt!318355 e!399841)))

(declare-fun res!474050 () Bool)

(assert (=> d!97429 (=> (not res!474050) (not e!399841))))

(assert (=> d!97429 (= res!474050 (is-Cons!13381 lt!318323))))

(assert (=> d!97429 (= (contains!3962 lt!318323 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318355)))

(declare-fun b!710626 () Bool)

(declare-fun e!399842 () Bool)

(assert (=> b!710626 (= e!399841 e!399842)))

(declare-fun res!474051 () Bool)

(assert (=> b!710626 (=> res!474051 e!399842)))

(assert (=> b!710626 (= res!474051 (= (h!14426 lt!318323) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710627 () Bool)

(assert (=> b!710627 (= e!399842 (contains!3962 (t!19685 lt!318323) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97429 res!474050) b!710626))

(assert (= (and b!710626 (not res!474051)) b!710627))

(assert (=> d!97429 m!667673))

(declare-fun m!667763 () Bool)

(assert (=> d!97429 m!667763))

(declare-fun m!667765 () Bool)

(assert (=> b!710627 m!667765))

(assert (=> b!710338 d!97429))

(declare-fun d!97431 () Bool)

(declare-fun lt!318356 () Bool)

(assert (=> d!97431 (= lt!318356 (set.member k!2824 (content!349 lt!318323)))))

(declare-fun e!399843 () Bool)

(assert (=> d!97431 (= lt!318356 e!399843)))

(declare-fun res!474052 () Bool)

(assert (=> d!97431 (=> (not res!474052) (not e!399843))))

(assert (=> d!97431 (= res!474052 (is-Cons!13381 lt!318323))))

(assert (=> d!97431 (= (contains!3962 lt!318323 k!2824) lt!318356)))

(declare-fun b!710628 () Bool)

(declare-fun e!399844 () Bool)

(assert (=> b!710628 (= e!399843 e!399844)))

(declare-fun res!474053 () Bool)

(assert (=> b!710628 (=> res!474053 e!399844)))

(assert (=> b!710628 (= res!474053 (= (h!14426 lt!318323) k!2824))))

(declare-fun b!710629 () Bool)

(assert (=> b!710629 (= e!399844 (contains!3962 (t!19685 lt!318323) k!2824))))

(assert (= (and d!97431 res!474052) b!710628))

(assert (= (and b!710628 (not res!474053)) b!710629))

(assert (=> d!97431 m!667673))

(declare-fun m!667767 () Bool)

(assert (=> d!97431 m!667767))

(declare-fun m!667769 () Bool)

(assert (=> b!710629 m!667769))

(assert (=> b!710359 d!97431))

(declare-fun d!97435 () Bool)

(declare-fun lt!318357 () Bool)

(assert (=> d!97435 (= lt!318357 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!349 newAcc!49)))))

(declare-fun e!399847 () Bool)

(assert (=> d!97435 (= lt!318357 e!399847)))

(declare-fun res!474056 () Bool)

(assert (=> d!97435 (=> (not res!474056) (not e!399847))))

(assert (=> d!97435 (= res!474056 (is-Cons!13381 newAcc!49))))

(assert (=> d!97435 (= (contains!3962 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318357)))

(declare-fun b!710632 () Bool)

(declare-fun e!399848 () Bool)

(assert (=> b!710632 (= e!399847 e!399848)))

(declare-fun res!474057 () Bool)

(assert (=> b!710632 (=> res!474057 e!399848)))

(assert (=> b!710632 (= res!474057 (= (h!14426 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710633 () Bool)

(assert (=> b!710633 (= e!399848 (contains!3962 (t!19685 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97435 res!474056) b!710632))

(assert (= (and b!710632 (not res!474057)) b!710633))

(assert (=> d!97435 m!667717))

(declare-fun m!667771 () Bool)

(assert (=> d!97435 m!667771))

(declare-fun m!667775 () Bool)

(assert (=> b!710633 m!667775))

(assert (=> b!710337 d!97435))

(declare-fun d!97437 () Bool)

(declare-fun res!474079 () Bool)

(declare-fun e!399871 () Bool)

(assert (=> d!97437 (=> res!474079 e!399871)))

(assert (=> d!97437 (= res!474079 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19742 a!3591)))))

(assert (=> d!97437 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318323) e!399871)))

(declare-fun b!710658 () Bool)

(declare-fun e!399874 () Bool)

(declare-fun e!399873 () Bool)

(assert (=> b!710658 (= e!399874 e!399873)))

(declare-fun c!78657 () Bool)

(assert (=> b!710658 (= c!78657 (validKeyInArray!0 (select (arr!19344 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun e!399872 () Bool)

(declare-fun b!710659 () Bool)

(assert (=> b!710659 (= e!399872 (contains!3962 lt!318323 (select (arr!19344 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710660 () Bool)

(declare-fun call!34480 () Bool)

(assert (=> b!710660 (= e!399873 call!34480)))

(declare-fun b!710661 () Bool)

(assert (=> b!710661 (= e!399873 call!34480)))

(declare-fun bm!34477 () Bool)

(assert (=> bm!34477 (= call!34480 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78657 (Cons!13381 (select (arr!19344 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318323) lt!318323)))))

(declare-fun b!710662 () Bool)

(assert (=> b!710662 (= e!399871 e!399874)))

(declare-fun res!474078 () Bool)

(assert (=> b!710662 (=> (not res!474078) (not e!399874))))

(assert (=> b!710662 (= res!474078 (not e!399872))))

(declare-fun res!474080 () Bool)

(assert (=> b!710662 (=> (not res!474080) (not e!399872))))

(assert (=> b!710662 (= res!474080 (validKeyInArray!0 (select (arr!19344 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!97437 (not res!474079)) b!710662))

(assert (= (and b!710662 res!474080) b!710659))

(assert (= (and b!710662 res!474078) b!710658))

(assert (= (and b!710658 c!78657) b!710660))

(assert (= (and b!710658 (not c!78657)) b!710661))

(assert (= (or b!710660 b!710661) bm!34477))

(assert (=> b!710658 m!667713))

(assert (=> b!710658 m!667713))

(declare-fun m!667801 () Bool)

(assert (=> b!710658 m!667801))

(assert (=> b!710659 m!667713))

(assert (=> b!710659 m!667713))

(declare-fun m!667803 () Bool)

(assert (=> b!710659 m!667803))

(assert (=> bm!34477 m!667713))

(declare-fun m!667805 () Bool)

(assert (=> bm!34477 m!667805))

(assert (=> b!710662 m!667713))

(assert (=> b!710662 m!667713))

(assert (=> b!710662 m!667801))

(assert (=> b!710355 d!97437))

(declare-fun d!97457 () Bool)

(declare-fun res!474081 () Bool)

(declare-fun e!399875 () Bool)

(assert (=> d!97457 (=> res!474081 e!399875)))

(assert (=> d!97457 (= res!474081 (is-Nil!13382 acc!652))))

(assert (=> d!97457 (= (noDuplicate!1209 acc!652) e!399875)))

(declare-fun b!710663 () Bool)

(declare-fun e!399876 () Bool)

(assert (=> b!710663 (= e!399875 e!399876)))

(declare-fun res!474082 () Bool)

(assert (=> b!710663 (=> (not res!474082) (not e!399876))))

(assert (=> b!710663 (= res!474082 (not (contains!3962 (t!19685 acc!652) (h!14426 acc!652))))))

(declare-fun b!710664 () Bool)

(assert (=> b!710664 (= e!399876 (noDuplicate!1209 (t!19685 acc!652)))))

(assert (= (and d!97457 (not res!474081)) b!710663))

(assert (= (and b!710663 res!474082) b!710664))

(declare-fun m!667807 () Bool)

(assert (=> b!710663 m!667807))

(declare-fun m!667809 () Bool)

(assert (=> b!710664 m!667809))

(assert (=> b!710356 d!97457))

(declare-fun d!97459 () Bool)

(declare-fun e!399904 () Bool)

(assert (=> d!97459 e!399904))

(declare-fun res!474091 () Bool)

(assert (=> d!97459 (=> (not res!474091) (not e!399904))))

(declare-fun lt!318368 () List!13385)

(declare-fun size!19746 (List!13385) Int)

(assert (=> d!97459 (= res!474091 (<= (size!19746 lt!318368) (size!19746 newAcc!49)))))

(declare-fun e!399905 () List!13385)

(assert (=> d!97459 (= lt!318368 e!399905)))

(declare-fun c!78675 () Bool)

(assert (=> d!97459 (= c!78675 (is-Cons!13381 newAcc!49))))

(assert (=> d!97459 (= (-!372 newAcc!49 k!2824) lt!318368)))

(declare-fun b!710705 () Bool)

(assert (=> b!710705 (= e!399905 Nil!13382)))

(declare-fun b!710706 () Bool)

(assert (=> b!710706 (= e!399904 (= (content!349 lt!318368) (set.minus (content!349 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun bm!34486 () Bool)

(declare-fun call!34489 () List!13385)

(assert (=> bm!34486 (= call!34489 (-!372 (t!19685 newAcc!49) k!2824))))

(declare-fun b!710707 () Bool)

(declare-fun e!399906 () List!13385)

(assert (=> b!710707 (= e!399906 (Cons!13381 (h!14426 newAcc!49) call!34489))))

(declare-fun b!710708 () Bool)

(assert (=> b!710708 (= e!399905 e!399906)))

(declare-fun c!78674 () Bool)

(assert (=> b!710708 (= c!78674 (= k!2824 (h!14426 newAcc!49)))))

(declare-fun b!710709 () Bool)

(assert (=> b!710709 (= e!399906 call!34489)))

(assert (= (and d!97459 c!78675) b!710708))

(assert (= (and d!97459 (not c!78675)) b!710705))

(assert (= (and b!710708 c!78674) b!710709))

(assert (= (and b!710708 (not c!78674)) b!710707))

(assert (= (or b!710709 b!710707) bm!34486))

(assert (= (and d!97459 res!474091) b!710706))

(declare-fun m!667833 () Bool)

(assert (=> d!97459 m!667833))

(declare-fun m!667837 () Bool)

(assert (=> d!97459 m!667837))

(declare-fun m!667839 () Bool)

(assert (=> b!710706 m!667839))

(assert (=> b!710706 m!667717))

(declare-fun m!667841 () Bool)

(assert (=> b!710706 m!667841))

(declare-fun m!667843 () Bool)

(assert (=> bm!34486 m!667843))

(assert (=> b!710342 d!97459))

(declare-fun d!97469 () Bool)

(declare-fun res!474095 () Bool)

(declare-fun e!399909 () Bool)

(assert (=> d!97469 (=> res!474095 e!399909)))

(assert (=> d!97469 (= res!474095 (bvsge from!2969 (size!19742 a!3591)))))

(assert (=> d!97469 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399909)))

(declare-fun b!710712 () Bool)

(declare-fun e!399912 () Bool)

(declare-fun e!399911 () Bool)

(assert (=> b!710712 (= e!399912 e!399911)))

(declare-fun c!78676 () Bool)

(assert (=> b!710712 (= c!78676 (validKeyInArray!0 (select (arr!19344 a!3591) from!2969)))))

(declare-fun e!399910 () Bool)

(declare-fun b!710713 () Bool)

(assert (=> b!710713 (= e!399910 (contains!3962 acc!652 (select (arr!19344 a!3591) from!2969)))))

(declare-fun b!710714 () Bool)

(declare-fun call!34490 () Bool)

(assert (=> b!710714 (= e!399911 call!34490)))

(declare-fun b!710715 () Bool)

(assert (=> b!710715 (= e!399911 call!34490)))

(declare-fun bm!34487 () Bool)

(assert (=> bm!34487 (= call!34490 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78676 (Cons!13381 (select (arr!19344 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!710716 () Bool)

(assert (=> b!710716 (= e!399909 e!399912)))

(declare-fun res!474094 () Bool)

(assert (=> b!710716 (=> (not res!474094) (not e!399912))))

(assert (=> b!710716 (= res!474094 (not e!399910))))

(declare-fun res!474096 () Bool)

(assert (=> b!710716 (=> (not res!474096) (not e!399910))))

(assert (=> b!710716 (= res!474096 (validKeyInArray!0 (select (arr!19344 a!3591) from!2969)))))

(assert (= (and d!97469 (not res!474095)) b!710716))

(assert (= (and b!710716 res!474096) b!710713))

(assert (= (and b!710716 res!474094) b!710712))

(assert (= (and b!710712 c!78676) b!710714))

(assert (= (and b!710712 (not c!78676)) b!710715))

(assert (= (or b!710714 b!710715) bm!34487))

(assert (=> b!710712 m!667495))

(assert (=> b!710712 m!667495))

(assert (=> b!710712 m!667497))

(assert (=> b!710713 m!667495))

(assert (=> b!710713 m!667495))

(declare-fun m!667845 () Bool)

(assert (=> b!710713 m!667845))

(assert (=> bm!34487 m!667495))

(declare-fun m!667847 () Bool)

(assert (=> bm!34487 m!667847))

(assert (=> b!710716 m!667495))

(assert (=> b!710716 m!667495))

(assert (=> b!710716 m!667497))

(assert (=> b!710341 d!97469))

(declare-fun d!97473 () Bool)

(declare-fun res!474099 () Bool)

(declare-fun e!399915 () Bool)

(assert (=> d!97473 (=> res!474099 e!399915)))

(assert (=> d!97473 (= res!474099 (is-Nil!13382 lt!318323))))

(assert (=> d!97473 (= (noDuplicate!1209 lt!318323) e!399915)))

(declare-fun b!710719 () Bool)

(declare-fun e!399916 () Bool)

(assert (=> b!710719 (= e!399915 e!399916)))

(declare-fun res!474100 () Bool)

(assert (=> b!710719 (=> (not res!474100) (not e!399916))))

(assert (=> b!710719 (= res!474100 (not (contains!3962 (t!19685 lt!318323) (h!14426 lt!318323))))))

(declare-fun b!710720 () Bool)

(assert (=> b!710720 (= e!399916 (noDuplicate!1209 (t!19685 lt!318323)))))

(assert (= (and d!97473 (not res!474099)) b!710719))

(assert (= (and b!710719 res!474100) b!710720))

(declare-fun m!667851 () Bool)

(assert (=> b!710719 m!667851))

(declare-fun m!667853 () Bool)

(assert (=> b!710720 m!667853))

(assert (=> b!710343 d!97473))

(declare-fun d!97475 () Bool)

(assert (=> d!97475 (= (validKeyInArray!0 (select (arr!19344 a!3591) from!2969)) (and (not (= (select (arr!19344 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19344 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710339 d!97475))

(declare-fun d!97481 () Bool)

(declare-fun lt!318370 () Bool)

(assert (=> d!97481 (= lt!318370 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!349 acc!652)))))

(declare-fun e!399921 () Bool)

(assert (=> d!97481 (= lt!318370 e!399921)))

(declare-fun res!474105 () Bool)

(assert (=> d!97481 (=> (not res!474105) (not e!399921))))

(assert (=> d!97481 (= res!474105 (is-Cons!13381 acc!652))))

(assert (=> d!97481 (= (contains!3962 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318370)))

(declare-fun b!710725 () Bool)

(declare-fun e!399922 () Bool)

(assert (=> b!710725 (= e!399921 e!399922)))

(declare-fun res!474106 () Bool)

(assert (=> b!710725 (=> res!474106 e!399922)))

(assert (=> b!710725 (= res!474106 (= (h!14426 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710726 () Bool)

(assert (=> b!710726 (= e!399922 (contains!3962 (t!19685 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97481 res!474105) b!710725))

(assert (= (and b!710725 (not res!474106)) b!710726))

(assert (=> d!97481 m!667739))

(declare-fun m!667863 () Bool)

(assert (=> d!97481 m!667863))

(declare-fun m!667865 () Bool)

(assert (=> b!710726 m!667865))

(assert (=> b!710340 d!97481))

(declare-fun d!97485 () Bool)

(declare-fun lt!318372 () Bool)

(assert (=> d!97485 (= lt!318372 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!349 newAcc!49)))))

(declare-fun e!399925 () Bool)

(assert (=> d!97485 (= lt!318372 e!399925)))

(declare-fun res!474109 () Bool)

(assert (=> d!97485 (=> (not res!474109) (not e!399925))))

(assert (=> d!97485 (= res!474109 (is-Cons!13381 newAcc!49))))

(assert (=> d!97485 (= (contains!3962 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318372)))

(declare-fun b!710729 () Bool)

(declare-fun e!399926 () Bool)

(assert (=> b!710729 (= e!399925 e!399926)))

(declare-fun res!474110 () Bool)

(assert (=> b!710729 (=> res!474110 e!399926)))

(assert (=> b!710729 (= res!474110 (= (h!14426 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710730 () Bool)

(assert (=> b!710730 (= e!399926 (contains!3962 (t!19685 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97485 res!474109) b!710729))

(assert (= (and b!710729 (not res!474110)) b!710730))

(assert (=> d!97485 m!667717))

(declare-fun m!667867 () Bool)

(assert (=> d!97485 m!667867))

(declare-fun m!667869 () Bool)

(assert (=> b!710730 m!667869))

(assert (=> b!710347 d!97485))

(declare-fun d!97487 () Bool)

(assert (=> d!97487 (= ($colon$colon!518 newAcc!49 (select (arr!19344 a!3591) from!2969)) (Cons!13381 (select (arr!19344 a!3591) from!2969) newAcc!49))))

(assert (=> b!710348 d!97487))

(declare-fun d!97491 () Bool)

(assert (=> d!97491 (= ($colon$colon!518 acc!652 (select (arr!19344 a!3591) from!2969)) (Cons!13381 (select (arr!19344 a!3591) from!2969) acc!652))))

(assert (=> b!710348 d!97491))

(declare-fun d!97495 () Bool)

(declare-fun res!474114 () Bool)

(declare-fun e!399930 () Bool)

(assert (=> d!97495 (=> res!474114 e!399930)))

(assert (=> d!97495 (= res!474114 (= (select (arr!19344 a!3591) from!2969) k!2824))))

(assert (=> d!97495 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!399930)))

(declare-fun b!710734 () Bool)

(declare-fun e!399932 () Bool)

(assert (=> b!710734 (= e!399930 e!399932)))

(declare-fun res!474116 () Bool)

(assert (=> b!710734 (=> (not res!474116) (not e!399932))))

(assert (=> b!710734 (= res!474116 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19742 a!3591)))))

(declare-fun b!710736 () Bool)

(assert (=> b!710736 (= e!399932 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97495 (not res!474114)) b!710734))

(assert (= (and b!710734 res!474116) b!710736))

(assert (=> d!97495 m!667495))

(declare-fun m!667879 () Bool)

(assert (=> b!710736 m!667879))

(assert (=> b!710346 d!97495))

(declare-fun d!97497 () Bool)

(assert (=> d!97497 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710345 d!97497))

(push 1)

