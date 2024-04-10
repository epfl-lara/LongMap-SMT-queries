; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62782 () Bool)

(assert start!62782)

(declare-fun b!708351 () Bool)

(declare-fun res!472016 () Bool)

(declare-fun e!398655 () Bool)

(assert (=> b!708351 (=> (not res!472016) (not e!398655))))

(declare-datatypes ((List!13370 0))(
  ( (Nil!13367) (Cons!13366 (h!14411 (_ BitVec 64)) (t!19658 List!13370)) )
))
(declare-fun acc!652 () List!13370)

(declare-fun contains!3947 (List!13370 (_ BitVec 64)) Bool)

(assert (=> b!708351 (= res!472016 (not (contains!3947 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708352 () Bool)

(declare-fun res!472014 () Bool)

(assert (=> b!708352 (=> (not res!472014) (not e!398655))))

(declare-fun newAcc!49 () List!13370)

(declare-fun noDuplicate!1194 (List!13370) Bool)

(assert (=> b!708352 (= res!472014 (noDuplicate!1194 newAcc!49))))

(declare-fun b!708353 () Bool)

(declare-fun res!472007 () Bool)

(assert (=> b!708353 (=> (not res!472007) (not e!398655))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!708353 (= res!472007 (contains!3947 newAcc!49 k!2824))))

(declare-fun res!472022 () Bool)

(assert (=> start!62782 (=> (not res!472022) (not e!398655))))

(declare-datatypes ((array!40351 0))(
  ( (array!40352 (arr!19329 (Array (_ BitVec 32) (_ BitVec 64))) (size!19719 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40351)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62782 (= res!472022 (and (bvslt (size!19719 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19719 a!3591))))))

(assert (=> start!62782 e!398655))

(assert (=> start!62782 true))

(declare-fun array_inv!15125 (array!40351) Bool)

(assert (=> start!62782 (array_inv!15125 a!3591)))

(declare-fun b!708354 () Bool)

(declare-fun e!398657 () Bool)

(declare-fun e!398654 () Bool)

(assert (=> b!708354 (= e!398657 e!398654)))

(declare-fun res!472015 () Bool)

(assert (=> b!708354 (=> res!472015 e!398654)))

(declare-fun lt!318104 () List!13370)

(assert (=> b!708354 (= res!472015 (contains!3947 lt!318104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708355 () Bool)

(assert (=> b!708355 (= e!398654 (contains!3947 lt!318104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708356 () Bool)

(declare-fun res!472024 () Bool)

(assert (=> b!708356 (=> (not res!472024) (not e!398657))))

(declare-fun $colon$colon!503 (List!13370 (_ BitVec 64)) List!13370)

(assert (=> b!708356 (= res!472024 (noDuplicate!1194 ($colon$colon!503 newAcc!49 (select (arr!19329 a!3591) from!2969))))))

(declare-fun b!708357 () Bool)

(declare-fun res!472021 () Bool)

(assert (=> b!708357 (=> (not res!472021) (not e!398655))))

(declare-fun arrayNoDuplicates!0 (array!40351 (_ BitVec 32) List!13370) Bool)

(assert (=> b!708357 (= res!472021 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708358 () Bool)

(declare-fun res!472010 () Bool)

(assert (=> b!708358 (=> (not res!472010) (not e!398655))))

(declare-fun subseq!392 (List!13370 List!13370) Bool)

(assert (=> b!708358 (= res!472010 (subseq!392 acc!652 newAcc!49))))

(declare-fun b!708359 () Bool)

(declare-fun res!472009 () Bool)

(assert (=> b!708359 (=> (not res!472009) (not e!398655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708359 (= res!472009 (validKeyInArray!0 (select (arr!19329 a!3591) from!2969)))))

(declare-fun b!708360 () Bool)

(declare-fun res!472005 () Bool)

(assert (=> b!708360 (=> (not res!472005) (not e!398655))))

(assert (=> b!708360 (= res!472005 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19719 a!3591)))))

(declare-fun b!708361 () Bool)

(declare-fun res!472017 () Bool)

(assert (=> b!708361 (=> (not res!472017) (not e!398655))))

(assert (=> b!708361 (= res!472017 (not (contains!3947 acc!652 k!2824)))))

(declare-fun b!708362 () Bool)

(declare-fun res!472006 () Bool)

(assert (=> b!708362 (=> (not res!472006) (not e!398655))))

(assert (=> b!708362 (= res!472006 (validKeyInArray!0 k!2824))))

(declare-fun b!708363 () Bool)

(declare-fun res!472018 () Bool)

(assert (=> b!708363 (=> (not res!472018) (not e!398657))))

(assert (=> b!708363 (= res!472018 (noDuplicate!1194 lt!318104))))

(declare-fun b!708364 () Bool)

(declare-fun res!472020 () Bool)

(assert (=> b!708364 (=> (not res!472020) (not e!398655))))

(declare-fun arrayContainsKey!0 (array!40351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708364 (= res!472020 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!708365 () Bool)

(declare-fun res!472019 () Bool)

(assert (=> b!708365 (=> (not res!472019) (not e!398655))))

(assert (=> b!708365 (= res!472019 (not (contains!3947 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708366 () Bool)

(declare-fun res!472013 () Bool)

(assert (=> b!708366 (=> (not res!472013) (not e!398655))))

(assert (=> b!708366 (= res!472013 (not (contains!3947 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708367 () Bool)

(declare-fun res!472008 () Bool)

(assert (=> b!708367 (=> (not res!472008) (not e!398655))))

(assert (=> b!708367 (= res!472008 (not (contains!3947 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708368 () Bool)

(declare-fun res!472023 () Bool)

(assert (=> b!708368 (=> (not res!472023) (not e!398655))))

(assert (=> b!708368 (= res!472023 (noDuplicate!1194 acc!652))))

(declare-fun b!708369 () Bool)

(assert (=> b!708369 (= e!398655 e!398657)))

(declare-fun res!472012 () Bool)

(assert (=> b!708369 (=> (not res!472012) (not e!398657))))

(assert (=> b!708369 (= res!472012 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!708369 (= lt!318104 ($colon$colon!503 acc!652 (select (arr!19329 a!3591) from!2969)))))

(declare-fun b!708370 () Bool)

(declare-fun res!472011 () Bool)

(assert (=> b!708370 (=> (not res!472011) (not e!398655))))

(declare-fun -!357 (List!13370 (_ BitVec 64)) List!13370)

(assert (=> b!708370 (= res!472011 (= (-!357 newAcc!49 k!2824) acc!652))))

(assert (= (and start!62782 res!472022) b!708368))

(assert (= (and b!708368 res!472023) b!708352))

(assert (= (and b!708352 res!472014) b!708366))

(assert (= (and b!708366 res!472013) b!708351))

(assert (= (and b!708351 res!472016) b!708364))

(assert (= (and b!708364 res!472020) b!708361))

(assert (= (and b!708361 res!472017) b!708362))

(assert (= (and b!708362 res!472006) b!708357))

(assert (= (and b!708357 res!472021) b!708358))

(assert (= (and b!708358 res!472010) b!708353))

(assert (= (and b!708353 res!472007) b!708370))

(assert (= (and b!708370 res!472011) b!708367))

(assert (= (and b!708367 res!472008) b!708365))

(assert (= (and b!708365 res!472019) b!708360))

(assert (= (and b!708360 res!472005) b!708359))

(assert (= (and b!708359 res!472009) b!708369))

(assert (= (and b!708369 res!472012) b!708363))

(assert (= (and b!708363 res!472018) b!708356))

(assert (= (and b!708356 res!472024) b!708354))

(assert (= (and b!708354 (not res!472015)) b!708355))

(declare-fun m!665815 () Bool)

(assert (=> b!708364 m!665815))

(declare-fun m!665817 () Bool)

(assert (=> b!708368 m!665817))

(declare-fun m!665819 () Bool)

(assert (=> b!708356 m!665819))

(assert (=> b!708356 m!665819))

(declare-fun m!665821 () Bool)

(assert (=> b!708356 m!665821))

(assert (=> b!708356 m!665821))

(declare-fun m!665823 () Bool)

(assert (=> b!708356 m!665823))

(declare-fun m!665825 () Bool)

(assert (=> b!708358 m!665825))

(declare-fun m!665827 () Bool)

(assert (=> b!708370 m!665827))

(declare-fun m!665829 () Bool)

(assert (=> b!708355 m!665829))

(declare-fun m!665831 () Bool)

(assert (=> b!708365 m!665831))

(assert (=> b!708359 m!665819))

(assert (=> b!708359 m!665819))

(declare-fun m!665833 () Bool)

(assert (=> b!708359 m!665833))

(declare-fun m!665835 () Bool)

(assert (=> b!708353 m!665835))

(declare-fun m!665837 () Bool)

(assert (=> b!708367 m!665837))

(declare-fun m!665839 () Bool)

(assert (=> b!708362 m!665839))

(declare-fun m!665841 () Bool)

(assert (=> b!708354 m!665841))

(declare-fun m!665843 () Bool)

(assert (=> b!708352 m!665843))

(declare-fun m!665845 () Bool)

(assert (=> b!708357 m!665845))

(declare-fun m!665847 () Bool)

(assert (=> b!708366 m!665847))

(declare-fun m!665849 () Bool)

(assert (=> start!62782 m!665849))

(assert (=> b!708369 m!665819))

(assert (=> b!708369 m!665819))

(declare-fun m!665851 () Bool)

(assert (=> b!708369 m!665851))

(declare-fun m!665853 () Bool)

(assert (=> b!708361 m!665853))

(declare-fun m!665855 () Bool)

(assert (=> b!708351 m!665855))

(declare-fun m!665857 () Bool)

(assert (=> b!708363 m!665857))

(push 1)

(assert (not start!62782))

(assert (not b!708357))

(assert (not b!708365))

(assert (not b!708362))

(assert (not b!708358))

(assert (not b!708370))

(assert (not b!708369))

(assert (not b!708356))

(assert (not b!708355))

(assert (not b!708361))

(assert (not b!708368))

(assert (not b!708366))

(assert (not b!708367))

(assert (not b!708359))

(assert (not b!708364))

(assert (not b!708351))

(assert (not b!708353))

(assert (not b!708363))

(assert (not b!708354))

(assert (not b!708352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun c!78551 () Bool)

(declare-fun call!34407 () Bool)

(declare-fun bm!34404 () Bool)

(assert (=> bm!34404 (= call!34407 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78551 (Cons!13366 (select (arr!19329 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708599 () Bool)

(declare-fun e!398783 () Bool)

(assert (=> b!708599 (= e!398783 call!34407)))

(declare-fun b!708600 () Bool)

(assert (=> b!708600 (= e!398783 call!34407)))

(declare-fun b!708601 () Bool)

(declare-fun e!398781 () Bool)

(declare-fun e!398780 () Bool)

(assert (=> b!708601 (= e!398781 e!398780)))

(declare-fun res!472232 () Bool)

(assert (=> b!708601 (=> (not res!472232) (not e!398780))))

(declare-fun e!398782 () Bool)

(assert (=> b!708601 (= res!472232 (not e!398782))))

(declare-fun res!472231 () Bool)

(assert (=> b!708601 (=> (not res!472231) (not e!398782))))

(assert (=> b!708601 (= res!472231 (validKeyInArray!0 (select (arr!19329 a!3591) from!2969)))))

(declare-fun d!96853 () Bool)

(declare-fun res!472233 () Bool)

(assert (=> d!96853 (=> res!472233 e!398781)))

(assert (=> d!96853 (= res!472233 (bvsge from!2969 (size!19719 a!3591)))))

(assert (=> d!96853 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398781)))

(declare-fun b!708602 () Bool)

(assert (=> b!708602 (= e!398780 e!398783)))

(assert (=> b!708602 (= c!78551 (validKeyInArray!0 (select (arr!19329 a!3591) from!2969)))))

(declare-fun b!708603 () Bool)

(assert (=> b!708603 (= e!398782 (contains!3947 acc!652 (select (arr!19329 a!3591) from!2969)))))

(assert (= (and d!96853 (not res!472233)) b!708601))

(assert (= (and b!708601 res!472231) b!708603))

(assert (= (and b!708601 res!472232) b!708602))

(assert (= (and b!708602 c!78551) b!708599))

(assert (= (and b!708602 (not c!78551)) b!708600))

(assert (= (or b!708599 b!708600) bm!34404))

(assert (=> bm!34404 m!665819))

(declare-fun m!666029 () Bool)

(assert (=> bm!34404 m!666029))

(assert (=> b!708601 m!665819))

(assert (=> b!708601 m!665819))

(assert (=> b!708601 m!665833))

(assert (=> b!708602 m!665819))

(assert (=> b!708602 m!665819))

(assert (=> b!708602 m!665833))

(assert (=> b!708603 m!665819))

(assert (=> b!708603 m!665819))

(declare-fun m!666031 () Bool)

(assert (=> b!708603 m!666031))

(assert (=> b!708357 d!96853))

(declare-fun d!96871 () Bool)

(declare-fun lt!318128 () Bool)

(declare-fun content!339 (List!13370) (Set (_ BitVec 64)))

(assert (=> d!96871 (= lt!318128 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!339 newAcc!49)))))

(declare-fun e!398799 () Bool)

(assert (=> d!96871 (= lt!318128 e!398799)))

(declare-fun res!472249 () Bool)

(assert (=> d!96871 (=> (not res!472249) (not e!398799))))

(assert (=> d!96871 (= res!472249 (is-Cons!13366 newAcc!49))))

(assert (=> d!96871 (= (contains!3947 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318128)))

(declare-fun b!708618 () Bool)

(declare-fun e!398798 () Bool)

(assert (=> b!708618 (= e!398799 e!398798)))

(declare-fun res!472248 () Bool)

(assert (=> b!708618 (=> res!472248 e!398798)))

(assert (=> b!708618 (= res!472248 (= (h!14411 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708619 () Bool)

(assert (=> b!708619 (= e!398798 (contains!3947 (t!19658 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96871 res!472249) b!708618))

(assert (= (and b!708618 (not res!472248)) b!708619))

(declare-fun m!666035 () Bool)

(assert (=> d!96871 m!666035))

(declare-fun m!666037 () Bool)

(assert (=> d!96871 m!666037))

(declare-fun m!666039 () Bool)

(assert (=> b!708619 m!666039))

(assert (=> b!708367 d!96871))

(declare-fun d!96875 () Bool)

(declare-fun res!472258 () Bool)

(declare-fun e!398808 () Bool)

(assert (=> d!96875 (=> res!472258 e!398808)))

(assert (=> d!96875 (= res!472258 (is-Nil!13367 ($colon$colon!503 newAcc!49 (select (arr!19329 a!3591) from!2969))))))

