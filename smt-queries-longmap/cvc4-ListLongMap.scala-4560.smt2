; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63590 () Bool)

(assert start!63590)

(declare-fun b!716369 () Bool)

(declare-fun res!479275 () Bool)

(declare-fun e!402172 () Bool)

(assert (=> b!716369 (=> (not res!479275) (not e!402172))))

(declare-datatypes ((array!40553 0))(
  ( (array!40554 (arr!19412 (Array (_ BitVec 32) (_ BitVec 64))) (size!19830 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40553)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13453 0))(
  ( (Nil!13450) (Cons!13449 (h!14494 (_ BitVec 64)) (t!19768 List!13453)) )
))
(declare-fun acc!652 () List!13453)

(declare-fun arrayNoDuplicates!0 (array!40553 (_ BitVec 32) List!13453) Bool)

(assert (=> b!716369 (= res!479275 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!716370 () Bool)

(declare-fun res!479267 () Bool)

(assert (=> b!716370 (=> (not res!479267) (not e!402172))))

(declare-fun newAcc!49 () List!13453)

(declare-fun noDuplicate!1277 (List!13453) Bool)

(assert (=> b!716370 (= res!479267 (noDuplicate!1277 newAcc!49))))

(declare-fun b!716371 () Bool)

(declare-fun res!479271 () Bool)

(assert (=> b!716371 (=> (not res!479271) (not e!402172))))

(declare-fun contains!4030 (List!13453 (_ BitVec 64)) Bool)

(assert (=> b!716371 (= res!479271 (not (contains!4030 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716372 () Bool)

(declare-fun res!479272 () Bool)

(assert (=> b!716372 (=> (not res!479272) (not e!402172))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716372 (= res!479272 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!716373 () Bool)

(assert (=> b!716373 (= e!402172 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(declare-fun b!716374 () Bool)

(declare-fun res!479280 () Bool)

(assert (=> b!716374 (=> (not res!479280) (not e!402172))))

(assert (=> b!716374 (= res!479280 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19830 a!3591)))))

(declare-fun b!716375 () Bool)

(declare-fun res!479277 () Bool)

(assert (=> b!716375 (=> (not res!479277) (not e!402172))))

(assert (=> b!716375 (= res!479277 (not (contains!4030 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716376 () Bool)

(declare-fun res!479279 () Bool)

(assert (=> b!716376 (=> (not res!479279) (not e!402172))))

(assert (=> b!716376 (= res!479279 (noDuplicate!1277 acc!652))))

(declare-fun b!716377 () Bool)

(declare-fun res!479274 () Bool)

(assert (=> b!716377 (=> (not res!479274) (not e!402172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716377 (= res!479274 (validKeyInArray!0 k!2824))))

(declare-fun res!479276 () Bool)

(assert (=> start!63590 (=> (not res!479276) (not e!402172))))

(assert (=> start!63590 (= res!479276 (and (bvslt (size!19830 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19830 a!3591))))))

(assert (=> start!63590 e!402172))

(assert (=> start!63590 true))

(declare-fun array_inv!15208 (array!40553) Bool)

(assert (=> start!63590 (array_inv!15208 a!3591)))

(declare-fun b!716378 () Bool)

(declare-fun res!479278 () Bool)

(assert (=> b!716378 (=> (not res!479278) (not e!402172))))

(assert (=> b!716378 (= res!479278 (not (contains!4030 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716379 () Bool)

(declare-fun res!479268 () Bool)

(assert (=> b!716379 (=> (not res!479268) (not e!402172))))

(assert (=> b!716379 (= res!479268 (not (contains!4030 acc!652 k!2824)))))

(declare-fun b!716380 () Bool)

(declare-fun res!479269 () Bool)

(assert (=> b!716380 (=> (not res!479269) (not e!402172))))

(declare-fun subseq!475 (List!13453 List!13453) Bool)

(assert (=> b!716380 (= res!479269 (subseq!475 acc!652 newAcc!49))))

(declare-fun b!716381 () Bool)

(declare-fun res!479270 () Bool)

(assert (=> b!716381 (=> (not res!479270) (not e!402172))))

(declare-fun -!440 (List!13453 (_ BitVec 64)) List!13453)

(assert (=> b!716381 (= res!479270 (= (-!440 newAcc!49 k!2824) acc!652))))

(declare-fun b!716382 () Bool)

(declare-fun res!479273 () Bool)

(assert (=> b!716382 (=> (not res!479273) (not e!402172))))

(assert (=> b!716382 (= res!479273 (not (contains!4030 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716383 () Bool)

(declare-fun res!479281 () Bool)

(assert (=> b!716383 (=> (not res!479281) (not e!402172))))

(assert (=> b!716383 (= res!479281 (contains!4030 newAcc!49 k!2824))))

(assert (= (and start!63590 res!479276) b!716376))

(assert (= (and b!716376 res!479279) b!716370))

(assert (= (and b!716370 res!479267) b!716382))

(assert (= (and b!716382 res!479273) b!716378))

(assert (= (and b!716378 res!479278) b!716372))

(assert (= (and b!716372 res!479272) b!716379))

(assert (= (and b!716379 res!479268) b!716377))

(assert (= (and b!716377 res!479274) b!716369))

(assert (= (and b!716369 res!479275) b!716380))

(assert (= (and b!716380 res!479269) b!716383))

(assert (= (and b!716383 res!479281) b!716381))

(assert (= (and b!716381 res!479270) b!716375))

(assert (= (and b!716375 res!479277) b!716371))

(assert (= (and b!716371 res!479271) b!716374))

(assert (= (and b!716374 res!479280) b!716373))

(declare-fun m!672361 () Bool)

(assert (=> b!716378 m!672361))

(declare-fun m!672363 () Bool)

(assert (=> b!716379 m!672363))

(declare-fun m!672365 () Bool)

(assert (=> b!716376 m!672365))

(declare-fun m!672367 () Bool)

(assert (=> b!716377 m!672367))

(declare-fun m!672369 () Bool)

(assert (=> b!716381 m!672369))

(declare-fun m!672371 () Bool)

(assert (=> b!716380 m!672371))

(declare-fun m!672373 () Bool)

(assert (=> b!716369 m!672373))

(declare-fun m!672375 () Bool)

(assert (=> start!63590 m!672375))

(declare-fun m!672377 () Bool)

(assert (=> b!716373 m!672377))

(declare-fun m!672379 () Bool)

(assert (=> b!716370 m!672379))

(declare-fun m!672381 () Bool)

(assert (=> b!716371 m!672381))

(declare-fun m!672383 () Bool)

(assert (=> b!716382 m!672383))

(declare-fun m!672385 () Bool)

(assert (=> b!716372 m!672385))

(declare-fun m!672387 () Bool)

(assert (=> b!716375 m!672387))

(declare-fun m!672389 () Bool)

(assert (=> b!716383 m!672389))

(push 1)

(assert (not b!716369))

(assert (not start!63590))

(assert (not b!716378))

(assert (not b!716383))

(assert (not b!716373))

(assert (not b!716370))

(assert (not b!716376))

(assert (not b!716377))

(assert (not b!716372))

(assert (not b!716379))

(assert (not b!716381))

(assert (not b!716380))

(assert (not b!716371))

(assert (not b!716375))

(assert (not b!716382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98569 () Bool)

(assert (=> d!98569 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!716377 d!98569))

(declare-fun d!98577 () Bool)

(declare-fun lt!318915 () Bool)

(declare-fun content!375 (List!13453) (Set (_ BitVec 64)))

(assert (=> d!98577 (= lt!318915 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!375 acc!652)))))

(declare-fun e!402210 () Bool)

(assert (=> d!98577 (= lt!318915 e!402210)))

(declare-fun res!479311 () Bool)

(assert (=> d!98577 (=> (not res!479311) (not e!402210))))

(assert (=> d!98577 (= res!479311 (is-Cons!13449 acc!652))))

(assert (=> d!98577 (= (contains!4030 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318915)))

(declare-fun b!716425 () Bool)

(declare-fun e!402211 () Bool)

(assert (=> b!716425 (= e!402210 e!402211)))

(declare-fun res!479312 () Bool)

(assert (=> b!716425 (=> res!479312 e!402211)))

(assert (=> b!716425 (= res!479312 (= (h!14494 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716426 () Bool)

(assert (=> b!716426 (= e!402211 (contains!4030 (t!19768 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98577 res!479311) b!716425))

(assert (= (and b!716425 (not res!479312)) b!716426))

(declare-fun m!672419 () Bool)

(assert (=> d!98577 m!672419))

(declare-fun m!672421 () Bool)

(assert (=> d!98577 m!672421))

(declare-fun m!672423 () Bool)

(assert (=> b!716426 m!672423))

(assert (=> b!716378 d!98577))

(declare-fun b!716466 () Bool)

(declare-fun e!402244 () Bool)

(assert (=> b!716466 (= e!402244 (contains!4030 acc!652 (select (arr!19412 a!3591) from!2969)))))

(declare-fun b!716467 () Bool)

(declare-fun e!402246 () Bool)

(declare-fun e!402247 () Bool)

(assert (=> b!716467 (= e!402246 e!402247)))

(declare-fun c!78931 () Bool)

(assert (=> b!716467 (= c!78931 (validKeyInArray!0 (select (arr!19412 a!3591) from!2969)))))

(declare-fun bm!34667 () Bool)

(declare-fun call!34670 () Bool)

(assert (=> bm!34667 (= call!34670 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78931 (Cons!13449 (select (arr!19412 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun d!98581 () Bool)

(declare-fun res!479340 () Bool)

(declare-fun e!402245 () Bool)

(assert (=> d!98581 (=> res!479340 e!402245)))

(assert (=> d!98581 (= res!479340 (bvsge from!2969 (size!19830 a!3591)))))

(assert (=> d!98581 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!402245)))

(declare-fun b!716468 () Bool)

(assert (=> b!716468 (= e!402247 call!34670)))

(declare-fun b!716469 () Bool)

(assert (=> b!716469 (= e!402247 call!34670)))

(declare-fun b!716470 () Bool)

(assert (=> b!716470 (= e!402245 e!402246)))

(declare-fun res!479339 () Bool)

(assert (=> b!716470 (=> (not res!479339) (not e!402246))))

(assert (=> b!716470 (= res!479339 (not e!402244))))

(declare-fun res!479338 () Bool)

(assert (=> b!716470 (=> (not res!479338) (not e!402244))))

(assert (=> b!716470 (= res!479338 (validKeyInArray!0 (select (arr!19412 a!3591) from!2969)))))

(assert (= (and d!98581 (not res!479340)) b!716470))

(assert (= (and b!716470 res!479338) b!716466))

(assert (= (and b!716470 res!479339) b!716467))

(assert (= (and b!716467 c!78931) b!716469))

(assert (= (and b!716467 (not c!78931)) b!716468))

(assert (= (or b!716469 b!716468) bm!34667))

(declare-fun m!672435 () Bool)

(assert (=> b!716466 m!672435))

(assert (=> b!716466 m!672435))

(declare-fun m!672439 () Bool)

(assert (=> b!716466 m!672439))

(assert (=> b!716467 m!672435))

(assert (=> b!716467 m!672435))

(declare-fun m!672441 () Bool)

(assert (=> b!716467 m!672441))

(assert (=> bm!34667 m!672435))

(declare-fun m!672443 () Bool)

(assert (=> bm!34667 m!672443))

(assert (=> b!716470 m!672435))

(assert (=> b!716470 m!672435))

(assert (=> b!716470 m!672441))

(assert (=> b!716369 d!98581))

(declare-fun b!716508 () Bool)

(declare-fun e!402285 () Bool)

(declare-fun e!402284 () Bool)

(assert (=> b!716508 (= e!402285 e!402284)))

(declare-fun res!479373 () Bool)

(assert (=> b!716508 (=> (not res!479373) (not e!402284))))

(assert (=> b!716508 (= res!479373 (is-Cons!13449 newAcc!49))))

(declare-fun b!716510 () Bool)

(declare-fun e!402282 () Bool)

(assert (=> b!716510 (= e!402282 (subseq!475 (t!19768 acc!652) (t!19768 newAcc!49)))))

(declare-fun b!716511 () Bool)

(declare-fun e!402283 () Bool)

(assert (=> b!716511 (= e!402283 (subseq!475 acc!652 (t!19768 newAcc!49)))))

(declare-fun d!98589 () Bool)

(declare-fun res!479374 () Bool)

(assert (=> d!98589 (=> res!479374 e!402285)))

(assert (=> d!98589 (= res!479374 (is-Nil!13450 acc!652))))

(assert (=> d!98589 (= (subseq!475 acc!652 newAcc!49) e!402285)))

(declare-fun b!716509 () Bool)

(assert (=> b!716509 (= e!402284 e!402283)))

(declare-fun res!479372 () Bool)

(assert (=> b!716509 (=> res!479372 e!402283)))

(assert (=> b!716509 (= res!479372 e!402282)))

(declare-fun res!479375 () Bool)

(assert (=> b!716509 (=> (not res!479375) (not e!402282))))

(assert (=> b!716509 (= res!479375 (= (h!14494 acc!652) (h!14494 newAcc!49)))))

(assert (= (and d!98589 (not res!479374)) b!716508))

(assert (= (and b!716508 res!479373) b!716509))

(assert (= (and b!716509 res!479375) b!716510))

(assert (= (and b!716509 (not res!479372)) b!716511))

(declare-fun m!672483 () Bool)

(assert (=> b!716510 m!672483))

(declare-fun m!672485 () Bool)

(assert (=> b!716511 m!672485))

(assert (=> b!716380 d!98589))

(declare-fun d!98611 () Bool)

(declare-fun lt!318921 () Bool)

(assert (=> d!98611 (= lt!318921 (member k!2824 (content!375 acc!652)))))

(declare-fun e!402286 () Bool)

(assert (=> d!98611 (= lt!318921 e!402286)))

(declare-fun res!479376 () Bool)

(assert (=> d!98611 (=> (not res!479376) (not e!402286))))

(assert (=> d!98611 (= res!479376 (is-Cons!13449 acc!652))))

(assert (=> d!98611 (= (contains!4030 acc!652 k!2824) lt!318921)))

(declare-fun b!716512 () Bool)

(declare-fun e!402287 () Bool)

(assert (=> b!716512 (= e!402286 e!402287)))

(declare-fun res!479377 () Bool)

(assert (=> b!716512 (=> res!479377 e!402287)))

(assert (=> b!716512 (= res!479377 (= (h!14494 acc!652) k!2824))))

(declare-fun b!716513 () Bool)

(assert (=> b!716513 (= e!402287 (contains!4030 (t!19768 acc!652) k!2824))))

(assert (= (and d!98611 res!479376) b!716512))

(assert (= (and b!716512 (not res!479377)) b!716513))

(assert (=> d!98611 m!672419))

(declare-fun m!672487 () Bool)

(assert (=> d!98611 m!672487))

(declare-fun m!672489 () Bool)

(assert (=> b!716513 m!672489))

(assert (=> b!716379 d!98611))

(declare-fun b!716560 () Bool)

(declare-fun e!402332 () List!13453)

(assert (=> b!716560 (= e!402332 Nil!13450)))

(declare-fun d!98613 () Bool)

(declare-fun e!402333 () Bool)

(assert (=> d!98613 e!402333))

(declare-fun res!479416 () Bool)

(assert (=> d!98613 (=> (not res!479416) (not e!402333))))

(declare-fun lt!318927 () List!13453)

(declare-fun size!19832 (List!13453) Int)

(assert (=> d!98613 (= res!479416 (<= (size!19832 lt!318927) (size!19832 newAcc!49)))))

(assert (=> d!98613 (= lt!318927 e!402332)))

(declare-fun c!78940 () Bool)

(assert (=> d!98613 (= c!78940 (is-Cons!13449 newAcc!49))))

(assert (=> d!98613 (= (-!440 newAcc!49 k!2824) lt!318927)))

(declare-fun b!716561 () Bool)

(declare-fun e!402331 () List!13453)

(declare-fun call!34676 () List!13453)

(assert (=> b!716561 (= e!402331 call!34676)))

(declare-fun bm!34673 () Bool)

(assert (=> bm!34673 (= call!34676 (-!440 (t!19768 newAcc!49) k!2824))))

(declare-fun b!716562 () Bool)

(assert (=> b!716562 (= e!402332 e!402331)))

(declare-fun c!78939 () Bool)

(assert (=> b!716562 (= c!78939 (= k!2824 (h!14494 newAcc!49)))))

(declare-fun b!716563 () Bool)

(assert (=> b!716563 (= e!402331 (Cons!13449 (h!14494 newAcc!49) call!34676))))

(declare-fun b!716564 () Bool)

(assert (=> b!716564 (= e!402333 (= (content!375 lt!318927) (setminus (content!375 newAcc!49) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(assert (= (and d!98613 c!78940) b!716562))

(assert (= (and d!98613 (not c!78940)) b!716560))

(assert (= (and b!716562 c!78939) b!716561))

(assert (= (and b!716562 (not c!78939)) b!716563))

(assert (= (or b!716561 b!716563) bm!34673))

(assert (= (and d!98613 res!479416) b!716564))

(declare-fun m!672519 () Bool)

(assert (=> d!98613 m!672519))

(declare-fun m!672521 () Bool)

(assert (=> d!98613 m!672521))

(declare-fun m!672523 () Bool)

(assert (=> bm!34673 m!672523))

(declare-fun m!672525 () Bool)

(assert (=> b!716564 m!672525))

(declare-fun m!672527 () Bool)

(assert (=> b!716564 m!672527))

(declare-fun m!672529 () Bool)

(assert (=> b!716564 m!672529))

(assert (=> b!716381 d!98613))

(declare-fun d!98629 () Bool)

(declare-fun res!479429 () Bool)

(declare-fun e!402346 () Bool)

(assert (=> d!98629 (=> res!479429 e!402346)))

(assert (=> d!98629 (= res!479429 (is-Nil!13450 newAcc!49))))

(assert (=> d!98629 (= (noDuplicate!1277 newAcc!49) e!402346)))

(declare-fun b!716577 () Bool)

(declare-fun e!402347 () Bool)

(assert (=> b!716577 (= e!402346 e!402347)))

(declare-fun res!479430 () Bool)

(assert (=> b!716577 (=> (not res!479430) (not e!402347))))

(assert (=> b!716577 (= res!479430 (not (contains!4030 (t!19768 newAcc!49) (h!14494 newAcc!49))))))

(declare-fun b!716578 () Bool)

(assert (=> b!716578 (= e!402347 (noDuplicate!1277 (t!19768 newAcc!49)))))

(assert (= (and d!98629 (not res!479429)) b!716577))

(assert (= (and b!716577 res!479430) b!716578))

(declare-fun m!672543 () Bool)

(assert (=> b!716577 m!672543))

(declare-fun m!672545 () Bool)

(assert (=> b!716578 m!672545))

(assert (=> b!716370 d!98629))

(declare-fun d!98637 () Bool)

(declare-fun res!479435 () Bool)

(declare-fun e!402357 () Bool)

(assert (=> d!98637 (=> res!479435 e!402357)))

(assert (=> d!98637 (= res!479435 (= (select (arr!19412 a!3591) from!2969) k!2824))))

(assert (=> d!98637 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!402357)))

(declare-fun b!716591 () Bool)

(declare-fun e!402358 () Bool)

(assert (=> b!716591 (= e!402357 e!402358)))

(declare-fun res!479436 () Bool)

(assert (=> b!716591 (=> (not res!479436) (not e!402358))))

(assert (=> b!716591 (= res!479436 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19830 a!3591)))))

(declare-fun b!716592 () Bool)

(assert (=> b!716592 (= e!402358 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98637 (not res!479435)) b!716591))

(assert (= (and b!716591 res!479436) b!716592))

(assert (=> d!98637 m!672435))

(declare-fun m!672547 () Bool)

(assert (=> b!716592 m!672547))

(assert (=> b!716372 d!98637))

(declare-fun d!98639 () Bool)

(declare-fun lt!318931 () Bool)

(assert (=> d!98639 (= lt!318931 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!375 newAcc!49)))))

(declare-fun e!402361 () Bool)

(assert (=> d!98639 (= lt!318931 e!402361)))

(declare-fun res!479439 () Bool)

(assert (=> d!98639 (=> (not res!479439) (not e!402361))))

(assert (=> d!98639 (= res!479439 (is-Cons!13449 newAcc!49))))

(assert (=> d!98639 (= (contains!4030 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318931)))

(declare-fun b!716595 () Bool)

(declare-fun e!402362 () Bool)

(assert (=> b!716595 (= e!402361 e!402362)))

(declare-fun res!479440 () Bool)

(assert (=> b!716595 (=> res!479440 e!402362)))

(assert (=> b!716595 (= res!479440 (= (h!14494 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716596 () Bool)

(assert (=> b!716596 (= e!402362 (contains!4030 (t!19768 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98639 res!479439) b!716595))

(assert (= (and b!716595 (not res!479440)) b!716596))

(assert (=> d!98639 m!672527))

(declare-fun m!672549 () Bool)

(assert (=> d!98639 m!672549))

(declare-fun m!672551 () Bool)

(assert (=> b!716596 m!672551))

(assert (=> b!716371 d!98639))

(declare-fun d!98641 () Bool)

(declare-fun lt!318932 () Bool)

(assert (=> d!98641 (= lt!318932 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!375 acc!652)))))

(declare-fun e!402363 () Bool)

(assert (=> d!98641 (= lt!318932 e!402363)))

(declare-fun res!479441 () Bool)

(assert (=> d!98641 (=> (not res!479441) (not e!402363))))

(assert (=> d!98641 (= res!479441 (is-Cons!13449 acc!652))))

(assert (=> d!98641 (= (contains!4030 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318932)))

(declare-fun b!716597 () Bool)

(declare-fun e!402364 () Bool)

(assert (=> b!716597 (= e!402363 e!402364)))

(declare-fun res!479442 () Bool)

(assert (=> b!716597 (=> res!479442 e!402364)))

(assert (=> b!716597 (= res!479442 (= (h!14494 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716598 () Bool)

(assert (=> b!716598 (= e!402364 (contains!4030 (t!19768 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98641 res!479441) b!716597))

(assert (= (and b!716597 (not res!479442)) b!716598))

(assert (=> d!98641 m!672419))

(declare-fun m!672553 () Bool)

(assert (=> d!98641 m!672553))

(declare-fun m!672555 () Bool)

(assert (=> b!716598 m!672555))

(assert (=> b!716382 d!98641))

(declare-fun b!716599 () Bool)

(declare-fun e!402365 () Bool)

(assert (=> b!716599 (= e!402365 (contains!4030 newAcc!49 (select (arr!19412 a!3591) from!2969)))))

(declare-fun b!716600 () Bool)

(declare-fun e!402367 () Bool)

(declare-fun e!402368 () Bool)

(assert (=> b!716600 (= e!402367 e!402368)))

(declare-fun c!78945 () Bool)

(assert (=> b!716600 (= c!78945 (validKeyInArray!0 (select (arr!19412 a!3591) from!2969)))))

(declare-fun call!34679 () Bool)

(declare-fun bm!34676 () Bool)

(assert (=> bm!34676 (= call!34679 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78945 (Cons!13449 (select (arr!19412 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun d!98643 () Bool)

(declare-fun res!479445 () Bool)

(declare-fun e!402366 () Bool)

(assert (=> d!98643 (=> res!479445 e!402366)))

(assert (=> d!98643 (= res!479445 (bvsge from!2969 (size!19830 a!3591)))))

(assert (=> d!98643 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!402366)))

(declare-fun b!716601 () Bool)

(assert (=> b!716601 (= e!402368 call!34679)))

(declare-fun b!716602 () Bool)

(assert (=> b!716602 (= e!402368 call!34679)))

(declare-fun b!716603 () Bool)

(assert (=> b!716603 (= e!402366 e!402367)))

(declare-fun res!479444 () Bool)

(assert (=> b!716603 (=> (not res!479444) (not e!402367))))

(assert (=> b!716603 (= res!479444 (not e!402365))))

(declare-fun res!479443 () Bool)

(assert (=> b!716603 (=> (not res!479443) (not e!402365))))

(assert (=> b!716603 (= res!479443 (validKeyInArray!0 (select (arr!19412 a!3591) from!2969)))))

(assert (= (and d!98643 (not res!479445)) b!716603))

(assert (= (and b!716603 res!479443) b!716599))

(assert (= (and b!716603 res!479444) b!716600))

(assert (= (and b!716600 c!78945) b!716602))

(assert (= (and b!716600 (not c!78945)) b!716601))

(assert (= (or b!716602 b!716601) bm!34676))

(assert (=> b!716599 m!672435))

(assert (=> b!716599 m!672435))

(declare-fun m!672557 () Bool)

(assert (=> b!716599 m!672557))

(assert (=> b!716600 m!672435))

(assert (=> b!716600 m!672435))

(assert (=> b!716600 m!672441))

(assert (=> bm!34676 m!672435))

(declare-fun m!672559 () Bool)

(assert (=> bm!34676 m!672559))

(assert (=> b!716603 m!672435))

(assert (=> b!716603 m!672435))

(assert (=> b!716603 m!672441))

(assert (=> b!716373 d!98643))

(declare-fun d!98645 () Bool)

(declare-fun lt!318933 () Bool)

(assert (=> d!98645 (= lt!318933 (member k!2824 (content!375 newAcc!49)))))

(declare-fun e!402369 () Bool)

(assert (=> d!98645 (= lt!318933 e!402369)))

(declare-fun res!479446 () Bool)

(assert (=> d!98645 (=> (not res!479446) (not e!402369))))

(assert (=> d!98645 (= res!479446 (is-Cons!13449 newAcc!49))))

(assert (=> d!98645 (= (contains!4030 newAcc!49 k!2824) lt!318933)))

(declare-fun b!716604 () Bool)

(declare-fun e!402370 () Bool)

(assert (=> b!716604 (= e!402369 e!402370)))

(declare-fun res!479447 () Bool)

(assert (=> b!716604 (=> res!479447 e!402370)))

(assert (=> b!716604 (= res!479447 (= (h!14494 newAcc!49) k!2824))))

(declare-fun b!716605 () Bool)

(assert (=> b!716605 (= e!402370 (contains!4030 (t!19768 newAcc!49) k!2824))))

(assert (= (and d!98645 res!479446) b!716604))

(assert (= (and b!716604 (not res!479447)) b!716605))

(assert (=> d!98645 m!672527))

(declare-fun m!672561 () Bool)

(assert (=> d!98645 m!672561))

(declare-fun m!672563 () Bool)

(assert (=> b!716605 m!672563))

(assert (=> b!716383 d!98645))

(declare-fun d!98647 () Bool)

(assert (=> d!98647 (= (array_inv!15208 a!3591) (bvsge (size!19830 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63590 d!98647))

(declare-fun d!98651 () Bool)

(declare-fun res!479449 () Bool)

(declare-fun e!402374 () Bool)

(assert (=> d!98651 (=> res!479449 e!402374)))

(assert (=> d!98651 (= res!479449 (is-Nil!13450 acc!652))))

(assert (=> d!98651 (= (noDuplicate!1277 acc!652) e!402374)))

(declare-fun b!716611 () Bool)

(declare-fun e!402375 () Bool)

(assert (=> b!716611 (= e!402374 e!402375)))

(declare-fun res!479450 () Bool)

(assert (=> b!716611 (=> (not res!479450) (not e!402375))))

(assert (=> b!716611 (= res!479450 (not (contains!4030 (t!19768 acc!652) (h!14494 acc!652))))))

(declare-fun b!716612 () Bool)

(assert (=> b!716612 (= e!402375 (noDuplicate!1277 (t!19768 acc!652)))))

(assert (= (and d!98651 (not res!479449)) b!716611))

(assert (= (and b!716611 res!479450) b!716612))

(declare-fun m!672575 () Bool)

(assert (=> b!716611 m!672575))

(declare-fun m!672577 () Bool)

(assert (=> b!716612 m!672577))

(assert (=> b!716376 d!98651))

(declare-fun d!98653 () Bool)

(declare-fun lt!318935 () Bool)

(assert (=> d!98653 (= lt!318935 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!375 newAcc!49)))))

(declare-fun e!402376 () Bool)

(assert (=> d!98653 (= lt!318935 e!402376)))

(declare-fun res!479451 () Bool)

(assert (=> d!98653 (=> (not res!479451) (not e!402376))))

(assert (=> d!98653 (= res!479451 (is-Cons!13449 newAcc!49))))

(assert (=> d!98653 (= (contains!4030 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318935)))

(declare-fun b!716613 () Bool)

(declare-fun e!402377 () Bool)

(assert (=> b!716613 (= e!402376 e!402377)))

(declare-fun res!479452 () Bool)

(assert (=> b!716613 (=> res!479452 e!402377)))

(assert (=> b!716613 (= res!479452 (= (h!14494 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716614 () Bool)

(assert (=> b!716614 (= e!402377 (contains!4030 (t!19768 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98653 res!479451) b!716613))

(assert (= (and b!716613 (not res!479452)) b!716614))

(assert (=> d!98653 m!672527))

(declare-fun m!672579 () Bool)

(assert (=> d!98653 m!672579))

(declare-fun m!672581 () Bool)

(assert (=> b!716614 m!672581))

(assert (=> b!716375 d!98653))

(push 1)

(assert (not d!98653))

(assert (not bm!34676))

(assert (not b!716592))

(assert (not b!716510))

(assert (not b!716564))

(assert (not bm!34673))

(assert (not b!716578))

(assert (not bm!34667))

(assert (not b!716513))

(assert (not b!716612))

(assert (not d!98577))

(assert (not b!716511))

(assert (not b!716600))

(assert (not b!716599))

(assert (not b!716470))

(assert (not d!98611))

(assert (not d!98613))

(assert (not b!716577))

(assert (not d!98645))

(assert (not b!716466))

(assert (not b!716611))

(assert (not b!716605))

(assert (not d!98641))

(assert (not b!716596))

(assert (not b!716603))

(assert (not b!716614))

(assert (not b!716467))

(assert (not b!716598))

(assert (not b!716426))

(assert (not d!98639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

