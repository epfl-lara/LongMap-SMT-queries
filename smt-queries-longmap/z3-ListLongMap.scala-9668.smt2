; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114370 () Bool)

(assert start!114370)

(declare-fun b!1357133 () Bool)

(declare-fun res!901215 () Bool)

(declare-fun e!770721 () Bool)

(assert (=> b!1357133 (=> (not res!901215) (not e!770721))))

(declare-datatypes ((array!92443 0))(
  ( (array!92444 (arr!44665 (Array (_ BitVec 32) (_ BitVec 64))) (size!45216 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92443)

(declare-datatypes ((List!31693 0))(
  ( (Nil!31690) (Cons!31689 (h!32907 (_ BitVec 64)) (t!46343 List!31693)) )
))
(declare-fun arrayNoDuplicates!0 (array!92443 (_ BitVec 32) List!31693) Bool)

(assert (=> b!1357133 (= res!901215 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31690))))

(declare-fun b!1357134 () Bool)

(declare-fun res!901219 () Bool)

(assert (=> b!1357134 (=> (not res!901219) (not e!770721))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357134 (= res!901219 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45216 a!3742))))))

(declare-fun b!1357135 () Bool)

(declare-fun res!901212 () Bool)

(assert (=> b!1357135 (=> (not res!901212) (not e!770721))))

(declare-fun acc!759 () List!31693)

(declare-fun contains!9405 (List!31693 (_ BitVec 64)) Bool)

(assert (=> b!1357135 (= res!901212 (not (contains!9405 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901221 () Bool)

(assert (=> start!114370 (=> (not res!901221) (not e!770721))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114370 (= res!901221 (and (bvslt (size!45216 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45216 a!3742))))))

(assert (=> start!114370 e!770721))

(assert (=> start!114370 true))

(declare-fun array_inv!33946 (array!92443) Bool)

(assert (=> start!114370 (array_inv!33946 a!3742)))

(declare-fun b!1357136 () Bool)

(declare-fun res!901217 () Bool)

(assert (=> b!1357136 (=> (not res!901217) (not e!770721))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357136 (= res!901217 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357137 () Bool)

(declare-fun res!901214 () Bool)

(assert (=> b!1357137 (=> (not res!901214) (not e!770721))))

(declare-fun noDuplicate!2236 (List!31693) Bool)

(assert (=> b!1357137 (= res!901214 (noDuplicate!2236 acc!759))))

(declare-fun b!1357138 () Bool)

(declare-datatypes ((Unit!44516 0))(
  ( (Unit!44517) )
))
(declare-fun e!770720 () Unit!44516)

(declare-fun Unit!44518 () Unit!44516)

(assert (=> b!1357138 (= e!770720 Unit!44518)))

(declare-fun b!1357139 () Bool)

(declare-fun res!901220 () Bool)

(assert (=> b!1357139 (=> (not res!901220) (not e!770721))))

(assert (=> b!1357139 (= res!901220 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357140 () Bool)

(declare-fun e!770719 () Bool)

(assert (=> b!1357140 (= e!770719 false)))

(declare-fun lt!599273 () Bool)

(assert (=> b!1357140 (= lt!599273 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357141 () Bool)

(assert (=> b!1357141 (= e!770721 e!770719)))

(declare-fun res!901216 () Bool)

(assert (=> b!1357141 (=> (not res!901216) (not e!770719))))

(declare-fun lt!599271 () Bool)

(assert (=> b!1357141 (= res!901216 (and (not (= from!3120 i!1404)) (not lt!599271) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599272 () Unit!44516)

(assert (=> b!1357141 (= lt!599272 e!770720)))

(declare-fun c!127408 () Bool)

(assert (=> b!1357141 (= c!127408 lt!599271)))

(assert (=> b!1357141 (= lt!599271 (validKeyInArray!0 (select (arr!44665 a!3742) from!3120)))))

(declare-fun b!1357142 () Bool)

(declare-fun res!901218 () Bool)

(assert (=> b!1357142 (=> (not res!901218) (not e!770721))))

(assert (=> b!1357142 (= res!901218 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45216 a!3742)))))

(declare-fun b!1357143 () Bool)

(declare-fun res!901213 () Bool)

(assert (=> b!1357143 (=> (not res!901213) (not e!770721))))

(assert (=> b!1357143 (= res!901213 (not (contains!9405 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357144 () Bool)

(declare-fun lt!599274 () Unit!44516)

(assert (=> b!1357144 (= e!770720 lt!599274)))

(declare-fun lt!599270 () Unit!44516)

(declare-fun lemmaListSubSeqRefl!0 (List!31693) Unit!44516)

(assert (=> b!1357144 (= lt!599270 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!782 (List!31693 List!31693) Bool)

(assert (=> b!1357144 (subseq!782 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92443 List!31693 List!31693 (_ BitVec 32)) Unit!44516)

(declare-fun $colon$colon!796 (List!31693 (_ BitVec 64)) List!31693)

(assert (=> b!1357144 (= lt!599274 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!796 acc!759 (select (arr!44665 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1357144 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114370 res!901221) b!1357137))

(assert (= (and b!1357137 res!901214) b!1357143))

(assert (= (and b!1357143 res!901213) b!1357135))

(assert (= (and b!1357135 res!901212) b!1357133))

(assert (= (and b!1357133 res!901215) b!1357139))

(assert (= (and b!1357139 res!901220) b!1357134))

(assert (= (and b!1357134 res!901219) b!1357136))

(assert (= (and b!1357136 res!901217) b!1357142))

(assert (= (and b!1357142 res!901218) b!1357141))

(assert (= (and b!1357141 c!127408) b!1357144))

(assert (= (and b!1357141 (not c!127408)) b!1357138))

(assert (= (and b!1357141 res!901216) b!1357140))

(declare-fun m!1243525 () Bool)

(assert (=> b!1357140 m!1243525))

(declare-fun m!1243527 () Bool)

(assert (=> b!1357136 m!1243527))

(declare-fun m!1243529 () Bool)

(assert (=> b!1357143 m!1243529))

(declare-fun m!1243531 () Bool)

(assert (=> start!114370 m!1243531))

(declare-fun m!1243533 () Bool)

(assert (=> b!1357144 m!1243533))

(declare-fun m!1243535 () Bool)

(assert (=> b!1357144 m!1243535))

(declare-fun m!1243537 () Bool)

(assert (=> b!1357144 m!1243537))

(declare-fun m!1243539 () Bool)

(assert (=> b!1357144 m!1243539))

(assert (=> b!1357144 m!1243525))

(assert (=> b!1357144 m!1243535))

(assert (=> b!1357144 m!1243537))

(declare-fun m!1243541 () Bool)

(assert (=> b!1357144 m!1243541))

(declare-fun m!1243543 () Bool)

(assert (=> b!1357137 m!1243543))

(declare-fun m!1243545 () Bool)

(assert (=> b!1357133 m!1243545))

(declare-fun m!1243547 () Bool)

(assert (=> b!1357139 m!1243547))

(declare-fun m!1243549 () Bool)

(assert (=> b!1357135 m!1243549))

(assert (=> b!1357141 m!1243535))

(assert (=> b!1357141 m!1243535))

(declare-fun m!1243551 () Bool)

(assert (=> b!1357141 m!1243551))

(check-sat (not b!1357133) (not b!1357141) (not b!1357143) (not b!1357144) (not b!1357136) (not start!114370) (not b!1357139) (not b!1357135) (not b!1357137) (not b!1357140))
(check-sat)
