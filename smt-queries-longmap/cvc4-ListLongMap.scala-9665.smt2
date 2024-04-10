; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114132 () Bool)

(assert start!114132)

(declare-fun b!1355582 () Bool)

(declare-datatypes ((Unit!44556 0))(
  ( (Unit!44557) )
))
(declare-fun e!769792 () Unit!44556)

(declare-fun lt!598691 () Unit!44556)

(assert (=> b!1355582 (= e!769792 lt!598691)))

(declare-fun lt!598689 () Unit!44556)

(declare-datatypes ((List!31646 0))(
  ( (Nil!31643) (Cons!31642 (h!32851 (_ BitVec 64)) (t!46304 List!31646)) )
))
(declare-fun acc!759 () List!31646)

(declare-fun lemmaListSubSeqRefl!0 (List!31646) Unit!44556)

(assert (=> b!1355582 (= lt!598689 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!775 (List!31646 List!31646) Bool)

(assert (=> b!1355582 (subseq!775 acc!759 acc!759)))

(declare-datatypes ((array!92314 0))(
  ( (array!92315 (arr!44605 (Array (_ BitVec 32) (_ BitVec 64))) (size!45155 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92314)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92314 List!31646 List!31646 (_ BitVec 32)) Unit!44556)

(declare-fun $colon$colon!790 (List!31646 (_ BitVec 64)) List!31646)

(assert (=> b!1355582 (= lt!598691 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!790 acc!759 (select (arr!44605 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92314 (_ BitVec 32) List!31646) Bool)

(assert (=> b!1355582 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355583 () Bool)

(declare-fun e!769793 () Bool)

(assert (=> b!1355583 (= e!769793 false)))

(declare-fun lt!598692 () Bool)

(assert (=> b!1355583 (= lt!598692 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355584 () Bool)

(declare-fun res!900491 () Bool)

(declare-fun e!769794 () Bool)

(assert (=> b!1355584 (=> (not res!900491) (not e!769794))))

(declare-fun noDuplicate!2212 (List!31646) Bool)

(assert (=> b!1355584 (= res!900491 (noDuplicate!2212 acc!759))))

(declare-fun b!1355585 () Bool)

(declare-fun res!900486 () Bool)

(assert (=> b!1355585 (=> (not res!900486) (not e!769794))))

(declare-fun contains!9355 (List!31646 (_ BitVec 64)) Bool)

(assert (=> b!1355585 (= res!900486 (not (contains!9355 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355586 () Bool)

(declare-fun Unit!44558 () Unit!44556)

(assert (=> b!1355586 (= e!769792 Unit!44558)))

(declare-fun b!1355587 () Bool)

(declare-fun res!900488 () Bool)

(assert (=> b!1355587 (=> (not res!900488) (not e!769794))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355587 (= res!900488 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45155 a!3742))))))

(declare-fun b!1355588 () Bool)

(declare-fun res!900490 () Bool)

(assert (=> b!1355588 (=> (not res!900490) (not e!769794))))

(assert (=> b!1355588 (= res!900490 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355589 () Bool)

(declare-fun res!900493 () Bool)

(assert (=> b!1355589 (=> (not res!900493) (not e!769794))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355589 (= res!900493 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355590 () Bool)

(declare-fun res!900484 () Bool)

(assert (=> b!1355590 (=> (not res!900484) (not e!769794))))

(assert (=> b!1355590 (= res!900484 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31643))))

(declare-fun b!1355591 () Bool)

(declare-fun res!900487 () Bool)

(assert (=> b!1355591 (=> (not res!900487) (not e!769794))))

(assert (=> b!1355591 (= res!900487 (not (contains!9355 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900492 () Bool)

(assert (=> start!114132 (=> (not res!900492) (not e!769794))))

(assert (=> start!114132 (= res!900492 (and (bvslt (size!45155 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45155 a!3742))))))

(assert (=> start!114132 e!769794))

(assert (=> start!114132 true))

(declare-fun array_inv!33633 (array!92314) Bool)

(assert (=> start!114132 (array_inv!33633 a!3742)))

(declare-fun b!1355592 () Bool)

(declare-fun res!900489 () Bool)

(assert (=> b!1355592 (=> (not res!900489) (not e!769794))))

(assert (=> b!1355592 (= res!900489 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45155 a!3742)))))

(declare-fun b!1355593 () Bool)

(assert (=> b!1355593 (= e!769794 e!769793)))

(declare-fun res!900485 () Bool)

(assert (=> b!1355593 (=> (not res!900485) (not e!769793))))

(declare-fun lt!598690 () Bool)

(assert (=> b!1355593 (= res!900485 (and (not (= from!3120 i!1404)) (not lt!598690) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598693 () Unit!44556)

(assert (=> b!1355593 (= lt!598693 e!769792)))

(declare-fun c!126989 () Bool)

(assert (=> b!1355593 (= c!126989 lt!598690)))

(assert (=> b!1355593 (= lt!598690 (validKeyInArray!0 (select (arr!44605 a!3742) from!3120)))))

(assert (= (and start!114132 res!900492) b!1355584))

(assert (= (and b!1355584 res!900491) b!1355585))

(assert (= (and b!1355585 res!900486) b!1355591))

(assert (= (and b!1355591 res!900487) b!1355590))

(assert (= (and b!1355590 res!900484) b!1355588))

(assert (= (and b!1355588 res!900490) b!1355587))

(assert (= (and b!1355587 res!900488) b!1355589))

(assert (= (and b!1355589 res!900493) b!1355592))

(assert (= (and b!1355592 res!900489) b!1355593))

(assert (= (and b!1355593 c!126989) b!1355582))

(assert (= (and b!1355593 (not c!126989)) b!1355586))

(assert (= (and b!1355593 res!900485) b!1355583))

(declare-fun m!1241733 () Bool)

(assert (=> b!1355588 m!1241733))

(declare-fun m!1241735 () Bool)

(assert (=> b!1355583 m!1241735))

(declare-fun m!1241737 () Bool)

(assert (=> b!1355585 m!1241737))

(declare-fun m!1241739 () Bool)

(assert (=> b!1355591 m!1241739))

(declare-fun m!1241741 () Bool)

(assert (=> start!114132 m!1241741))

(declare-fun m!1241743 () Bool)

(assert (=> b!1355593 m!1241743))

(assert (=> b!1355593 m!1241743))

(declare-fun m!1241745 () Bool)

(assert (=> b!1355593 m!1241745))

(declare-fun m!1241747 () Bool)

(assert (=> b!1355590 m!1241747))

(declare-fun m!1241749 () Bool)

(assert (=> b!1355582 m!1241749))

(assert (=> b!1355582 m!1241743))

(declare-fun m!1241751 () Bool)

(assert (=> b!1355582 m!1241751))

(declare-fun m!1241753 () Bool)

(assert (=> b!1355582 m!1241753))

(assert (=> b!1355582 m!1241735))

(assert (=> b!1355582 m!1241743))

(assert (=> b!1355582 m!1241751))

(declare-fun m!1241755 () Bool)

(assert (=> b!1355582 m!1241755))

(declare-fun m!1241757 () Bool)

(assert (=> b!1355584 m!1241757))

(declare-fun m!1241759 () Bool)

(assert (=> b!1355589 m!1241759))

(push 1)

(assert (not b!1355584))

(assert (not b!1355582))

