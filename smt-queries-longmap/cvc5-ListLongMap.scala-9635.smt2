; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113948 () Bool)

(assert start!113948)

(declare-fun b!1351730 () Bool)

(declare-fun res!897193 () Bool)

(declare-fun e!768571 () Bool)

(assert (=> b!1351730 (=> (not res!897193) (not e!768571))))

(declare-datatypes ((List!31554 0))(
  ( (Nil!31551) (Cons!31550 (h!32759 (_ BitVec 64)) (t!46212 List!31554)) )
))
(declare-fun acc!759 () List!31554)

(declare-datatypes ((array!92130 0))(
  ( (array!92131 (arr!44513 (Array (_ BitVec 32) (_ BitVec 64))) (size!45063 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92130)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92130 (_ BitVec 32) List!31554) Bool)

(assert (=> b!1351730 (= res!897193 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351731 () Bool)

(declare-fun res!897190 () Bool)

(assert (=> b!1351731 (=> (not res!897190) (not e!768571))))

(declare-fun noDuplicate!2120 (List!31554) Bool)

(assert (=> b!1351731 (= res!897190 (noDuplicate!2120 acc!759))))

(declare-fun res!897186 () Bool)

(assert (=> start!113948 (=> (not res!897186) (not e!768571))))

(assert (=> start!113948 (= res!897186 (and (bvslt (size!45063 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45063 a!3742))))))

(assert (=> start!113948 e!768571))

(assert (=> start!113948 true))

(declare-fun array_inv!33541 (array!92130) Bool)

(assert (=> start!113948 (array_inv!33541 a!3742)))

(declare-fun b!1351732 () Bool)

(declare-datatypes ((Unit!44280 0))(
  ( (Unit!44281) )
))
(declare-fun e!768573 () Unit!44280)

(declare-fun lt!597309 () Unit!44280)

(assert (=> b!1351732 (= e!768573 lt!597309)))

(declare-fun lt!597310 () Unit!44280)

(declare-fun lemmaListSubSeqRefl!0 (List!31554) Unit!44280)

(assert (=> b!1351732 (= lt!597310 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!683 (List!31554 List!31554) Bool)

(assert (=> b!1351732 (subseq!683 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92130 List!31554 List!31554 (_ BitVec 32)) Unit!44280)

(declare-fun $colon$colon!698 (List!31554 (_ BitVec 64)) List!31554)

(assert (=> b!1351732 (= lt!597309 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!698 acc!759 (select (arr!44513 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351732 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351733 () Bool)

(declare-fun Unit!44282 () Unit!44280)

(assert (=> b!1351733 (= e!768573 Unit!44282)))

(declare-fun b!1351734 () Bool)

(declare-fun e!768574 () Bool)

(assert (=> b!1351734 (= e!768574 false)))

(declare-fun lt!597308 () Bool)

(assert (=> b!1351734 (= lt!597308 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351735 () Bool)

(declare-fun res!897189 () Bool)

(assert (=> b!1351735 (=> (not res!897189) (not e!768571))))

(declare-fun contains!9263 (List!31554 (_ BitVec 64)) Bool)

(assert (=> b!1351735 (= res!897189 (not (contains!9263 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351736 () Bool)

(assert (=> b!1351736 (= e!768571 e!768574)))

(declare-fun res!897184 () Bool)

(assert (=> b!1351736 (=> (not res!897184) (not e!768574))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351736 (= res!897184 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597307 () Unit!44280)

(assert (=> b!1351736 (= lt!597307 e!768573)))

(declare-fun c!126713 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351736 (= c!126713 (validKeyInArray!0 (select (arr!44513 a!3742) from!3120)))))

(declare-fun b!1351737 () Bool)

(declare-fun res!897191 () Bool)

(assert (=> b!1351737 (=> (not res!897191) (not e!768571))))

(assert (=> b!1351737 (= res!897191 (not (contains!9263 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351738 () Bool)

(declare-fun res!897192 () Bool)

(assert (=> b!1351738 (=> (not res!897192) (not e!768571))))

(assert (=> b!1351738 (= res!897192 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31551))))

(declare-fun b!1351739 () Bool)

(declare-fun res!897187 () Bool)

(assert (=> b!1351739 (=> (not res!897187) (not e!768571))))

(assert (=> b!1351739 (= res!897187 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45063 a!3742))))))

(declare-fun b!1351740 () Bool)

(declare-fun res!897185 () Bool)

(assert (=> b!1351740 (=> (not res!897185) (not e!768571))))

(assert (=> b!1351740 (= res!897185 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45063 a!3742)))))

(declare-fun b!1351741 () Bool)

(declare-fun res!897188 () Bool)

(assert (=> b!1351741 (=> (not res!897188) (not e!768571))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351741 (= res!897188 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113948 res!897186) b!1351731))

(assert (= (and b!1351731 res!897190) b!1351737))

(assert (= (and b!1351737 res!897191) b!1351735))

(assert (= (and b!1351735 res!897189) b!1351738))

(assert (= (and b!1351738 res!897192) b!1351730))

(assert (= (and b!1351730 res!897193) b!1351739))

(assert (= (and b!1351739 res!897187) b!1351741))

(assert (= (and b!1351741 res!897188) b!1351740))

(assert (= (and b!1351740 res!897185) b!1351736))

(assert (= (and b!1351736 c!126713) b!1351732))

(assert (= (and b!1351736 (not c!126713)) b!1351733))

(assert (= (and b!1351736 res!897184) b!1351734))

(declare-fun m!1238701 () Bool)

(assert (=> b!1351741 m!1238701))

(declare-fun m!1238703 () Bool)

(assert (=> b!1351730 m!1238703))

(declare-fun m!1238705 () Bool)

(assert (=> b!1351737 m!1238705))

(declare-fun m!1238707 () Bool)

(assert (=> b!1351732 m!1238707))

(declare-fun m!1238709 () Bool)

(assert (=> b!1351732 m!1238709))

(declare-fun m!1238711 () Bool)

(assert (=> b!1351732 m!1238711))

(declare-fun m!1238713 () Bool)

(assert (=> b!1351732 m!1238713))

(declare-fun m!1238715 () Bool)

(assert (=> b!1351732 m!1238715))

(assert (=> b!1351732 m!1238709))

(assert (=> b!1351732 m!1238711))

(declare-fun m!1238717 () Bool)

(assert (=> b!1351732 m!1238717))

(declare-fun m!1238719 () Bool)

(assert (=> b!1351735 m!1238719))

(declare-fun m!1238721 () Bool)

(assert (=> b!1351738 m!1238721))

(declare-fun m!1238723 () Bool)

(assert (=> start!113948 m!1238723))

(assert (=> b!1351736 m!1238709))

(assert (=> b!1351736 m!1238709))

(declare-fun m!1238725 () Bool)

(assert (=> b!1351736 m!1238725))

(assert (=> b!1351734 m!1238715))

(declare-fun m!1238727 () Bool)

(assert (=> b!1351731 m!1238727))

(push 1)

