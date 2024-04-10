; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114972 () Bool)

(assert start!114972)

(declare-fun b!1362738 () Bool)

(declare-fun res!906675 () Bool)

(declare-fun e!772966 () Bool)

(assert (=> b!1362738 (=> (not res!906675) (not e!772966))))

(declare-datatypes ((List!31799 0))(
  ( (Nil!31796) (Cons!31795 (h!33004 (_ BitVec 64)) (t!46487 List!31799)) )
))
(declare-fun acc!759 () List!31799)

(declare-fun contains!9508 (List!31799 (_ BitVec 64)) Bool)

(assert (=> b!1362738 (= res!906675 (not (contains!9508 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362739 () Bool)

(declare-fun res!906682 () Bool)

(assert (=> b!1362739 (=> (not res!906682) (not e!772966))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362739 (= res!906682 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362740 () Bool)

(declare-fun res!906680 () Bool)

(assert (=> b!1362740 (=> (not res!906680) (not e!772966))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92650 0))(
  ( (array!92651 (arr!44758 (Array (_ BitVec 32) (_ BitVec 64))) (size!45308 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92650)

(assert (=> b!1362740 (= res!906680 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45308 a!3742)))))

(declare-fun b!1362741 () Bool)

(declare-fun res!906681 () Bool)

(assert (=> b!1362741 (=> (not res!906681) (not e!772966))))

(declare-fun arrayNoDuplicates!0 (array!92650 (_ BitVec 32) List!31799) Bool)

(assert (=> b!1362741 (= res!906681 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362742 () Bool)

(declare-datatypes ((Unit!44934 0))(
  ( (Unit!44935) )
))
(declare-fun e!772965 () Unit!44934)

(declare-fun lt!600574 () Unit!44934)

(assert (=> b!1362742 (= e!772965 lt!600574)))

(declare-fun lt!600575 () Unit!44934)

(declare-fun lemmaListSubSeqRefl!0 (List!31799) Unit!44934)

(assert (=> b!1362742 (= lt!600575 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!910 (List!31799 List!31799) Bool)

(assert (=> b!1362742 (subseq!910 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92650 List!31799 List!31799 (_ BitVec 32)) Unit!44934)

(declare-fun $colon$colon!913 (List!31799 (_ BitVec 64)) List!31799)

(assert (=> b!1362742 (= lt!600574 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!913 acc!759 (select (arr!44758 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362742 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362743 () Bool)

(declare-fun res!906678 () Bool)

(assert (=> b!1362743 (=> (not res!906678) (not e!772966))))

(declare-fun noDuplicate!2365 (List!31799) Bool)

(assert (=> b!1362743 (= res!906678 (noDuplicate!2365 acc!759))))

(declare-fun lt!600576 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun b!1362745 () Bool)

(assert (=> b!1362745 (= e!772966 (and (not (= from!3120 i!1404)) (not lt!600576) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600577 () Unit!44934)

(assert (=> b!1362745 (= lt!600577 e!772965)))

(declare-fun c!127472 () Bool)

(assert (=> b!1362745 (= c!127472 lt!600576)))

(assert (=> b!1362745 (= lt!600576 (validKeyInArray!0 (select (arr!44758 a!3742) from!3120)))))

(declare-fun b!1362746 () Bool)

(declare-fun res!906679 () Bool)

(assert (=> b!1362746 (=> (not res!906679) (not e!772966))))

(assert (=> b!1362746 (= res!906679 (not (contains!9508 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362747 () Bool)

(declare-fun res!906676 () Bool)

(assert (=> b!1362747 (=> (not res!906676) (not e!772966))))

(assert (=> b!1362747 (= res!906676 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45308 a!3742))))))

(declare-fun b!1362748 () Bool)

(declare-fun res!906674 () Bool)

(assert (=> b!1362748 (=> (not res!906674) (not e!772966))))

(assert (=> b!1362748 (= res!906674 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31796))))

(declare-fun b!1362744 () Bool)

(declare-fun Unit!44936 () Unit!44934)

(assert (=> b!1362744 (= e!772965 Unit!44936)))

(declare-fun res!906677 () Bool)

(assert (=> start!114972 (=> (not res!906677) (not e!772966))))

(assert (=> start!114972 (= res!906677 (and (bvslt (size!45308 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45308 a!3742))))))

(assert (=> start!114972 e!772966))

(assert (=> start!114972 true))

(declare-fun array_inv!33786 (array!92650) Bool)

(assert (=> start!114972 (array_inv!33786 a!3742)))

(assert (= (and start!114972 res!906677) b!1362743))

(assert (= (and b!1362743 res!906678) b!1362738))

(assert (= (and b!1362738 res!906675) b!1362746))

(assert (= (and b!1362746 res!906679) b!1362748))

(assert (= (and b!1362748 res!906674) b!1362741))

(assert (= (and b!1362741 res!906681) b!1362747))

(assert (= (and b!1362747 res!906676) b!1362739))

(assert (= (and b!1362739 res!906682) b!1362740))

(assert (= (and b!1362740 res!906680) b!1362745))

(assert (= (and b!1362745 c!127472) b!1362742))

(assert (= (and b!1362745 (not c!127472)) b!1362744))

(declare-fun m!1247667 () Bool)

(assert (=> b!1362739 m!1247667))

(declare-fun m!1247669 () Bool)

(assert (=> start!114972 m!1247669))

(declare-fun m!1247671 () Bool)

(assert (=> b!1362742 m!1247671))

(declare-fun m!1247673 () Bool)

(assert (=> b!1362742 m!1247673))

(declare-fun m!1247675 () Bool)

(assert (=> b!1362742 m!1247675))

(declare-fun m!1247677 () Bool)

(assert (=> b!1362742 m!1247677))

(declare-fun m!1247679 () Bool)

(assert (=> b!1362742 m!1247679))

(assert (=> b!1362742 m!1247673))

(assert (=> b!1362742 m!1247675))

(declare-fun m!1247681 () Bool)

(assert (=> b!1362742 m!1247681))

(declare-fun m!1247683 () Bool)

(assert (=> b!1362746 m!1247683))

(declare-fun m!1247685 () Bool)

(assert (=> b!1362743 m!1247685))

(declare-fun m!1247687 () Bool)

(assert (=> b!1362741 m!1247687))

(declare-fun m!1247689 () Bool)

(assert (=> b!1362738 m!1247689))

(declare-fun m!1247691 () Bool)

(assert (=> b!1362748 m!1247691))

(assert (=> b!1362745 m!1247673))

(assert (=> b!1362745 m!1247673))

(declare-fun m!1247693 () Bool)

(assert (=> b!1362745 m!1247693))

(push 1)

(assert (not start!114972))

(assert (not b!1362742))

(assert (not b!1362738))

(assert (not b!1362748))

(assert (not b!1362739))

(assert (not b!1362741))

(assert (not b!1362743))

(assert (not b!1362745))

(assert (not b!1362746))

(check-sat)

(pop 1)

