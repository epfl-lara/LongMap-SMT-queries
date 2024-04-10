; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114000 () Bool)

(assert start!114000)

(declare-fun b!1352666 () Bool)

(declare-fun e!768883 () Bool)

(assert (=> b!1352666 (= e!768883 false)))

(declare-fun lt!597620 () Bool)

(declare-datatypes ((List!31580 0))(
  ( (Nil!31577) (Cons!31576 (h!32785 (_ BitVec 64)) (t!46238 List!31580)) )
))
(declare-fun acc!759 () List!31580)

(declare-datatypes ((array!92182 0))(
  ( (array!92183 (arr!44539 (Array (_ BitVec 32) (_ BitVec 64))) (size!45089 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92182)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92182 (_ BitVec 32) List!31580) Bool)

(assert (=> b!1352666 (= lt!597620 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!897968 () Bool)

(declare-fun e!768885 () Bool)

(assert (=> start!114000 (=> (not res!897968) (not e!768885))))

(assert (=> start!114000 (= res!897968 (and (bvslt (size!45089 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45089 a!3742))))))

(assert (=> start!114000 e!768885))

(assert (=> start!114000 true))

(declare-fun array_inv!33567 (array!92182) Bool)

(assert (=> start!114000 (array_inv!33567 a!3742)))

(declare-fun b!1352667 () Bool)

(declare-fun res!897971 () Bool)

(assert (=> b!1352667 (=> (not res!897971) (not e!768885))))

(declare-fun contains!9289 (List!31580 (_ BitVec 64)) Bool)

(assert (=> b!1352667 (= res!897971 (not (contains!9289 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352668 () Bool)

(declare-fun res!897967 () Bool)

(assert (=> b!1352668 (=> (not res!897967) (not e!768885))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352668 (= res!897967 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45089 a!3742))))))

(declare-fun b!1352669 () Bool)

(declare-fun res!897969 () Bool)

(assert (=> b!1352669 (=> (not res!897969) (not e!768885))))

(assert (=> b!1352669 (= res!897969 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31577))))

(declare-fun b!1352670 () Bool)

(declare-fun res!897965 () Bool)

(assert (=> b!1352670 (=> (not res!897965) (not e!768885))))

(declare-fun noDuplicate!2146 (List!31580) Bool)

(assert (=> b!1352670 (= res!897965 (noDuplicate!2146 acc!759))))

(declare-fun b!1352671 () Bool)

(declare-fun res!897964 () Bool)

(assert (=> b!1352671 (=> (not res!897964) (not e!768885))))

(assert (=> b!1352671 (= res!897964 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352672 () Bool)

(declare-fun res!897972 () Bool)

(assert (=> b!1352672 (=> (not res!897972) (not e!768885))))

(assert (=> b!1352672 (= res!897972 (not (contains!9289 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352673 () Bool)

(declare-fun res!897966 () Bool)

(assert (=> b!1352673 (=> (not res!897966) (not e!768885))))

(assert (=> b!1352673 (= res!897966 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45089 a!3742)))))

(declare-fun b!1352674 () Bool)

(declare-datatypes ((Unit!44358 0))(
  ( (Unit!44359) )
))
(declare-fun e!768884 () Unit!44358)

(declare-fun lt!597621 () Unit!44358)

(assert (=> b!1352674 (= e!768884 lt!597621)))

(declare-fun lt!597619 () Unit!44358)

(declare-fun lemmaListSubSeqRefl!0 (List!31580) Unit!44358)

(assert (=> b!1352674 (= lt!597619 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!709 (List!31580 List!31580) Bool)

(assert (=> b!1352674 (subseq!709 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92182 List!31580 List!31580 (_ BitVec 32)) Unit!44358)

(declare-fun $colon$colon!724 (List!31580 (_ BitVec 64)) List!31580)

(assert (=> b!1352674 (= lt!597621 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!724 acc!759 (select (arr!44539 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352674 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352675 () Bool)

(declare-fun res!897970 () Bool)

(assert (=> b!1352675 (=> (not res!897970) (not e!768885))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352675 (= res!897970 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352676 () Bool)

(declare-fun Unit!44360 () Unit!44358)

(assert (=> b!1352676 (= e!768884 Unit!44360)))

(declare-fun b!1352677 () Bool)

(assert (=> b!1352677 (= e!768885 e!768883)))

(declare-fun res!897973 () Bool)

(assert (=> b!1352677 (=> (not res!897973) (not e!768883))))

(assert (=> b!1352677 (= res!897973 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597622 () Unit!44358)

(assert (=> b!1352677 (= lt!597622 e!768884)))

(declare-fun c!126791 () Bool)

(assert (=> b!1352677 (= c!126791 (validKeyInArray!0 (select (arr!44539 a!3742) from!3120)))))

(assert (= (and start!114000 res!897968) b!1352670))

(assert (= (and b!1352670 res!897965) b!1352667))

(assert (= (and b!1352667 res!897971) b!1352672))

(assert (= (and b!1352672 res!897972) b!1352669))

(assert (= (and b!1352669 res!897969) b!1352671))

(assert (= (and b!1352671 res!897964) b!1352668))

(assert (= (and b!1352668 res!897967) b!1352675))

(assert (= (and b!1352675 res!897970) b!1352673))

(assert (= (and b!1352673 res!897966) b!1352677))

(assert (= (and b!1352677 c!126791) b!1352674))

(assert (= (and b!1352677 (not c!126791)) b!1352676))

(assert (= (and b!1352677 res!897973) b!1352666))

(declare-fun m!1239429 () Bool)

(assert (=> b!1352669 m!1239429))

(declare-fun m!1239431 () Bool)

(assert (=> b!1352667 m!1239431))

(declare-fun m!1239433 () Bool)

(assert (=> b!1352672 m!1239433))

(declare-fun m!1239435 () Bool)

(assert (=> b!1352666 m!1239435))

(declare-fun m!1239437 () Bool)

(assert (=> start!114000 m!1239437))

(declare-fun m!1239439 () Bool)

(assert (=> b!1352671 m!1239439))

(declare-fun m!1239441 () Bool)

(assert (=> b!1352670 m!1239441))

(declare-fun m!1239443 () Bool)

(assert (=> b!1352675 m!1239443))

(declare-fun m!1239445 () Bool)

(assert (=> b!1352674 m!1239445))

(declare-fun m!1239447 () Bool)

(assert (=> b!1352674 m!1239447))

(declare-fun m!1239449 () Bool)

(assert (=> b!1352674 m!1239449))

(declare-fun m!1239451 () Bool)

(assert (=> b!1352674 m!1239451))

(assert (=> b!1352674 m!1239435))

(assert (=> b!1352674 m!1239447))

(assert (=> b!1352674 m!1239449))

(declare-fun m!1239453 () Bool)

(assert (=> b!1352674 m!1239453))

(assert (=> b!1352677 m!1239447))

(assert (=> b!1352677 m!1239447))

(declare-fun m!1239455 () Bool)

(assert (=> b!1352677 m!1239455))

(push 1)

(assert (not b!1352670))

(assert (not b!1352675))

