; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114018 () Bool)

(assert start!114018)

(declare-fun res!898268 () Bool)

(declare-fun e!768994 () Bool)

(assert (=> start!114018 (=> (not res!898268) (not e!768994))))

(declare-datatypes ((array!92200 0))(
  ( (array!92201 (arr!44548 (Array (_ BitVec 32) (_ BitVec 64))) (size!45098 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92200)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114018 (= res!898268 (and (bvslt (size!45098 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45098 a!3742))))))

(assert (=> start!114018 e!768994))

(assert (=> start!114018 true))

(declare-fun array_inv!33576 (array!92200) Bool)

(assert (=> start!114018 (array_inv!33576 a!3742)))

(declare-fun b!1353016 () Bool)

(declare-fun res!898266 () Bool)

(assert (=> b!1353016 (=> (not res!898266) (not e!768994))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353016 (= res!898266 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353017 () Bool)

(declare-datatypes ((Unit!44385 0))(
  ( (Unit!44386) )
))
(declare-fun e!768992 () Unit!44385)

(declare-fun Unit!44387 () Unit!44385)

(assert (=> b!1353017 (= e!768992 Unit!44387)))

(declare-fun b!1353018 () Bool)

(declare-fun res!898262 () Bool)

(assert (=> b!1353018 (=> (not res!898262) (not e!768994))))

(assert (=> b!1353018 (= res!898262 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45098 a!3742)))))

(declare-fun b!1353019 () Bool)

(declare-fun e!768993 () Bool)

(assert (=> b!1353019 (= e!768993 (not true))))

(declare-datatypes ((List!31589 0))(
  ( (Nil!31586) (Cons!31585 (h!32794 (_ BitVec 64)) (t!46247 List!31589)) )
))
(declare-fun acc!759 () List!31589)

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92200 (_ BitVec 32) List!31589) Bool)

(assert (=> b!1353019 (arrayNoDuplicates!0 (array!92201 (store (arr!44548 a!3742) i!1404 l!3587) (size!45098 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597730 () Unit!44385)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92200 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31589) Unit!44385)

(assert (=> b!1353019 (= lt!597730 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353020 () Bool)

(declare-fun res!898270 () Bool)

(assert (=> b!1353020 (=> (not res!898270) (not e!768994))))

(declare-fun noDuplicate!2155 (List!31589) Bool)

(assert (=> b!1353020 (= res!898270 (noDuplicate!2155 acc!759))))

(declare-fun b!1353021 () Bool)

(declare-fun res!898261 () Bool)

(assert (=> b!1353021 (=> (not res!898261) (not e!768994))))

(assert (=> b!1353021 (= res!898261 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31586))))

(declare-fun b!1353022 () Bool)

(declare-fun res!898267 () Bool)

(assert (=> b!1353022 (=> (not res!898267) (not e!768993))))

(assert (=> b!1353022 (= res!898267 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353023 () Bool)

(declare-fun res!898260 () Bool)

(assert (=> b!1353023 (=> (not res!898260) (not e!768994))))

(assert (=> b!1353023 (= res!898260 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45098 a!3742))))))

(declare-fun b!1353024 () Bool)

(declare-fun lt!597728 () Unit!44385)

(assert (=> b!1353024 (= e!768992 lt!597728)))

(declare-fun lt!597727 () Unit!44385)

(declare-fun lemmaListSubSeqRefl!0 (List!31589) Unit!44385)

(assert (=> b!1353024 (= lt!597727 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!718 (List!31589 List!31589) Bool)

(assert (=> b!1353024 (subseq!718 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92200 List!31589 List!31589 (_ BitVec 32)) Unit!44385)

(declare-fun $colon$colon!733 (List!31589 (_ BitVec 64)) List!31589)

(assert (=> b!1353024 (= lt!597728 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!733 acc!759 (select (arr!44548 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353024 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353025 () Bool)

(declare-fun res!898269 () Bool)

(assert (=> b!1353025 (=> (not res!898269) (not e!768994))))

(declare-fun contains!9298 (List!31589 (_ BitVec 64)) Bool)

(assert (=> b!1353025 (= res!898269 (not (contains!9298 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353026 () Bool)

(assert (=> b!1353026 (= e!768994 e!768993)))

(declare-fun res!898265 () Bool)

(assert (=> b!1353026 (=> (not res!898265) (not e!768993))))

(assert (=> b!1353026 (= res!898265 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597729 () Unit!44385)

(assert (=> b!1353026 (= lt!597729 e!768992)))

(declare-fun c!126818 () Bool)

(assert (=> b!1353026 (= c!126818 (validKeyInArray!0 (select (arr!44548 a!3742) from!3120)))))

(declare-fun b!1353027 () Bool)

(declare-fun res!898263 () Bool)

(assert (=> b!1353027 (=> (not res!898263) (not e!768994))))

(assert (=> b!1353027 (= res!898263 (not (contains!9298 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353028 () Bool)

(declare-fun res!898264 () Bool)

(assert (=> b!1353028 (=> (not res!898264) (not e!768994))))

(assert (=> b!1353028 (= res!898264 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114018 res!898268) b!1353020))

(assert (= (and b!1353020 res!898270) b!1353027))

(assert (= (and b!1353027 res!898263) b!1353025))

(assert (= (and b!1353025 res!898269) b!1353021))

(assert (= (and b!1353021 res!898261) b!1353028))

(assert (= (and b!1353028 res!898264) b!1353023))

(assert (= (and b!1353023 res!898260) b!1353016))

(assert (= (and b!1353016 res!898266) b!1353018))

(assert (= (and b!1353018 res!898262) b!1353026))

(assert (= (and b!1353026 c!126818) b!1353024))

(assert (= (and b!1353026 (not c!126818)) b!1353017))

(assert (= (and b!1353026 res!898265) b!1353022))

(assert (= (and b!1353022 res!898267) b!1353019))

(declare-fun m!1239729 () Bool)

(assert (=> b!1353028 m!1239729))

(declare-fun m!1239731 () Bool)

(assert (=> start!114018 m!1239731))

(declare-fun m!1239733 () Bool)

(assert (=> b!1353016 m!1239733))

(declare-fun m!1239735 () Bool)

(assert (=> b!1353021 m!1239735))

(declare-fun m!1239737 () Bool)

(assert (=> b!1353026 m!1239737))

(assert (=> b!1353026 m!1239737))

(declare-fun m!1239739 () Bool)

(assert (=> b!1353026 m!1239739))

(declare-fun m!1239741 () Bool)

(assert (=> b!1353024 m!1239741))

(assert (=> b!1353024 m!1239737))

(declare-fun m!1239743 () Bool)

(assert (=> b!1353024 m!1239743))

(declare-fun m!1239745 () Bool)

(assert (=> b!1353024 m!1239745))

(declare-fun m!1239747 () Bool)

(assert (=> b!1353024 m!1239747))

(assert (=> b!1353024 m!1239737))

(assert (=> b!1353024 m!1239743))

(declare-fun m!1239749 () Bool)

(assert (=> b!1353024 m!1239749))

(declare-fun m!1239751 () Bool)

(assert (=> b!1353020 m!1239751))

(declare-fun m!1239753 () Bool)

(assert (=> b!1353027 m!1239753))

(assert (=> b!1353022 m!1239747))

(declare-fun m!1239755 () Bool)

(assert (=> b!1353025 m!1239755))

(declare-fun m!1239757 () Bool)

(assert (=> b!1353019 m!1239757))

(declare-fun m!1239759 () Bool)

(assert (=> b!1353019 m!1239759))

(declare-fun m!1239761 () Bool)

(assert (=> b!1353019 m!1239761))

(push 1)

