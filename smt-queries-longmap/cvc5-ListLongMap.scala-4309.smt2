; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59882 () Bool)

(assert start!59882)

(declare-fun res!430572 () Bool)

(declare-fun e!380353 () Bool)

(assert (=> start!59882 (=> (not res!430572) (not e!380353))))

(declare-datatypes ((array!38929 0))(
  ( (array!38930 (arr!18657 (Array (_ BitVec 32) (_ BitVec 64))) (size!19021 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38929)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59882 (= res!430572 (and (bvslt (size!19021 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19021 a!3626))))))

(assert (=> start!59882 e!380353))

(assert (=> start!59882 true))

(declare-fun array_inv!14453 (array!38929) Bool)

(assert (=> start!59882 (array_inv!14453 a!3626)))

(declare-fun b!662570 () Bool)

(declare-fun res!430565 () Bool)

(declare-fun e!380356 () Bool)

(assert (=> b!662570 (=> res!430565 e!380356)))

(declare-datatypes ((List!12698 0))(
  ( (Nil!12695) (Cons!12694 (h!13739 (_ BitVec 64)) (t!18926 List!12698)) )
))
(declare-fun lt!309049 () List!12698)

(declare-fun contains!3275 (List!12698 (_ BitVec 64)) Bool)

(assert (=> b!662570 (= res!430565 (contains!3275 lt!309049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662571 () Bool)

(declare-fun e!380352 () Bool)

(assert (=> b!662571 (= e!380352 e!380356)))

(declare-fun res!430569 () Bool)

(assert (=> b!662571 (=> res!430569 e!380356)))

(assert (=> b!662571 (= res!430569 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!12698)

(declare-fun $colon$colon!146 (List!12698 (_ BitVec 64)) List!12698)

(assert (=> b!662571 (= lt!309049 ($colon$colon!146 acc!681 (select (arr!18657 a!3626) from!3004)))))

(declare-fun subseq!14 (List!12698 List!12698) Bool)

(assert (=> b!662571 (subseq!14 acc!681 acc!681)))

(declare-datatypes ((Unit!23022 0))(
  ( (Unit!23023) )
))
(declare-fun lt!309047 () Unit!23022)

(declare-fun lemmaListSubSeqRefl!0 (List!12698) Unit!23022)

(assert (=> b!662571 (= lt!309047 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662572 () Bool)

(declare-fun res!430558 () Bool)

(assert (=> b!662572 (=> (not res!430558) (not e!380353))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662572 (= res!430558 (validKeyInArray!0 k!2843))))

(declare-fun b!662573 () Bool)

(declare-fun res!430567 () Bool)

(assert (=> b!662573 (=> (not res!430567) (not e!380353))))

(declare-fun arrayNoDuplicates!0 (array!38929 (_ BitVec 32) List!12698) Bool)

(assert (=> b!662573 (= res!430567 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12695))))

(declare-fun b!662574 () Bool)

(declare-fun e!380357 () Bool)

(assert (=> b!662574 (= e!380357 (contains!3275 acc!681 k!2843))))

(declare-fun b!662575 () Bool)

(assert (=> b!662575 (= e!380353 (not e!380352))))

(declare-fun res!430563 () Bool)

(assert (=> b!662575 (=> res!430563 e!380352)))

(assert (=> b!662575 (= res!430563 (not (validKeyInArray!0 (select (arr!18657 a!3626) from!3004))))))

(declare-fun lt!309050 () Unit!23022)

(declare-fun e!380355 () Unit!23022)

(assert (=> b!662575 (= lt!309050 e!380355)))

(declare-fun c!76373 () Bool)

(declare-fun arrayContainsKey!0 (array!38929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662575 (= c!76373 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662575 (arrayContainsKey!0 (array!38930 (store (arr!18657 a!3626) i!1382 k!2843) (size!19021 a!3626)) k!2843 from!3004)))

(declare-fun b!662576 () Bool)

(declare-fun res!430573 () Bool)

(assert (=> b!662576 (=> (not res!430573) (not e!380353))))

(assert (=> b!662576 (= res!430573 (not (contains!3275 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662577 () Bool)

(declare-fun res!430570 () Bool)

(assert (=> b!662577 (=> (not res!430570) (not e!380353))))

(assert (=> b!662577 (= res!430570 (not (contains!3275 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662578 () Bool)

(declare-fun e!380354 () Bool)

(assert (=> b!662578 (= e!380354 (not (contains!3275 acc!681 k!2843)))))

(declare-fun b!662579 () Bool)

(assert (=> b!662579 (= e!380356 true)))

(declare-fun lt!309048 () Bool)

(assert (=> b!662579 (= lt!309048 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309049))))

(declare-fun lt!309052 () Unit!23022)

(declare-fun noDuplicateSubseq!14 (List!12698 List!12698) Unit!23022)

(assert (=> b!662579 (= lt!309052 (noDuplicateSubseq!14 acc!681 lt!309049))))

(declare-fun b!662580 () Bool)

(declare-fun res!430568 () Bool)

(assert (=> b!662580 (=> res!430568 e!380356)))

(declare-fun noDuplicate!522 (List!12698) Bool)

(assert (=> b!662580 (= res!430568 (not (noDuplicate!522 lt!309049)))))

(declare-fun b!662581 () Bool)

(declare-fun Unit!23024 () Unit!23022)

(assert (=> b!662581 (= e!380355 Unit!23024)))

(declare-fun b!662582 () Bool)

(declare-fun res!430577 () Bool)

(assert (=> b!662582 (=> res!430577 e!380356)))

(assert (=> b!662582 (= res!430577 (contains!3275 lt!309049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662583 () Bool)

(declare-fun res!430564 () Bool)

(assert (=> b!662583 (=> (not res!430564) (not e!380353))))

(assert (=> b!662583 (= res!430564 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662584 () Bool)

(declare-fun Unit!23025 () Unit!23022)

(assert (=> b!662584 (= e!380355 Unit!23025)))

(declare-fun lt!309051 () Unit!23022)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38929 (_ BitVec 64) (_ BitVec 32)) Unit!23022)

(assert (=> b!662584 (= lt!309051 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662584 false))

(declare-fun b!662585 () Bool)

(declare-fun e!380358 () Bool)

(assert (=> b!662585 (= e!380358 e!380354)))

(declare-fun res!430559 () Bool)

(assert (=> b!662585 (=> (not res!430559) (not e!380354))))

(assert (=> b!662585 (= res!430559 (bvsle from!3004 i!1382))))

(declare-fun b!662586 () Bool)

(declare-fun res!430576 () Bool)

(assert (=> b!662586 (=> (not res!430576) (not e!380353))))

(assert (=> b!662586 (= res!430576 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662587 () Bool)

(declare-fun res!430566 () Bool)

(assert (=> b!662587 (=> res!430566 e!380356)))

(assert (=> b!662587 (= res!430566 (not (subseq!14 acc!681 lt!309049)))))

(declare-fun b!662588 () Bool)

(declare-fun res!430571 () Bool)

(assert (=> b!662588 (=> (not res!430571) (not e!380353))))

(assert (=> b!662588 (= res!430571 e!380358)))

(declare-fun res!430560 () Bool)

(assert (=> b!662588 (=> res!430560 e!380358)))

(assert (=> b!662588 (= res!430560 e!380357)))

(declare-fun res!430574 () Bool)

(assert (=> b!662588 (=> (not res!430574) (not e!380357))))

(assert (=> b!662588 (= res!430574 (bvsgt from!3004 i!1382))))

(declare-fun b!662589 () Bool)

(declare-fun res!430575 () Bool)

(assert (=> b!662589 (=> (not res!430575) (not e!380353))))

(assert (=> b!662589 (= res!430575 (noDuplicate!522 acc!681))))

(declare-fun b!662590 () Bool)

(declare-fun res!430562 () Bool)

(assert (=> b!662590 (=> (not res!430562) (not e!380353))))

(assert (=> b!662590 (= res!430562 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19021 a!3626))))))

(declare-fun b!662591 () Bool)

(declare-fun res!430561 () Bool)

(assert (=> b!662591 (=> (not res!430561) (not e!380353))))

(assert (=> b!662591 (= res!430561 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19021 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!59882 res!430572) b!662589))

(assert (= (and b!662589 res!430575) b!662576))

(assert (= (and b!662576 res!430573) b!662577))

(assert (= (and b!662577 res!430570) b!662588))

(assert (= (and b!662588 res!430574) b!662574))

(assert (= (and b!662588 (not res!430560)) b!662585))

(assert (= (and b!662585 res!430559) b!662578))

(assert (= (and b!662588 res!430571) b!662573))

(assert (= (and b!662573 res!430567) b!662586))

(assert (= (and b!662586 res!430576) b!662590))

(assert (= (and b!662590 res!430562) b!662572))

(assert (= (and b!662572 res!430558) b!662583))

(assert (= (and b!662583 res!430564) b!662591))

(assert (= (and b!662591 res!430561) b!662575))

(assert (= (and b!662575 c!76373) b!662584))

(assert (= (and b!662575 (not c!76373)) b!662581))

(assert (= (and b!662575 (not res!430563)) b!662571))

(assert (= (and b!662571 (not res!430569)) b!662580))

(assert (= (and b!662580 (not res!430568)) b!662570))

(assert (= (and b!662570 (not res!430565)) b!662582))

(assert (= (and b!662582 (not res!430577)) b!662587))

(assert (= (and b!662587 (not res!430566)) b!662579))

(declare-fun m!634373 () Bool)

(assert (=> b!662572 m!634373))

(declare-fun m!634375 () Bool)

(assert (=> b!662574 m!634375))

(declare-fun m!634377 () Bool)

(assert (=> b!662573 m!634377))

(declare-fun m!634379 () Bool)

(assert (=> b!662583 m!634379))

(declare-fun m!634381 () Bool)

(assert (=> start!59882 m!634381))

(declare-fun m!634383 () Bool)

(assert (=> b!662584 m!634383))

(declare-fun m!634385 () Bool)

(assert (=> b!662575 m!634385))

(declare-fun m!634387 () Bool)

(assert (=> b!662575 m!634387))

(declare-fun m!634389 () Bool)

(assert (=> b!662575 m!634389))

(assert (=> b!662575 m!634385))

(declare-fun m!634391 () Bool)

(assert (=> b!662575 m!634391))

(declare-fun m!634393 () Bool)

(assert (=> b!662575 m!634393))

(declare-fun m!634395 () Bool)

(assert (=> b!662589 m!634395))

(declare-fun m!634397 () Bool)

(assert (=> b!662587 m!634397))

(declare-fun m!634399 () Bool)

(assert (=> b!662570 m!634399))

(declare-fun m!634401 () Bool)

(assert (=> b!662576 m!634401))

(assert (=> b!662578 m!634375))

(declare-fun m!634403 () Bool)

(assert (=> b!662582 m!634403))

(declare-fun m!634405 () Bool)

(assert (=> b!662579 m!634405))

(declare-fun m!634407 () Bool)

(assert (=> b!662579 m!634407))

(assert (=> b!662571 m!634385))

(assert (=> b!662571 m!634385))

(declare-fun m!634409 () Bool)

(assert (=> b!662571 m!634409))

(declare-fun m!634411 () Bool)

(assert (=> b!662571 m!634411))

(declare-fun m!634413 () Bool)

(assert (=> b!662571 m!634413))

(declare-fun m!634415 () Bool)

(assert (=> b!662586 m!634415))

(declare-fun m!634417 () Bool)

(assert (=> b!662580 m!634417))

(declare-fun m!634419 () Bool)

(assert (=> b!662577 m!634419))

(push 1)

