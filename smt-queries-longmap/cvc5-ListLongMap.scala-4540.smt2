; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63148 () Bool)

(assert start!63148)

(declare-fun b!711345 () Bool)

(declare-fun res!474665 () Bool)

(declare-fun e!400268 () Bool)

(assert (=> b!711345 (=> (not res!474665) (not e!400268))))

(declare-datatypes ((array!40411 0))(
  ( (array!40412 (arr!19350 (Array (_ BitVec 32) (_ BitVec 64))) (size!19752 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40411)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13391 0))(
  ( (Nil!13388) (Cons!13387 (h!14432 (_ BitVec 64)) (t!19697 List!13391)) )
))
(declare-fun acc!652 () List!13391)

(declare-fun arrayNoDuplicates!0 (array!40411 (_ BitVec 32) List!13391) Bool)

(assert (=> b!711345 (= res!474665 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!711346 () Bool)

(declare-fun res!474674 () Bool)

(declare-fun e!400266 () Bool)

(assert (=> b!711346 (=> (not res!474674) (not e!400266))))

(declare-fun lt!318445 () List!13391)

(declare-fun lt!318446 () List!13391)

(declare-fun subseq!413 (List!13391 List!13391) Bool)

(assert (=> b!711346 (= res!474674 (subseq!413 lt!318445 lt!318446))))

(declare-fun b!711347 () Bool)

(declare-fun res!474673 () Bool)

(assert (=> b!711347 (=> (not res!474673) (not e!400268))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3968 (List!13391 (_ BitVec 64)) Bool)

(assert (=> b!711347 (= res!474673 (not (contains!3968 acc!652 k!2824)))))

(declare-fun b!711349 () Bool)

(assert (=> b!711349 (= e!400268 e!400266)))

(declare-fun res!474667 () Bool)

(assert (=> b!711349 (=> (not res!474667) (not e!400266))))

(assert (=> b!711349 (= res!474667 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun newAcc!49 () List!13391)

(declare-fun $colon$colon!524 (List!13391 (_ BitVec 64)) List!13391)

(assert (=> b!711349 (= lt!318446 ($colon$colon!524 newAcc!49 (select (arr!19350 a!3591) from!2969)))))

(assert (=> b!711349 (= lt!318445 ($colon$colon!524 acc!652 (select (arr!19350 a!3591) from!2969)))))

(declare-fun b!711350 () Bool)

(declare-fun -!378 (List!13391 (_ BitVec 64)) List!13391)

(assert (=> b!711350 (= e!400266 (not (= (-!378 lt!318446 k!2824) lt!318445)))))

(declare-fun b!711351 () Bool)

(declare-fun res!474659 () Bool)

(assert (=> b!711351 (=> (not res!474659) (not e!400268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!711351 (= res!474659 (validKeyInArray!0 k!2824))))

(declare-fun b!711352 () Bool)

(declare-fun res!474657 () Bool)

(assert (=> b!711352 (=> (not res!474657) (not e!400266))))

(assert (=> b!711352 (= res!474657 (not (contains!3968 lt!318445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711353 () Bool)

(declare-fun res!474668 () Bool)

(assert (=> b!711353 (=> (not res!474668) (not e!400268))))

(assert (=> b!711353 (= res!474668 (validKeyInArray!0 (select (arr!19350 a!3591) from!2969)))))

(declare-fun b!711354 () Bool)

(declare-fun res!474680 () Bool)

(assert (=> b!711354 (=> (not res!474680) (not e!400268))))

(declare-fun noDuplicate!1215 (List!13391) Bool)

(assert (=> b!711354 (= res!474680 (noDuplicate!1215 newAcc!49))))

(declare-fun b!711355 () Bool)

(declare-fun res!474676 () Bool)

(assert (=> b!711355 (=> (not res!474676) (not e!400268))))

(assert (=> b!711355 (= res!474676 (noDuplicate!1215 acc!652))))

(declare-fun b!711356 () Bool)

(declare-fun res!474669 () Bool)

(assert (=> b!711356 (=> (not res!474669) (not e!400266))))

(assert (=> b!711356 (= res!474669 (noDuplicate!1215 lt!318445))))

(declare-fun b!711357 () Bool)

(declare-fun res!474662 () Bool)

(assert (=> b!711357 (=> (not res!474662) (not e!400266))))

(assert (=> b!711357 (= res!474662 (contains!3968 lt!318446 k!2824))))

(declare-fun b!711358 () Bool)

(declare-fun res!474679 () Bool)

(assert (=> b!711358 (=> (not res!474679) (not e!400268))))

(assert (=> b!711358 (= res!474679 (subseq!413 acc!652 newAcc!49))))

(declare-fun b!711359 () Bool)

(declare-fun res!474678 () Bool)

(assert (=> b!711359 (=> (not res!474678) (not e!400266))))

(assert (=> b!711359 (= res!474678 (not (contains!3968 lt!318445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!474664 () Bool)

(assert (=> start!63148 (=> (not res!474664) (not e!400268))))

(assert (=> start!63148 (= res!474664 (and (bvslt (size!19752 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19752 a!3591))))))

(assert (=> start!63148 e!400268))

(assert (=> start!63148 true))

(declare-fun array_inv!15146 (array!40411) Bool)

(assert (=> start!63148 (array_inv!15146 a!3591)))

(declare-fun b!711348 () Bool)

(declare-fun res!474681 () Bool)

(assert (=> b!711348 (=> (not res!474681) (not e!400268))))

(declare-fun arrayContainsKey!0 (array!40411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!711348 (= res!474681 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!711360 () Bool)

(declare-fun res!474666 () Bool)

(assert (=> b!711360 (=> (not res!474666) (not e!400268))))

(assert (=> b!711360 (= res!474666 (contains!3968 newAcc!49 k!2824))))

(declare-fun b!711361 () Bool)

(declare-fun res!474671 () Bool)

(assert (=> b!711361 (=> (not res!474671) (not e!400268))))

(assert (=> b!711361 (= res!474671 (not (contains!3968 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711362 () Bool)

(declare-fun res!474677 () Bool)

(assert (=> b!711362 (=> (not res!474677) (not e!400266))))

(assert (=> b!711362 (= res!474677 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711363 () Bool)

(declare-fun res!474672 () Bool)

(assert (=> b!711363 (=> (not res!474672) (not e!400268))))

(assert (=> b!711363 (= res!474672 (not (contains!3968 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711364 () Bool)

(declare-fun res!474658 () Bool)

(assert (=> b!711364 (=> (not res!474658) (not e!400266))))

(assert (=> b!711364 (= res!474658 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318445))))

(declare-fun b!711365 () Bool)

(declare-fun res!474661 () Bool)

(assert (=> b!711365 (=> (not res!474661) (not e!400268))))

(assert (=> b!711365 (= res!474661 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19752 a!3591)))))

(declare-fun b!711366 () Bool)

(declare-fun res!474670 () Bool)

(assert (=> b!711366 (=> (not res!474670) (not e!400268))))

(assert (=> b!711366 (= res!474670 (not (contains!3968 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711367 () Bool)

(declare-fun res!474675 () Bool)

(assert (=> b!711367 (=> (not res!474675) (not e!400266))))

(assert (=> b!711367 (= res!474675 (not (contains!3968 lt!318445 k!2824)))))

(declare-fun b!711368 () Bool)

(declare-fun res!474682 () Bool)

(assert (=> b!711368 (=> (not res!474682) (not e!400268))))

(assert (=> b!711368 (= res!474682 (not (contains!3968 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711369 () Bool)

(declare-fun res!474663 () Bool)

(assert (=> b!711369 (=> (not res!474663) (not e!400268))))

(assert (=> b!711369 (= res!474663 (= (-!378 newAcc!49 k!2824) acc!652))))

(declare-fun b!711370 () Bool)

(declare-fun res!474660 () Bool)

(assert (=> b!711370 (=> (not res!474660) (not e!400266))))

(assert (=> b!711370 (= res!474660 (noDuplicate!1215 lt!318446))))

(assert (= (and start!63148 res!474664) b!711355))

(assert (= (and b!711355 res!474676) b!711354))

(assert (= (and b!711354 res!474680) b!711366))

(assert (= (and b!711366 res!474670) b!711368))

(assert (= (and b!711368 res!474682) b!711348))

(assert (= (and b!711348 res!474681) b!711347))

(assert (= (and b!711347 res!474673) b!711351))

(assert (= (and b!711351 res!474659) b!711345))

(assert (= (and b!711345 res!474665) b!711358))

(assert (= (and b!711358 res!474679) b!711360))

(assert (= (and b!711360 res!474666) b!711369))

(assert (= (and b!711369 res!474663) b!711363))

(assert (= (and b!711363 res!474672) b!711361))

(assert (= (and b!711361 res!474671) b!711365))

(assert (= (and b!711365 res!474661) b!711353))

(assert (= (and b!711353 res!474668) b!711349))

(assert (= (and b!711349 res!474667) b!711356))

(assert (= (and b!711356 res!474669) b!711370))

(assert (= (and b!711370 res!474660) b!711352))

(assert (= (and b!711352 res!474657) b!711359))

(assert (= (and b!711359 res!474678) b!711362))

(assert (= (and b!711362 res!474677) b!711367))

(assert (= (and b!711367 res!474675) b!711364))

(assert (= (and b!711364 res!474658) b!711346))

(assert (= (and b!711346 res!474674) b!711357))

(assert (= (and b!711357 res!474662) b!711350))

(declare-fun m!668377 () Bool)

(assert (=> b!711349 m!668377))

(assert (=> b!711349 m!668377))

(declare-fun m!668379 () Bool)

(assert (=> b!711349 m!668379))

(assert (=> b!711349 m!668377))

(declare-fun m!668381 () Bool)

(assert (=> b!711349 m!668381))

(declare-fun m!668383 () Bool)

(assert (=> b!711351 m!668383))

(declare-fun m!668385 () Bool)

(assert (=> b!711354 m!668385))

(declare-fun m!668387 () Bool)

(assert (=> b!711368 m!668387))

(declare-fun m!668389 () Bool)

(assert (=> b!711346 m!668389))

(declare-fun m!668391 () Bool)

(assert (=> b!711362 m!668391))

(assert (=> b!711353 m!668377))

(assert (=> b!711353 m!668377))

(declare-fun m!668393 () Bool)

(assert (=> b!711353 m!668393))

(declare-fun m!668395 () Bool)

(assert (=> b!711366 m!668395))

(declare-fun m!668397 () Bool)

(assert (=> b!711345 m!668397))

(declare-fun m!668399 () Bool)

(assert (=> b!711352 m!668399))

(declare-fun m!668401 () Bool)

(assert (=> start!63148 m!668401))

(declare-fun m!668403 () Bool)

(assert (=> b!711364 m!668403))

(declare-fun m!668405 () Bool)

(assert (=> b!711356 m!668405))

(declare-fun m!668407 () Bool)

(assert (=> b!711361 m!668407))

(declare-fun m!668409 () Bool)

(assert (=> b!711357 m!668409))

(declare-fun m!668411 () Bool)

(assert (=> b!711360 m!668411))

(declare-fun m!668413 () Bool)

(assert (=> b!711370 m!668413))

(declare-fun m!668415 () Bool)

(assert (=> b!711367 m!668415))

(declare-fun m!668417 () Bool)

(assert (=> b!711350 m!668417))

(declare-fun m!668419 () Bool)

(assert (=> b!711369 m!668419))

(declare-fun m!668421 () Bool)

(assert (=> b!711363 m!668421))

(declare-fun m!668423 () Bool)

(assert (=> b!711347 m!668423))

(declare-fun m!668425 () Bool)

(assert (=> b!711359 m!668425))

(declare-fun m!668427 () Bool)

(assert (=> b!711355 m!668427))

(declare-fun m!668429 () Bool)

(assert (=> b!711348 m!668429))

(declare-fun m!668431 () Bool)

(assert (=> b!711358 m!668431))

(push 1)

(assert (not b!711369))

(assert (not b!711364))

(assert (not b!711346))

(assert (not b!711370))

(assert (not b!711354))

(assert (not b!711361))

(assert (not b!711355))

(assert (not b!711362))

(assert (not b!711357))

(assert (not b!711347))

(assert (not start!63148))

(assert (not b!711358))

(assert (not b!711367))

(assert (not b!711368))

(assert (not b!711359))

(assert (not b!711350))

(assert (not b!711366))

(assert (not b!711356))

(assert (not b!711363))

(assert (not b!711348))

(assert (not b!711360))

(assert (not b!711351))

(assert (not b!711345))

(assert (not b!711353))

(assert (not b!711352))

(assert (not b!711349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97687 () Bool)

(declare-fun res!474866 () Bool)

(declare-fun e!400322 () Bool)

(assert (=> d!97687 (=> res!474866 e!400322)))

(assert (=> d!97687 (= res!474866 (= (select (arr!19350 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97687 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400322)))

(declare-fun b!711568 () Bool)

(declare-fun e!400323 () Bool)

(assert (=> b!711568 (= e!400322 e!400323)))

(declare-fun res!474867 () Bool)

(assert (=> b!711568 (=> (not res!474867) (not e!400323))))

(assert (=> b!711568 (= res!474867 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19752 a!3591)))))

(declare-fun b!711569 () Bool)

(assert (=> b!711569 (= e!400323 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97687 (not res!474866)) b!711568))

(assert (= (and b!711568 res!474867) b!711569))

(declare-fun m!668565 () Bool)

(assert (=> d!97687 m!668565))

(declare-fun m!668571 () Bool)

(assert (=> b!711569 m!668571))

(assert (=> b!711362 d!97687))

(declare-fun d!97695 () Bool)

(declare-fun lt!318470 () Bool)

(declare-fun content!357 (List!13391) (Set (_ BitVec 64)))

(assert (=> d!97695 (= lt!318470 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!357 newAcc!49)))))

(declare-fun e!400343 () Bool)

(assert (=> d!97695 (= lt!318470 e!400343)))

(declare-fun res!474886 () Bool)

(assert (=> d!97695 (=> (not res!474886) (not e!400343))))

(assert (=> d!97695 (= res!474886 (is-Cons!13387 newAcc!49))))

(assert (=> d!97695 (= (contains!3968 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318470)))

(declare-fun b!711591 () Bool)

(declare-fun e!400344 () Bool)

(assert (=> b!711591 (= e!400343 e!400344)))

(declare-fun res!474885 () Bool)

(assert (=> b!711591 (=> res!474885 e!400344)))

(assert (=> b!711591 (= res!474885 (= (h!14432 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711592 () Bool)

(assert (=> b!711592 (= e!400344 (contains!3968 (t!19697 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97695 res!474886) b!711591))

(assert (= (and b!711591 (not res!474885)) b!711592))

(declare-fun m!668595 () Bool)

(assert (=> d!97695 m!668595))

(declare-fun m!668597 () Bool)

(assert (=> d!97695 m!668597))

(declare-fun m!668599 () Bool)

(assert (=> b!711592 m!668599))

(assert (=> b!711361 d!97695))

(declare-fun d!97705 () Bool)

(declare-fun lt!318471 () Bool)

(assert (=> d!97705 (= lt!318471 (set.member k!2824 (content!357 newAcc!49)))))

(declare-fun e!400345 () Bool)

(assert (=> d!97705 (= lt!318471 e!400345)))

(declare-fun res!474888 () Bool)

(assert (=> d!97705 (=> (not res!474888) (not e!400345))))

(assert (=> d!97705 (= res!474888 (is-Cons!13387 newAcc!49))))

(assert (=> d!97705 (= (contains!3968 newAcc!49 k!2824) lt!318471)))

(declare-fun b!711593 () Bool)

(declare-fun e!400346 () Bool)

(assert (=> b!711593 (= e!400345 e!400346)))

(declare-fun res!474887 () Bool)

(assert (=> b!711593 (=> res!474887 e!400346)))

(assert (=> b!711593 (= res!474887 (= (h!14432 newAcc!49) k!2824))))

(declare-fun b!711594 () Bool)

(assert (=> b!711594 (= e!400346 (contains!3968 (t!19697 newAcc!49) k!2824))))

(assert (= (and d!97705 res!474888) b!711593))

(assert (= (and b!711593 (not res!474887)) b!711594))

(assert (=> d!97705 m!668595))

(declare-fun m!668601 () Bool)

(assert (=> d!97705 m!668601))

(declare-fun m!668603 () Bool)

(assert (=> b!711594 m!668603))

(assert (=> b!711360 d!97705))

(declare-fun b!711645 () Bool)

(declare-fun e!400394 () Bool)

(declare-fun e!400396 () Bool)

(assert (=> b!711645 (= e!400394 e!400396)))

(declare-fun res!474931 () Bool)

(assert (=> b!711645 (=> (not res!474931) (not e!400396))))

(declare-fun e!400393 () Bool)

(assert (=> b!711645 (= res!474931 (not e!400393))))

(declare-fun res!474933 () Bool)

(assert (=> b!711645 (=> (not res!474933) (not e!400393))))

(assert (=> b!711645 (= res!474933 (validKeyInArray!0 (select (arr!19350 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun call!34524 () Bool)

(declare-fun bm!34521 () Bool)

(declare-fun c!78722 () Bool)

(assert (=> bm!34521 (= call!34524 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78722 (Cons!13387 (select (arr!19350 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318445) lt!318445)))))

(declare-fun b!711646 () Bool)

(declare-fun e!400397 () Bool)

(assert (=> b!711646 (= e!400396 e!400397)))

(assert (=> b!711646 (= c!78722 (validKeyInArray!0 (select (arr!19350 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711647 () Bool)

(assert (=> b!711647 (= e!400397 call!34524)))

(declare-fun d!97707 () Bool)

(declare-fun res!474932 () Bool)

(assert (=> d!97707 (=> res!474932 e!400394)))

(assert (=> d!97707 (= res!474932 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19752 a!3591)))))

(assert (=> d!97707 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318445) e!400394)))

(declare-fun b!711648 () Bool)

(assert (=> b!711648 (= e!400397 call!34524)))

(declare-fun b!711649 () Bool)

(assert (=> b!711649 (= e!400393 (contains!3968 lt!318445 (select (arr!19350 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!97707 (not res!474932)) b!711645))

(assert (= (and b!711645 res!474933) b!711649))

(assert (= (and b!711645 res!474931) b!711646))

(assert (= (and b!711646 c!78722) b!711648))

(assert (= (and b!711646 (not c!78722)) b!711647))

(assert (= (or b!711648 b!711647) bm!34521))

(assert (=> b!711645 m!668565))

(assert (=> b!711645 m!668565))

(declare-fun m!668633 () Bool)

(assert (=> b!711645 m!668633))

(assert (=> bm!34521 m!668565))

(declare-fun m!668635 () Bool)

(assert (=> bm!34521 m!668635))

(assert (=> b!711646 m!668565))

(assert (=> b!711646 m!668565))

(assert (=> b!711646 m!668633))

(assert (=> b!711649 m!668565))

(assert (=> b!711649 m!668565))

(declare-fun m!668637 () Bool)

(assert (=> b!711649 m!668637))

(assert (=> b!711364 d!97707))

(declare-fun d!97721 () Bool)

(declare-fun lt!318479 () Bool)

(assert (=> d!97721 (= lt!318479 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!357 newAcc!49)))))

(declare-fun e!400402 () Bool)

(assert (=> d!97721 (= lt!318479 e!400402)))

(declare-fun res!474937 () Bool)

(assert (=> d!97721 (=> (not res!474937) (not e!400402))))

(assert (=> d!97721 (= res!474937 (is-Cons!13387 newAcc!49))))

(assert (=> d!97721 (= (contains!3968 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318479)))

(declare-fun b!711656 () Bool)

(declare-fun e!400403 () Bool)

(assert (=> b!711656 (= e!400402 e!400403)))

(declare-fun res!474936 () Bool)

(assert (=> b!711656 (=> res!474936 e!400403)))

(assert (=> b!711656 (= res!474936 (= (h!14432 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711657 () Bool)

(assert (=> b!711657 (= e!400403 (contains!3968 (t!19697 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97721 res!474937) b!711656))

(assert (= (and b!711656 (not res!474936)) b!711657))

(assert (=> d!97721 m!668595))

(declare-fun m!668639 () Bool)

(assert (=> d!97721 m!668639))

(declare-fun m!668641 () Bool)

(assert (=> b!711657 m!668641))

(assert (=> b!711363 d!97721))

(declare-fun d!97723 () Bool)

(declare-fun lt!318480 () Bool)

(assert (=> d!97723 (= lt!318480 (set.member k!2824 (content!357 lt!318445)))))

(declare-fun e!400404 () Bool)

(assert (=> d!97723 (= lt!318480 e!400404)))

(declare-fun res!474939 () Bool)

(assert (=> d!97723 (=> (not res!474939) (not e!400404))))

(assert (=> d!97723 (= res!474939 (is-Cons!13387 lt!318445))))

(assert (=> d!97723 (= (contains!3968 lt!318445 k!2824) lt!318480)))

(declare-fun b!711658 () Bool)

(declare-fun e!400405 () Bool)

(assert (=> b!711658 (= e!400404 e!400405)))

(declare-fun res!474938 () Bool)

(assert (=> b!711658 (=> res!474938 e!400405)))

(assert (=> b!711658 (= res!474938 (= (h!14432 lt!318445) k!2824))))

(declare-fun b!711659 () Bool)

(assert (=> b!711659 (= e!400405 (contains!3968 (t!19697 lt!318445) k!2824))))

(assert (= (and d!97723 res!474939) b!711658))

(assert (= (and b!711658 (not res!474938)) b!711659))

(declare-fun m!668643 () Bool)

(assert (=> d!97723 m!668643))

(declare-fun m!668645 () Bool)

(assert (=> d!97723 m!668645))

(declare-fun m!668647 () Bool)

(assert (=> b!711659 m!668647))

(assert (=> b!711367 d!97723))

(declare-fun d!97725 () Bool)

(declare-fun res!474974 () Bool)

(declare-fun e!400452 () Bool)

(assert (=> d!97725 (=> res!474974 e!400452)))

(assert (=> d!97725 (= res!474974 (is-Nil!13388 lt!318445))))

(assert (=> d!97725 (= (subseq!413 lt!318445 lt!318446) e!400452)))

(declare-fun b!711713 () Bool)

(declare-fun e!400449 () Bool)

(declare-fun e!400450 () Bool)

(assert (=> b!711713 (= e!400449 e!400450)))

(declare-fun res!474976 () Bool)

(assert (=> b!711713 (=> res!474976 e!400450)))

(declare-fun e!400451 () Bool)

(assert (=> b!711713 (= res!474976 e!400451)))

(declare-fun res!474975 () Bool)

(assert (=> b!711713 (=> (not res!474975) (not e!400451))))

(assert (=> b!711713 (= res!474975 (= (h!14432 lt!318445) (h!14432 lt!318446)))))

(declare-fun b!711714 () Bool)

(assert (=> b!711714 (= e!400451 (subseq!413 (t!19697 lt!318445) (t!19697 lt!318446)))))

(declare-fun b!711712 () Bool)

(assert (=> b!711712 (= e!400452 e!400449)))

(declare-fun res!474977 () Bool)

(assert (=> b!711712 (=> (not res!474977) (not e!400449))))

(assert (=> b!711712 (= res!474977 (is-Cons!13387 lt!318446))))

(declare-fun b!711715 () Bool)

(assert (=> b!711715 (= e!400450 (subseq!413 lt!318445 (t!19697 lt!318446)))))

(assert (= (and d!97725 (not res!474974)) b!711712))

(assert (= (and b!711712 res!474977) b!711713))

(assert (= (and b!711713 res!474975) b!711714))

(assert (= (and b!711713 (not res!474976)) b!711715))

(declare-fun m!668699 () Bool)

(assert (=> b!711714 m!668699))

(declare-fun m!668701 () Bool)

(assert (=> b!711715 m!668701))

(assert (=> b!711346 d!97725))

(declare-fun b!711721 () Bool)

(declare-fun e!400458 () Bool)

(declare-fun e!400459 () Bool)

(assert (=> b!711721 (= e!400458 e!400459)))

(declare-fun res!474981 () Bool)

(assert (=> b!711721 (=> (not res!474981) (not e!400459))))

(declare-fun e!400457 () Bool)

(assert (=> b!711721 (= res!474981 (not e!400457))))

(declare-fun res!474983 () Bool)

(assert (=> b!711721 (=> (not res!474983) (not e!400457))))

(assert (=> b!711721 (= res!474983 (validKeyInArray!0 (select (arr!19350 a!3591) from!2969)))))

(declare-fun call!34534 () Bool)

(declare-fun bm!34531 () Bool)

(declare-fun c!78737 () Bool)

(assert (=> bm!34531 (= call!34534 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78737 (Cons!13387 (select (arr!19350 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!711722 () Bool)

(declare-fun e!400460 () Bool)

(assert (=> b!711722 (= e!400459 e!400460)))

(assert (=> b!711722 (= c!78737 (validKeyInArray!0 (select (arr!19350 a!3591) from!2969)))))

(declare-fun b!711723 () Bool)

(assert (=> b!711723 (= e!400460 call!34534)))

(declare-fun d!97759 () Bool)

(declare-fun res!474982 () Bool)

(assert (=> d!97759 (=> res!474982 e!400458)))

(assert (=> d!97759 (= res!474982 (bvsge from!2969 (size!19752 a!3591)))))

(assert (=> d!97759 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400458)))

(declare-fun b!711724 () Bool)

(assert (=> b!711724 (= e!400460 call!34534)))

(declare-fun b!711725 () Bool)

(assert (=> b!711725 (= e!400457 (contains!3968 acc!652 (select (arr!19350 a!3591) from!2969)))))

(assert (= (and d!97759 (not res!474982)) b!711721))

(assert (= (and b!711721 res!474983) b!711725))

(assert (= (and b!711721 res!474981) b!711722))

(assert (= (and b!711722 c!78737) b!711724))

(assert (= (and b!711722 (not c!78737)) b!711723))

(assert (= (or b!711724 b!711723) bm!34531))

(assert (=> b!711721 m!668377))

(assert (=> b!711721 m!668377))

(assert (=> b!711721 m!668393))

(assert (=> bm!34531 m!668377))

(declare-fun m!668721 () Bool)

(assert (=> bm!34531 m!668721))

(assert (=> b!711722 m!668377))

(assert (=> b!711722 m!668377))

(assert (=> b!711722 m!668393))

(assert (=> b!711725 m!668377))

(assert (=> b!711725 m!668377))

(declare-fun m!668725 () Bool)

(assert (=> b!711725 m!668725))

(assert (=> b!711345 d!97759))

(declare-fun d!97767 () Bool)

(declare-fun lt!318490 () Bool)

(assert (=> d!97767 (= lt!318490 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!357 acc!652)))))

(declare-fun e!400469 () Bool)

(assert (=> d!97767 (= lt!318490 e!400469)))

(declare-fun res!474992 () Bool)

(assert (=> d!97767 (=> (not res!474992) (not e!400469))))

(assert (=> d!97767 (= res!474992 (is-Cons!13387 acc!652))))

(assert (=> d!97767 (= (contains!3968 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318490)))

(declare-fun b!711735 () Bool)

(declare-fun e!400470 () Bool)

(assert (=> b!711735 (= e!400469 e!400470)))

(declare-fun res!474991 () Bool)

(assert (=> b!711735 (=> res!474991 e!400470)))

(assert (=> b!711735 (= res!474991 (= (h!14432 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711736 () Bool)

(assert (=> b!711736 (= e!400470 (contains!3968 (t!19697 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97767 res!474992) b!711735))

(assert (= (and b!711735 (not res!474991)) b!711736))

(declare-fun m!668737 () Bool)

(assert (=> d!97767 m!668737))

(declare-fun m!668739 () Bool)

(assert (=> d!97767 m!668739))

(declare-fun m!668743 () Bool)

(assert (=> b!711736 m!668743))

(assert (=> b!711366 d!97767))

(declare-fun d!97773 () Bool)

(assert (=> d!97773 (= (array_inv!15146 a!3591) (bvsge (size!19752 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63148 d!97773))

(declare-fun d!97775 () Bool)

(declare-fun res!475009 () Bool)

(declare-fun e!400487 () Bool)

(assert (=> d!97775 (=> res!475009 e!400487)))

(assert (=> d!97775 (= res!475009 (is-Nil!13388 lt!318446))))

(assert (=> d!97775 (= (noDuplicate!1215 lt!318446) e!400487)))

(declare-fun b!711753 () Bool)

(declare-fun e!400488 () Bool)

(assert (=> b!711753 (= e!400487 e!400488)))

(declare-fun res!475010 () Bool)

(assert (=> b!711753 (=> (not res!475010) (not e!400488))))

(assert (=> b!711753 (= res!475010 (not (contains!3968 (t!19697 lt!318446) (h!14432 lt!318446))))))

(declare-fun b!711754 () Bool)

(assert (=> b!711754 (= e!400488 (noDuplicate!1215 (t!19697 lt!318446)))))

(assert (= (and d!97775 (not res!475009)) b!711753))

(assert (= (and b!711753 res!475010) b!711754))

(declare-fun m!668755 () Bool)

(assert (=> b!711753 m!668755))

(declare-fun m!668757 () Bool)

(assert (=> b!711754 m!668757))

(assert (=> b!711370 d!97775))

(declare-fun bm!34535 () Bool)

(declare-fun call!34538 () List!13391)

(assert (=> bm!34535 (= call!34538 (-!378 (t!19697 newAcc!49) k!2824))))

(declare-fun b!711795 () Bool)

(declare-fun e!400527 () List!13391)

(declare-fun e!400528 () List!13391)

(assert (=> b!711795 (= e!400527 e!400528)))

(declare-fun c!78743 () Bool)

(assert (=> b!711795 (= c!78743 (= k!2824 (h!14432 newAcc!49)))))

(declare-fun b!711796 () Bool)

(assert (=> b!711796 (= e!400527 Nil!13388)))

(declare-fun d!97783 () Bool)

(declare-fun e!400526 () Bool)

(assert (=> d!97783 e!400526))

(declare-fun res!475043 () Bool)

(assert (=> d!97783 (=> (not res!475043) (not e!400526))))

(declare-fun lt!318500 () List!13391)

(declare-fun size!19757 (List!13391) Int)

(assert (=> d!97783 (= res!475043 (<= (size!19757 lt!318500) (size!19757 newAcc!49)))))

(assert (=> d!97783 (= lt!318500 e!400527)))

(declare-fun c!78744 () Bool)

(assert (=> d!97783 (= c!78744 (is-Cons!13387 newAcc!49))))

(assert (=> d!97783 (= (-!378 newAcc!49 k!2824) lt!318500)))

(declare-fun b!711797 () Bool)

(assert (=> b!711797 (= e!400528 call!34538)))

(declare-fun b!711798 () Bool)

(assert (=> b!711798 (= e!400528 (Cons!13387 (h!14432 newAcc!49) call!34538))))

(declare-fun b!711799 () Bool)

(assert (=> b!711799 (= e!400526 (= (content!357 lt!318500) (set.minus (content!357 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(assert (= (and d!97783 c!78744) b!711795))

(assert (= (and d!97783 (not c!78744)) b!711796))

(assert (= (and b!711795 c!78743) b!711797))

(assert (= (and b!711795 (not c!78743)) b!711798))

(assert (= (or b!711797 b!711798) bm!34535))

(assert (= (and d!97783 res!475043) b!711799))

(declare-fun m!668805 () Bool)

(assert (=> bm!34535 m!668805))

(declare-fun m!668807 () Bool)

(assert (=> d!97783 m!668807))

(declare-fun m!668809 () Bool)

(assert (=> d!97783 m!668809))

(declare-fun m!668811 () Bool)

(assert (=> b!711799 m!668811))

(assert (=> b!711799 m!668595))

(declare-fun m!668813 () Bool)

(assert (=> b!711799 m!668813))

(assert (=> b!711369 d!97783))

(declare-fun d!97811 () Bool)

(declare-fun res!475044 () Bool)

(declare-fun e!400529 () Bool)

(assert (=> d!97811 (=> res!475044 e!400529)))

(assert (=> d!97811 (= res!475044 (= (select (arr!19350 a!3591) from!2969) k!2824))))

(assert (=> d!97811 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!400529)))

(declare-fun b!711800 () Bool)

(declare-fun e!400530 () Bool)

(assert (=> b!711800 (= e!400529 e!400530)))

(declare-fun res!475045 () Bool)

(assert (=> b!711800 (=> (not res!475045) (not e!400530))))

(assert (=> b!711800 (= res!475045 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19752 a!3591)))))

(declare-fun b!711801 () Bool)

(assert (=> b!711801 (= e!400530 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97811 (not res!475044)) b!711800))

(assert (= (and b!711800 res!475045) b!711801))

(assert (=> d!97811 m!668377))

(declare-fun m!668815 () Bool)

(assert (=> b!711801 m!668815))

(assert (=> b!711348 d!97811))

(declare-fun d!97813 () Bool)

(declare-fun lt!318501 () Bool)

(assert (=> d!97813 (= lt!318501 (set.member k!2824 (content!357 acc!652)))))

(declare-fun e!400531 () Bool)

(assert (=> d!97813 (= lt!318501 e!400531)))

(declare-fun res!475047 () Bool)

(assert (=> d!97813 (=> (not res!475047) (not e!400531))))

(assert (=> d!97813 (= res!475047 (is-Cons!13387 acc!652))))

(assert (=> d!97813 (= (contains!3968 acc!652 k!2824) lt!318501)))

(declare-fun b!711802 () Bool)

(declare-fun e!400532 () Bool)

(assert (=> b!711802 (= e!400531 e!400532)))

(declare-fun res!475046 () Bool)

(assert (=> b!711802 (=> res!475046 e!400532)))

(assert (=> b!711802 (= res!475046 (= (h!14432 acc!652) k!2824))))

(declare-fun b!711803 () Bool)

(assert (=> b!711803 (= e!400532 (contains!3968 (t!19697 acc!652) k!2824))))

(assert (= (and d!97813 res!475047) b!711802))

(assert (= (and b!711802 (not res!475046)) b!711803))

(assert (=> d!97813 m!668737))

(declare-fun m!668817 () Bool)

(assert (=> d!97813 m!668817))

(declare-fun m!668819 () Bool)

(assert (=> b!711803 m!668819))

(assert (=> b!711347 d!97813))

(declare-fun d!97815 () Bool)

(declare-fun lt!318502 () Bool)

(assert (=> d!97815 (= lt!318502 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!357 acc!652)))))

(declare-fun e!400533 () Bool)

(assert (=> d!97815 (= lt!318502 e!400533)))

(declare-fun res!475049 () Bool)

(assert (=> d!97815 (=> (not res!475049) (not e!400533))))

(assert (=> d!97815 (= res!475049 (is-Cons!13387 acc!652))))

(assert (=> d!97815 (= (contains!3968 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318502)))

(declare-fun b!711804 () Bool)

(declare-fun e!400534 () Bool)

(assert (=> b!711804 (= e!400533 e!400534)))

(declare-fun res!475048 () Bool)

(assert (=> b!711804 (=> res!475048 e!400534)))

(assert (=> b!711804 (= res!475048 (= (h!14432 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711805 () Bool)

(assert (=> b!711805 (= e!400534 (contains!3968 (t!19697 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97815 res!475049) b!711804))

(assert (= (and b!711804 (not res!475048)) b!711805))

(assert (=> d!97815 m!668737))

(declare-fun m!668821 () Bool)

(assert (=> d!97815 m!668821))

(declare-fun m!668823 () Bool)

(assert (=> b!711805 m!668823))

(assert (=> b!711368 d!97815))

(declare-fun d!97817 () Bool)

(assert (=> d!97817 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711351 d!97817))

(declare-fun bm!34536 () Bool)

(declare-fun call!34539 () List!13391)

(assert (=> bm!34536 (= call!34539 (-!378 (t!19697 lt!318446) k!2824))))

(declare-fun b!711806 () Bool)

(declare-fun e!400536 () List!13391)

(declare-fun e!400537 () List!13391)

(assert (=> b!711806 (= e!400536 e!400537)))

(declare-fun c!78745 () Bool)

(assert (=> b!711806 (= c!78745 (= k!2824 (h!14432 lt!318446)))))

(declare-fun b!711807 () Bool)

(assert (=> b!711807 (= e!400536 Nil!13388)))

(declare-fun d!97819 () Bool)

(declare-fun e!400535 () Bool)

(assert (=> d!97819 e!400535))

(declare-fun res!475050 () Bool)

(assert (=> d!97819 (=> (not res!475050) (not e!400535))))

(declare-fun lt!318503 () List!13391)

(assert (=> d!97819 (= res!475050 (<= (size!19757 lt!318503) (size!19757 lt!318446)))))

(assert (=> d!97819 (= lt!318503 e!400536)))

(declare-fun c!78746 () Bool)

(assert (=> d!97819 (= c!78746 (is-Cons!13387 lt!318446))))

(assert (=> d!97819 (= (-!378 lt!318446 k!2824) lt!318503)))

(declare-fun b!711808 () Bool)

(assert (=> b!711808 (= e!400537 call!34539)))

(declare-fun b!711809 () Bool)

(assert (=> b!711809 (= e!400537 (Cons!13387 (h!14432 lt!318446) call!34539))))

(declare-fun b!711810 () Bool)

(assert (=> b!711810 (= e!400535 (= (content!357 lt!318503) (set.minus (content!357 lt!318446) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(assert (= (and d!97819 c!78746) b!711806))

(assert (= (and d!97819 (not c!78746)) b!711807))

(assert (= (and b!711806 c!78745) b!711808))

(assert (= (and b!711806 (not c!78745)) b!711809))

(assert (= (or b!711808 b!711809) bm!34536))

(assert (= (and d!97819 res!475050) b!711810))

