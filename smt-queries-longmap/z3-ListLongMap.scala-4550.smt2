; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63436 () Bool)

(assert start!63436)

(declare-fun b!714279 () Bool)

(declare-fun res!477247 () Bool)

(declare-fun e!401511 () Bool)

(assert (=> b!714279 (=> (not res!477247) (not e!401511))))

(declare-datatypes ((List!13323 0))(
  ( (Nil!13320) (Cons!13319 (h!14367 (_ BitVec 64)) (t!19630 List!13323)) )
))
(declare-fun newAcc!49 () List!13323)

(declare-fun contains!3975 (List!13323 (_ BitVec 64)) Bool)

(assert (=> b!714279 (= res!477247 (not (contains!3975 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714280 () Bool)

(declare-fun res!477252 () Bool)

(assert (=> b!714280 (=> (not res!477252) (not e!401511))))

(assert (=> b!714280 (= res!477252 (not (contains!3975 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714281 () Bool)

(declare-fun res!477241 () Bool)

(assert (=> b!714281 (=> (not res!477241) (not e!401511))))

(declare-fun acc!652 () List!13323)

(assert (=> b!714281 (= res!477241 (not (contains!3975 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714282 () Bool)

(declare-fun res!477250 () Bool)

(assert (=> b!714282 (=> (not res!477250) (not e!401511))))

(assert (=> b!714282 (= res!477250 (not (contains!3975 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!40476 0))(
  ( (array!40477 (arr!19375 (Array (_ BitVec 32) (_ BitVec 64))) (size!19787 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40476)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun b!714283 () Bool)

(declare-fun arrayContainsKey!0 (array!40476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714283 (= e!401511 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(declare-fun b!714285 () Bool)

(declare-fun res!477248 () Bool)

(assert (=> b!714285 (=> (not res!477248) (not e!401511))))

(assert (=> b!714285 (= res!477248 (not (contains!3975 acc!652 k0!2824)))))

(declare-fun b!714286 () Bool)

(declare-fun res!477251 () Bool)

(assert (=> b!714286 (=> (not res!477251) (not e!401511))))

(assert (=> b!714286 (= res!477251 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19787 a!3591)))))

(declare-fun b!714287 () Bool)

(declare-fun res!477256 () Bool)

(assert (=> b!714287 (=> (not res!477256) (not e!401511))))

(declare-fun -!407 (List!13323 (_ BitVec 64)) List!13323)

(assert (=> b!714287 (= res!477256 (= (-!407 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714288 () Bool)

(declare-fun res!477255 () Bool)

(assert (=> b!714288 (=> (not res!477255) (not e!401511))))

(assert (=> b!714288 (= res!477255 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714289 () Bool)

(declare-fun res!477254 () Bool)

(assert (=> b!714289 (=> (not res!477254) (not e!401511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714289 (= res!477254 (validKeyInArray!0 k0!2824))))

(declare-fun b!714290 () Bool)

(declare-fun res!477249 () Bool)

(assert (=> b!714290 (=> (not res!477249) (not e!401511))))

(assert (=> b!714290 (= res!477249 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714291 () Bool)

(declare-fun res!477242 () Bool)

(assert (=> b!714291 (=> (not res!477242) (not e!401511))))

(declare-fun noDuplicate!1249 (List!13323) Bool)

(assert (=> b!714291 (= res!477242 (noDuplicate!1249 newAcc!49))))

(declare-fun b!714292 () Bool)

(declare-fun res!477245 () Bool)

(assert (=> b!714292 (=> (not res!477245) (not e!401511))))

(assert (=> b!714292 (= res!477245 (noDuplicate!1249 acc!652))))

(declare-fun b!714293 () Bool)

(declare-fun res!477243 () Bool)

(assert (=> b!714293 (=> (not res!477243) (not e!401511))))

(declare-fun subseq!443 (List!13323 List!13323) Bool)

(assert (=> b!714293 (= res!477243 (subseq!443 acc!652 newAcc!49))))

(declare-fun b!714294 () Bool)

(declare-fun res!477240 () Bool)

(assert (=> b!714294 (=> (not res!477240) (not e!401511))))

(assert (=> b!714294 (= res!477240 (contains!3975 newAcc!49 k0!2824))))

(declare-fun b!714295 () Bool)

(declare-fun res!477253 () Bool)

(assert (=> b!714295 (=> (not res!477253) (not e!401511))))

(assert (=> b!714295 (= res!477253 (not (validKeyInArray!0 (select (arr!19375 a!3591) from!2969))))))

(declare-fun b!714284 () Bool)

(declare-fun res!477244 () Bool)

(assert (=> b!714284 (=> (not res!477244) (not e!401511))))

(declare-fun arrayNoDuplicates!0 (array!40476 (_ BitVec 32) List!13323) Bool)

(assert (=> b!714284 (= res!477244 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!477246 () Bool)

(assert (=> start!63436 (=> (not res!477246) (not e!401511))))

(assert (=> start!63436 (= res!477246 (and (bvslt (size!19787 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19787 a!3591))))))

(assert (=> start!63436 e!401511))

(assert (=> start!63436 true))

(declare-fun array_inv!15234 (array!40476) Bool)

(assert (=> start!63436 (array_inv!15234 a!3591)))

(assert (= (and start!63436 res!477246) b!714292))

(assert (= (and b!714292 res!477245) b!714291))

(assert (= (and b!714291 res!477242) b!714281))

(assert (= (and b!714281 res!477241) b!714282))

(assert (= (and b!714282 res!477250) b!714288))

(assert (= (and b!714288 res!477255) b!714285))

(assert (= (and b!714285 res!477248) b!714289))

(assert (= (and b!714289 res!477254) b!714284))

(assert (= (and b!714284 res!477244) b!714293))

(assert (= (and b!714293 res!477243) b!714294))

(assert (= (and b!714294 res!477240) b!714287))

(assert (= (and b!714287 res!477256) b!714280))

(assert (= (and b!714280 res!477252) b!714279))

(assert (= (and b!714279 res!477247) b!714286))

(assert (= (and b!714286 res!477251) b!714295))

(assert (= (and b!714295 res!477253) b!714290))

(assert (= (and b!714290 res!477249) b!714283))

(declare-fun m!671409 () Bool)

(assert (=> b!714288 m!671409))

(declare-fun m!671411 () Bool)

(assert (=> b!714291 m!671411))

(declare-fun m!671413 () Bool)

(assert (=> b!714282 m!671413))

(declare-fun m!671415 () Bool)

(assert (=> b!714294 m!671415))

(declare-fun m!671417 () Bool)

(assert (=> b!714289 m!671417))

(declare-fun m!671419 () Bool)

(assert (=> b!714280 m!671419))

(declare-fun m!671421 () Bool)

(assert (=> start!63436 m!671421))

(declare-fun m!671423 () Bool)

(assert (=> b!714295 m!671423))

(assert (=> b!714295 m!671423))

(declare-fun m!671425 () Bool)

(assert (=> b!714295 m!671425))

(declare-fun m!671427 () Bool)

(assert (=> b!714292 m!671427))

(declare-fun m!671429 () Bool)

(assert (=> b!714281 m!671429))

(declare-fun m!671431 () Bool)

(assert (=> b!714279 m!671431))

(declare-fun m!671433 () Bool)

(assert (=> b!714285 m!671433))

(declare-fun m!671435 () Bool)

(assert (=> b!714293 m!671435))

(declare-fun m!671437 () Bool)

(assert (=> b!714283 m!671437))

(declare-fun m!671439 () Bool)

(assert (=> b!714284 m!671439))

(declare-fun m!671441 () Bool)

(assert (=> b!714287 m!671441))

(check-sat (not b!714283) (not b!714285) (not start!63436) (not b!714282) (not b!714288) (not b!714287) (not b!714284) (not b!714292) (not b!714291) (not b!714281) (not b!714295) (not b!714293) (not b!714279) (not b!714289) (not b!714280) (not b!714294))
(check-sat)
(get-model)

(declare-fun d!98375 () Bool)

(assert (=> d!98375 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714289 d!98375))

(declare-fun d!98377 () Bool)

(declare-fun lt!318849 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!365 (List!13323) (InoxSet (_ BitVec 64)))

(assert (=> d!98377 (= lt!318849 (select (content!365 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401528 () Bool)

(assert (=> d!98377 (= lt!318849 e!401528)))

(declare-fun res!477364 () Bool)

(assert (=> d!98377 (=> (not res!477364) (not e!401528))))

(get-info :version)

(assert (=> d!98377 (= res!477364 ((_ is Cons!13319) newAcc!49))))

(assert (=> d!98377 (= (contains!3975 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318849)))

(declare-fun b!714402 () Bool)

(declare-fun e!401529 () Bool)

(assert (=> b!714402 (= e!401528 e!401529)))

(declare-fun res!477363 () Bool)

(assert (=> b!714402 (=> res!477363 e!401529)))

(assert (=> b!714402 (= res!477363 (= (h!14367 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714403 () Bool)

(assert (=> b!714403 (= e!401529 (contains!3975 (t!19630 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98377 res!477364) b!714402))

(assert (= (and b!714402 (not res!477363)) b!714403))

(declare-fun m!671511 () Bool)

(assert (=> d!98377 m!671511))

(declare-fun m!671513 () Bool)

(assert (=> d!98377 m!671513))

(declare-fun m!671515 () Bool)

(assert (=> b!714403 m!671515))

(assert (=> b!714280 d!98377))

(declare-fun d!98379 () Bool)

(declare-fun lt!318850 () Bool)

(assert (=> d!98379 (= lt!318850 (select (content!365 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401530 () Bool)

(assert (=> d!98379 (= lt!318850 e!401530)))

(declare-fun res!477366 () Bool)

(assert (=> d!98379 (=> (not res!477366) (not e!401530))))

(assert (=> d!98379 (= res!477366 ((_ is Cons!13319) newAcc!49))))

(assert (=> d!98379 (= (contains!3975 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318850)))

(declare-fun b!714404 () Bool)

(declare-fun e!401531 () Bool)

(assert (=> b!714404 (= e!401530 e!401531)))

(declare-fun res!477365 () Bool)

(assert (=> b!714404 (=> res!477365 e!401531)))

(assert (=> b!714404 (= res!477365 (= (h!14367 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714405 () Bool)

(assert (=> b!714405 (= e!401531 (contains!3975 (t!19630 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98379 res!477366) b!714404))

(assert (= (and b!714404 (not res!477365)) b!714405))

(assert (=> d!98379 m!671511))

(declare-fun m!671517 () Bool)

(assert (=> d!98379 m!671517))

(declare-fun m!671519 () Bool)

(assert (=> b!714405 m!671519))

(assert (=> b!714279 d!98379))

(declare-fun d!98381 () Bool)

(declare-fun res!477371 () Bool)

(declare-fun e!401536 () Bool)

(assert (=> d!98381 (=> res!477371 e!401536)))

(assert (=> d!98381 (= res!477371 (= (select (arr!19375 a!3591) from!2969) k0!2824))))

(assert (=> d!98381 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!401536)))

(declare-fun b!714410 () Bool)

(declare-fun e!401537 () Bool)

(assert (=> b!714410 (= e!401536 e!401537)))

(declare-fun res!477372 () Bool)

(assert (=> b!714410 (=> (not res!477372) (not e!401537))))

(assert (=> b!714410 (= res!477372 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19787 a!3591)))))

(declare-fun b!714411 () Bool)

(assert (=> b!714411 (= e!401537 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98381 (not res!477371)) b!714410))

(assert (= (and b!714410 res!477372) b!714411))

(assert (=> d!98381 m!671423))

(declare-fun m!671521 () Bool)

(assert (=> b!714411 m!671521))

(assert (=> b!714288 d!98381))

(declare-fun b!714422 () Bool)

(declare-fun e!401546 () List!13323)

(declare-fun e!401545 () List!13323)

(assert (=> b!714422 (= e!401546 e!401545)))

(declare-fun c!78893 () Bool)

(assert (=> b!714422 (= c!78893 (= k0!2824 (h!14367 newAcc!49)))))

(declare-fun d!98383 () Bool)

(declare-fun e!401547 () Bool)

(assert (=> d!98383 e!401547))

(declare-fun res!477375 () Bool)

(assert (=> d!98383 (=> (not res!477375) (not e!401547))))

(declare-fun lt!318853 () List!13323)

(declare-fun size!19790 (List!13323) Int)

(assert (=> d!98383 (= res!477375 (<= (size!19790 lt!318853) (size!19790 newAcc!49)))))

(assert (=> d!98383 (= lt!318853 e!401546)))

(declare-fun c!78892 () Bool)

(assert (=> d!98383 (= c!78892 ((_ is Cons!13319) newAcc!49))))

(assert (=> d!98383 (= (-!407 newAcc!49 k0!2824) lt!318853)))

(declare-fun bm!34599 () Bool)

(declare-fun call!34602 () List!13323)

(assert (=> bm!34599 (= call!34602 (-!407 (t!19630 newAcc!49) k0!2824))))

(declare-fun b!714423 () Bool)

(assert (=> b!714423 (= e!401545 call!34602)))

(declare-fun b!714424 () Bool)

(assert (=> b!714424 (= e!401545 (Cons!13319 (h!14367 newAcc!49) call!34602))))

(declare-fun b!714425 () Bool)

(assert (=> b!714425 (= e!401546 Nil!13320)))

(declare-fun b!714426 () Bool)

(assert (=> b!714426 (= e!401547 (= (content!365 lt!318853) ((_ map and) (content!365 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!98383 c!78892) b!714422))

(assert (= (and d!98383 (not c!78892)) b!714425))

(assert (= (and b!714422 c!78893) b!714423))

(assert (= (and b!714422 (not c!78893)) b!714424))

(assert (= (or b!714423 b!714424) bm!34599))

(assert (= (and d!98383 res!477375) b!714426))

(declare-fun m!671523 () Bool)

(assert (=> d!98383 m!671523))

(declare-fun m!671525 () Bool)

(assert (=> d!98383 m!671525))

(declare-fun m!671527 () Bool)

(assert (=> bm!34599 m!671527))

(declare-fun m!671529 () Bool)

(assert (=> b!714426 m!671529))

(assert (=> b!714426 m!671511))

(declare-fun m!671531 () Bool)

(assert (=> b!714426 m!671531))

(assert (=> b!714287 d!98383))

(declare-fun e!401569 () Bool)

(declare-fun b!714449 () Bool)

(assert (=> b!714449 (= e!401569 (contains!3975 acc!652 (select (arr!19375 a!3591) from!2969)))))

(declare-fun b!714450 () Bool)

(declare-fun e!401571 () Bool)

(declare-fun e!401570 () Bool)

(assert (=> b!714450 (= e!401571 e!401570)))

(declare-fun res!477396 () Bool)

(assert (=> b!714450 (=> (not res!477396) (not e!401570))))

(assert (=> b!714450 (= res!477396 (not e!401569))))

(declare-fun res!477394 () Bool)

(assert (=> b!714450 (=> (not res!477394) (not e!401569))))

(assert (=> b!714450 (= res!477394 (validKeyInArray!0 (select (arr!19375 a!3591) from!2969)))))

(declare-fun bm!34602 () Bool)

(declare-fun c!78896 () Bool)

(declare-fun call!34605 () Bool)

(assert (=> bm!34602 (= call!34605 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78896 (Cons!13319 (select (arr!19375 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!714451 () Bool)

(declare-fun e!401568 () Bool)

(assert (=> b!714451 (= e!401570 e!401568)))

(assert (=> b!714451 (= c!78896 (validKeyInArray!0 (select (arr!19375 a!3591) from!2969)))))

(declare-fun b!714452 () Bool)

(assert (=> b!714452 (= e!401568 call!34605)))

(declare-fun d!98389 () Bool)

(declare-fun res!477395 () Bool)

(assert (=> d!98389 (=> res!477395 e!401571)))

(assert (=> d!98389 (= res!477395 (bvsge from!2969 (size!19787 a!3591)))))

(assert (=> d!98389 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401571)))

(declare-fun b!714453 () Bool)

(assert (=> b!714453 (= e!401568 call!34605)))

(assert (= (and d!98389 (not res!477395)) b!714450))

(assert (= (and b!714450 res!477394) b!714449))

(assert (= (and b!714450 res!477396) b!714451))

(assert (= (and b!714451 c!78896) b!714453))

(assert (= (and b!714451 (not c!78896)) b!714452))

(assert (= (or b!714453 b!714452) bm!34602))

(assert (=> b!714449 m!671423))

(assert (=> b!714449 m!671423))

(declare-fun m!671545 () Bool)

(assert (=> b!714449 m!671545))

(assert (=> b!714450 m!671423))

(assert (=> b!714450 m!671423))

(assert (=> b!714450 m!671425))

(assert (=> bm!34602 m!671423))

(declare-fun m!671547 () Bool)

(assert (=> bm!34602 m!671547))

(assert (=> b!714451 m!671423))

(assert (=> b!714451 m!671423))

(assert (=> b!714451 m!671425))

(assert (=> b!714284 d!98389))

(declare-fun d!98397 () Bool)

(declare-fun lt!318860 () Bool)

(assert (=> d!98397 (= lt!318860 (select (content!365 newAcc!49) k0!2824))))

(declare-fun e!401572 () Bool)

(assert (=> d!98397 (= lt!318860 e!401572)))

(declare-fun res!477398 () Bool)

(assert (=> d!98397 (=> (not res!477398) (not e!401572))))

(assert (=> d!98397 (= res!477398 ((_ is Cons!13319) newAcc!49))))

(assert (=> d!98397 (= (contains!3975 newAcc!49 k0!2824) lt!318860)))

(declare-fun b!714454 () Bool)

(declare-fun e!401573 () Bool)

(assert (=> b!714454 (= e!401572 e!401573)))

(declare-fun res!477397 () Bool)

(assert (=> b!714454 (=> res!477397 e!401573)))

(assert (=> b!714454 (= res!477397 (= (h!14367 newAcc!49) k0!2824))))

(declare-fun b!714455 () Bool)

(assert (=> b!714455 (= e!401573 (contains!3975 (t!19630 newAcc!49) k0!2824))))

(assert (= (and d!98397 res!477398) b!714454))

(assert (= (and b!714454 (not res!477397)) b!714455))

(assert (=> d!98397 m!671511))

(declare-fun m!671549 () Bool)

(assert (=> d!98397 m!671549))

(declare-fun m!671551 () Bool)

(assert (=> b!714455 m!671551))

(assert (=> b!714294 d!98397))

(declare-fun d!98399 () Bool)

(declare-fun res!477399 () Bool)

(declare-fun e!401574 () Bool)

(assert (=> d!98399 (=> res!477399 e!401574)))

(assert (=> d!98399 (= res!477399 (= (select (arr!19375 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98399 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401574)))

(declare-fun b!714456 () Bool)

(declare-fun e!401575 () Bool)

(assert (=> b!714456 (= e!401574 e!401575)))

(declare-fun res!477400 () Bool)

(assert (=> b!714456 (=> (not res!477400) (not e!401575))))

(assert (=> b!714456 (= res!477400 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19787 a!3591)))))

(declare-fun b!714457 () Bool)

(assert (=> b!714457 (= e!401575 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98399 (not res!477399)) b!714456))

(assert (= (and b!714456 res!477400) b!714457))

(declare-fun m!671553 () Bool)

(assert (=> d!98399 m!671553))

(declare-fun m!671555 () Bool)

(assert (=> b!714457 m!671555))

(assert (=> b!714283 d!98399))

(declare-fun d!98401 () Bool)

(assert (=> d!98401 (= (array_inv!15234 a!3591) (bvsge (size!19787 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63436 d!98401))

(declare-fun d!98403 () Bool)

(declare-fun lt!318861 () Bool)

(assert (=> d!98403 (= lt!318861 (select (content!365 acc!652) k0!2824))))

(declare-fun e!401584 () Bool)

(assert (=> d!98403 (= lt!318861 e!401584)))

(declare-fun res!477408 () Bool)

(assert (=> d!98403 (=> (not res!477408) (not e!401584))))

(assert (=> d!98403 (= res!477408 ((_ is Cons!13319) acc!652))))

(assert (=> d!98403 (= (contains!3975 acc!652 k0!2824) lt!318861)))

(declare-fun b!714468 () Bool)

(declare-fun e!401585 () Bool)

(assert (=> b!714468 (= e!401584 e!401585)))

(declare-fun res!477407 () Bool)

(assert (=> b!714468 (=> res!477407 e!401585)))

(assert (=> b!714468 (= res!477407 (= (h!14367 acc!652) k0!2824))))

(declare-fun b!714469 () Bool)

(assert (=> b!714469 (= e!401585 (contains!3975 (t!19630 acc!652) k0!2824))))

(assert (= (and d!98403 res!477408) b!714468))

(assert (= (and b!714468 (not res!477407)) b!714469))

(declare-fun m!671557 () Bool)

(assert (=> d!98403 m!671557))

(declare-fun m!671559 () Bool)

(assert (=> d!98403 m!671559))

(declare-fun m!671561 () Bool)

(assert (=> b!714469 m!671561))

(assert (=> b!714285 d!98403))

(declare-fun d!98405 () Bool)

(assert (=> d!98405 (= (validKeyInArray!0 (select (arr!19375 a!3591) from!2969)) (and (not (= (select (arr!19375 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19375 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714295 d!98405))

(declare-fun d!98407 () Bool)

(declare-fun res!477419 () Bool)

(declare-fun e!401598 () Bool)

(assert (=> d!98407 (=> res!477419 e!401598)))

(assert (=> d!98407 (= res!477419 ((_ is Nil!13320) acc!652))))

(assert (=> d!98407 (= (noDuplicate!1249 acc!652) e!401598)))

(declare-fun b!714484 () Bool)

(declare-fun e!401599 () Bool)

(assert (=> b!714484 (= e!401598 e!401599)))

(declare-fun res!477420 () Bool)

(assert (=> b!714484 (=> (not res!477420) (not e!401599))))

(assert (=> b!714484 (= res!477420 (not (contains!3975 (t!19630 acc!652) (h!14367 acc!652))))))

(declare-fun b!714485 () Bool)

(assert (=> b!714485 (= e!401599 (noDuplicate!1249 (t!19630 acc!652)))))

(assert (= (and d!98407 (not res!477419)) b!714484))

(assert (= (and b!714484 res!477420) b!714485))

(declare-fun m!671563 () Bool)

(assert (=> b!714484 m!671563))

(declare-fun m!671565 () Bool)

(assert (=> b!714485 m!671565))

(assert (=> b!714292 d!98407))

(declare-fun d!98409 () Bool)

(declare-fun lt!318862 () Bool)

(assert (=> d!98409 (= lt!318862 (select (content!365 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401600 () Bool)

(assert (=> d!98409 (= lt!318862 e!401600)))

(declare-fun res!477422 () Bool)

(assert (=> d!98409 (=> (not res!477422) (not e!401600))))

(assert (=> d!98409 (= res!477422 ((_ is Cons!13319) acc!652))))

(assert (=> d!98409 (= (contains!3975 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318862)))

(declare-fun b!714486 () Bool)

(declare-fun e!401601 () Bool)

(assert (=> b!714486 (= e!401600 e!401601)))

(declare-fun res!477421 () Bool)

(assert (=> b!714486 (=> res!477421 e!401601)))

(assert (=> b!714486 (= res!477421 (= (h!14367 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714487 () Bool)

(assert (=> b!714487 (= e!401601 (contains!3975 (t!19630 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98409 res!477422) b!714486))

(assert (= (and b!714486 (not res!477421)) b!714487))

(assert (=> d!98409 m!671557))

(declare-fun m!671567 () Bool)

(assert (=> d!98409 m!671567))

(declare-fun m!671569 () Bool)

(assert (=> b!714487 m!671569))

(assert (=> b!714281 d!98409))

(declare-fun d!98411 () Bool)

(declare-fun res!477423 () Bool)

(declare-fun e!401602 () Bool)

(assert (=> d!98411 (=> res!477423 e!401602)))

(assert (=> d!98411 (= res!477423 ((_ is Nil!13320) newAcc!49))))

(assert (=> d!98411 (= (noDuplicate!1249 newAcc!49) e!401602)))

(declare-fun b!714488 () Bool)

(declare-fun e!401603 () Bool)

(assert (=> b!714488 (= e!401602 e!401603)))

(declare-fun res!477424 () Bool)

(assert (=> b!714488 (=> (not res!477424) (not e!401603))))

(assert (=> b!714488 (= res!477424 (not (contains!3975 (t!19630 newAcc!49) (h!14367 newAcc!49))))))

(declare-fun b!714489 () Bool)

(assert (=> b!714489 (= e!401603 (noDuplicate!1249 (t!19630 newAcc!49)))))

(assert (= (and d!98411 (not res!477423)) b!714488))

(assert (= (and b!714488 res!477424) b!714489))

(declare-fun m!671571 () Bool)

(assert (=> b!714488 m!671571))

(declare-fun m!671573 () Bool)

(assert (=> b!714489 m!671573))

(assert (=> b!714291 d!98411))

(declare-fun b!714515 () Bool)

(declare-fun e!401628 () Bool)

(declare-fun e!401629 () Bool)

(assert (=> b!714515 (= e!401628 e!401629)))

(declare-fun res!477447 () Bool)

(assert (=> b!714515 (=> res!477447 e!401629)))

(declare-fun e!401626 () Bool)

(assert (=> b!714515 (= res!477447 e!401626)))

(declare-fun res!477446 () Bool)

(assert (=> b!714515 (=> (not res!477446) (not e!401626))))

(assert (=> b!714515 (= res!477446 (= (h!14367 acc!652) (h!14367 newAcc!49)))))

(declare-fun b!714514 () Bool)

(declare-fun e!401627 () Bool)

(assert (=> b!714514 (= e!401627 e!401628)))

(declare-fun res!477448 () Bool)

(assert (=> b!714514 (=> (not res!477448) (not e!401628))))

(assert (=> b!714514 (= res!477448 ((_ is Cons!13319) newAcc!49))))

(declare-fun b!714516 () Bool)

(assert (=> b!714516 (= e!401626 (subseq!443 (t!19630 acc!652) (t!19630 newAcc!49)))))

(declare-fun b!714517 () Bool)

(assert (=> b!714517 (= e!401629 (subseq!443 acc!652 (t!19630 newAcc!49)))))

(declare-fun d!98413 () Bool)

(declare-fun res!477445 () Bool)

(assert (=> d!98413 (=> res!477445 e!401627)))

(assert (=> d!98413 (= res!477445 ((_ is Nil!13320) acc!652))))

(assert (=> d!98413 (= (subseq!443 acc!652 newAcc!49) e!401627)))

(assert (= (and d!98413 (not res!477445)) b!714514))

(assert (= (and b!714514 res!477448) b!714515))

(assert (= (and b!714515 res!477446) b!714516))

(assert (= (and b!714515 (not res!477447)) b!714517))

(declare-fun m!671597 () Bool)

(assert (=> b!714516 m!671597))

(declare-fun m!671599 () Bool)

(assert (=> b!714517 m!671599))

(assert (=> b!714293 d!98413))

(declare-fun d!98425 () Bool)

(declare-fun lt!318866 () Bool)

(assert (=> d!98425 (= lt!318866 (select (content!365 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401630 () Bool)

(assert (=> d!98425 (= lt!318866 e!401630)))

(declare-fun res!477450 () Bool)

(assert (=> d!98425 (=> (not res!477450) (not e!401630))))

(assert (=> d!98425 (= res!477450 ((_ is Cons!13319) acc!652))))

(assert (=> d!98425 (= (contains!3975 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318866)))

(declare-fun b!714518 () Bool)

(declare-fun e!401631 () Bool)

(assert (=> b!714518 (= e!401630 e!401631)))

(declare-fun res!477449 () Bool)

(assert (=> b!714518 (=> res!477449 e!401631)))

(assert (=> b!714518 (= res!477449 (= (h!14367 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714519 () Bool)

(assert (=> b!714519 (= e!401631 (contains!3975 (t!19630 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98425 res!477450) b!714518))

(assert (= (and b!714518 (not res!477449)) b!714519))

(assert (=> d!98425 m!671557))

(declare-fun m!671601 () Bool)

(assert (=> d!98425 m!671601))

(declare-fun m!671603 () Bool)

(assert (=> b!714519 m!671603))

(assert (=> b!714282 d!98425))

(check-sat (not b!714403) (not b!714449) (not b!714488) (not d!98425) (not d!98409) (not b!714426) (not b!714457) (not d!98383) (not bm!34602) (not b!714484) (not b!714450) (not b!714485) (not d!98397) (not b!714451) (not b!714411) (not b!714519) (not d!98379) (not b!714517) (not b!714455) (not b!714469) (not b!714489) (not b!714405) (not d!98403) (not b!714487) (not bm!34599) (not d!98377) (not b!714516))
(check-sat)
