; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60512 () Bool)

(assert start!60512)

(declare-fun b!680343 () Bool)

(declare-fun res!446624 () Bool)

(declare-fun e!387497 () Bool)

(assert (=> b!680343 (=> (not res!446624) (not e!387497))))

(declare-datatypes ((List!12977 0))(
  ( (Nil!12974) (Cons!12973 (h!14018 (_ BitVec 64)) (t!19205 List!12977)) )
))
(declare-fun acc!681 () List!12977)

(declare-fun contains!3554 (List!12977 (_ BitVec 64)) Bool)

(assert (=> b!680343 (= res!446624 (not (contains!3554 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680344 () Bool)

(declare-fun e!387502 () Bool)

(declare-fun e!387501 () Bool)

(assert (=> b!680344 (= e!387502 e!387501)))

(declare-fun res!446609 () Bool)

(assert (=> b!680344 (=> (not res!446609) (not e!387501))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680344 (= res!446609 (bvsle from!3004 i!1382))))

(declare-fun b!680345 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!680345 (= e!387501 (not (contains!3554 acc!681 k!2843)))))

(declare-fun b!680346 () Bool)

(declare-datatypes ((array!39493 0))(
  ( (array!39494 (arr!18936 (Array (_ BitVec 32) (_ BitVec 64))) (size!19300 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39493)

(declare-fun e!387498 () Bool)

(declare-fun noDuplicate!801 (List!12977) Bool)

(declare-fun $colon$colon!305 (List!12977 (_ BitVec 64)) List!12977)

(assert (=> b!680346 (= e!387498 (noDuplicate!801 ($colon$colon!305 acc!681 (select (arr!18936 a!3626) from!3004))))))

(declare-fun b!680347 () Bool)

(declare-fun res!446623 () Bool)

(assert (=> b!680347 (=> (not res!446623) (not e!387497))))

(assert (=> b!680347 (= res!446623 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19300 a!3626))))))

(declare-fun b!680348 () Bool)

(declare-fun res!446622 () Bool)

(assert (=> b!680348 (=> (not res!446622) (not e!387497))))

(declare-fun arrayNoDuplicates!0 (array!39493 (_ BitVec 32) List!12977) Bool)

(assert (=> b!680348 (= res!446622 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12974))))

(declare-fun b!680349 () Bool)

(declare-fun res!446619 () Bool)

(assert (=> b!680349 (=> (not res!446619) (not e!387497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680349 (= res!446619 (validKeyInArray!0 k!2843))))

(declare-fun b!680350 () Bool)

(declare-datatypes ((Unit!23862 0))(
  ( (Unit!23863) )
))
(declare-fun e!387500 () Unit!23862)

(declare-fun Unit!23864 () Unit!23862)

(assert (=> b!680350 (= e!387500 Unit!23864)))

(declare-fun lt!313068 () Unit!23862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39493 (_ BitVec 64) (_ BitVec 32)) Unit!23862)

(assert (=> b!680350 (= lt!313068 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680350 false))

(declare-fun b!680351 () Bool)

(declare-fun res!446614 () Bool)

(assert (=> b!680351 (=> (not res!446614) (not e!387497))))

(declare-fun arrayContainsKey!0 (array!39493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680351 (= res!446614 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680352 () Bool)

(declare-fun e!387504 () Bool)

(assert (=> b!680352 (= e!387504 (contains!3554 acc!681 k!2843))))

(declare-fun res!446615 () Bool)

(assert (=> start!60512 (=> (not res!446615) (not e!387497))))

(assert (=> start!60512 (= res!446615 (and (bvslt (size!19300 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19300 a!3626))))))

(assert (=> start!60512 e!387497))

(assert (=> start!60512 true))

(declare-fun array_inv!14732 (array!39493) Bool)

(assert (=> start!60512 (array_inv!14732 a!3626)))

(declare-fun b!680353 () Bool)

(declare-fun res!446613 () Bool)

(assert (=> b!680353 (=> (not res!446613) (not e!387497))))

(assert (=> b!680353 (= res!446613 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19300 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680354 () Bool)

(declare-fun res!446612 () Bool)

(assert (=> b!680354 (=> (not res!446612) (not e!387497))))

(assert (=> b!680354 (= res!446612 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680355 () Bool)

(declare-fun res!446617 () Bool)

(assert (=> b!680355 (=> (not res!446617) (not e!387497))))

(assert (=> b!680355 (= res!446617 e!387502)))

(declare-fun res!446611 () Bool)

(assert (=> b!680355 (=> res!446611 e!387502)))

(assert (=> b!680355 (= res!446611 e!387504)))

(declare-fun res!446620 () Bool)

(assert (=> b!680355 (=> (not res!446620) (not e!387504))))

(assert (=> b!680355 (= res!446620 (bvsgt from!3004 i!1382))))

(declare-fun b!680356 () Bool)

(declare-fun Unit!23865 () Unit!23862)

(assert (=> b!680356 (= e!387500 Unit!23865)))

(declare-fun b!680357 () Bool)

(declare-fun res!446610 () Bool)

(assert (=> b!680357 (=> (not res!446610) (not e!387497))))

(assert (=> b!680357 (= res!446610 (noDuplicate!801 acc!681))))

(declare-fun b!680358 () Bool)

(declare-fun e!387503 () Bool)

(assert (=> b!680358 (= e!387497 (not e!387503))))

(declare-fun res!446618 () Bool)

(assert (=> b!680358 (=> res!446618 e!387503)))

(assert (=> b!680358 (= res!446618 (not (validKeyInArray!0 (select (arr!18936 a!3626) from!3004))))))

(declare-fun lt!313067 () Unit!23862)

(assert (=> b!680358 (= lt!313067 e!387500)))

(declare-fun c!77234 () Bool)

(assert (=> b!680358 (= c!77234 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680358 (arrayContainsKey!0 (array!39494 (store (arr!18936 a!3626) i!1382 k!2843) (size!19300 a!3626)) k!2843 from!3004)))

(declare-fun b!680359 () Bool)

(assert (=> b!680359 (= e!387503 e!387498)))

(declare-fun res!446621 () Bool)

(assert (=> b!680359 (=> res!446621 e!387498)))

(assert (=> b!680359 (= res!446621 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun subseq!140 (List!12977 List!12977) Bool)

(assert (=> b!680359 (subseq!140 acc!681 acc!681)))

(declare-fun lt!313069 () Unit!23862)

(declare-fun lemmaListSubSeqRefl!0 (List!12977) Unit!23862)

(assert (=> b!680359 (= lt!313069 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680360 () Bool)

(declare-fun res!446616 () Bool)

(assert (=> b!680360 (=> (not res!446616) (not e!387497))))

(assert (=> b!680360 (= res!446616 (not (contains!3554 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60512 res!446615) b!680357))

(assert (= (and b!680357 res!446610) b!680343))

(assert (= (and b!680343 res!446624) b!680360))

(assert (= (and b!680360 res!446616) b!680355))

(assert (= (and b!680355 res!446620) b!680352))

(assert (= (and b!680355 (not res!446611)) b!680344))

(assert (= (and b!680344 res!446609) b!680345))

(assert (= (and b!680355 res!446617) b!680348))

(assert (= (and b!680348 res!446622) b!680354))

(assert (= (and b!680354 res!446612) b!680347))

(assert (= (and b!680347 res!446623) b!680349))

(assert (= (and b!680349 res!446619) b!680351))

(assert (= (and b!680351 res!446614) b!680353))

(assert (= (and b!680353 res!446613) b!680358))

(assert (= (and b!680358 c!77234) b!680350))

(assert (= (and b!680358 (not c!77234)) b!680356))

(assert (= (and b!680358 (not res!446618)) b!680359))

(assert (= (and b!680359 (not res!446621)) b!680346))

(declare-fun m!645425 () Bool)

(assert (=> b!680343 m!645425))

(declare-fun m!645427 () Bool)

(assert (=> b!680351 m!645427))

(declare-fun m!645429 () Bool)

(assert (=> b!680352 m!645429))

(declare-fun m!645431 () Bool)

(assert (=> b!680348 m!645431))

(declare-fun m!645433 () Bool)

(assert (=> b!680360 m!645433))

(declare-fun m!645435 () Bool)

(assert (=> b!680357 m!645435))

(declare-fun m!645437 () Bool)

(assert (=> b!680346 m!645437))

(assert (=> b!680346 m!645437))

(declare-fun m!645439 () Bool)

(assert (=> b!680346 m!645439))

(assert (=> b!680346 m!645439))

(declare-fun m!645441 () Bool)

(assert (=> b!680346 m!645441))

(declare-fun m!645443 () Bool)

(assert (=> b!680354 m!645443))

(declare-fun m!645445 () Bool)

(assert (=> b!680350 m!645445))

(assert (=> b!680358 m!645437))

(declare-fun m!645447 () Bool)

(assert (=> b!680358 m!645447))

(declare-fun m!645449 () Bool)

(assert (=> b!680358 m!645449))

(assert (=> b!680358 m!645437))

(declare-fun m!645451 () Bool)

(assert (=> b!680358 m!645451))

(declare-fun m!645453 () Bool)

(assert (=> b!680358 m!645453))

(declare-fun m!645455 () Bool)

(assert (=> b!680349 m!645455))

(declare-fun m!645457 () Bool)

(assert (=> b!680359 m!645457))

(declare-fun m!645459 () Bool)

(assert (=> b!680359 m!645459))

(assert (=> b!680345 m!645429))

(declare-fun m!645461 () Bool)

(assert (=> start!60512 m!645461))

(push 1)

(assert (not b!680345))

(assert (not b!680346))

(assert (not start!60512))

(assert (not b!680357))

(assert (not b!680359))

(assert (not b!680343))

(assert (not b!680348))

(assert (not b!680358))

(assert (not b!680354))

(assert (not b!680360))

(assert (not b!680350))

(assert (not b!680352))

(assert (not b!680349))

(assert (not b!680351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93575 () Bool)

(assert (=> d!93575 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680349 d!93575))

(declare-fun bm!33940 () Bool)

(declare-fun call!33943 () Bool)

(declare-fun c!77245 () Bool)

(assert (=> bm!33940 (= call!33943 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77245 (Cons!12973 (select (arr!18936 a!3626) #b00000000000000000000000000000000) Nil!12974) Nil!12974)))))

(declare-fun b!680507 () Bool)

(declare-fun e!387589 () Bool)

(assert (=> b!680507 (= e!387589 call!33943)))

(declare-fun b!680508 () Bool)

(declare-fun e!387588 () Bool)

(assert (=> b!680508 (= e!387588 (contains!3554 Nil!12974 (select (arr!18936 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680509 () Bool)

(declare-fun e!387590 () Bool)

(declare-fun e!387587 () Bool)

(assert (=> b!680509 (= e!387590 e!387587)))

(declare-fun res!446752 () Bool)

(assert (=> b!680509 (=> (not res!446752) (not e!387587))))

(assert (=> b!680509 (= res!446752 (not e!387588))))

(declare-fun res!446751 () Bool)

(assert (=> b!680509 (=> (not res!446751) (not e!387588))))

(assert (=> b!680509 (= res!446751 (validKeyInArray!0 (select (arr!18936 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93577 () Bool)

(declare-fun res!446753 () Bool)

(assert (=> d!93577 (=> res!446753 e!387590)))

(assert (=> d!93577 (= res!446753 (bvsge #b00000000000000000000000000000000 (size!19300 a!3626)))))

(assert (=> d!93577 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12974) e!387590)))

(declare-fun b!680510 () Bool)

(assert (=> b!680510 (= e!387587 e!387589)))

(assert (=> b!680510 (= c!77245 (validKeyInArray!0 (select (arr!18936 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680511 () Bool)

(assert (=> b!680511 (= e!387589 call!33943)))

(assert (= (and d!93577 (not res!446753)) b!680509))

(assert (= (and b!680509 res!446751) b!680508))

(assert (= (and b!680509 res!446752) b!680510))

(assert (= (and b!680510 c!77245) b!680511))

(assert (= (and b!680510 (not c!77245)) b!680507))

(assert (= (or b!680511 b!680507) bm!33940))

(declare-fun m!645551 () Bool)

(assert (=> bm!33940 m!645551))

(declare-fun m!645553 () Bool)

(assert (=> bm!33940 m!645553))

(assert (=> b!680508 m!645551))

(assert (=> b!680508 m!645551))

(declare-fun m!645555 () Bool)

(assert (=> b!680508 m!645555))

(assert (=> b!680509 m!645551))

(assert (=> b!680509 m!645551))

(declare-fun m!645557 () Bool)

(assert (=> b!680509 m!645557))

(assert (=> b!680510 m!645551))

(assert (=> b!680510 m!645551))

(assert (=> b!680510 m!645557))

(assert (=> b!680348 d!93577))

(declare-fun b!680542 () Bool)

(declare-fun e!387622 () Bool)

(declare-fun e!387621 () Bool)

(assert (=> b!680542 (= e!387622 e!387621)))

(declare-fun res!446781 () Bool)

(assert (=> b!680542 (=> res!446781 e!387621)))

(declare-fun e!387620 () Bool)

(assert (=> b!680542 (= res!446781 e!387620)))

(declare-fun res!446783 () Bool)

(assert (=> b!680542 (=> (not res!446783) (not e!387620))))

(assert (=> b!680542 (= res!446783 (= (h!14018 acc!681) (h!14018 acc!681)))))

(declare-fun b!680541 () Bool)

(declare-fun e!387619 () Bool)

(assert (=> b!680541 (= e!387619 e!387622)))

(declare-fun res!446784 () Bool)

(assert (=> b!680541 (=> (not res!446784) (not e!387622))))

(assert (=> b!680541 (= res!446784 (is-Cons!12973 acc!681))))

(declare-fun b!680543 () Bool)

(assert (=> b!680543 (= e!387620 (subseq!140 (t!19205 acc!681) (t!19205 acc!681)))))

(declare-fun b!680544 () Bool)

(assert (=> b!680544 (= e!387621 (subseq!140 acc!681 (t!19205 acc!681)))))

(declare-fun d!93587 () Bool)

(declare-fun res!446782 () Bool)

(assert (=> d!93587 (=> res!446782 e!387619)))

(assert (=> d!93587 (= res!446782 (is-Nil!12974 acc!681))))

(assert (=> d!93587 (= (subseq!140 acc!681 acc!681) e!387619)))

(assert (= (and d!93587 (not res!446782)) b!680541))

(assert (= (and b!680541 res!446784) b!680542))

(assert (= (and b!680542 res!446783) b!680543))

(assert (= (and b!680542 (not res!446781)) b!680544))

(declare-fun m!645571 () Bool)

(assert (=> b!680543 m!645571))

(declare-fun m!645573 () Bool)

(assert (=> b!680544 m!645573))

(assert (=> b!680359 d!93587))

(declare-fun d!93597 () Bool)

(assert (=> d!93597 (subseq!140 acc!681 acc!681)))

(declare-fun lt!313101 () Unit!23862)

(declare-fun choose!36 (List!12977) Unit!23862)

(assert (=> d!93597 (= lt!313101 (choose!36 acc!681))))

(assert (=> d!93597 (= (lemmaListSubSeqRefl!0 acc!681) lt!313101)))

(declare-fun bs!19979 () Bool)

(assert (= bs!19979 d!93597))

(assert (=> bs!19979 m!645457))

(declare-fun m!645593 () Bool)

(assert (=> bs!19979 m!645593))

(assert (=> b!680359 d!93597))

(declare-fun d!93609 () Bool)

(assert (=> d!93609 (= (validKeyInArray!0 (select (arr!18936 a!3626) from!3004)) (and (not (= (select (arr!18936 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18936 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680358 d!93609))

(declare-fun d!93611 () Bool)

(declare-fun res!446797 () Bool)

(declare-fun e!387635 () Bool)

(assert (=> d!93611 (=> res!446797 e!387635)))

(assert (=> d!93611 (= res!446797 (= (select (arr!18936 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!93611 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387635)))

(declare-fun b!680557 () Bool)

(declare-fun e!387636 () Bool)

(assert (=> b!680557 (= e!387635 e!387636)))

(declare-fun res!446798 () Bool)

(assert (=> b!680557 (=> (not res!446798) (not e!387636))))

(assert (=> b!680557 (= res!446798 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19300 a!3626)))))

(declare-fun b!680558 () Bool)

(assert (=> b!680558 (= e!387636 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93611 (not res!446797)) b!680557))

(assert (= (and b!680557 res!446798) b!680558))

(declare-fun m!645597 () Bool)

(assert (=> d!93611 m!645597))

(declare-fun m!645599 () Bool)

(assert (=> b!680558 m!645599))

(assert (=> b!680358 d!93611))

(declare-fun d!93619 () Bool)

(declare-fun res!446801 () Bool)

(declare-fun e!387639 () Bool)

(assert (=> d!93619 (=> res!446801 e!387639)))

(assert (=> d!93619 (= res!446801 (= (select (arr!18936 (array!39494 (store (arr!18936 a!3626) i!1382 k!2843) (size!19300 a!3626))) from!3004) k!2843))))

(assert (=> d!93619 (= (arrayContainsKey!0 (array!39494 (store (arr!18936 a!3626) i!1382 k!2843) (size!19300 a!3626)) k!2843 from!3004) e!387639)))

(declare-fun b!680561 () Bool)

(declare-fun e!387640 () Bool)

(assert (=> b!680561 (= e!387639 e!387640)))

(declare-fun res!446802 () Bool)

(assert (=> b!680561 (=> (not res!446802) (not e!387640))))

(assert (=> b!680561 (= res!446802 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19300 (array!39494 (store (arr!18936 a!3626) i!1382 k!2843) (size!19300 a!3626)))))))

(declare-fun b!680562 () Bool)

(assert (=> b!680562 (= e!387640 (arrayContainsKey!0 (array!39494 (store (arr!18936 a!3626) i!1382 k!2843) (size!19300 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93619 (not res!446801)) b!680561))

(assert (= (and b!680561 res!446802) b!680562))

(declare-fun m!645601 () Bool)

(assert (=> d!93619 m!645601))

(declare-fun m!645603 () Bool)

(assert (=> b!680562 m!645603))

(assert (=> b!680358 d!93619))

(declare-fun d!93621 () Bool)

(declare-fun res!446805 () Bool)

(declare-fun e!387643 () Bool)

(assert (=> d!93621 (=> res!446805 e!387643)))

(assert (=> d!93621 (= res!446805 (= (select (arr!18936 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93621 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!387643)))

(declare-fun b!680565 () Bool)

(declare-fun e!387644 () Bool)

(assert (=> b!680565 (= e!387643 e!387644)))

(declare-fun res!446806 () Bool)

(assert (=> b!680565 (=> (not res!446806) (not e!387644))))

(assert (=> b!680565 (= res!446806 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19300 a!3626)))))

(declare-fun b!680566 () Bool)

(assert (=> b!680566 (= e!387644 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93621 (not res!446805)) b!680565))

(assert (= (and b!680565 res!446806) b!680566))

(assert (=> d!93621 m!645551))

(declare-fun m!645605 () Bool)

(assert (=> b!680566 m!645605))

(assert (=> b!680351 d!93621))

(declare-fun d!93623 () Bool)

(assert (=> d!93623 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313107 () Unit!23862)

(declare-fun choose!13 (array!39493 (_ BitVec 64) (_ BitVec 32)) Unit!23862)

(assert (=> d!93623 (= lt!313107 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!93623 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93623 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!313107)))

(declare-fun bs!19981 () Bool)

(assert (= bs!19981 d!93623))

(assert (=> bs!19981 m!645427))

(declare-fun m!645611 () Bool)

(assert (=> bs!19981 m!645611))

(assert (=> b!680350 d!93623))

(declare-fun d!93629 () Bool)

(assert (=> d!93629 (= (array_inv!14732 a!3626) (bvsge (size!19300 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60512 d!93629))

(declare-fun d!93633 () Bool)

(declare-fun lt!313112 () Bool)

(declare-fun content!269 (List!12977) (Set (_ BitVec 64)))

(assert (=> d!93633 (= lt!313112 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!269 acc!681)))))

(declare-fun e!387675 () Bool)

(assert (=> d!93633 (= lt!313112 e!387675)))

(declare-fun res!446833 () Bool)

(assert (=> d!93633 (=> (not res!446833) (not e!387675))))

(assert (=> d!93633 (= res!446833 (is-Cons!12973 acc!681))))

(assert (=> d!93633 (= (contains!3554 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313112)))

(declare-fun b!680601 () Bool)

(declare-fun e!387676 () Bool)

(assert (=> b!680601 (= e!387675 e!387676)))

(declare-fun res!446834 () Bool)

(assert (=> b!680601 (=> res!446834 e!387676)))

(assert (=> b!680601 (= res!446834 (= (h!14018 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680602 () Bool)

(assert (=> b!680602 (= e!387676 (contains!3554 (t!19205 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93633 res!446833) b!680601))

(assert (= (and b!680601 (not res!446834)) b!680602))

(declare-fun m!645629 () Bool)

(assert (=> d!93633 m!645629))

(declare-fun m!645633 () Bool)

(assert (=> d!93633 m!645633))

(declare-fun m!645635 () Bool)

(assert (=> b!680602 m!645635))

(assert (=> b!680360 d!93633))

(declare-fun call!33949 () Bool)

(declare-fun c!77251 () Bool)

(declare-fun bm!33946 () Bool)

(assert (=> bm!33946 (= call!33949 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77251 (Cons!12973 (select (arr!18936 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!680603 () Bool)

(declare-fun e!387679 () Bool)

(assert (=> b!680603 (= e!387679 call!33949)))

(declare-fun e!387678 () Bool)

(declare-fun b!680604 () Bool)

(assert (=> b!680604 (= e!387678 (contains!3554 acc!681 (select (arr!18936 a!3626) from!3004)))))

(declare-fun b!680605 () Bool)

(declare-fun e!387680 () Bool)

(declare-fun e!387677 () Bool)

(assert (=> b!680605 (= e!387680 e!387677)))

(declare-fun res!446836 () Bool)

(assert (=> b!680605 (=> (not res!446836) (not e!387677))))

(assert (=> b!680605 (= res!446836 (not e!387678))))

(declare-fun res!446835 () Bool)

(assert (=> b!680605 (=> (not res!446835) (not e!387678))))

(assert (=> b!680605 (= res!446835 (validKeyInArray!0 (select (arr!18936 a!3626) from!3004)))))

(declare-fun d!93641 () Bool)

(declare-fun res!446837 () Bool)

(assert (=> d!93641 (=> res!446837 e!387680)))

(assert (=> d!93641 (= res!446837 (bvsge from!3004 (size!19300 a!3626)))))

(assert (=> d!93641 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387680)))

(declare-fun b!680606 () Bool)

(assert (=> b!680606 (= e!387677 e!387679)))

(assert (=> b!680606 (= c!77251 (validKeyInArray!0 (select (arr!18936 a!3626) from!3004)))))

(declare-fun b!680607 () Bool)

(assert (=> b!680607 (= e!387679 call!33949)))

(assert (= (and d!93641 (not res!446837)) b!680605))

(assert (= (and b!680605 res!446835) b!680604))

(assert (= (and b!680605 res!446836) b!680606))

(assert (= (and b!680606 c!77251) b!680607))

(assert (= (and b!680606 (not c!77251)) b!680603))

(assert (= (or b!680607 b!680603) bm!33946))

(assert (=> bm!33946 m!645437))

(declare-fun m!645645 () Bool)

(assert (=> bm!33946 m!645645))

(assert (=> b!680604 m!645437))

(assert (=> b!680604 m!645437))

(declare-fun m!645647 () Bool)

(assert (=> b!680604 m!645647))

(assert (=> b!680605 m!645437))

(assert (=> b!680605 m!645437))

(assert (=> b!680605 m!645451))

(assert (=> b!680606 m!645437))

(assert (=> b!680606 m!645437))

(assert (=> b!680606 m!645451))

(assert (=> b!680354 d!93641))

(declare-fun d!93653 () Bool)

(declare-fun lt!313115 () Bool)

(assert (=> d!93653 (= lt!313115 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!269 acc!681)))))

(declare-fun e!387687 () Bool)

(assert (=> d!93653 (= lt!313115 e!387687)))

(declare-fun res!446844 () Bool)

(assert (=> d!93653 (=> (not res!446844) (not e!387687))))

(assert (=> d!93653 (= res!446844 (is-Cons!12973 acc!681))))

(assert (=> d!93653 (= (contains!3554 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313115)))

(declare-fun b!680614 () Bool)

(declare-fun e!387688 () Bool)

(assert (=> b!680614 (= e!387687 e!387688)))

(declare-fun res!446845 () Bool)

(assert (=> b!680614 (=> res!446845 e!387688)))

(assert (=> b!680614 (= res!446845 (= (h!14018 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680615 () Bool)

(assert (=> b!680615 (= e!387688 (contains!3554 (t!19205 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93653 res!446844) b!680614))

(assert (= (and b!680614 (not res!446845)) b!680615))

(assert (=> d!93653 m!645629))

(declare-fun m!645657 () Bool)

(assert (=> d!93653 m!645657))

(declare-fun m!645659 () Bool)

(assert (=> b!680615 m!645659))

(assert (=> b!680343 d!93653))

(declare-fun d!93659 () Bool)

(declare-fun lt!313116 () Bool)

(assert (=> d!93659 (= lt!313116 (set.member k!2843 (content!269 acc!681)))))

(declare-fun e!387693 () Bool)

(assert (=> d!93659 (= lt!313116 e!387693)))

(declare-fun res!446850 () Bool)

(assert (=> d!93659 (=> (not res!446850) (not e!387693))))

(assert (=> d!93659 (= res!446850 (is-Cons!12973 acc!681))))

(assert (=> d!93659 (= (contains!3554 acc!681 k!2843) lt!313116)))

(declare-fun b!680620 () Bool)

(declare-fun e!387694 () Bool)

(assert (=> b!680620 (= e!387693 e!387694)))

(declare-fun res!446851 () Bool)

(assert (=> b!680620 (=> res!446851 e!387694)))

(assert (=> b!680620 (= res!446851 (= (h!14018 acc!681) k!2843))))

(declare-fun b!680621 () Bool)

(assert (=> b!680621 (= e!387694 (contains!3554 (t!19205 acc!681) k!2843))))

(assert (= (and d!93659 res!446850) b!680620))

(assert (= (and b!680620 (not res!446851)) b!680621))

(assert (=> d!93659 m!645629))

(declare-fun m!645669 () Bool)

(assert (=> d!93659 m!645669))

(declare-fun m!645671 () Bool)

(assert (=> b!680621 m!645671))

(assert (=> b!680352 d!93659))

(declare-fun d!93665 () Bool)

(declare-fun res!446867 () Bool)

(declare-fun e!387711 () Bool)

(assert (=> d!93665 (=> res!446867 e!387711)))

(assert (=> d!93665 (= res!446867 (is-Nil!12974 ($colon$colon!305 acc!681 (select (arr!18936 a!3626) from!3004))))))

(assert (=> d!93665 (= (noDuplicate!801 ($colon$colon!305 acc!681 (select (arr!18936 a!3626) from!3004))) e!387711)))

(declare-fun b!680637 () Bool)

(declare-fun e!387712 () Bool)

(assert (=> b!680637 (= e!387711 e!387712)))

(declare-fun res!446868 () Bool)

(assert (=> b!680637 (=> (not res!446868) (not e!387712))))

(assert (=> b!680637 (= res!446868 (not (contains!3554 (t!19205 ($colon$colon!305 acc!681 (select (arr!18936 a!3626) from!3004))) (h!14018 ($colon$colon!305 acc!681 (select (arr!18936 a!3626) from!3004))))))))

(declare-fun b!680638 () Bool)

(assert (=> b!680638 (= e!387712 (noDuplicate!801 (t!19205 ($colon$colon!305 acc!681 (select (arr!18936 a!3626) from!3004)))))))

(assert (= (and d!93665 (not res!446867)) b!680637))

(assert (= (and b!680637 res!446868) b!680638))

(declare-fun m!645681 () Bool)

(assert (=> b!680637 m!645681))

(declare-fun m!645683 () Bool)

(assert (=> b!680638 m!645683))

(assert (=> b!680346 d!93665))

(declare-fun d!93669 () Bool)

(assert (=> d!93669 (= ($colon$colon!305 acc!681 (select (arr!18936 a!3626) from!3004)) (Cons!12973 (select (arr!18936 a!3626) from!3004) acc!681))))

(assert (=> b!680346 d!93669))

(declare-fun d!93671 () Bool)

(declare-fun res!446871 () Bool)

(declare-fun e!387715 () Bool)

(assert (=> d!93671 (=> res!446871 e!387715)))

(assert (=> d!93671 (= res!446871 (is-Nil!12974 acc!681))))

(assert (=> d!93671 (= (noDuplicate!801 acc!681) e!387715)))

(declare-fun b!680643 () Bool)

(declare-fun e!387716 () Bool)

(assert (=> b!680643 (= e!387715 e!387716)))

(declare-fun res!446872 () Bool)

(assert (=> b!680643 (=> (not res!446872) (not e!387716))))

(assert (=> b!680643 (= res!446872 (not (contains!3554 (t!19205 acc!681) (h!14018 acc!681))))))

(declare-fun b!680644 () Bool)

(assert (=> b!680644 (= e!387716 (noDuplicate!801 (t!19205 acc!681)))))

(assert (= (and d!93671 (not res!446871)) b!680643))

(assert (= (and b!680643 res!446872) b!680644))

(declare-fun m!645685 () Bool)

(assert (=> b!680643 m!645685))

(declare-fun m!645687 () Bool)

(assert (=> b!680644 m!645687))

(assert (=> b!680357 d!93671))

(assert (=> b!680345 d!93659))

(push 1)

(assert (not b!680543))

(assert (not b!680615))

