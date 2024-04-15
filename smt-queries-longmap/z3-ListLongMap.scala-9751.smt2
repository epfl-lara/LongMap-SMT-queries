; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115480 () Bool)

(assert start!115480)

(declare-fun b!1366319 () Bool)

(declare-fun e!774390 () Bool)

(declare-fun e!774393 () Bool)

(assert (=> b!1366319 (= e!774390 e!774393)))

(declare-fun res!909944 () Bool)

(assert (=> b!1366319 (=> (not res!909944) (not e!774393))))

(declare-datatypes ((array!92760 0))(
  ( (array!92761 (arr!44809 (Array (_ BitVec 32) (_ BitVec 64))) (size!45361 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92760)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31955 0))(
  ( (Nil!31952) (Cons!31951 (h!33160 (_ BitVec 64)) (t!46641 List!31955)) )
))
(declare-fun acc!866 () List!31955)

(declare-fun arrayNoDuplicates!0 (array!92760 (_ BitVec 32) List!31955) Bool)

(assert (=> b!1366319 (= res!909944 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44946 0))(
  ( (Unit!44947) )
))
(declare-fun lt!601365 () Unit!44946)

(declare-fun newAcc!98 () List!31955)

(declare-fun noDuplicateSubseq!173 (List!31955 List!31955) Unit!44946)

(assert (=> b!1366319 (= lt!601365 (noDuplicateSubseq!173 newAcc!98 acc!866))))

(declare-fun b!1366320 () Bool)

(declare-fun e!774391 () Bool)

(declare-fun lt!601367 () List!31955)

(declare-fun noDuplicate!2463 (List!31955) Bool)

(assert (=> b!1366320 (= e!774391 (noDuplicate!2463 lt!601367))))

(declare-fun b!1366321 () Bool)

(declare-fun res!909936 () Bool)

(assert (=> b!1366321 (=> (not res!909936) (not e!774390))))

(declare-fun subseq!986 (List!31955 List!31955) Bool)

(assert (=> b!1366321 (= res!909936 (subseq!986 newAcc!98 acc!866))))

(declare-fun b!1366322 () Bool)

(declare-fun res!909940 () Bool)

(assert (=> b!1366322 (=> (not res!909940) (not e!774393))))

(assert (=> b!1366322 (= res!909940 (bvslt from!3239 (size!45361 a!3861)))))

(declare-fun b!1366323 () Bool)

(declare-fun res!909946 () Bool)

(assert (=> b!1366323 (=> (not res!909946) (not e!774390))))

(declare-fun contains!9548 (List!31955 (_ BitVec 64)) Bool)

(assert (=> b!1366323 (= res!909946 (not (contains!9548 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366324 () Bool)

(declare-fun res!909938 () Bool)

(assert (=> b!1366324 (=> (not res!909938) (not e!774390))))

(assert (=> b!1366324 (= res!909938 (noDuplicate!2463 acc!866))))

(declare-fun res!909942 () Bool)

(assert (=> start!115480 (=> (not res!909942) (not e!774390))))

(assert (=> start!115480 (= res!909942 (and (bvslt (size!45361 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45361 a!3861))))))

(assert (=> start!115480 e!774390))

(declare-fun array_inv!34042 (array!92760) Bool)

(assert (=> start!115480 (array_inv!34042 a!3861)))

(assert (=> start!115480 true))

(declare-fun b!1366325 () Bool)

(declare-fun res!909937 () Bool)

(assert (=> b!1366325 (=> (not res!909937) (not e!774390))))

(assert (=> b!1366325 (= res!909937 (not (contains!9548 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366326 () Bool)

(declare-fun res!909939 () Bool)

(assert (=> b!1366326 (=> (not res!909939) (not e!774390))))

(assert (=> b!1366326 (= res!909939 (not (contains!9548 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366327 () Bool)

(declare-fun res!909943 () Bool)

(assert (=> b!1366327 (=> (not res!909943) (not e!774393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366327 (= res!909943 (validKeyInArray!0 (select (arr!44809 a!3861) from!3239)))))

(declare-fun b!1366328 () Bool)

(declare-fun res!909947 () Bool)

(assert (=> b!1366328 (=> (not res!909947) (not e!774393))))

(assert (=> b!1366328 (= res!909947 (not (contains!9548 acc!866 (select (arr!44809 a!3861) from!3239))))))

(declare-fun b!1366329 () Bool)

(assert (=> b!1366329 (= e!774393 (not e!774391))))

(declare-fun res!909941 () Bool)

(assert (=> b!1366329 (=> (not res!909941) (not e!774391))))

(declare-fun lt!601368 () List!31955)

(assert (=> b!1366329 (= res!909941 (subseq!986 lt!601368 lt!601367))))

(assert (=> b!1366329 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601368)))

(declare-fun lt!601366 () Unit!44946)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92760 List!31955 List!31955 (_ BitVec 32)) Unit!44946)

(assert (=> b!1366329 (= lt!601366 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601367 lt!601368 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366329 (= lt!601368 (Cons!31951 (select (arr!44809 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366329 (= lt!601367 (Cons!31951 (select (arr!44809 a!3861) from!3239) acc!866))))

(declare-fun b!1366330 () Bool)

(declare-fun res!909945 () Bool)

(assert (=> b!1366330 (=> (not res!909945) (not e!774390))))

(assert (=> b!1366330 (= res!909945 (not (contains!9548 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115480 res!909942) b!1366324))

(assert (= (and b!1366324 res!909938) b!1366323))

(assert (= (and b!1366323 res!909946) b!1366330))

(assert (= (and b!1366330 res!909945) b!1366325))

(assert (= (and b!1366325 res!909937) b!1366326))

(assert (= (and b!1366326 res!909939) b!1366321))

(assert (= (and b!1366321 res!909936) b!1366319))

(assert (= (and b!1366319 res!909944) b!1366322))

(assert (= (and b!1366322 res!909940) b!1366327))

(assert (= (and b!1366327 res!909943) b!1366328))

(assert (= (and b!1366328 res!909947) b!1366329))

(assert (= (and b!1366329 res!909941) b!1366320))

(declare-fun m!1250175 () Bool)

(assert (=> b!1366328 m!1250175))

(assert (=> b!1366328 m!1250175))

(declare-fun m!1250177 () Bool)

(assert (=> b!1366328 m!1250177))

(assert (=> b!1366327 m!1250175))

(assert (=> b!1366327 m!1250175))

(declare-fun m!1250179 () Bool)

(assert (=> b!1366327 m!1250179))

(declare-fun m!1250181 () Bool)

(assert (=> b!1366325 m!1250181))

(declare-fun m!1250183 () Bool)

(assert (=> b!1366319 m!1250183))

(declare-fun m!1250185 () Bool)

(assert (=> b!1366319 m!1250185))

(declare-fun m!1250187 () Bool)

(assert (=> b!1366320 m!1250187))

(declare-fun m!1250189 () Bool)

(assert (=> b!1366323 m!1250189))

(declare-fun m!1250191 () Bool)

(assert (=> b!1366329 m!1250191))

(declare-fun m!1250193 () Bool)

(assert (=> b!1366329 m!1250193))

(declare-fun m!1250195 () Bool)

(assert (=> b!1366329 m!1250195))

(assert (=> b!1366329 m!1250175))

(declare-fun m!1250197 () Bool)

(assert (=> b!1366321 m!1250197))

(declare-fun m!1250199 () Bool)

(assert (=> start!115480 m!1250199))

(declare-fun m!1250201 () Bool)

(assert (=> b!1366330 m!1250201))

(declare-fun m!1250203 () Bool)

(assert (=> b!1366326 m!1250203))

(declare-fun m!1250205 () Bool)

(assert (=> b!1366324 m!1250205))

(check-sat (not b!1366320) (not b!1366326) (not b!1366324) (not b!1366323) (not b!1366325) (not b!1366328) (not b!1366319) (not b!1366321) (not b!1366330) (not b!1366329) (not b!1366327) (not start!115480))
(check-sat)
(get-model)

(declare-fun d!146497 () Bool)

(declare-fun lt!601395 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!707 (List!31955) (InoxSet (_ BitVec 64)))

(assert (=> d!146497 (= lt!601395 (select (content!707 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774423 () Bool)

(assert (=> d!146497 (= lt!601395 e!774423)))

(declare-fun res!910025 () Bool)

(assert (=> d!146497 (=> (not res!910025) (not e!774423))))

(get-info :version)

(assert (=> d!146497 (= res!910025 ((_ is Cons!31951) acc!866))))

(assert (=> d!146497 (= (contains!9548 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601395)))

(declare-fun b!1366407 () Bool)

(declare-fun e!774422 () Bool)

(assert (=> b!1366407 (= e!774423 e!774422)))

(declare-fun res!910024 () Bool)

(assert (=> b!1366407 (=> res!910024 e!774422)))

(assert (=> b!1366407 (= res!910024 (= (h!33160 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366408 () Bool)

(assert (=> b!1366408 (= e!774422 (contains!9548 (t!46641 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146497 res!910025) b!1366407))

(assert (= (and b!1366407 (not res!910024)) b!1366408))

(declare-fun m!1250271 () Bool)

(assert (=> d!146497 m!1250271))

(declare-fun m!1250273 () Bool)

(assert (=> d!146497 m!1250273))

(declare-fun m!1250275 () Bool)

(assert (=> b!1366408 m!1250275))

(assert (=> b!1366323 d!146497))

(declare-fun d!146499 () Bool)

(declare-fun lt!601396 () Bool)

(assert (=> d!146499 (= lt!601396 (select (content!707 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774425 () Bool)

(assert (=> d!146499 (= lt!601396 e!774425)))

(declare-fun res!910027 () Bool)

(assert (=> d!146499 (=> (not res!910027) (not e!774425))))

(assert (=> d!146499 (= res!910027 ((_ is Cons!31951) newAcc!98))))

(assert (=> d!146499 (= (contains!9548 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601396)))

(declare-fun b!1366409 () Bool)

(declare-fun e!774424 () Bool)

(assert (=> b!1366409 (= e!774425 e!774424)))

(declare-fun res!910026 () Bool)

(assert (=> b!1366409 (=> res!910026 e!774424)))

(assert (=> b!1366409 (= res!910026 (= (h!33160 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366410 () Bool)

(assert (=> b!1366410 (= e!774424 (contains!9548 (t!46641 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146499 res!910027) b!1366409))

(assert (= (and b!1366409 (not res!910026)) b!1366410))

(declare-fun m!1250277 () Bool)

(assert (=> d!146499 m!1250277))

(declare-fun m!1250279 () Bool)

(assert (=> d!146499 m!1250279))

(declare-fun m!1250281 () Bool)

(assert (=> b!1366410 m!1250281))

(assert (=> b!1366325 d!146499))

(declare-fun d!146501 () Bool)

(declare-fun res!910032 () Bool)

(declare-fun e!774430 () Bool)

(assert (=> d!146501 (=> res!910032 e!774430)))

(assert (=> d!146501 (= res!910032 ((_ is Nil!31952) acc!866))))

(assert (=> d!146501 (= (noDuplicate!2463 acc!866) e!774430)))

(declare-fun b!1366415 () Bool)

(declare-fun e!774431 () Bool)

(assert (=> b!1366415 (= e!774430 e!774431)))

(declare-fun res!910033 () Bool)

(assert (=> b!1366415 (=> (not res!910033) (not e!774431))))

(assert (=> b!1366415 (= res!910033 (not (contains!9548 (t!46641 acc!866) (h!33160 acc!866))))))

(declare-fun b!1366416 () Bool)

(assert (=> b!1366416 (= e!774431 (noDuplicate!2463 (t!46641 acc!866)))))

(assert (= (and d!146501 (not res!910032)) b!1366415))

(assert (= (and b!1366415 res!910033) b!1366416))

(declare-fun m!1250283 () Bool)

(assert (=> b!1366415 m!1250283))

(declare-fun m!1250285 () Bool)

(assert (=> b!1366416 m!1250285))

(assert (=> b!1366324 d!146501))

(declare-fun b!1366438 () Bool)

(declare-fun e!774452 () Bool)

(assert (=> b!1366438 (= e!774452 (subseq!986 newAcc!98 (t!46641 acc!866)))))

(declare-fun b!1366437 () Bool)

(declare-fun e!774450 () Bool)

(assert (=> b!1366437 (= e!774450 (subseq!986 (t!46641 newAcc!98) (t!46641 acc!866)))))

(declare-fun b!1366436 () Bool)

(declare-fun e!774451 () Bool)

(assert (=> b!1366436 (= e!774451 e!774452)))

(declare-fun res!910054 () Bool)

(assert (=> b!1366436 (=> res!910054 e!774452)))

(assert (=> b!1366436 (= res!910054 e!774450)))

(declare-fun res!910052 () Bool)

(assert (=> b!1366436 (=> (not res!910052) (not e!774450))))

(assert (=> b!1366436 (= res!910052 (= (h!33160 newAcc!98) (h!33160 acc!866)))))

(declare-fun b!1366435 () Bool)

(declare-fun e!774453 () Bool)

(assert (=> b!1366435 (= e!774453 e!774451)))

(declare-fun res!910055 () Bool)

(assert (=> b!1366435 (=> (not res!910055) (not e!774451))))

(assert (=> b!1366435 (= res!910055 ((_ is Cons!31951) acc!866))))

(declare-fun d!146503 () Bool)

(declare-fun res!910053 () Bool)

(assert (=> d!146503 (=> res!910053 e!774453)))

(assert (=> d!146503 (= res!910053 ((_ is Nil!31952) newAcc!98))))

(assert (=> d!146503 (= (subseq!986 newAcc!98 acc!866) e!774453)))

(assert (= (and d!146503 (not res!910053)) b!1366435))

(assert (= (and b!1366435 res!910055) b!1366436))

(assert (= (and b!1366436 res!910052) b!1366437))

(assert (= (and b!1366436 (not res!910054)) b!1366438))

(declare-fun m!1250291 () Bool)

(assert (=> b!1366438 m!1250291))

(declare-fun m!1250293 () Bool)

(assert (=> b!1366437 m!1250293))

(assert (=> b!1366321 d!146503))

(declare-fun d!146513 () Bool)

(declare-fun res!910058 () Bool)

(declare-fun e!774456 () Bool)

(assert (=> d!146513 (=> res!910058 e!774456)))

(assert (=> d!146513 (= res!910058 ((_ is Nil!31952) lt!601367))))

(assert (=> d!146513 (= (noDuplicate!2463 lt!601367) e!774456)))

(declare-fun b!1366441 () Bool)

(declare-fun e!774457 () Bool)

(assert (=> b!1366441 (= e!774456 e!774457)))

(declare-fun res!910059 () Bool)

(assert (=> b!1366441 (=> (not res!910059) (not e!774457))))

(assert (=> b!1366441 (= res!910059 (not (contains!9548 (t!46641 lt!601367) (h!33160 lt!601367))))))

(declare-fun b!1366442 () Bool)

(assert (=> b!1366442 (= e!774457 (noDuplicate!2463 (t!46641 lt!601367)))))

(assert (= (and d!146513 (not res!910058)) b!1366441))

(assert (= (and b!1366441 res!910059) b!1366442))

(declare-fun m!1250299 () Bool)

(assert (=> b!1366441 m!1250299))

(declare-fun m!1250301 () Bool)

(assert (=> b!1366442 m!1250301))

(assert (=> b!1366320 d!146513))

(declare-fun b!1366446 () Bool)

(declare-fun e!774460 () Bool)

(assert (=> b!1366446 (= e!774460 (subseq!986 lt!601368 (t!46641 lt!601367)))))

(declare-fun b!1366445 () Bool)

(declare-fun e!774458 () Bool)

(assert (=> b!1366445 (= e!774458 (subseq!986 (t!46641 lt!601368) (t!46641 lt!601367)))))

(declare-fun b!1366444 () Bool)

(declare-fun e!774459 () Bool)

(assert (=> b!1366444 (= e!774459 e!774460)))

(declare-fun res!910062 () Bool)

(assert (=> b!1366444 (=> res!910062 e!774460)))

(assert (=> b!1366444 (= res!910062 e!774458)))

(declare-fun res!910060 () Bool)

(assert (=> b!1366444 (=> (not res!910060) (not e!774458))))

(assert (=> b!1366444 (= res!910060 (= (h!33160 lt!601368) (h!33160 lt!601367)))))

(declare-fun b!1366443 () Bool)

(declare-fun e!774461 () Bool)

(assert (=> b!1366443 (= e!774461 e!774459)))

(declare-fun res!910063 () Bool)

(assert (=> b!1366443 (=> (not res!910063) (not e!774459))))

(assert (=> b!1366443 (= res!910063 ((_ is Cons!31951) lt!601367))))

(declare-fun d!146515 () Bool)

(declare-fun res!910061 () Bool)

(assert (=> d!146515 (=> res!910061 e!774461)))

(assert (=> d!146515 (= res!910061 ((_ is Nil!31952) lt!601368))))

(assert (=> d!146515 (= (subseq!986 lt!601368 lt!601367) e!774461)))

(assert (= (and d!146515 (not res!910061)) b!1366443))

(assert (= (and b!1366443 res!910063) b!1366444))

(assert (= (and b!1366444 res!910060) b!1366445))

(assert (= (and b!1366444 (not res!910062)) b!1366446))

(declare-fun m!1250303 () Bool)

(assert (=> b!1366446 m!1250303))

(declare-fun m!1250305 () Bool)

(assert (=> b!1366445 m!1250305))

(assert (=> b!1366329 d!146515))

(declare-fun b!1366477 () Bool)

(declare-fun e!774492 () Bool)

(declare-fun call!65443 () Bool)

(assert (=> b!1366477 (= e!774492 call!65443)))

(declare-fun b!1366478 () Bool)

(declare-fun e!774490 () Bool)

(declare-fun e!774491 () Bool)

(assert (=> b!1366478 (= e!774490 e!774491)))

(declare-fun res!910091 () Bool)

(assert (=> b!1366478 (=> (not res!910091) (not e!774491))))

(declare-fun e!774493 () Bool)

(assert (=> b!1366478 (= res!910091 (not e!774493))))

(declare-fun res!910092 () Bool)

(assert (=> b!1366478 (=> (not res!910092) (not e!774493))))

(assert (=> b!1366478 (= res!910092 (validKeyInArray!0 (select (arr!44809 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1366479 () Bool)

(assert (=> b!1366479 (= e!774492 call!65443)))

(declare-fun b!1366480 () Bool)

(assert (=> b!1366480 (= e!774493 (contains!9548 lt!601368 (select (arr!44809 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!146517 () Bool)

(declare-fun res!910090 () Bool)

(assert (=> d!146517 (=> res!910090 e!774490)))

(assert (=> d!146517 (= res!910090 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45361 a!3861)))))

(assert (=> d!146517 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601368) e!774490)))

(declare-fun c!127636 () Bool)

(declare-fun bm!65440 () Bool)

(assert (=> bm!65440 (= call!65443 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127636 (Cons!31951 (select (arr!44809 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!601368) lt!601368)))))

(declare-fun b!1366481 () Bool)

(assert (=> b!1366481 (= e!774491 e!774492)))

(assert (=> b!1366481 (= c!127636 (validKeyInArray!0 (select (arr!44809 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!146517 (not res!910090)) b!1366478))

(assert (= (and b!1366478 res!910092) b!1366480))

(assert (= (and b!1366478 res!910091) b!1366481))

(assert (= (and b!1366481 c!127636) b!1366479))

(assert (= (and b!1366481 (not c!127636)) b!1366477))

(assert (= (or b!1366479 b!1366477) bm!65440))

(declare-fun m!1250323 () Bool)

(assert (=> b!1366478 m!1250323))

(assert (=> b!1366478 m!1250323))

(declare-fun m!1250325 () Bool)

(assert (=> b!1366478 m!1250325))

(assert (=> b!1366480 m!1250323))

(assert (=> b!1366480 m!1250323))

(declare-fun m!1250327 () Bool)

(assert (=> b!1366480 m!1250327))

(assert (=> bm!65440 m!1250323))

(declare-fun m!1250329 () Bool)

(assert (=> bm!65440 m!1250329))

(assert (=> b!1366481 m!1250323))

(assert (=> b!1366481 m!1250323))

(assert (=> b!1366481 m!1250325))

(assert (=> b!1366329 d!146517))

(declare-fun d!146527 () Bool)

(assert (=> d!146527 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601368)))

(declare-fun lt!601405 () Unit!44946)

(declare-fun choose!80 (array!92760 List!31955 List!31955 (_ BitVec 32)) Unit!44946)

(assert (=> d!146527 (= lt!601405 (choose!80 a!3861 lt!601367 lt!601368 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146527 (bvslt (size!45361 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146527 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601367 lt!601368 (bvadd #b00000000000000000000000000000001 from!3239)) lt!601405)))

(declare-fun bs!39176 () Bool)

(assert (= bs!39176 d!146527))

(assert (=> bs!39176 m!1250193))

(declare-fun m!1250335 () Bool)

(assert (=> bs!39176 m!1250335))

(assert (=> b!1366329 d!146527))

(declare-fun d!146531 () Bool)

(declare-fun lt!601406 () Bool)

(assert (=> d!146531 (= lt!601406 (select (content!707 acc!866) (select (arr!44809 a!3861) from!3239)))))

(declare-fun e!774515 () Bool)

(assert (=> d!146531 (= lt!601406 e!774515)))

(declare-fun res!910112 () Bool)

(assert (=> d!146531 (=> (not res!910112) (not e!774515))))

(assert (=> d!146531 (= res!910112 ((_ is Cons!31951) acc!866))))

(assert (=> d!146531 (= (contains!9548 acc!866 (select (arr!44809 a!3861) from!3239)) lt!601406)))

(declare-fun b!1366504 () Bool)

(declare-fun e!774514 () Bool)

(assert (=> b!1366504 (= e!774515 e!774514)))

(declare-fun res!910111 () Bool)

(assert (=> b!1366504 (=> res!910111 e!774514)))

(assert (=> b!1366504 (= res!910111 (= (h!33160 acc!866) (select (arr!44809 a!3861) from!3239)))))

(declare-fun b!1366505 () Bool)

(assert (=> b!1366505 (= e!774514 (contains!9548 (t!46641 acc!866) (select (arr!44809 a!3861) from!3239)))))

(assert (= (and d!146531 res!910112) b!1366504))

(assert (= (and b!1366504 (not res!910111)) b!1366505))

(assert (=> d!146531 m!1250271))

(assert (=> d!146531 m!1250175))

(declare-fun m!1250337 () Bool)

(assert (=> d!146531 m!1250337))

(assert (=> b!1366505 m!1250175))

(declare-fun m!1250339 () Bool)

(assert (=> b!1366505 m!1250339))

(assert (=> b!1366328 d!146531))

(declare-fun d!146533 () Bool)

(assert (=> d!146533 (= (array_inv!34042 a!3861) (bvsge (size!45361 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115480 d!146533))

(declare-fun d!146535 () Bool)

(declare-fun lt!601407 () Bool)

(assert (=> d!146535 (= lt!601407 (select (content!707 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774517 () Bool)

(assert (=> d!146535 (= lt!601407 e!774517)))

(declare-fun res!910114 () Bool)

(assert (=> d!146535 (=> (not res!910114) (not e!774517))))

(assert (=> d!146535 (= res!910114 ((_ is Cons!31951) acc!866))))

(assert (=> d!146535 (= (contains!9548 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601407)))

(declare-fun b!1366506 () Bool)

(declare-fun e!774516 () Bool)

(assert (=> b!1366506 (= e!774517 e!774516)))

(declare-fun res!910113 () Bool)

(assert (=> b!1366506 (=> res!910113 e!774516)))

(assert (=> b!1366506 (= res!910113 (= (h!33160 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366507 () Bool)

(assert (=> b!1366507 (= e!774516 (contains!9548 (t!46641 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146535 res!910114) b!1366506))

(assert (= (and b!1366506 (not res!910113)) b!1366507))

(assert (=> d!146535 m!1250271))

(declare-fun m!1250341 () Bool)

(assert (=> d!146535 m!1250341))

(declare-fun m!1250343 () Bool)

(assert (=> b!1366507 m!1250343))

(assert (=> b!1366330 d!146535))

(declare-fun b!1366508 () Bool)

(declare-fun e!774520 () Bool)

(declare-fun call!65446 () Bool)

(assert (=> b!1366508 (= e!774520 call!65446)))

(declare-fun b!1366509 () Bool)

(declare-fun e!774518 () Bool)

(declare-fun e!774519 () Bool)

(assert (=> b!1366509 (= e!774518 e!774519)))

(declare-fun res!910116 () Bool)

(assert (=> b!1366509 (=> (not res!910116) (not e!774519))))

(declare-fun e!774521 () Bool)

(assert (=> b!1366509 (= res!910116 (not e!774521))))

(declare-fun res!910117 () Bool)

(assert (=> b!1366509 (=> (not res!910117) (not e!774521))))

(assert (=> b!1366509 (= res!910117 (validKeyInArray!0 (select (arr!44809 a!3861) from!3239)))))

(declare-fun b!1366510 () Bool)

(assert (=> b!1366510 (= e!774520 call!65446)))

(declare-fun b!1366511 () Bool)

(assert (=> b!1366511 (= e!774521 (contains!9548 acc!866 (select (arr!44809 a!3861) from!3239)))))

(declare-fun d!146537 () Bool)

(declare-fun res!910115 () Bool)

(assert (=> d!146537 (=> res!910115 e!774518)))

(assert (=> d!146537 (= res!910115 (bvsge from!3239 (size!45361 a!3861)))))

(assert (=> d!146537 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!774518)))

(declare-fun c!127639 () Bool)

(declare-fun bm!65443 () Bool)

(assert (=> bm!65443 (= call!65446 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127639 (Cons!31951 (select (arr!44809 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1366512 () Bool)

(assert (=> b!1366512 (= e!774519 e!774520)))

(assert (=> b!1366512 (= c!127639 (validKeyInArray!0 (select (arr!44809 a!3861) from!3239)))))

(assert (= (and d!146537 (not res!910115)) b!1366509))

(assert (= (and b!1366509 res!910117) b!1366511))

(assert (= (and b!1366509 res!910116) b!1366512))

(assert (= (and b!1366512 c!127639) b!1366510))

(assert (= (and b!1366512 (not c!127639)) b!1366508))

(assert (= (or b!1366510 b!1366508) bm!65443))

(assert (=> b!1366509 m!1250175))

(assert (=> b!1366509 m!1250175))

(assert (=> b!1366509 m!1250179))

(assert (=> b!1366511 m!1250175))

(assert (=> b!1366511 m!1250175))

(assert (=> b!1366511 m!1250177))

(assert (=> bm!65443 m!1250175))

(declare-fun m!1250345 () Bool)

(assert (=> bm!65443 m!1250345))

(assert (=> b!1366512 m!1250175))

(assert (=> b!1366512 m!1250175))

(assert (=> b!1366512 m!1250179))

(assert (=> b!1366319 d!146537))

(declare-fun d!146539 () Bool)

(assert (=> d!146539 (noDuplicate!2463 newAcc!98)))

(declare-fun lt!601410 () Unit!44946)

(declare-fun choose!2000 (List!31955 List!31955) Unit!44946)

(assert (=> d!146539 (= lt!601410 (choose!2000 newAcc!98 acc!866))))

(declare-fun e!774536 () Bool)

(assert (=> d!146539 e!774536))

(declare-fun res!910129 () Bool)

(assert (=> d!146539 (=> (not res!910129) (not e!774536))))

(assert (=> d!146539 (= res!910129 (subseq!986 newAcc!98 acc!866))))

(assert (=> d!146539 (= (noDuplicateSubseq!173 newAcc!98 acc!866) lt!601410)))

(declare-fun b!1366530 () Bool)

(assert (=> b!1366530 (= e!774536 (noDuplicate!2463 acc!866))))

(assert (= (and d!146539 res!910129) b!1366530))

(declare-fun m!1250355 () Bool)

(assert (=> d!146539 m!1250355))

(declare-fun m!1250357 () Bool)

(assert (=> d!146539 m!1250357))

(assert (=> d!146539 m!1250197))

(assert (=> b!1366530 m!1250205))

(assert (=> b!1366319 d!146539))

(declare-fun d!146543 () Bool)

(declare-fun lt!601413 () Bool)

(assert (=> d!146543 (= lt!601413 (select (content!707 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774540 () Bool)

(assert (=> d!146543 (= lt!601413 e!774540)))

(declare-fun res!910133 () Bool)

(assert (=> d!146543 (=> (not res!910133) (not e!774540))))

(assert (=> d!146543 (= res!910133 ((_ is Cons!31951) newAcc!98))))

(assert (=> d!146543 (= (contains!9548 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601413)))

(declare-fun b!1366531 () Bool)

(declare-fun e!774537 () Bool)

(assert (=> b!1366531 (= e!774540 e!774537)))

(declare-fun res!910131 () Bool)

(assert (=> b!1366531 (=> res!910131 e!774537)))

(assert (=> b!1366531 (= res!910131 (= (h!33160 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366532 () Bool)

(assert (=> b!1366532 (= e!774537 (contains!9548 (t!46641 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146543 res!910133) b!1366531))

(assert (= (and b!1366531 (not res!910131)) b!1366532))

(assert (=> d!146543 m!1250277))

(declare-fun m!1250359 () Bool)

(assert (=> d!146543 m!1250359))

(declare-fun m!1250361 () Bool)

(assert (=> b!1366532 m!1250361))

(assert (=> b!1366326 d!146543))

(declare-fun d!146545 () Bool)

(assert (=> d!146545 (= (validKeyInArray!0 (select (arr!44809 a!3861) from!3239)) (and (not (= (select (arr!44809 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44809 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1366327 d!146545))

(check-sat (not d!146539) (not d!146497) (not d!146527) (not b!1366442) (not b!1366532) (not b!1366410) (not d!146543) (not b!1366512) (not d!146535) (not b!1366509) (not b!1366478) (not bm!65443) (not b!1366481) (not b!1366446) (not b!1366408) (not b!1366416) (not b!1366437) (not b!1366438) (not bm!65440) (not b!1366507) (not b!1366505) (not d!146531) (not b!1366480) (not b!1366511) (not b!1366445) (not b!1366530) (not b!1366441) (not b!1366415) (not d!146499))
(check-sat)
