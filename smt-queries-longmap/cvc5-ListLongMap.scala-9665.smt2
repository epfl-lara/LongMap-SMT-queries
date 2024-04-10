; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114128 () Bool)

(assert start!114128)

(declare-fun b!1355510 () Bool)

(declare-fun res!900432 () Bool)

(declare-fun e!769769 () Bool)

(assert (=> b!1355510 (=> (not res!900432) (not e!769769))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355510 (= res!900432 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!900428 () Bool)

(assert (=> start!114128 (=> (not res!900428) (not e!769769))))

(declare-datatypes ((array!92310 0))(
  ( (array!92311 (arr!44603 (Array (_ BitVec 32) (_ BitVec 64))) (size!45153 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92310)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114128 (= res!900428 (and (bvslt (size!45153 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45153 a!3742))))))

(assert (=> start!114128 e!769769))

(assert (=> start!114128 true))

(declare-fun array_inv!33631 (array!92310) Bool)

(assert (=> start!114128 (array_inv!33631 a!3742)))

(declare-fun b!1355511 () Bool)

(declare-datatypes ((Unit!44550 0))(
  ( (Unit!44551) )
))
(declare-fun e!769768 () Unit!44550)

(declare-fun lt!598661 () Unit!44550)

(assert (=> b!1355511 (= e!769768 lt!598661)))

(declare-fun lt!598662 () Unit!44550)

(declare-datatypes ((List!31644 0))(
  ( (Nil!31641) (Cons!31640 (h!32849 (_ BitVec 64)) (t!46302 List!31644)) )
))
(declare-fun acc!759 () List!31644)

(declare-fun lemmaListSubSeqRefl!0 (List!31644) Unit!44550)

(assert (=> b!1355511 (= lt!598662 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!773 (List!31644 List!31644) Bool)

(assert (=> b!1355511 (subseq!773 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92310 List!31644 List!31644 (_ BitVec 32)) Unit!44550)

(declare-fun $colon$colon!788 (List!31644 (_ BitVec 64)) List!31644)

(assert (=> b!1355511 (= lt!598661 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!788 acc!759 (select (arr!44603 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92310 (_ BitVec 32) List!31644) Bool)

(assert (=> b!1355511 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355512 () Bool)

(declare-fun res!900427 () Bool)

(assert (=> b!1355512 (=> (not res!900427) (not e!769769))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355512 (= res!900427 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45153 a!3742))))))

(declare-fun b!1355513 () Bool)

(declare-fun res!900431 () Bool)

(assert (=> b!1355513 (=> (not res!900431) (not e!769769))))

(assert (=> b!1355513 (= res!900431 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355514 () Bool)

(declare-fun e!769771 () Bool)

(assert (=> b!1355514 (= e!769771 false)))

(declare-fun lt!598663 () Bool)

(assert (=> b!1355514 (= lt!598663 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355515 () Bool)

(assert (=> b!1355515 (= e!769769 e!769771)))

(declare-fun res!900430 () Bool)

(assert (=> b!1355515 (=> (not res!900430) (not e!769771))))

(declare-fun lt!598659 () Bool)

(assert (=> b!1355515 (= res!900430 (and (not (= from!3120 i!1404)) (not lt!598659) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598660 () Unit!44550)

(assert (=> b!1355515 (= lt!598660 e!769768)))

(declare-fun c!126983 () Bool)

(assert (=> b!1355515 (= c!126983 lt!598659)))

(assert (=> b!1355515 (= lt!598659 (validKeyInArray!0 (select (arr!44603 a!3742) from!3120)))))

(declare-fun b!1355516 () Bool)

(declare-fun res!900426 () Bool)

(assert (=> b!1355516 (=> (not res!900426) (not e!769769))))

(assert (=> b!1355516 (= res!900426 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31641))))

(declare-fun b!1355517 () Bool)

(declare-fun Unit!44552 () Unit!44550)

(assert (=> b!1355517 (= e!769768 Unit!44552)))

(declare-fun b!1355518 () Bool)

(declare-fun res!900425 () Bool)

(assert (=> b!1355518 (=> (not res!900425) (not e!769769))))

(declare-fun contains!9353 (List!31644 (_ BitVec 64)) Bool)

(assert (=> b!1355518 (= res!900425 (not (contains!9353 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355519 () Bool)

(declare-fun res!900433 () Bool)

(assert (=> b!1355519 (=> (not res!900433) (not e!769769))))

(declare-fun noDuplicate!2210 (List!31644) Bool)

(assert (=> b!1355519 (= res!900433 (noDuplicate!2210 acc!759))))

(declare-fun b!1355520 () Bool)

(declare-fun res!900429 () Bool)

(assert (=> b!1355520 (=> (not res!900429) (not e!769769))))

(assert (=> b!1355520 (= res!900429 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45153 a!3742)))))

(declare-fun b!1355521 () Bool)

(declare-fun res!900424 () Bool)

(assert (=> b!1355521 (=> (not res!900424) (not e!769769))))

(assert (=> b!1355521 (= res!900424 (not (contains!9353 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114128 res!900428) b!1355519))

(assert (= (and b!1355519 res!900433) b!1355521))

(assert (= (and b!1355521 res!900424) b!1355518))

(assert (= (and b!1355518 res!900425) b!1355516))

(assert (= (and b!1355516 res!900426) b!1355513))

(assert (= (and b!1355513 res!900431) b!1355512))

(assert (= (and b!1355512 res!900427) b!1355510))

(assert (= (and b!1355510 res!900432) b!1355520))

(assert (= (and b!1355520 res!900429) b!1355515))

(assert (= (and b!1355515 c!126983) b!1355511))

(assert (= (and b!1355515 (not c!126983)) b!1355517))

(assert (= (and b!1355515 res!900430) b!1355514))

(declare-fun m!1241677 () Bool)

(assert (=> b!1355511 m!1241677))

(declare-fun m!1241679 () Bool)

(assert (=> b!1355511 m!1241679))

(declare-fun m!1241681 () Bool)

(assert (=> b!1355511 m!1241681))

(declare-fun m!1241683 () Bool)

(assert (=> b!1355511 m!1241683))

(declare-fun m!1241685 () Bool)

(assert (=> b!1355511 m!1241685))

(assert (=> b!1355511 m!1241679))

(assert (=> b!1355511 m!1241681))

(declare-fun m!1241687 () Bool)

(assert (=> b!1355511 m!1241687))

(declare-fun m!1241689 () Bool)

(assert (=> b!1355510 m!1241689))

(assert (=> b!1355514 m!1241685))

(declare-fun m!1241691 () Bool)

(assert (=> b!1355513 m!1241691))

(declare-fun m!1241693 () Bool)

(assert (=> b!1355519 m!1241693))

(declare-fun m!1241695 () Bool)

(assert (=> b!1355516 m!1241695))

(declare-fun m!1241697 () Bool)

(assert (=> b!1355521 m!1241697))

(declare-fun m!1241699 () Bool)

(assert (=> b!1355518 m!1241699))

(assert (=> b!1355515 m!1241679))

(assert (=> b!1355515 m!1241679))

(declare-fun m!1241701 () Bool)

(assert (=> b!1355515 m!1241701))

(declare-fun m!1241703 () Bool)

(assert (=> start!114128 m!1241703))

(push 1)

