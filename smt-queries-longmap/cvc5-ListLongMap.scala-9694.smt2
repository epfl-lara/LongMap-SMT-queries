; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114728 () Bool)

(assert start!114728)

(declare-fun b!1360314 () Bool)

(declare-fun res!904086 () Bool)

(declare-fun e!772021 () Bool)

(assert (=> b!1360314 (=> (not res!904086) (not e!772021))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92615 0))(
  ( (array!92616 (arr!44745 (Array (_ BitVec 32) (_ BitVec 64))) (size!45296 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92615)

(assert (=> b!1360314 (= res!904086 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45296 a!3742)))))

(declare-fun b!1360315 () Bool)

(declare-datatypes ((Unit!44675 0))(
  ( (Unit!44676) )
))
(declare-fun e!772020 () Unit!44675)

(declare-fun lt!599971 () Unit!44675)

(assert (=> b!1360315 (= e!772020 lt!599971)))

(declare-fun lt!599972 () Unit!44675)

(declare-datatypes ((List!31773 0))(
  ( (Nil!31770) (Cons!31769 (h!32987 (_ BitVec 64)) (t!46435 List!31773)) )
))
(declare-fun acc!759 () List!31773)

(declare-fun lemmaListSubSeqRefl!0 (List!31773) Unit!44675)

(assert (=> b!1360315 (= lt!599972 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!844 (List!31773 List!31773) Bool)

(assert (=> b!1360315 (subseq!844 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92615 List!31773 List!31773 (_ BitVec 32)) Unit!44675)

(declare-fun $colon$colon!846 (List!31773 (_ BitVec 64)) List!31773)

(assert (=> b!1360315 (= lt!599971 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!846 acc!759 (select (arr!44745 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92615 (_ BitVec 32) List!31773) Bool)

(assert (=> b!1360315 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360316 () Bool)

(declare-fun res!904089 () Bool)

(assert (=> b!1360316 (=> (not res!904089) (not e!772021))))

(assert (=> b!1360316 (= res!904089 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360317 () Bool)

(declare-fun res!904087 () Bool)

(assert (=> b!1360317 (=> (not res!904087) (not e!772021))))

(assert (=> b!1360317 (= res!904087 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31770))))

(declare-fun b!1360318 () Bool)

(declare-fun res!904083 () Bool)

(assert (=> b!1360318 (=> (not res!904083) (not e!772021))))

(declare-fun contains!9485 (List!31773 (_ BitVec 64)) Bool)

(assert (=> b!1360318 (= res!904083 (not (contains!9485 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360319 () Bool)

(declare-fun res!904088 () Bool)

(assert (=> b!1360319 (=> (not res!904088) (not e!772021))))

(declare-fun noDuplicate!2316 (List!31773) Bool)

(assert (=> b!1360319 (= res!904088 (noDuplicate!2316 acc!759))))

(declare-fun b!1360320 () Bool)

(declare-fun res!904084 () Bool)

(assert (=> b!1360320 (=> (not res!904084) (not e!772021))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360320 (= res!904084 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360322 () Bool)

(declare-fun res!904082 () Bool)

(assert (=> b!1360322 (=> (not res!904082) (not e!772021))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360322 (= res!904082 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45296 a!3742))))))

(declare-fun b!1360323 () Bool)

(declare-fun Unit!44677 () Unit!44675)

(assert (=> b!1360323 (= e!772020 Unit!44677)))

(declare-fun b!1360324 () Bool)

(declare-fun res!904085 () Bool)

(assert (=> b!1360324 (=> (not res!904085) (not e!772021))))

(assert (=> b!1360324 (= res!904085 (not (contains!9485 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!904081 () Bool)

(assert (=> start!114728 (=> (not res!904081) (not e!772021))))

(assert (=> start!114728 (= res!904081 (and (bvslt (size!45296 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45296 a!3742))))))

(assert (=> start!114728 e!772021))

(assert (=> start!114728 true))

(declare-fun array_inv!34026 (array!92615) Bool)

(assert (=> start!114728 (array_inv!34026 a!3742)))

(declare-fun b!1360321 () Bool)

(assert (=> b!1360321 (= e!772021 false)))

(declare-fun lt!599973 () Unit!44675)

(assert (=> b!1360321 (= lt!599973 e!772020)))

(declare-fun c!127564 () Bool)

(assert (=> b!1360321 (= c!127564 (validKeyInArray!0 (select (arr!44745 a!3742) from!3120)))))

(assert (= (and start!114728 res!904081) b!1360319))

(assert (= (and b!1360319 res!904088) b!1360324))

(assert (= (and b!1360324 res!904085) b!1360318))

(assert (= (and b!1360318 res!904083) b!1360317))

(assert (= (and b!1360317 res!904087) b!1360316))

(assert (= (and b!1360316 res!904089) b!1360322))

(assert (= (and b!1360322 res!904082) b!1360320))

(assert (= (and b!1360320 res!904084) b!1360314))

(assert (= (and b!1360314 res!904086) b!1360321))

(assert (= (and b!1360321 c!127564) b!1360315))

(assert (= (and b!1360321 (not c!127564)) b!1360323))

(declare-fun m!1246107 () Bool)

(assert (=> b!1360315 m!1246107))

(declare-fun m!1246109 () Bool)

(assert (=> b!1360315 m!1246109))

(declare-fun m!1246111 () Bool)

(assert (=> b!1360315 m!1246111))

(declare-fun m!1246113 () Bool)

(assert (=> b!1360315 m!1246113))

(declare-fun m!1246115 () Bool)

(assert (=> b!1360315 m!1246115))

(assert (=> b!1360315 m!1246109))

(assert (=> b!1360315 m!1246111))

(declare-fun m!1246117 () Bool)

(assert (=> b!1360315 m!1246117))

(declare-fun m!1246119 () Bool)

(assert (=> b!1360318 m!1246119))

(declare-fun m!1246121 () Bool)

(assert (=> b!1360320 m!1246121))

(assert (=> b!1360321 m!1246109))

(assert (=> b!1360321 m!1246109))

(declare-fun m!1246123 () Bool)

(assert (=> b!1360321 m!1246123))

(declare-fun m!1246125 () Bool)

(assert (=> start!114728 m!1246125))

(declare-fun m!1246127 () Bool)

(assert (=> b!1360316 m!1246127))

(declare-fun m!1246129 () Bool)

(assert (=> b!1360317 m!1246129))

(declare-fun m!1246131 () Bool)

(assert (=> b!1360324 m!1246131))

(declare-fun m!1246133 () Bool)

(assert (=> b!1360319 m!1246133))

(push 1)

(assert (not b!1360316))

(assert (not b!1360318))

(assert (not b!1360317))

(assert (not b!1360321))

(assert (not b!1360324))

(assert (not start!114728))

(assert (not b!1360315))

(assert (not b!1360320))

(assert (not b!1360319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

