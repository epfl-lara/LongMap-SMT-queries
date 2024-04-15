; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113978 () Bool)

(assert start!113978)

(declare-fun b!1352200 () Bool)

(declare-fun e!768720 () Bool)

(assert (=> b!1352200 (= e!768720 false)))

(declare-fun lt!597303 () Bool)

(declare-datatypes ((List!31622 0))(
  ( (Nil!31619) (Cons!31618 (h!32827 (_ BitVec 64)) (t!46272 List!31622)) )
))
(declare-fun acc!759 () List!31622)

(declare-datatypes ((array!92109 0))(
  ( (array!92110 (arr!44503 (Array (_ BitVec 32) (_ BitVec 64))) (size!45055 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92109)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92109 (_ BitVec 32) List!31622) Bool)

(assert (=> b!1352200 (= lt!597303 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352201 () Bool)

(declare-fun res!897607 () Bool)

(declare-fun e!768718 () Bool)

(assert (=> b!1352201 (=> (not res!897607) (not e!768718))))

(assert (=> b!1352201 (= res!897607 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45055 a!3742)))))

(declare-fun b!1352202 () Bool)

(assert (=> b!1352202 (= e!768718 e!768720)))

(declare-fun res!897611 () Bool)

(assert (=> b!1352202 (=> (not res!897611) (not e!768720))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352202 (= res!897611 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44166 0))(
  ( (Unit!44167) )
))
(declare-fun lt!597304 () Unit!44166)

(declare-fun e!768719 () Unit!44166)

(assert (=> b!1352202 (= lt!597304 e!768719)))

(declare-fun c!126740 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352202 (= c!126740 (validKeyInArray!0 (select (arr!44503 a!3742) from!3120)))))

(declare-fun b!1352203 () Bool)

(declare-fun res!897608 () Bool)

(assert (=> b!1352203 (=> (not res!897608) (not e!768718))))

(declare-fun noDuplicate!2157 (List!31622) Bool)

(assert (=> b!1352203 (= res!897608 (noDuplicate!2157 acc!759))))

(declare-fun b!1352204 () Bool)

(declare-fun res!897613 () Bool)

(assert (=> b!1352204 (=> (not res!897613) (not e!768718))))

(assert (=> b!1352204 (= res!897613 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45055 a!3742))))))

(declare-fun b!1352205 () Bool)

(declare-fun res!897612 () Bool)

(assert (=> b!1352205 (=> (not res!897612) (not e!768718))))

(assert (=> b!1352205 (= res!897612 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352206 () Bool)

(declare-fun res!897614 () Bool)

(assert (=> b!1352206 (=> (not res!897614) (not e!768718))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352206 (= res!897614 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!897609 () Bool)

(assert (=> start!113978 (=> (not res!897609) (not e!768718))))

(assert (=> start!113978 (= res!897609 (and (bvslt (size!45055 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45055 a!3742))))))

(assert (=> start!113978 e!768718))

(assert (=> start!113978 true))

(declare-fun array_inv!33736 (array!92109) Bool)

(assert (=> start!113978 (array_inv!33736 a!3742)))

(declare-fun b!1352207 () Bool)

(declare-fun res!897606 () Bool)

(assert (=> b!1352207 (=> (not res!897606) (not e!768718))))

(declare-fun contains!9242 (List!31622 (_ BitVec 64)) Bool)

(assert (=> b!1352207 (= res!897606 (not (contains!9242 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352208 () Bool)

(declare-fun res!897605 () Bool)

(assert (=> b!1352208 (=> (not res!897605) (not e!768718))))

(assert (=> b!1352208 (= res!897605 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31619))))

(declare-fun b!1352209 () Bool)

(declare-fun lt!597302 () Unit!44166)

(assert (=> b!1352209 (= e!768719 lt!597302)))

(declare-fun lt!597301 () Unit!44166)

(declare-fun lemmaListSubSeqRefl!0 (List!31622) Unit!44166)

(assert (=> b!1352209 (= lt!597301 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!698 (List!31622 List!31622) Bool)

(assert (=> b!1352209 (subseq!698 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92109 List!31622 List!31622 (_ BitVec 32)) Unit!44166)

(declare-fun $colon$colon!715 (List!31622 (_ BitVec 64)) List!31622)

(assert (=> b!1352209 (= lt!597302 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!715 acc!759 (select (arr!44503 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352209 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352210 () Bool)

(declare-fun Unit!44168 () Unit!44166)

(assert (=> b!1352210 (= e!768719 Unit!44168)))

(declare-fun b!1352211 () Bool)

(declare-fun res!897610 () Bool)

(assert (=> b!1352211 (=> (not res!897610) (not e!768718))))

(assert (=> b!1352211 (= res!897610 (not (contains!9242 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113978 res!897609) b!1352203))

(assert (= (and b!1352203 res!897608) b!1352211))

(assert (= (and b!1352211 res!897610) b!1352207))

(assert (= (and b!1352207 res!897606) b!1352208))

(assert (= (and b!1352208 res!897605) b!1352205))

(assert (= (and b!1352205 res!897612) b!1352204))

(assert (= (and b!1352204 res!897613) b!1352206))

(assert (= (and b!1352206 res!897614) b!1352201))

(assert (= (and b!1352201 res!897607) b!1352202))

(assert (= (and b!1352202 c!126740) b!1352209))

(assert (= (and b!1352202 (not c!126740)) b!1352210))

(assert (= (and b!1352202 res!897611) b!1352200))

(declare-fun m!1238605 () Bool)

(assert (=> b!1352205 m!1238605))

(declare-fun m!1238607 () Bool)

(assert (=> b!1352208 m!1238607))

(declare-fun m!1238609 () Bool)

(assert (=> b!1352207 m!1238609))

(declare-fun m!1238611 () Bool)

(assert (=> b!1352209 m!1238611))

(declare-fun m!1238613 () Bool)

(assert (=> b!1352209 m!1238613))

(declare-fun m!1238615 () Bool)

(assert (=> b!1352209 m!1238615))

(declare-fun m!1238617 () Bool)

(assert (=> b!1352209 m!1238617))

(declare-fun m!1238619 () Bool)

(assert (=> b!1352209 m!1238619))

(assert (=> b!1352209 m!1238613))

(assert (=> b!1352209 m!1238615))

(declare-fun m!1238621 () Bool)

(assert (=> b!1352209 m!1238621))

(assert (=> b!1352200 m!1238619))

(declare-fun m!1238623 () Bool)

(assert (=> b!1352211 m!1238623))

(declare-fun m!1238625 () Bool)

(assert (=> start!113978 m!1238625))

(declare-fun m!1238627 () Bool)

(assert (=> b!1352203 m!1238627))

(declare-fun m!1238629 () Bool)

(assert (=> b!1352206 m!1238629))

(assert (=> b!1352202 m!1238613))

(assert (=> b!1352202 m!1238613))

(declare-fun m!1238631 () Bool)

(assert (=> b!1352202 m!1238631))

(check-sat (not b!1352209) (not b!1352202) (not b!1352200) (not b!1352205) (not b!1352211) (not b!1352203) (not b!1352207) (not b!1352206) (not start!113978) (not b!1352208))
(check-sat)
