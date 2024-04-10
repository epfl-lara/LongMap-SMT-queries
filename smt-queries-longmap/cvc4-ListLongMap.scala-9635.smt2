; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113952 () Bool)

(assert start!113952)

(declare-fun b!1351802 () Bool)

(declare-fun res!897247 () Bool)

(declare-fun e!768598 () Bool)

(assert (=> b!1351802 (=> (not res!897247) (not e!768598))))

(declare-datatypes ((List!31556 0))(
  ( (Nil!31553) (Cons!31552 (h!32761 (_ BitVec 64)) (t!46214 List!31556)) )
))
(declare-fun acc!759 () List!31556)

(declare-fun contains!9265 (List!31556 (_ BitVec 64)) Bool)

(assert (=> b!1351802 (= res!897247 (not (contains!9265 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351803 () Bool)

(declare-fun res!897244 () Bool)

(assert (=> b!1351803 (=> (not res!897244) (not e!768598))))

(declare-datatypes ((array!92134 0))(
  ( (array!92135 (arr!44515 (Array (_ BitVec 32) (_ BitVec 64))) (size!45065 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92134)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92134 (_ BitVec 32) List!31556) Bool)

(assert (=> b!1351803 (= res!897244 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!897249 () Bool)

(assert (=> start!113952 (=> (not res!897249) (not e!768598))))

(assert (=> start!113952 (= res!897249 (and (bvslt (size!45065 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45065 a!3742))))))

(assert (=> start!113952 e!768598))

(assert (=> start!113952 true))

(declare-fun array_inv!33543 (array!92134) Bool)

(assert (=> start!113952 (array_inv!33543 a!3742)))

(declare-fun b!1351804 () Bool)

(declare-fun res!897245 () Bool)

(assert (=> b!1351804 (=> (not res!897245) (not e!768598))))

(assert (=> b!1351804 (= res!897245 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45065 a!3742)))))

(declare-fun b!1351805 () Bool)

(declare-fun res!897251 () Bool)

(assert (=> b!1351805 (=> (not res!897251) (not e!768598))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351805 (= res!897251 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351806 () Bool)

(declare-datatypes ((Unit!44286 0))(
  ( (Unit!44287) )
))
(declare-fun e!768595 () Unit!44286)

(declare-fun Unit!44288 () Unit!44286)

(assert (=> b!1351806 (= e!768595 Unit!44288)))

(declare-fun b!1351807 () Bool)

(declare-fun e!768596 () Bool)

(assert (=> b!1351807 (= e!768598 e!768596)))

(declare-fun res!897253 () Bool)

(assert (=> b!1351807 (=> (not res!897253) (not e!768596))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351807 (= res!897253 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597332 () Unit!44286)

(assert (=> b!1351807 (= lt!597332 e!768595)))

(declare-fun c!126719 () Bool)

(assert (=> b!1351807 (= c!126719 (validKeyInArray!0 (select (arr!44515 a!3742) from!3120)))))

(declare-fun b!1351808 () Bool)

(declare-fun res!897252 () Bool)

(assert (=> b!1351808 (=> (not res!897252) (not e!768598))))

(assert (=> b!1351808 (= res!897252 (not (contains!9265 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351809 () Bool)

(declare-fun res!897246 () Bool)

(assert (=> b!1351809 (=> (not res!897246) (not e!768598))))

(assert (=> b!1351809 (= res!897246 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31553))))

(declare-fun b!1351810 () Bool)

(declare-fun lt!597333 () Unit!44286)

(assert (=> b!1351810 (= e!768595 lt!597333)))

(declare-fun lt!597331 () Unit!44286)

(declare-fun lemmaListSubSeqRefl!0 (List!31556) Unit!44286)

(assert (=> b!1351810 (= lt!597331 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!685 (List!31556 List!31556) Bool)

(assert (=> b!1351810 (subseq!685 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92134 List!31556 List!31556 (_ BitVec 32)) Unit!44286)

(declare-fun $colon$colon!700 (List!31556 (_ BitVec 64)) List!31556)

(assert (=> b!1351810 (= lt!597333 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!700 acc!759 (select (arr!44515 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351810 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351811 () Bool)

(declare-fun res!897248 () Bool)

(assert (=> b!1351811 (=> (not res!897248) (not e!768598))))

(declare-fun noDuplicate!2122 (List!31556) Bool)

(assert (=> b!1351811 (= res!897248 (noDuplicate!2122 acc!759))))

(declare-fun b!1351812 () Bool)

(assert (=> b!1351812 (= e!768596 false)))

(declare-fun lt!597334 () Bool)

(assert (=> b!1351812 (= lt!597334 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351813 () Bool)

(declare-fun res!897250 () Bool)

(assert (=> b!1351813 (=> (not res!897250) (not e!768598))))

(assert (=> b!1351813 (= res!897250 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45065 a!3742))))))

(assert (= (and start!113952 res!897249) b!1351811))

(assert (= (and b!1351811 res!897248) b!1351802))

(assert (= (and b!1351802 res!897247) b!1351808))

(assert (= (and b!1351808 res!897252) b!1351809))

(assert (= (and b!1351809 res!897246) b!1351803))

(assert (= (and b!1351803 res!897244) b!1351813))

(assert (= (and b!1351813 res!897250) b!1351805))

(assert (= (and b!1351805 res!897251) b!1351804))

(assert (= (and b!1351804 res!897245) b!1351807))

(assert (= (and b!1351807 c!126719) b!1351810))

(assert (= (and b!1351807 (not c!126719)) b!1351806))

(assert (= (and b!1351807 res!897253) b!1351812))

(declare-fun m!1238757 () Bool)

(assert (=> b!1351810 m!1238757))

(declare-fun m!1238759 () Bool)

(assert (=> b!1351810 m!1238759))

(declare-fun m!1238761 () Bool)

(assert (=> b!1351810 m!1238761))

(declare-fun m!1238763 () Bool)

(assert (=> b!1351810 m!1238763))

(declare-fun m!1238765 () Bool)

(assert (=> b!1351810 m!1238765))

(assert (=> b!1351810 m!1238759))

(assert (=> b!1351810 m!1238761))

(declare-fun m!1238767 () Bool)

(assert (=> b!1351810 m!1238767))

(declare-fun m!1238769 () Bool)

(assert (=> b!1351802 m!1238769))

(declare-fun m!1238771 () Bool)

(assert (=> b!1351809 m!1238771))

(assert (=> b!1351812 m!1238765))

(declare-fun m!1238773 () Bool)

(assert (=> b!1351811 m!1238773))

(declare-fun m!1238775 () Bool)

(assert (=> b!1351803 m!1238775))

(declare-fun m!1238777 () Bool)

(assert (=> b!1351808 m!1238777))

(assert (=> b!1351807 m!1238759))

(assert (=> b!1351807 m!1238759))

(declare-fun m!1238779 () Bool)

(assert (=> b!1351807 m!1238779))

(declare-fun m!1238781 () Bool)

(assert (=> start!113952 m!1238781))

(declare-fun m!1238783 () Bool)

(assert (=> b!1351805 m!1238783))

(push 1)

(assert (not b!1351803))

(assert (not b!1351810))

