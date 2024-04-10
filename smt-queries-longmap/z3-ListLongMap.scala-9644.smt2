; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114004 () Bool)

(assert start!114004)

(declare-fun b!1352743 () Bool)

(declare-fun res!898031 () Bool)

(declare-fun e!768908 () Bool)

(assert (=> b!1352743 (=> (not res!898031) (not e!768908))))

(declare-datatypes ((List!31582 0))(
  ( (Nil!31579) (Cons!31578 (h!32787 (_ BitVec 64)) (t!46240 List!31582)) )
))
(declare-fun acc!759 () List!31582)

(declare-datatypes ((array!92186 0))(
  ( (array!92187 (arr!44541 (Array (_ BitVec 32) (_ BitVec 64))) (size!45091 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92186)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92186 (_ BitVec 32) List!31582) Bool)

(assert (=> b!1352743 (= res!898031 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352744 () Bool)

(declare-fun res!898037 () Bool)

(declare-fun e!768910 () Bool)

(assert (=> b!1352744 (=> (not res!898037) (not e!768910))))

(declare-fun contains!9291 (List!31582 (_ BitVec 64)) Bool)

(assert (=> b!1352744 (= res!898037 (not (contains!9291 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352745 () Bool)

(declare-fun res!898036 () Bool)

(assert (=> b!1352745 (=> (not res!898036) (not e!768910))))

(assert (=> b!1352745 (= res!898036 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31579))))

(declare-fun b!1352746 () Bool)

(declare-datatypes ((Unit!44364 0))(
  ( (Unit!44365) )
))
(declare-fun e!768909 () Unit!44364)

(declare-fun lt!597645 () Unit!44364)

(assert (=> b!1352746 (= e!768909 lt!597645)))

(declare-fun lt!597644 () Unit!44364)

(declare-fun lemmaListSubSeqRefl!0 (List!31582) Unit!44364)

(assert (=> b!1352746 (= lt!597644 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!711 (List!31582 List!31582) Bool)

(assert (=> b!1352746 (subseq!711 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92186 List!31582 List!31582 (_ BitVec 32)) Unit!44364)

(declare-fun $colon$colon!726 (List!31582 (_ BitVec 64)) List!31582)

(assert (=> b!1352746 (= lt!597645 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!726 acc!759 (select (arr!44541 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352746 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352747 () Bool)

(declare-fun res!898035 () Bool)

(assert (=> b!1352747 (=> (not res!898035) (not e!768910))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352747 (= res!898035 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352748 () Bool)

(declare-fun Unit!44366 () Unit!44364)

(assert (=> b!1352748 (= e!768909 Unit!44366)))

(declare-fun b!1352749 () Bool)

(assert (=> b!1352749 (= e!768908 (not (bvsle from!3120 (size!45091 a!3742))))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352749 (arrayNoDuplicates!0 (array!92187 (store (arr!44541 a!3742) i!1404 l!3587) (size!45091 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597646 () Unit!44364)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92186 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31582) Unit!44364)

(assert (=> b!1352749 (= lt!597646 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352750 () Bool)

(declare-fun res!898039 () Bool)

(assert (=> b!1352750 (=> (not res!898039) (not e!768910))))

(declare-fun noDuplicate!2148 (List!31582) Bool)

(assert (=> b!1352750 (= res!898039 (noDuplicate!2148 acc!759))))

(declare-fun b!1352751 () Bool)

(declare-fun res!898034 () Bool)

(assert (=> b!1352751 (=> (not res!898034) (not e!768910))))

(assert (=> b!1352751 (= res!898034 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45091 a!3742)))))

(declare-fun b!1352752 () Bool)

(declare-fun res!898030 () Bool)

(assert (=> b!1352752 (=> (not res!898030) (not e!768910))))

(assert (=> b!1352752 (= res!898030 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45091 a!3742))))))

(declare-fun b!1352754 () Bool)

(declare-fun res!898033 () Bool)

(assert (=> b!1352754 (=> (not res!898033) (not e!768910))))

(assert (=> b!1352754 (= res!898033 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352755 () Bool)

(declare-fun res!898038 () Bool)

(assert (=> b!1352755 (=> (not res!898038) (not e!768910))))

(assert (=> b!1352755 (= res!898038 (not (contains!9291 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898032 () Bool)

(assert (=> start!114004 (=> (not res!898032) (not e!768910))))

(assert (=> start!114004 (= res!898032 (and (bvslt (size!45091 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45091 a!3742))))))

(assert (=> start!114004 e!768910))

(assert (=> start!114004 true))

(declare-fun array_inv!33569 (array!92186) Bool)

(assert (=> start!114004 (array_inv!33569 a!3742)))

(declare-fun b!1352753 () Bool)

(assert (=> b!1352753 (= e!768910 e!768908)))

(declare-fun res!898029 () Bool)

(assert (=> b!1352753 (=> (not res!898029) (not e!768908))))

(assert (=> b!1352753 (= res!898029 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597643 () Unit!44364)

(assert (=> b!1352753 (= lt!597643 e!768909)))

(declare-fun c!126797 () Bool)

(assert (=> b!1352753 (= c!126797 (validKeyInArray!0 (select (arr!44541 a!3742) from!3120)))))

(assert (= (and start!114004 res!898032) b!1352750))

(assert (= (and b!1352750 res!898039) b!1352755))

(assert (= (and b!1352755 res!898038) b!1352744))

(assert (= (and b!1352744 res!898037) b!1352745))

(assert (= (and b!1352745 res!898036) b!1352754))

(assert (= (and b!1352754 res!898033) b!1352752))

(assert (= (and b!1352752 res!898030) b!1352747))

(assert (= (and b!1352747 res!898035) b!1352751))

(assert (= (and b!1352751 res!898034) b!1352753))

(assert (= (and b!1352753 c!126797) b!1352746))

(assert (= (and b!1352753 (not c!126797)) b!1352748))

(assert (= (and b!1352753 res!898029) b!1352743))

(assert (= (and b!1352743 res!898031) b!1352749))

(declare-fun m!1239491 () Bool)

(assert (=> start!114004 m!1239491))

(declare-fun m!1239493 () Bool)

(assert (=> b!1352750 m!1239493))

(declare-fun m!1239495 () Bool)

(assert (=> b!1352747 m!1239495))

(declare-fun m!1239497 () Bool)

(assert (=> b!1352753 m!1239497))

(assert (=> b!1352753 m!1239497))

(declare-fun m!1239499 () Bool)

(assert (=> b!1352753 m!1239499))

(declare-fun m!1239501 () Bool)

(assert (=> b!1352754 m!1239501))

(declare-fun m!1239503 () Bool)

(assert (=> b!1352755 m!1239503))

(declare-fun m!1239505 () Bool)

(assert (=> b!1352744 m!1239505))

(declare-fun m!1239507 () Bool)

(assert (=> b!1352745 m!1239507))

(declare-fun m!1239509 () Bool)

(assert (=> b!1352749 m!1239509))

(declare-fun m!1239511 () Bool)

(assert (=> b!1352749 m!1239511))

(declare-fun m!1239513 () Bool)

(assert (=> b!1352749 m!1239513))

(declare-fun m!1239515 () Bool)

(assert (=> b!1352746 m!1239515))

(assert (=> b!1352746 m!1239497))

(declare-fun m!1239517 () Bool)

(assert (=> b!1352746 m!1239517))

(declare-fun m!1239519 () Bool)

(assert (=> b!1352746 m!1239519))

(declare-fun m!1239521 () Bool)

(assert (=> b!1352746 m!1239521))

(assert (=> b!1352746 m!1239497))

(assert (=> b!1352746 m!1239517))

(declare-fun m!1239523 () Bool)

(assert (=> b!1352746 m!1239523))

(assert (=> b!1352743 m!1239521))

(check-sat (not b!1352753) (not b!1352750) (not b!1352745) (not b!1352744) (not start!114004) (not b!1352747) (not b!1352746) (not b!1352749) (not b!1352754) (not b!1352743) (not b!1352755))
(check-sat)
