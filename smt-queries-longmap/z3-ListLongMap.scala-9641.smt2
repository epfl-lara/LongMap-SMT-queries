; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113984 () Bool)

(assert start!113984)

(declare-fun b!1352308 () Bool)

(declare-fun e!768757 () Bool)

(assert (=> b!1352308 (= e!768757 false)))

(declare-fun lt!597340 () Bool)

(declare-datatypes ((List!31625 0))(
  ( (Nil!31622) (Cons!31621 (h!32830 (_ BitVec 64)) (t!46275 List!31625)) )
))
(declare-fun acc!759 () List!31625)

(declare-datatypes ((array!92115 0))(
  ( (array!92116 (arr!44506 (Array (_ BitVec 32) (_ BitVec 64))) (size!45058 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92115)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92115 (_ BitVec 32) List!31625) Bool)

(assert (=> b!1352308 (= lt!597340 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352309 () Bool)

(declare-fun res!897701 () Bool)

(declare-fun e!768756 () Bool)

(assert (=> b!1352309 (=> (not res!897701) (not e!768756))))

(declare-fun contains!9245 (List!31625 (_ BitVec 64)) Bool)

(assert (=> b!1352309 (= res!897701 (not (contains!9245 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352310 () Bool)

(assert (=> b!1352310 (= e!768756 e!768757)))

(declare-fun res!897704 () Bool)

(assert (=> b!1352310 (=> (not res!897704) (not e!768757))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352310 (= res!897704 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44175 0))(
  ( (Unit!44176) )
))
(declare-fun lt!597337 () Unit!44175)

(declare-fun e!768755 () Unit!44175)

(assert (=> b!1352310 (= lt!597337 e!768755)))

(declare-fun c!126749 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352310 (= c!126749 (validKeyInArray!0 (select (arr!44506 a!3742) from!3120)))))

(declare-fun b!1352311 () Bool)

(declare-fun res!897703 () Bool)

(assert (=> b!1352311 (=> (not res!897703) (not e!768756))))

(assert (=> b!1352311 (= res!897703 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352313 () Bool)

(declare-fun res!897697 () Bool)

(assert (=> b!1352313 (=> (not res!897697) (not e!768756))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352313 (= res!897697 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352314 () Bool)

(declare-fun res!897696 () Bool)

(assert (=> b!1352314 (=> (not res!897696) (not e!768756))))

(assert (=> b!1352314 (= res!897696 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31622))))

(declare-fun b!1352315 () Bool)

(declare-fun res!897700 () Bool)

(assert (=> b!1352315 (=> (not res!897700) (not e!768756))))

(assert (=> b!1352315 (= res!897700 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45058 a!3742))))))

(declare-fun b!1352316 () Bool)

(declare-fun Unit!44177 () Unit!44175)

(assert (=> b!1352316 (= e!768755 Unit!44177)))

(declare-fun b!1352317 () Bool)

(declare-fun res!897698 () Bool)

(assert (=> b!1352317 (=> (not res!897698) (not e!768756))))

(assert (=> b!1352317 (= res!897698 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45058 a!3742)))))

(declare-fun b!1352312 () Bool)

(declare-fun res!897702 () Bool)

(assert (=> b!1352312 (=> (not res!897702) (not e!768756))))

(declare-fun noDuplicate!2160 (List!31625) Bool)

(assert (=> b!1352312 (= res!897702 (noDuplicate!2160 acc!759))))

(declare-fun res!897695 () Bool)

(assert (=> start!113984 (=> (not res!897695) (not e!768756))))

(assert (=> start!113984 (= res!897695 (and (bvslt (size!45058 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45058 a!3742))))))

(assert (=> start!113984 e!768756))

(assert (=> start!113984 true))

(declare-fun array_inv!33739 (array!92115) Bool)

(assert (=> start!113984 (array_inv!33739 a!3742)))

(declare-fun b!1352318 () Bool)

(declare-fun lt!597338 () Unit!44175)

(assert (=> b!1352318 (= e!768755 lt!597338)))

(declare-fun lt!597339 () Unit!44175)

(declare-fun lemmaListSubSeqRefl!0 (List!31625) Unit!44175)

(assert (=> b!1352318 (= lt!597339 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!701 (List!31625 List!31625) Bool)

(assert (=> b!1352318 (subseq!701 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92115 List!31625 List!31625 (_ BitVec 32)) Unit!44175)

(declare-fun $colon$colon!718 (List!31625 (_ BitVec 64)) List!31625)

(assert (=> b!1352318 (= lt!597338 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!718 acc!759 (select (arr!44506 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352318 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352319 () Bool)

(declare-fun res!897699 () Bool)

(assert (=> b!1352319 (=> (not res!897699) (not e!768756))))

(assert (=> b!1352319 (= res!897699 (not (contains!9245 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113984 res!897695) b!1352312))

(assert (= (and b!1352312 res!897702) b!1352319))

(assert (= (and b!1352319 res!897699) b!1352309))

(assert (= (and b!1352309 res!897701) b!1352314))

(assert (= (and b!1352314 res!897696) b!1352311))

(assert (= (and b!1352311 res!897703) b!1352315))

(assert (= (and b!1352315 res!897700) b!1352313))

(assert (= (and b!1352313 res!897697) b!1352317))

(assert (= (and b!1352317 res!897698) b!1352310))

(assert (= (and b!1352310 c!126749) b!1352318))

(assert (= (and b!1352310 (not c!126749)) b!1352316))

(assert (= (and b!1352310 res!897704) b!1352308))

(declare-fun m!1238689 () Bool)

(assert (=> b!1352314 m!1238689))

(declare-fun m!1238691 () Bool)

(assert (=> b!1352313 m!1238691))

(declare-fun m!1238693 () Bool)

(assert (=> b!1352312 m!1238693))

(declare-fun m!1238695 () Bool)

(assert (=> b!1352308 m!1238695))

(declare-fun m!1238697 () Bool)

(assert (=> b!1352311 m!1238697))

(declare-fun m!1238699 () Bool)

(assert (=> b!1352319 m!1238699))

(declare-fun m!1238701 () Bool)

(assert (=> b!1352318 m!1238701))

(declare-fun m!1238703 () Bool)

(assert (=> b!1352318 m!1238703))

(declare-fun m!1238705 () Bool)

(assert (=> b!1352318 m!1238705))

(declare-fun m!1238707 () Bool)

(assert (=> b!1352318 m!1238707))

(assert (=> b!1352318 m!1238695))

(assert (=> b!1352318 m!1238703))

(assert (=> b!1352318 m!1238705))

(declare-fun m!1238709 () Bool)

(assert (=> b!1352318 m!1238709))

(assert (=> b!1352310 m!1238703))

(assert (=> b!1352310 m!1238703))

(declare-fun m!1238711 () Bool)

(assert (=> b!1352310 m!1238711))

(declare-fun m!1238713 () Bool)

(assert (=> b!1352309 m!1238713))

(declare-fun m!1238715 () Bool)

(assert (=> start!113984 m!1238715))

(check-sat (not b!1352308) (not b!1352310) (not b!1352319) (not b!1352309) (not b!1352314) (not start!113984) (not b!1352311) (not b!1352312) (not b!1352313) (not b!1352318))
(check-sat)
