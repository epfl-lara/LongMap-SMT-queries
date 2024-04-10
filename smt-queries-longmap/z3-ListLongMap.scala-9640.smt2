; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113980 () Bool)

(assert start!113980)

(declare-fun res!897670 () Bool)

(declare-fun e!768764 () Bool)

(assert (=> start!113980 (=> (not res!897670) (not e!768764))))

(declare-datatypes ((array!92162 0))(
  ( (array!92163 (arr!44529 (Array (_ BitVec 32) (_ BitVec 64))) (size!45079 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92162)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113980 (= res!897670 (and (bvslt (size!45079 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45079 a!3742))))))

(assert (=> start!113980 e!768764))

(assert (=> start!113980 true))

(declare-fun array_inv!33557 (array!92162) Bool)

(assert (=> start!113980 (array_inv!33557 a!3742)))

(declare-fun b!1352306 () Bool)

(declare-fun e!768765 () Bool)

(assert (=> b!1352306 (= e!768764 e!768765)))

(declare-fun res!897672 () Bool)

(assert (=> b!1352306 (=> (not res!897672) (not e!768765))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352306 (= res!897672 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44328 0))(
  ( (Unit!44329) )
))
(declare-fun lt!597502 () Unit!44328)

(declare-fun e!768766 () Unit!44328)

(assert (=> b!1352306 (= lt!597502 e!768766)))

(declare-fun c!126761 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352306 (= c!126761 (validKeyInArray!0 (select (arr!44529 a!3742) from!3120)))))

(declare-fun b!1352307 () Bool)

(declare-fun res!897664 () Bool)

(assert (=> b!1352307 (=> (not res!897664) (not e!768764))))

(declare-datatypes ((List!31570 0))(
  ( (Nil!31567) (Cons!31566 (h!32775 (_ BitVec 64)) (t!46228 List!31570)) )
))
(declare-fun acc!759 () List!31570)

(declare-fun noDuplicate!2136 (List!31570) Bool)

(assert (=> b!1352307 (= res!897664 (noDuplicate!2136 acc!759))))

(declare-fun b!1352308 () Bool)

(declare-fun res!897673 () Bool)

(assert (=> b!1352308 (=> (not res!897673) (not e!768764))))

(assert (=> b!1352308 (= res!897673 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45079 a!3742)))))

(declare-fun b!1352309 () Bool)

(declare-fun res!897671 () Bool)

(assert (=> b!1352309 (=> (not res!897671) (not e!768764))))

(declare-fun arrayNoDuplicates!0 (array!92162 (_ BitVec 32) List!31570) Bool)

(assert (=> b!1352309 (= res!897671 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352310 () Bool)

(declare-fun res!897666 () Bool)

(assert (=> b!1352310 (=> (not res!897666) (not e!768764))))

(declare-fun contains!9279 (List!31570 (_ BitVec 64)) Bool)

(assert (=> b!1352310 (= res!897666 (not (contains!9279 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352311 () Bool)

(declare-fun res!897665 () Bool)

(assert (=> b!1352311 (=> (not res!897665) (not e!768764))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352311 (= res!897665 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352312 () Bool)

(declare-fun res!897667 () Bool)

(assert (=> b!1352312 (=> (not res!897667) (not e!768764))))

(assert (=> b!1352312 (= res!897667 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31567))))

(declare-fun b!1352313 () Bool)

(declare-fun lt!597501 () Unit!44328)

(assert (=> b!1352313 (= e!768766 lt!597501)))

(declare-fun lt!597499 () Unit!44328)

(declare-fun lemmaListSubSeqRefl!0 (List!31570) Unit!44328)

(assert (=> b!1352313 (= lt!597499 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!699 (List!31570 List!31570) Bool)

(assert (=> b!1352313 (subseq!699 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92162 List!31570 List!31570 (_ BitVec 32)) Unit!44328)

(declare-fun $colon$colon!714 (List!31570 (_ BitVec 64)) List!31570)

(assert (=> b!1352313 (= lt!597501 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!714 acc!759 (select (arr!44529 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352313 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352314 () Bool)

(declare-fun res!897668 () Bool)

(assert (=> b!1352314 (=> (not res!897668) (not e!768764))))

(assert (=> b!1352314 (= res!897668 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45079 a!3742))))))

(declare-fun b!1352315 () Bool)

(assert (=> b!1352315 (= e!768765 false)))

(declare-fun lt!597500 () Bool)

(assert (=> b!1352315 (= lt!597500 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352316 () Bool)

(declare-fun Unit!44330 () Unit!44328)

(assert (=> b!1352316 (= e!768766 Unit!44330)))

(declare-fun b!1352317 () Bool)

(declare-fun res!897669 () Bool)

(assert (=> b!1352317 (=> (not res!897669) (not e!768764))))

(assert (=> b!1352317 (= res!897669 (not (contains!9279 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113980 res!897670) b!1352307))

(assert (= (and b!1352307 res!897664) b!1352310))

(assert (= (and b!1352310 res!897666) b!1352317))

(assert (= (and b!1352317 res!897669) b!1352312))

(assert (= (and b!1352312 res!897667) b!1352309))

(assert (= (and b!1352309 res!897671) b!1352314))

(assert (= (and b!1352314 res!897668) b!1352311))

(assert (= (and b!1352311 res!897665) b!1352308))

(assert (= (and b!1352308 res!897673) b!1352306))

(assert (= (and b!1352306 c!126761) b!1352313))

(assert (= (and b!1352306 (not c!126761)) b!1352316))

(assert (= (and b!1352306 res!897672) b!1352315))

(declare-fun m!1239149 () Bool)

(assert (=> b!1352311 m!1239149))

(declare-fun m!1239151 () Bool)

(assert (=> start!113980 m!1239151))

(declare-fun m!1239153 () Bool)

(assert (=> b!1352317 m!1239153))

(declare-fun m!1239155 () Bool)

(assert (=> b!1352312 m!1239155))

(declare-fun m!1239157 () Bool)

(assert (=> b!1352306 m!1239157))

(assert (=> b!1352306 m!1239157))

(declare-fun m!1239159 () Bool)

(assert (=> b!1352306 m!1239159))

(declare-fun m!1239161 () Bool)

(assert (=> b!1352315 m!1239161))

(declare-fun m!1239163 () Bool)

(assert (=> b!1352309 m!1239163))

(declare-fun m!1239165 () Bool)

(assert (=> b!1352310 m!1239165))

(declare-fun m!1239167 () Bool)

(assert (=> b!1352313 m!1239167))

(assert (=> b!1352313 m!1239157))

(declare-fun m!1239169 () Bool)

(assert (=> b!1352313 m!1239169))

(declare-fun m!1239171 () Bool)

(assert (=> b!1352313 m!1239171))

(assert (=> b!1352313 m!1239161))

(assert (=> b!1352313 m!1239157))

(assert (=> b!1352313 m!1239169))

(declare-fun m!1239173 () Bool)

(assert (=> b!1352313 m!1239173))

(declare-fun m!1239175 () Bool)

(assert (=> b!1352307 m!1239175))

(check-sat (not b!1352312) (not b!1352307) (not b!1352311) (not b!1352313) (not b!1352306) (not b!1352309) (not b!1352315) (not b!1352310) (not b!1352317) (not start!113980))
(check-sat)
