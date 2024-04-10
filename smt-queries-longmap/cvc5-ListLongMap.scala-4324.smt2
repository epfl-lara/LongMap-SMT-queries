; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59972 () Bool)

(assert start!59972)

(declare-fun b!665528 () Bool)

(declare-fun e!381393 () Bool)

(declare-datatypes ((List!12743 0))(
  ( (Nil!12740) (Cons!12739 (h!13784 (_ BitVec 64)) (t!18971 List!12743)) )
))
(declare-fun acc!681 () List!12743)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3320 (List!12743 (_ BitVec 64)) Bool)

(assert (=> b!665528 (= e!381393 (contains!3320 acc!681 k!2843))))

(declare-fun b!665529 () Bool)

(declare-fun res!433052 () Bool)

(declare-fun e!381387 () Bool)

(assert (=> b!665529 (=> (not res!433052) (not e!381387))))

(declare-datatypes ((array!39019 0))(
  ( (array!39020 (arr!18702 (Array (_ BitVec 32) (_ BitVec 64))) (size!19066 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39019)

(declare-fun arrayContainsKey!0 (array!39019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665529 (= res!433052 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665530 () Bool)

(declare-fun res!433064 () Bool)

(assert (=> b!665530 (=> (not res!433064) (not e!381387))))

(declare-fun noDuplicate!567 (List!12743) Bool)

(assert (=> b!665530 (= res!433064 (noDuplicate!567 acc!681))))

(declare-fun b!665532 () Bool)

(declare-fun e!381391 () Bool)

(assert (=> b!665532 (= e!381387 (not e!381391))))

(declare-fun res!433062 () Bool)

(assert (=> b!665532 (=> res!433062 e!381391)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!665532 (= res!433062 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!310063 () List!12743)

(declare-fun -!57 (List!12743 (_ BitVec 64)) List!12743)

(assert (=> b!665532 (= (-!57 lt!310063 k!2843) acc!681)))

(declare-fun $colon$colon!191 (List!12743 (_ BitVec 64)) List!12743)

(assert (=> b!665532 (= lt!310063 ($colon$colon!191 acc!681 k!2843))))

(declare-datatypes ((Unit!23235 0))(
  ( (Unit!23236) )
))
(declare-fun lt!310054 () Unit!23235)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12743) Unit!23235)

(assert (=> b!665532 (= lt!310054 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!59 (List!12743 List!12743) Bool)

(assert (=> b!665532 (subseq!59 acc!681 acc!681)))

(declare-fun lt!310058 () Unit!23235)

(declare-fun lemmaListSubSeqRefl!0 (List!12743) Unit!23235)

(assert (=> b!665532 (= lt!310058 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39019 (_ BitVec 32) List!12743) Bool)

(assert (=> b!665532 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310060 () Unit!23235)

(declare-fun e!381390 () Unit!23235)

(assert (=> b!665532 (= lt!310060 e!381390)))

(declare-fun c!76610 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665532 (= c!76610 (validKeyInArray!0 (select (arr!18702 a!3626) from!3004)))))

(declare-fun lt!310056 () Unit!23235)

(declare-fun e!381386 () Unit!23235)

(assert (=> b!665532 (= lt!310056 e!381386)))

(declare-fun c!76609 () Bool)

(declare-fun lt!310055 () Bool)

(assert (=> b!665532 (= c!76609 lt!310055)))

(assert (=> b!665532 (= lt!310055 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665532 (arrayContainsKey!0 (array!39020 (store (arr!18702 a!3626) i!1382 k!2843) (size!19066 a!3626)) k!2843 from!3004)))

(declare-fun b!665533 () Bool)

(declare-fun res!433047 () Bool)

(assert (=> b!665533 (=> res!433047 e!381391)))

(assert (=> b!665533 (= res!433047 (not (contains!3320 lt!310063 k!2843)))))

(declare-fun b!665534 () Bool)

(declare-fun res!433053 () Bool)

(assert (=> b!665534 (=> (not res!433053) (not e!381387))))

(assert (=> b!665534 (= res!433053 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19066 a!3626))))))

(declare-fun b!665535 () Bool)

(declare-fun Unit!23237 () Unit!23235)

(assert (=> b!665535 (= e!381390 Unit!23237)))

(declare-fun b!665536 () Bool)

(declare-fun res!433051 () Bool)

(assert (=> b!665536 (=> res!433051 e!381391)))

(assert (=> b!665536 (= res!433051 lt!310055)))

(declare-fun b!665537 () Bool)

(declare-fun res!433050 () Bool)

(assert (=> b!665537 (=> res!433050 e!381391)))

(assert (=> b!665537 (= res!433050 (not (subseq!59 acc!681 lt!310063)))))

(declare-fun b!665538 () Bool)

(declare-fun lt!310059 () Unit!23235)

(assert (=> b!665538 (= e!381390 lt!310059)))

(declare-fun lt!310061 () Unit!23235)

(assert (=> b!665538 (= lt!310061 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665538 (subseq!59 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39019 List!12743 List!12743 (_ BitVec 32)) Unit!23235)

(assert (=> b!665538 (= lt!310059 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!191 acc!681 (select (arr!18702 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665538 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665539 () Bool)

(declare-fun res!433044 () Bool)

(assert (=> b!665539 (=> (not res!433044) (not e!381387))))

(assert (=> b!665539 (= res!433044 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12740))))

(declare-fun b!665540 () Bool)

(assert (=> b!665540 (= e!381391 true)))

(declare-fun lt!310062 () Bool)

(assert (=> b!665540 (= lt!310062 (contains!3320 lt!310063 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665541 () Bool)

(declare-fun res!433048 () Bool)

(assert (=> b!665541 (=> (not res!433048) (not e!381387))))

(assert (=> b!665541 (= res!433048 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19066 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665542 () Bool)

(declare-fun res!433054 () Bool)

(assert (=> b!665542 (=> (not res!433054) (not e!381387))))

(assert (=> b!665542 (= res!433054 (validKeyInArray!0 k!2843))))

(declare-fun b!665543 () Bool)

(declare-fun res!433061 () Bool)

(assert (=> b!665543 (=> res!433061 e!381391)))

(assert (=> b!665543 (= res!433061 (not (noDuplicate!567 lt!310063)))))

(declare-fun b!665544 () Bool)

(declare-fun res!433055 () Bool)

(assert (=> b!665544 (=> (not res!433055) (not e!381387))))

(assert (=> b!665544 (= res!433055 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665545 () Bool)

(declare-fun e!381392 () Bool)

(assert (=> b!665545 (= e!381392 (not (contains!3320 acc!681 k!2843)))))

(declare-fun res!433059 () Bool)

(assert (=> start!59972 (=> (not res!433059) (not e!381387))))

(assert (=> start!59972 (= res!433059 (and (bvslt (size!19066 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19066 a!3626))))))

(assert (=> start!59972 e!381387))

(assert (=> start!59972 true))

(declare-fun array_inv!14498 (array!39019) Bool)

(assert (=> start!59972 (array_inv!14498 a!3626)))

(declare-fun b!665531 () Bool)

(declare-fun e!381389 () Bool)

(assert (=> b!665531 (= e!381389 e!381392)))

(declare-fun res!433058 () Bool)

(assert (=> b!665531 (=> (not res!433058) (not e!381392))))

(assert (=> b!665531 (= res!433058 (bvsle from!3004 i!1382))))

(declare-fun b!665546 () Bool)

(declare-fun res!433060 () Bool)

(assert (=> b!665546 (=> (not res!433060) (not e!381387))))

(assert (=> b!665546 (= res!433060 (not (contains!3320 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665547 () Bool)

(declare-fun res!433045 () Bool)

(assert (=> b!665547 (=> (not res!433045) (not e!381387))))

(assert (=> b!665547 (= res!433045 e!381389)))

(declare-fun res!433057 () Bool)

(assert (=> b!665547 (=> res!433057 e!381389)))

(assert (=> b!665547 (= res!433057 e!381393)))

(declare-fun res!433049 () Bool)

(assert (=> b!665547 (=> (not res!433049) (not e!381393))))

(assert (=> b!665547 (= res!433049 (bvsgt from!3004 i!1382))))

(declare-fun b!665548 () Bool)

(declare-fun res!433056 () Bool)

(assert (=> b!665548 (=> res!433056 e!381391)))

(assert (=> b!665548 (= res!433056 (contains!3320 lt!310063 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665549 () Bool)

(declare-fun Unit!23238 () Unit!23235)

(assert (=> b!665549 (= e!381386 Unit!23238)))

(declare-fun lt!310057 () Unit!23235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39019 (_ BitVec 64) (_ BitVec 32)) Unit!23235)

(assert (=> b!665549 (= lt!310057 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665549 false))

(declare-fun b!665550 () Bool)

(declare-fun res!433063 () Bool)

(assert (=> b!665550 (=> (not res!433063) (not e!381387))))

(assert (=> b!665550 (= res!433063 (not (contains!3320 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665551 () Bool)

(declare-fun res!433046 () Bool)

(assert (=> b!665551 (=> res!433046 e!381391)))

(assert (=> b!665551 (= res!433046 (contains!3320 acc!681 k!2843))))

(declare-fun b!665552 () Bool)

(declare-fun Unit!23239 () Unit!23235)

(assert (=> b!665552 (= e!381386 Unit!23239)))

(assert (= (and start!59972 res!433059) b!665530))

(assert (= (and b!665530 res!433064) b!665550))

(assert (= (and b!665550 res!433063) b!665546))

(assert (= (and b!665546 res!433060) b!665547))

(assert (= (and b!665547 res!433049) b!665528))

(assert (= (and b!665547 (not res!433057)) b!665531))

(assert (= (and b!665531 res!433058) b!665545))

(assert (= (and b!665547 res!433045) b!665539))

(assert (= (and b!665539 res!433044) b!665544))

(assert (= (and b!665544 res!433055) b!665534))

(assert (= (and b!665534 res!433053) b!665542))

(assert (= (and b!665542 res!433054) b!665529))

(assert (= (and b!665529 res!433052) b!665541))

(assert (= (and b!665541 res!433048) b!665532))

(assert (= (and b!665532 c!76609) b!665549))

(assert (= (and b!665532 (not c!76609)) b!665552))

(assert (= (and b!665532 c!76610) b!665538))

(assert (= (and b!665532 (not c!76610)) b!665535))

(assert (= (and b!665532 (not res!433062)) b!665543))

(assert (= (and b!665543 (not res!433061)) b!665536))

(assert (= (and b!665536 (not res!433051)) b!665551))

(assert (= (and b!665551 (not res!433046)) b!665537))

(assert (= (and b!665537 (not res!433050)) b!665533))

(assert (= (and b!665533 (not res!433047)) b!665548))

(assert (= (and b!665548 (not res!433056)) b!665540))

(declare-fun m!636557 () Bool)

(assert (=> b!665533 m!636557))

(declare-fun m!636559 () Bool)

(assert (=> b!665538 m!636559))

(declare-fun m!636561 () Bool)

(assert (=> b!665538 m!636561))

(declare-fun m!636563 () Bool)

(assert (=> b!665538 m!636563))

(declare-fun m!636565 () Bool)

(assert (=> b!665538 m!636565))

(assert (=> b!665538 m!636561))

(assert (=> b!665538 m!636563))

(declare-fun m!636567 () Bool)

(assert (=> b!665538 m!636567))

(declare-fun m!636569 () Bool)

(assert (=> b!665538 m!636569))

(declare-fun m!636571 () Bool)

(assert (=> b!665530 m!636571))

(declare-fun m!636573 () Bool)

(assert (=> b!665550 m!636573))

(declare-fun m!636575 () Bool)

(assert (=> b!665548 m!636575))

(declare-fun m!636577 () Bool)

(assert (=> b!665542 m!636577))

(declare-fun m!636579 () Bool)

(assert (=> b!665529 m!636579))

(declare-fun m!636581 () Bool)

(assert (=> b!665549 m!636581))

(declare-fun m!636583 () Bool)

(assert (=> b!665545 m!636583))

(declare-fun m!636585 () Bool)

(assert (=> b!665546 m!636585))

(assert (=> b!665551 m!636583))

(declare-fun m!636587 () Bool)

(assert (=> b!665537 m!636587))

(declare-fun m!636589 () Bool)

(assert (=> start!59972 m!636589))

(declare-fun m!636591 () Bool)

(assert (=> b!665543 m!636591))

(declare-fun m!636593 () Bool)

(assert (=> b!665540 m!636593))

(assert (=> b!665532 m!636559))

(assert (=> b!665532 m!636561))

(declare-fun m!636595 () Bool)

(assert (=> b!665532 m!636595))

(declare-fun m!636597 () Bool)

(assert (=> b!665532 m!636597))

(assert (=> b!665532 m!636567))

(declare-fun m!636599 () Bool)

(assert (=> b!665532 m!636599))

(declare-fun m!636601 () Bool)

(assert (=> b!665532 m!636601))

(declare-fun m!636603 () Bool)

(assert (=> b!665532 m!636603))

(assert (=> b!665532 m!636561))

(declare-fun m!636605 () Bool)

(assert (=> b!665532 m!636605))

(declare-fun m!636607 () Bool)

(assert (=> b!665532 m!636607))

(assert (=> b!665532 m!636569))

(declare-fun m!636609 () Bool)

(assert (=> b!665539 m!636609))

(assert (=> b!665528 m!636583))

(declare-fun m!636611 () Bool)

(assert (=> b!665544 m!636611))

(push 1)

(assert (not b!665539))

(assert (not b!665533))

(assert (not b!665528))

(assert (not b!665542))

(assert (not b!665540))

(assert (not b!665544))

(assert (not b!665546))

(assert (not b!665550))

(assert (not b!665545))

(assert (not start!59972))

(assert (not b!665532))

(assert (not b!665549))

(assert (not b!665529))

(assert (not b!665548))

(assert (not b!665551))

(assert (not b!665538))

(assert (not b!665543))

(assert (not b!665537))

(assert (not b!665530))

