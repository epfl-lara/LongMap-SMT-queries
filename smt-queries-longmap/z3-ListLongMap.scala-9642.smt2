; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113992 () Bool)

(assert start!113992)

(declare-fun b!1352522 () Bool)

(declare-fun res!897850 () Bool)

(declare-fun e!768837 () Bool)

(assert (=> b!1352522 (=> (not res!897850) (not e!768837))))

(declare-datatypes ((List!31576 0))(
  ( (Nil!31573) (Cons!31572 (h!32781 (_ BitVec 64)) (t!46234 List!31576)) )
))
(declare-fun acc!759 () List!31576)

(declare-fun contains!9285 (List!31576 (_ BitVec 64)) Bool)

(assert (=> b!1352522 (= res!897850 (not (contains!9285 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352523 () Bool)

(declare-datatypes ((Unit!44346 0))(
  ( (Unit!44347) )
))
(declare-fun e!768836 () Unit!44346)

(declare-fun lt!597571 () Unit!44346)

(assert (=> b!1352523 (= e!768836 lt!597571)))

(declare-fun lt!597572 () Unit!44346)

(declare-fun lemmaListSubSeqRefl!0 (List!31576) Unit!44346)

(assert (=> b!1352523 (= lt!597572 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!705 (List!31576 List!31576) Bool)

(assert (=> b!1352523 (subseq!705 acc!759 acc!759)))

(declare-datatypes ((array!92174 0))(
  ( (array!92175 (arr!44535 (Array (_ BitVec 32) (_ BitVec 64))) (size!45085 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92174)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92174 List!31576 List!31576 (_ BitVec 32)) Unit!44346)

(declare-fun $colon$colon!720 (List!31576 (_ BitVec 64)) List!31576)

(assert (=> b!1352523 (= lt!597571 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!720 acc!759 (select (arr!44535 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92174 (_ BitVec 32) List!31576) Bool)

(assert (=> b!1352523 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352525 () Bool)

(declare-fun Unit!44348 () Unit!44346)

(assert (=> b!1352525 (= e!768836 Unit!44348)))

(declare-fun b!1352526 () Bool)

(declare-fun res!897844 () Bool)

(assert (=> b!1352526 (=> (not res!897844) (not e!768837))))

(assert (=> b!1352526 (= res!897844 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45085 a!3742)))))

(declare-fun b!1352527 () Bool)

(declare-fun res!897851 () Bool)

(assert (=> b!1352527 (=> (not res!897851) (not e!768837))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352527 (= res!897851 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45085 a!3742))))))

(declare-fun b!1352528 () Bool)

(declare-fun res!897853 () Bool)

(assert (=> b!1352528 (=> (not res!897853) (not e!768837))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352528 (= res!897853 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352529 () Bool)

(declare-fun e!768838 () Bool)

(assert (=> b!1352529 (= e!768838 false)))

(declare-fun lt!597574 () Bool)

(assert (=> b!1352529 (= lt!597574 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352530 () Bool)

(declare-fun res!897848 () Bool)

(assert (=> b!1352530 (=> (not res!897848) (not e!768837))))

(assert (=> b!1352530 (= res!897848 (not (contains!9285 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352531 () Bool)

(declare-fun res!897845 () Bool)

(assert (=> b!1352531 (=> (not res!897845) (not e!768837))))

(declare-fun noDuplicate!2142 (List!31576) Bool)

(assert (=> b!1352531 (= res!897845 (noDuplicate!2142 acc!759))))

(declare-fun b!1352524 () Bool)

(declare-fun res!897849 () Bool)

(assert (=> b!1352524 (=> (not res!897849) (not e!768837))))

(assert (=> b!1352524 (= res!897849 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31573))))

(declare-fun res!897852 () Bool)

(assert (=> start!113992 (=> (not res!897852) (not e!768837))))

(assert (=> start!113992 (= res!897852 (and (bvslt (size!45085 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45085 a!3742))))))

(assert (=> start!113992 e!768837))

(assert (=> start!113992 true))

(declare-fun array_inv!33563 (array!92174) Bool)

(assert (=> start!113992 (array_inv!33563 a!3742)))

(declare-fun b!1352532 () Bool)

(declare-fun res!897846 () Bool)

(assert (=> b!1352532 (=> (not res!897846) (not e!768837))))

(assert (=> b!1352532 (= res!897846 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352533 () Bool)

(assert (=> b!1352533 (= e!768837 e!768838)))

(declare-fun res!897847 () Bool)

(assert (=> b!1352533 (=> (not res!897847) (not e!768838))))

(assert (=> b!1352533 (= res!897847 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597573 () Unit!44346)

(assert (=> b!1352533 (= lt!597573 e!768836)))

(declare-fun c!126779 () Bool)

(assert (=> b!1352533 (= c!126779 (validKeyInArray!0 (select (arr!44535 a!3742) from!3120)))))

(assert (= (and start!113992 res!897852) b!1352531))

(assert (= (and b!1352531 res!897845) b!1352522))

(assert (= (and b!1352522 res!897850) b!1352530))

(assert (= (and b!1352530 res!897848) b!1352524))

(assert (= (and b!1352524 res!897849) b!1352532))

(assert (= (and b!1352532 res!897846) b!1352527))

(assert (= (and b!1352527 res!897851) b!1352528))

(assert (= (and b!1352528 res!897853) b!1352526))

(assert (= (and b!1352526 res!897844) b!1352533))

(assert (= (and b!1352533 c!126779) b!1352523))

(assert (= (and b!1352533 (not c!126779)) b!1352525))

(assert (= (and b!1352533 res!897847) b!1352529))

(declare-fun m!1239317 () Bool)

(assert (=> b!1352532 m!1239317))

(declare-fun m!1239319 () Bool)

(assert (=> b!1352530 m!1239319))

(declare-fun m!1239321 () Bool)

(assert (=> b!1352531 m!1239321))

(declare-fun m!1239323 () Bool)

(assert (=> b!1352533 m!1239323))

(assert (=> b!1352533 m!1239323))

(declare-fun m!1239325 () Bool)

(assert (=> b!1352533 m!1239325))

(declare-fun m!1239327 () Bool)

(assert (=> b!1352524 m!1239327))

(declare-fun m!1239329 () Bool)

(assert (=> b!1352522 m!1239329))

(declare-fun m!1239331 () Bool)

(assert (=> b!1352529 m!1239331))

(declare-fun m!1239333 () Bool)

(assert (=> b!1352523 m!1239333))

(assert (=> b!1352523 m!1239323))

(declare-fun m!1239335 () Bool)

(assert (=> b!1352523 m!1239335))

(declare-fun m!1239337 () Bool)

(assert (=> b!1352523 m!1239337))

(assert (=> b!1352523 m!1239331))

(assert (=> b!1352523 m!1239323))

(assert (=> b!1352523 m!1239335))

(declare-fun m!1239339 () Bool)

(assert (=> b!1352523 m!1239339))

(declare-fun m!1239341 () Bool)

(assert (=> b!1352528 m!1239341))

(declare-fun m!1239343 () Bool)

(assert (=> start!113992 m!1239343))

(check-sat (not start!113992) (not b!1352533) (not b!1352529) (not b!1352524) (not b!1352523) (not b!1352530) (not b!1352531) (not b!1352522) (not b!1352532) (not b!1352528))
(check-sat)
