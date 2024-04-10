; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62906 () Bool)

(assert start!62906)

(declare-fun b!709342 () Bool)

(declare-fun res!472900 () Bool)

(declare-fun e!399172 () Bool)

(assert (=> b!709342 (=> (not res!472900) (not e!399172))))

(declare-datatypes ((array!40373 0))(
  ( (array!40374 (arr!19337 (Array (_ BitVec 32) (_ BitVec 64))) (size!19730 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40373)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709342 (= res!472900 (validKeyInArray!0 (select (arr!19337 a!3591) from!2969)))))

(declare-fun b!709344 () Bool)

(declare-fun res!472890 () Bool)

(assert (=> b!709344 (=> (not res!472890) (not e!399172))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!709344 (= res!472890 (validKeyInArray!0 k!2824))))

(declare-fun b!709345 () Bool)

(declare-fun e!399173 () Bool)

(assert (=> b!709345 (= e!399172 e!399173)))

(declare-fun res!472905 () Bool)

(assert (=> b!709345 (=> (not res!472905) (not e!399173))))

(assert (=> b!709345 (= res!472905 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13378 0))(
  ( (Nil!13375) (Cons!13374 (h!14419 (_ BitVec 64)) (t!19672 List!13378)) )
))
(declare-fun lt!318206 () List!13378)

(declare-fun acc!652 () List!13378)

(declare-fun $colon$colon!511 (List!13378 (_ BitVec 64)) List!13378)

(assert (=> b!709345 (= lt!318206 ($colon$colon!511 acc!652 (select (arr!19337 a!3591) from!2969)))))

(declare-fun b!709346 () Bool)

(declare-fun res!472908 () Bool)

(assert (=> b!709346 (=> (not res!472908) (not e!399172))))

(declare-fun newAcc!49 () List!13378)

(declare-fun noDuplicate!1202 (List!13378) Bool)

(assert (=> b!709346 (= res!472908 (noDuplicate!1202 newAcc!49))))

(declare-fun b!709347 () Bool)

(declare-fun res!472904 () Bool)

(assert (=> b!709347 (=> (not res!472904) (not e!399172))))

(declare-fun contains!3955 (List!13378 (_ BitVec 64)) Bool)

(assert (=> b!709347 (= res!472904 (not (contains!3955 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709348 () Bool)

(declare-fun res!472892 () Bool)

(assert (=> b!709348 (=> (not res!472892) (not e!399172))))

(assert (=> b!709348 (= res!472892 (contains!3955 newAcc!49 k!2824))))

(declare-fun b!709349 () Bool)

(declare-fun res!472902 () Bool)

(assert (=> b!709349 (=> (not res!472902) (not e!399173))))

(assert (=> b!709349 (= res!472902 (not (contains!3955 lt!318206 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709350 () Bool)

(declare-fun res!472894 () Bool)

(assert (=> b!709350 (=> (not res!472894) (not e!399172))))

(declare-fun arrayNoDuplicates!0 (array!40373 (_ BitVec 32) List!13378) Bool)

(assert (=> b!709350 (= res!472894 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709351 () Bool)

(declare-fun res!472889 () Bool)

(assert (=> b!709351 (=> (not res!472889) (not e!399172))))

(declare-fun -!365 (List!13378 (_ BitVec 64)) List!13378)

(assert (=> b!709351 (= res!472889 (= (-!365 newAcc!49 k!2824) acc!652))))

(declare-fun b!709352 () Bool)

(declare-fun res!472906 () Bool)

(assert (=> b!709352 (=> (not res!472906) (not e!399173))))

(assert (=> b!709352 (= res!472906 (not (contains!3955 lt!318206 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709343 () Bool)

(declare-fun res!472891 () Bool)

(assert (=> b!709343 (=> (not res!472891) (not e!399173))))

(assert (=> b!709343 (= res!472891 (noDuplicate!1202 ($colon$colon!511 newAcc!49 (select (arr!19337 a!3591) from!2969))))))

(declare-fun res!472893 () Bool)

(assert (=> start!62906 (=> (not res!472893) (not e!399172))))

(assert (=> start!62906 (= res!472893 (and (bvslt (size!19730 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19730 a!3591))))))

(assert (=> start!62906 e!399172))

(assert (=> start!62906 true))

(declare-fun array_inv!15133 (array!40373) Bool)

(assert (=> start!62906 (array_inv!15133 a!3591)))

(declare-fun b!709353 () Bool)

(declare-fun res!472898 () Bool)

(assert (=> b!709353 (=> (not res!472898) (not e!399172))))

(assert (=> b!709353 (= res!472898 (not (contains!3955 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709354 () Bool)

(declare-fun res!472909 () Bool)

(assert (=> b!709354 (=> (not res!472909) (not e!399172))))

(declare-fun arrayContainsKey!0 (array!40373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709354 (= res!472909 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!709355 () Bool)

(declare-fun res!472896 () Bool)

(assert (=> b!709355 (=> (not res!472896) (not e!399173))))

(assert (=> b!709355 (= res!472896 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709356 () Bool)

(declare-fun res!472901 () Bool)

(assert (=> b!709356 (=> (not res!472901) (not e!399172))))

(assert (=> b!709356 (= res!472901 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19730 a!3591)))))

(declare-fun b!709357 () Bool)

(declare-fun res!472899 () Bool)

(assert (=> b!709357 (=> (not res!472899) (not e!399172))))

(assert (=> b!709357 (= res!472899 (not (contains!3955 acc!652 k!2824)))))

(declare-fun b!709358 () Bool)

(assert (=> b!709358 (= e!399173 (contains!3955 lt!318206 k!2824))))

(declare-fun b!709359 () Bool)

(declare-fun res!472907 () Bool)

(assert (=> b!709359 (=> (not res!472907) (not e!399173))))

(assert (=> b!709359 (= res!472907 (noDuplicate!1202 lt!318206))))

(declare-fun b!709360 () Bool)

(declare-fun res!472888 () Bool)

(assert (=> b!709360 (=> (not res!472888) (not e!399172))))

(assert (=> b!709360 (= res!472888 (not (contains!3955 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709361 () Bool)

(declare-fun res!472895 () Bool)

(assert (=> b!709361 (=> (not res!472895) (not e!399172))))

(assert (=> b!709361 (= res!472895 (not (contains!3955 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709362 () Bool)

(declare-fun res!472897 () Bool)

(assert (=> b!709362 (=> (not res!472897) (not e!399172))))

(declare-fun subseq!400 (List!13378 List!13378) Bool)

(assert (=> b!709362 (= res!472897 (subseq!400 acc!652 newAcc!49))))

(declare-fun b!709363 () Bool)

(declare-fun res!472903 () Bool)

(assert (=> b!709363 (=> (not res!472903) (not e!399172))))

(assert (=> b!709363 (= res!472903 (noDuplicate!1202 acc!652))))

(assert (= (and start!62906 res!472893) b!709363))

(assert (= (and b!709363 res!472903) b!709346))

(assert (= (and b!709346 res!472908) b!709353))

(assert (= (and b!709353 res!472898) b!709361))

(assert (= (and b!709361 res!472895) b!709354))

(assert (= (and b!709354 res!472909) b!709357))

(assert (= (and b!709357 res!472899) b!709344))

(assert (= (and b!709344 res!472890) b!709350))

(assert (= (and b!709350 res!472894) b!709362))

(assert (= (and b!709362 res!472897) b!709348))

(assert (= (and b!709348 res!472892) b!709351))

(assert (= (and b!709351 res!472889) b!709360))

(assert (= (and b!709360 res!472888) b!709347))

(assert (= (and b!709347 res!472904) b!709356))

(assert (= (and b!709356 res!472901) b!709342))

(assert (= (and b!709342 res!472900) b!709345))

(assert (= (and b!709345 res!472905) b!709359))

(assert (= (and b!709359 res!472907) b!709343))

(assert (= (and b!709343 res!472891) b!709349))

(assert (= (and b!709349 res!472902) b!709352))

(assert (= (and b!709352 res!472906) b!709355))

(assert (= (and b!709355 res!472896) b!709358))

(declare-fun m!666637 () Bool)

(assert (=> b!709355 m!666637))

(declare-fun m!666639 () Bool)

(assert (=> b!709363 m!666639))

(declare-fun m!666641 () Bool)

(assert (=> start!62906 m!666641))

(declare-fun m!666643 () Bool)

(assert (=> b!709350 m!666643))

(declare-fun m!666645 () Bool)

(assert (=> b!709342 m!666645))

(assert (=> b!709342 m!666645))

(declare-fun m!666647 () Bool)

(assert (=> b!709342 m!666647))

(declare-fun m!666649 () Bool)

(assert (=> b!709359 m!666649))

(assert (=> b!709343 m!666645))

(assert (=> b!709343 m!666645))

(declare-fun m!666651 () Bool)

(assert (=> b!709343 m!666651))

(assert (=> b!709343 m!666651))

(declare-fun m!666653 () Bool)

(assert (=> b!709343 m!666653))

(assert (=> b!709345 m!666645))

(assert (=> b!709345 m!666645))

(declare-fun m!666655 () Bool)

(assert (=> b!709345 m!666655))

(declare-fun m!666657 () Bool)

(assert (=> b!709360 m!666657))

(declare-fun m!666659 () Bool)

(assert (=> b!709361 m!666659))

(declare-fun m!666661 () Bool)

(assert (=> b!709351 m!666661))

(declare-fun m!666663 () Bool)

(assert (=> b!709354 m!666663))

(declare-fun m!666665 () Bool)

(assert (=> b!709349 m!666665))

(declare-fun m!666667 () Bool)

(assert (=> b!709358 m!666667))

(declare-fun m!666669 () Bool)

(assert (=> b!709348 m!666669))

(declare-fun m!666671 () Bool)

(assert (=> b!709344 m!666671))

(declare-fun m!666673 () Bool)

(assert (=> b!709362 m!666673))

(declare-fun m!666675 () Bool)

(assert (=> b!709347 m!666675))

(declare-fun m!666677 () Bool)

(assert (=> b!709346 m!666677))

(declare-fun m!666679 () Bool)

(assert (=> b!709353 m!666679))

(declare-fun m!666681 () Bool)

(assert (=> b!709357 m!666681))

(declare-fun m!666683 () Bool)

(assert (=> b!709352 m!666683))

(push 1)

(assert (not b!709347))

(assert (not b!709352))

(assert (not b!709353))

(assert (not b!709345))

(assert (not b!709363))

(assert (not b!709359))

(assert (not b!709343))

(assert (not b!709357))

(assert (not b!709360))

(assert (not b!709349))

(assert (not b!709355))

(assert (not b!709361))

(assert (not b!709344))

(assert (not b!709362))

(assert (not b!709354))

(assert (not b!709346))

(assert (not b!709358))

(assert (not start!62906))

(assert (not b!709351))

(assert (not b!709342))

(assert (not b!709350))

(assert (not b!709348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!709391 () Bool)

(declare-fun e!399200 () Bool)

(assert (=> b!709391 (= e!399200 (subseq!400 acc!652 (t!19672 newAcc!49)))))

(declare-fun d!97093 () Bool)

(declare-fun res!472936 () Bool)

(declare-fun e!399198 () Bool)

(assert (=> d!97093 (=> res!472936 e!399198)))

(assert (=> d!97093 (= res!472936 (is-Nil!13375 acc!652))))

(assert (=> d!97093 (= (subseq!400 acc!652 newAcc!49) e!399198)))

(declare-fun b!709389 () Bool)

(declare-fun e!399199 () Bool)

(assert (=> b!709389 (= e!399199 e!399200)))

(declare-fun res!472937 () Bool)

(assert (=> b!709389 (=> res!472937 e!399200)))

(declare-fun e!399201 () Bool)

(assert (=> b!709389 (= res!472937 e!399201)))

(declare-fun res!472935 () Bool)

(assert (=> b!709389 (=> (not res!472935) (not e!399201))))

(assert (=> b!709389 (= res!472935 (= (h!14419 acc!652) (h!14419 newAcc!49)))))

(declare-fun b!709390 () Bool)

(assert (=> b!709390 (= e!399201 (subseq!400 (t!19672 acc!652) (t!19672 newAcc!49)))))

(declare-fun b!709388 () Bool)

(assert (=> b!709388 (= e!399198 e!399199)))

(declare-fun res!472934 () Bool)

(assert (=> b!709388 (=> (not res!472934) (not e!399199))))

(assert (=> b!709388 (= res!472934 (is-Cons!13374 newAcc!49))))

(assert (= (and d!97093 (not res!472936)) b!709388))

(assert (= (and b!709388 res!472934) b!709389))

(assert (= (and b!709389 res!472935) b!709390))

(assert (= (and b!709389 (not res!472937)) b!709391))

(declare-fun m!666703 () Bool)

(assert (=> b!709391 m!666703))

(declare-fun m!666705 () Bool)

(assert (=> b!709390 m!666705))

(assert (=> b!709362 d!97093))

(declare-fun b!709426 () Bool)

(declare-fun e!399232 () List!13378)

(declare-fun call!34439 () List!13378)

(assert (=> b!709426 (= e!399232 call!34439)))

(declare-fun d!97099 () Bool)

(declare-fun e!399233 () Bool)

(assert (=> d!97099 e!399233))

(declare-fun res!472960 () Bool)

(assert (=> d!97099 (=> (not res!472960) (not e!399233))))

(declare-fun lt!318216 () List!13378)

(declare-fun size!19731 (List!13378) Int)

(assert (=> d!97099 (= res!472960 (<= (size!19731 lt!318216) (size!19731 newAcc!49)))))

(declare-fun e!399231 () List!13378)

(assert (=> d!97099 (= lt!318216 e!399231)))

(declare-fun c!78601 () Bool)

(assert (=> d!97099 (= c!78601 (is-Cons!13374 newAcc!49))))

(assert (=> d!97099 (= (-!365 newAcc!49 k!2824) lt!318216)))

(declare-fun b!709427 () Bool)

(assert (=> b!709427 (= e!399231 Nil!13375)))

(declare-fun bm!34436 () Bool)

(assert (=> bm!34436 (= call!34439 (-!365 (t!19672 newAcc!49) k!2824))))

(declare-fun b!709428 () Bool)

(declare-fun content!345 (List!13378) (Set (_ BitVec 64)))

(assert (=> b!709428 (= e!399233 (= (content!345 lt!318216) (setminus (content!345 newAcc!49) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!709429 () Bool)

(assert (=> b!709429 (= e!399232 (Cons!13374 (h!14419 newAcc!49) call!34439))))

(declare-fun b!709430 () Bool)

(assert (=> b!709430 (= e!399231 e!399232)))

(declare-fun c!78600 () Bool)

(assert (=> b!709430 (= c!78600 (= k!2824 (h!14419 newAcc!49)))))

(assert (= (and d!97099 c!78601) b!709430))

(assert (= (and d!97099 (not c!78601)) b!709427))

(assert (= (and b!709430 c!78600) b!709426))

(assert (= (and b!709430 (not c!78600)) b!709429))

(assert (= (or b!709426 b!709429) bm!34436))

(assert (= (and d!97099 res!472960) b!709428))

(declare-fun m!666721 () Bool)

(assert (=> d!97099 m!666721))

(declare-fun m!666723 () Bool)

(assert (=> d!97099 m!666723))

(declare-fun m!666725 () Bool)

(assert (=> bm!34436 m!666725))

(declare-fun m!666727 () Bool)

(assert (=> b!709428 m!666727))

(declare-fun m!666729 () Bool)

(assert (=> b!709428 m!666729))

(declare-fun m!666731 () Bool)

(assert (=> b!709428 m!666731))

(assert (=> b!709351 d!97099))

(declare-fun d!97111 () Bool)

(declare-fun lt!318222 () Bool)

(assert (=> d!97111 (= lt!318222 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!345 acc!652)))))

(declare-fun e!399255 () Bool)

(assert (=> d!97111 (= lt!318222 e!399255)))

(declare-fun res!472981 () Bool)

(assert (=> d!97111 (=> (not res!472981) (not e!399255))))

(assert (=> d!97111 (= res!472981 (is-Cons!13374 acc!652))))

(assert (=> d!97111 (= (contains!3955 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318222)))

(declare-fun b!709452 () Bool)

(declare-fun e!399254 () Bool)

(assert (=> b!709452 (= e!399255 e!399254)))

(declare-fun res!472980 () Bool)

(assert (=> b!709452 (=> res!472980 e!399254)))

(assert (=> b!709452 (= res!472980 (= (h!14419 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709453 () Bool)

(assert (=> b!709453 (= e!399254 (contains!3955 (t!19672 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97111 res!472981) b!709452))

(assert (= (and b!709452 (not res!472980)) b!709453))

(declare-fun m!666755 () Bool)

(assert (=> d!97111 m!666755))

(declare-fun m!666757 () Bool)

(assert (=> d!97111 m!666757))

(declare-fun m!666759 () Bool)

(assert (=> b!709453 m!666759))

(assert (=> b!709361 d!97111))

(declare-fun e!399300 () Bool)

(declare-fun b!709498 () Bool)

(assert (=> b!709498 (= e!399300 (contains!3955 acc!652 (select (arr!19337 a!3591) from!2969)))))

(declare-fun d!97123 () Bool)

(declare-fun res!473022 () Bool)

(declare-fun e!399299 () Bool)

(assert (=> d!97123 (=> res!473022 e!399299)))

(assert (=> d!97123 (= res!473022 (bvsge from!2969 (size!19730 a!3591)))))

(assert (=> d!97123 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399299)))

(declare-fun b!709499 () Bool)

(declare-fun e!399298 () Bool)

(declare-fun call!34443 () Bool)

(assert (=> b!709499 (= e!399298 call!34443)))

(declare-fun b!709500 () Bool)

(declare-fun e!399301 () Bool)

(assert (=> b!709500 (= e!399301 e!399298)))

(declare-fun c!78605 () Bool)

(assert (=> b!709500 (= c!78605 (validKeyInArray!0 (select (arr!19337 a!3591) from!2969)))))

(declare-fun bm!34440 () Bool)

(assert (=> bm!34440 (= call!34443 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78605 (Cons!13374 (select (arr!19337 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!709501 () Bool)

(assert (=> b!709501 (= e!399299 e!399301)))

(declare-fun res!473024 () Bool)

(assert (=> b!709501 (=> (not res!473024) (not e!399301))))

(assert (=> b!709501 (= res!473024 (not e!399300))))

(declare-fun res!473023 () Bool)

(assert (=> b!709501 (=> (not res!473023) (not e!399300))))

(assert (=> b!709501 (= res!473023 (validKeyInArray!0 (select (arr!19337 a!3591) from!2969)))))

(declare-fun b!709502 () Bool)

(assert (=> b!709502 (= e!399298 call!34443)))

(assert (= (and d!97123 (not res!473022)) b!709501))

(assert (= (and b!709501 res!473023) b!709498))

(assert (= (and b!709501 res!473024) b!709500))

(assert (= (and b!709500 c!78605) b!709499))

(assert (= (and b!709500 (not c!78605)) b!709502))

(assert (= (or b!709499 b!709502) bm!34440))

(assert (=> b!709498 m!666645))

(assert (=> b!709498 m!666645))

(declare-fun m!666793 () Bool)

(assert (=> b!709498 m!666793))

(assert (=> b!709500 m!666645))

(assert (=> b!709500 m!666645))

(assert (=> b!709500 m!666647))

(assert (=> bm!34440 m!666645))

(declare-fun m!666795 () Bool)

(assert (=> bm!34440 m!666795))

(assert (=> b!709501 m!666645))

(assert (=> b!709501 m!666645))

(assert (=> b!709501 m!666647))

(assert (=> b!709350 d!97123))

(declare-fun d!97147 () Bool)

(declare-fun lt!318228 () Bool)

(assert (=> d!97147 (= lt!318228 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!345 newAcc!49)))))

(declare-fun e!399307 () Bool)

(assert (=> d!97147 (= lt!318228 e!399307)))

(declare-fun res!473030 () Bool)

(assert (=> d!97147 (=> (not res!473030) (not e!399307))))

(assert (=> d!97147 (= res!473030 (is-Cons!13374 newAcc!49))))

(assert (=> d!97147 (= (contains!3955 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318228)))

(declare-fun b!709507 () Bool)

(declare-fun e!399306 () Bool)

(assert (=> b!709507 (= e!399307 e!399306)))

(declare-fun res!473029 () Bool)

(assert (=> b!709507 (=> res!473029 e!399306)))

(assert (=> b!709507 (= res!473029 (= (h!14419 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709508 () Bool)

(assert (=> b!709508 (= e!399306 (contains!3955 (t!19672 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97147 res!473030) b!709507))

(assert (= (and b!709507 (not res!473029)) b!709508))

(assert (=> d!97147 m!666729))

(declare-fun m!666797 () Bool)

(assert (=> d!97147 m!666797))

(declare-fun m!666799 () Bool)

(assert (=> b!709508 m!666799))

(assert (=> b!709360 d!97147))

(declare-fun d!97149 () Bool)

(declare-fun lt!318229 () Bool)

(assert (=> d!97149 (= lt!318229 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!345 lt!318206)))))

(declare-fun e!399312 () Bool)

(assert (=> d!97149 (= lt!318229 e!399312)))

(declare-fun res!473035 () Bool)

(assert (=> d!97149 (=> (not res!473035) (not e!399312))))

(assert (=> d!97149 (= res!473035 (is-Cons!13374 lt!318206))))

(assert (=> d!97149 (= (contains!3955 lt!318206 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318229)))

(declare-fun b!709509 () Bool)

(declare-fun e!399310 () Bool)

(assert (=> b!709509 (= e!399312 e!399310)))

(declare-fun res!473032 () Bool)

(assert (=> b!709509 (=> res!473032 e!399310)))

(assert (=> b!709509 (= res!473032 (= (h!14419 lt!318206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709511 () Bool)

(assert (=> b!709511 (= e!399310 (contains!3955 (t!19672 lt!318206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97149 res!473035) b!709509))

(assert (= (and b!709509 (not res!473032)) b!709511))

(declare-fun m!666801 () Bool)

(assert (=> d!97149 m!666801))

(declare-fun m!666803 () Bool)

(assert (=> d!97149 m!666803))

(declare-fun m!666805 () Bool)

(assert (=> b!709511 m!666805))

(assert (=> b!709349 d!97149))

(declare-fun d!97151 () Bool)

(declare-fun res!473045 () Bool)

(declare-fun e!399322 () Bool)

(assert (=> d!97151 (=> res!473045 e!399322)))

(assert (=> d!97151 (= res!473045 (is-Nil!13375 lt!318206))))

(assert (=> d!97151 (= (noDuplicate!1202 lt!318206) e!399322)))

(declare-fun b!709523 () Bool)

(declare-fun e!399323 () Bool)

(assert (=> b!709523 (= e!399322 e!399323)))

(declare-fun res!473046 () Bool)

(assert (=> b!709523 (=> (not res!473046) (not e!399323))))

(assert (=> b!709523 (= res!473046 (not (contains!3955 (t!19672 lt!318206) (h!14419 lt!318206))))))

(declare-fun b!709524 () Bool)

(assert (=> b!709524 (= e!399323 (noDuplicate!1202 (t!19672 lt!318206)))))

(assert (= (and d!97151 (not res!473045)) b!709523))

(assert (= (and b!709523 res!473046) b!709524))

(declare-fun m!666819 () Bool)

(assert (=> b!709523 m!666819))

(declare-fun m!666821 () Bool)

(assert (=> b!709524 m!666821))

(assert (=> b!709359 d!97151))

(declare-fun d!97163 () Bool)

(declare-fun lt!318230 () Bool)

(assert (=> d!97163 (= lt!318230 (member k!2824 (content!345 newAcc!49)))))

(declare-fun e!399325 () Bool)

(assert (=> d!97163 (= lt!318230 e!399325)))

(declare-fun res!473048 () Bool)

(assert (=> d!97163 (=> (not res!473048) (not e!399325))))

(assert (=> d!97163 (= res!473048 (is-Cons!13374 newAcc!49))))

(assert (=> d!97163 (= (contains!3955 newAcc!49 k!2824) lt!318230)))

(declare-fun b!709525 () Bool)

(declare-fun e!399324 () Bool)

(assert (=> b!709525 (= e!399325 e!399324)))

(declare-fun res!473047 () Bool)

(assert (=> b!709525 (=> res!473047 e!399324)))

(assert (=> b!709525 (= res!473047 (= (h!14419 newAcc!49) k!2824))))

(declare-fun b!709526 () Bool)

(assert (=> b!709526 (= e!399324 (contains!3955 (t!19672 newAcc!49) k!2824))))

(assert (= (and d!97163 res!473048) b!709525))

(assert (= (and b!709525 (not res!473047)) b!709526))

(assert (=> d!97163 m!666729))

(declare-fun m!666823 () Bool)

(assert (=> d!97163 m!666823))

(declare-fun m!666825 () Bool)

(assert (=> b!709526 m!666825))

(assert (=> b!709348 d!97163))

(declare-fun d!97165 () Bool)

(declare-fun lt!318231 () Bool)

(assert (=> d!97165 (= lt!318231 (member k!2824 (content!345 lt!318206)))))

(declare-fun e!399327 () Bool)

(assert (=> d!97165 (= lt!318231 e!399327)))

(declare-fun res!473050 () Bool)

(assert (=> d!97165 (=> (not res!473050) (not e!399327))))

(assert (=> d!97165 (= res!473050 (is-Cons!13374 lt!318206))))

(assert (=> d!97165 (= (contains!3955 lt!318206 k!2824) lt!318231)))

(declare-fun b!709527 () Bool)

(declare-fun e!399326 () Bool)

(assert (=> b!709527 (= e!399327 e!399326)))

(declare-fun res!473049 () Bool)

(assert (=> b!709527 (=> res!473049 e!399326)))

(assert (=> b!709527 (= res!473049 (= (h!14419 lt!318206) k!2824))))

(declare-fun b!709528 () Bool)

(assert (=> b!709528 (= e!399326 (contains!3955 (t!19672 lt!318206) k!2824))))

(assert (= (and d!97165 res!473050) b!709527))

(assert (= (and b!709527 (not res!473049)) b!709528))

(assert (=> d!97165 m!666801))

(declare-fun m!666827 () Bool)

(assert (=> d!97165 m!666827))

(declare-fun m!666829 () Bool)

(assert (=> b!709528 m!666829))

(assert (=> b!709358 d!97165))

(declare-fun d!97167 () Bool)

(declare-fun lt!318234 () Bool)

(assert (=> d!97167 (= lt!318234 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!345 newAcc!49)))))

(declare-fun e!399332 () Bool)

(assert (=> d!97167 (= lt!318234 e!399332)))

(declare-fun res!473052 () Bool)

(assert (=> d!97167 (=> (not res!473052) (not e!399332))))

(assert (=> d!97167 (= res!473052 (is-Cons!13374 newAcc!49))))

(assert (=> d!97167 (= (contains!3955 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318234)))

(declare-fun b!709533 () Bool)

(declare-fun e!399331 () Bool)

(assert (=> b!709533 (= e!399332 e!399331)))

(declare-fun res!473051 () Bool)

(assert (=> b!709533 (=> res!473051 e!399331)))

(assert (=> b!709533 (= res!473051 (= (h!14419 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709534 () Bool)

(assert (=> b!709534 (= e!399331 (contains!3955 (t!19672 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97167 res!473052) b!709533))

(assert (= (and b!709533 (not res!473051)) b!709534))

(assert (=> d!97167 m!666729))

(declare-fun m!666831 () Bool)

(assert (=> d!97167 m!666831))

(declare-fun m!666833 () Bool)

(assert (=> b!709534 m!666833))

(assert (=> b!709347 d!97167))

(declare-fun d!97169 () Bool)

(assert (=> d!97169 (= (array_inv!15133 a!3591) (bvsge (size!19730 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62906 d!97169))

(declare-fun d!97171 () Bool)

(declare-fun lt!318235 () Bool)

(assert (=> d!97171 (= lt!318235 (member k!2824 (content!345 acc!652)))))

(declare-fun e!399346 () Bool)

(assert (=> d!97171 (= lt!318235 e!399346)))

(declare-fun res!473062 () Bool)

(assert (=> d!97171 (=> (not res!473062) (not e!399346))))

(assert (=> d!97171 (= res!473062 (is-Cons!13374 acc!652))))

(assert (=> d!97171 (= (contains!3955 acc!652 k!2824) lt!318235)))

(declare-fun b!709549 () Bool)

(declare-fun e!399345 () Bool)

(assert (=> b!709549 (= e!399346 e!399345)))

(declare-fun res!473061 () Bool)

(assert (=> b!709549 (=> res!473061 e!399345)))

(assert (=> b!709549 (= res!473061 (= (h!14419 acc!652) k!2824))))

(declare-fun b!709550 () Bool)

(assert (=> b!709550 (= e!399345 (contains!3955 (t!19672 acc!652) k!2824))))

(assert (= (and d!97171 res!473062) b!709549))

(assert (= (and b!709549 (not res!473061)) b!709550))

(assert (=> d!97171 m!666755))

(declare-fun m!666835 () Bool)

(assert (=> d!97171 m!666835))

(declare-fun m!666837 () Bool)

(assert (=> b!709550 m!666837))

(assert (=> b!709357 d!97171))

(declare-fun d!97173 () Bool)

(declare-fun res!473063 () Bool)

(declare-fun e!399347 () Bool)

(assert (=> d!97173 (=> res!473063 e!399347)))

(assert (=> d!97173 (= res!473063 (is-Nil!13375 newAcc!49))))

(assert (=> d!97173 (= (noDuplicate!1202 newAcc!49) e!399347)))

(declare-fun b!709553 () Bool)

(declare-fun e!399348 () Bool)

(assert (=> b!709553 (= e!399347 e!399348)))

(declare-fun res!473064 () Bool)

(assert (=> b!709553 (=> (not res!473064) (not e!399348))))

(assert (=> b!709553 (= res!473064 (not (contains!3955 (t!19672 newAcc!49) (h!14419 newAcc!49))))))

(declare-fun b!709554 () Bool)

(assert (=> b!709554 (= e!399348 (noDuplicate!1202 (t!19672 newAcc!49)))))

(assert (= (and d!97173 (not res!473063)) b!709553))

(assert (= (and b!709553 res!473064) b!709554))

(declare-fun m!666839 () Bool)

(assert (=> b!709553 m!666839))

(declare-fun m!666841 () Bool)

(assert (=> b!709554 m!666841))

(assert (=> b!709346 d!97173))

(declare-fun d!97175 () Bool)

(assert (=> d!97175 (= ($colon$colon!511 acc!652 (select (arr!19337 a!3591) from!2969)) (Cons!13374 (select (arr!19337 a!3591) from!2969) acc!652))))

(assert (=> b!709345 d!97175))

(declare-fun d!97177 () Bool)

(declare-fun res!473075 () Bool)

(declare-fun e!399362 () Bool)

(assert (=> d!97177 (=> res!473075 e!399362)))

(assert (=> d!97177 (= res!473075 (= (select (arr!19337 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97177 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399362)))

(declare-fun b!709571 () Bool)

(declare-fun e!399363 () Bool)

(assert (=> b!709571 (= e!399362 e!399363)))

(declare-fun res!473076 () Bool)

(assert (=> b!709571 (=> (not res!473076) (not e!399363))))

(assert (=> b!709571 (= res!473076 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19730 a!3591)))))

(declare-fun b!709572 () Bool)

(assert (=> b!709572 (= e!399363 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97177 (not res!473075)) b!709571))

(assert (= (and b!709571 res!473076) b!709572))

(declare-fun m!666861 () Bool)

(assert (=> d!97177 m!666861))

(declare-fun m!666863 () Bool)

(assert (=> b!709572 m!666863))

(assert (=> b!709355 d!97177))

(declare-fun d!97183 () Bool)

(assert (=> d!97183 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

