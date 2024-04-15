; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114008 () Bool)

(assert start!114008)

(declare-fun b!1352751 () Bool)

(declare-datatypes ((Unit!44211 0))(
  ( (Unit!44212) )
))
(declare-fun e!768900 () Unit!44211)

(declare-fun Unit!44213 () Unit!44211)

(assert (=> b!1352751 (= e!768900 Unit!44213)))

(declare-fun b!1352752 () Bool)

(declare-fun res!898072 () Bool)

(declare-fun e!768898 () Bool)

(assert (=> b!1352752 (=> (not res!898072) (not e!768898))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92139 0))(
  ( (array!92140 (arr!44518 (Array (_ BitVec 32) (_ BitVec 64))) (size!45070 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92139)

(assert (=> b!1352752 (= res!898072 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45070 a!3742))))))

(declare-fun b!1352753 () Bool)

(declare-fun res!898067 () Bool)

(assert (=> b!1352753 (=> (not res!898067) (not e!768898))))

(declare-datatypes ((List!31637 0))(
  ( (Nil!31634) (Cons!31633 (h!32842 (_ BitVec 64)) (t!46287 List!31637)) )
))
(declare-fun arrayNoDuplicates!0 (array!92139 (_ BitVec 32) List!31637) Bool)

(assert (=> b!1352753 (= res!898067 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31634))))

(declare-fun b!1352754 () Bool)

(declare-fun res!898073 () Bool)

(declare-fun e!768901 () Bool)

(assert (=> b!1352754 (=> (not res!898073) (not e!768901))))

(declare-fun acc!759 () List!31637)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1352754 (= res!898073 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!898066 () Bool)

(assert (=> start!114008 (=> (not res!898066) (not e!768898))))

(assert (=> start!114008 (= res!898066 (and (bvslt (size!45070 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45070 a!3742))))))

(assert (=> start!114008 e!768898))

(assert (=> start!114008 true))

(declare-fun array_inv!33751 (array!92139) Bool)

(assert (=> start!114008 (array_inv!33751 a!3742)))

(declare-fun b!1352755 () Bool)

(declare-fun res!898068 () Bool)

(assert (=> b!1352755 (=> (not res!898068) (not e!768898))))

(declare-fun contains!9257 (List!31637 (_ BitVec 64)) Bool)

(assert (=> b!1352755 (= res!898068 (not (contains!9257 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352756 () Bool)

(declare-fun lt!597481 () Unit!44211)

(assert (=> b!1352756 (= e!768900 lt!597481)))

(declare-fun lt!597482 () Unit!44211)

(declare-fun lemmaListSubSeqRefl!0 (List!31637) Unit!44211)

(assert (=> b!1352756 (= lt!597482 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!713 (List!31637 List!31637) Bool)

(assert (=> b!1352756 (subseq!713 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92139 List!31637 List!31637 (_ BitVec 32)) Unit!44211)

(declare-fun $colon$colon!730 (List!31637 (_ BitVec 64)) List!31637)

(assert (=> b!1352756 (= lt!597481 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!730 acc!759 (select (arr!44518 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352756 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352757 () Bool)

(assert (=> b!1352757 (= e!768898 e!768901)))

(declare-fun res!898069 () Bool)

(assert (=> b!1352757 (=> (not res!898069) (not e!768901))))

(assert (=> b!1352757 (= res!898069 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597483 () Unit!44211)

(assert (=> b!1352757 (= lt!597483 e!768900)))

(declare-fun c!126785 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352757 (= c!126785 (validKeyInArray!0 (select (arr!44518 a!3742) from!3120)))))

(declare-fun b!1352758 () Bool)

(declare-fun res!898074 () Bool)

(assert (=> b!1352758 (=> (not res!898074) (not e!768898))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352758 (= res!898074 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352759 () Bool)

(declare-fun res!898075 () Bool)

(assert (=> b!1352759 (=> (not res!898075) (not e!768898))))

(declare-fun noDuplicate!2172 (List!31637) Bool)

(assert (=> b!1352759 (= res!898075 (noDuplicate!2172 acc!759))))

(declare-fun b!1352760 () Bool)

(assert (=> b!1352760 (= e!768901 (not true))))

(assert (=> b!1352760 (arrayNoDuplicates!0 (array!92140 (store (arr!44518 a!3742) i!1404 l!3587) (size!45070 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597484 () Unit!44211)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92139 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31637) Unit!44211)

(assert (=> b!1352760 (= lt!597484 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352761 () Bool)

(declare-fun res!898071 () Bool)

(assert (=> b!1352761 (=> (not res!898071) (not e!768898))))

(assert (=> b!1352761 (= res!898071 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45070 a!3742)))))

(declare-fun b!1352762 () Bool)

(declare-fun res!898076 () Bool)

(assert (=> b!1352762 (=> (not res!898076) (not e!768898))))

(assert (=> b!1352762 (= res!898076 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352763 () Bool)

(declare-fun res!898070 () Bool)

(assert (=> b!1352763 (=> (not res!898070) (not e!768898))))

(assert (=> b!1352763 (= res!898070 (not (contains!9257 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114008 res!898066) b!1352759))

(assert (= (and b!1352759 res!898075) b!1352763))

(assert (= (and b!1352763 res!898070) b!1352755))

(assert (= (and b!1352755 res!898068) b!1352753))

(assert (= (and b!1352753 res!898067) b!1352762))

(assert (= (and b!1352762 res!898076) b!1352752))

(assert (= (and b!1352752 res!898072) b!1352758))

(assert (= (and b!1352758 res!898074) b!1352761))

(assert (= (and b!1352761 res!898071) b!1352757))

(assert (= (and b!1352757 c!126785) b!1352756))

(assert (= (and b!1352757 (not c!126785)) b!1352751))

(assert (= (and b!1352757 res!898069) b!1352754))

(assert (= (and b!1352754 res!898073) b!1352760))

(declare-fun m!1239043 () Bool)

(assert (=> b!1352760 m!1239043))

(declare-fun m!1239045 () Bool)

(assert (=> b!1352760 m!1239045))

(declare-fun m!1239047 () Bool)

(assert (=> b!1352760 m!1239047))

(declare-fun m!1239049 () Bool)

(assert (=> b!1352759 m!1239049))

(declare-fun m!1239051 () Bool)

(assert (=> b!1352757 m!1239051))

(assert (=> b!1352757 m!1239051))

(declare-fun m!1239053 () Bool)

(assert (=> b!1352757 m!1239053))

(declare-fun m!1239055 () Bool)

(assert (=> b!1352755 m!1239055))

(declare-fun m!1239057 () Bool)

(assert (=> b!1352762 m!1239057))

(declare-fun m!1239059 () Bool)

(assert (=> b!1352753 m!1239059))

(declare-fun m!1239061 () Bool)

(assert (=> start!114008 m!1239061))

(declare-fun m!1239063 () Bool)

(assert (=> b!1352756 m!1239063))

(assert (=> b!1352756 m!1239051))

(declare-fun m!1239065 () Bool)

(assert (=> b!1352756 m!1239065))

(declare-fun m!1239067 () Bool)

(assert (=> b!1352756 m!1239067))

(declare-fun m!1239069 () Bool)

(assert (=> b!1352756 m!1239069))

(assert (=> b!1352756 m!1239051))

(assert (=> b!1352756 m!1239065))

(declare-fun m!1239071 () Bool)

(assert (=> b!1352756 m!1239071))

(assert (=> b!1352754 m!1239069))

(declare-fun m!1239073 () Bool)

(assert (=> b!1352763 m!1239073))

(declare-fun m!1239075 () Bool)

(assert (=> b!1352758 m!1239075))

(check-sat (not start!114008) (not b!1352762) (not b!1352756) (not b!1352753) (not b!1352758) (not b!1352760) (not b!1352757) (not b!1352759) (not b!1352763) (not b!1352755) (not b!1352754))
(check-sat)
