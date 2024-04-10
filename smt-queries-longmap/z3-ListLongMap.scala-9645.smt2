; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114010 () Bool)

(assert start!114010)

(declare-fun b!1352861 () Bool)

(declare-fun res!898136 () Bool)

(declare-fun e!768946 () Bool)

(assert (=> b!1352861 (=> (not res!898136) (not e!768946))))

(declare-datatypes ((List!31585 0))(
  ( (Nil!31582) (Cons!31581 (h!32790 (_ BitVec 64)) (t!46243 List!31585)) )
))
(declare-fun acc!759 () List!31585)

(declare-fun noDuplicate!2151 (List!31585) Bool)

(assert (=> b!1352861 (= res!898136 (noDuplicate!2151 acc!759))))

(declare-fun b!1352862 () Bool)

(declare-fun res!898133 () Bool)

(assert (=> b!1352862 (=> (not res!898133) (not e!768946))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92192 0))(
  ( (array!92193 (arr!44544 (Array (_ BitVec 32) (_ BitVec 64))) (size!45094 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92192)

(assert (=> b!1352862 (= res!898133 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45094 a!3742)))))

(declare-fun b!1352863 () Bool)

(declare-fun e!768944 () Bool)

(assert (=> b!1352863 (= e!768944 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92192 (_ BitVec 32) List!31585) Bool)

(assert (=> b!1352863 (arrayNoDuplicates!0 (array!92193 (store (arr!44544 a!3742) i!1404 l!3587) (size!45094 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44373 0))(
  ( (Unit!44374) )
))
(declare-fun lt!597679 () Unit!44373)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92192 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31585) Unit!44373)

(assert (=> b!1352863 (= lt!597679 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352864 () Bool)

(assert (=> b!1352864 (= e!768946 e!768944)))

(declare-fun res!898135 () Bool)

(assert (=> b!1352864 (=> (not res!898135) (not e!768944))))

(assert (=> b!1352864 (= res!898135 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597681 () Unit!44373)

(declare-fun e!768945 () Unit!44373)

(assert (=> b!1352864 (= lt!597681 e!768945)))

(declare-fun c!126806 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352864 (= c!126806 (validKeyInArray!0 (select (arr!44544 a!3742) from!3120)))))

(declare-fun b!1352865 () Bool)

(declare-fun res!898134 () Bool)

(assert (=> b!1352865 (=> (not res!898134) (not e!768946))))

(assert (=> b!1352865 (= res!898134 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352866 () Bool)

(declare-fun res!898132 () Bool)

(assert (=> b!1352866 (=> (not res!898132) (not e!768946))))

(declare-fun contains!9294 (List!31585 (_ BitVec 64)) Bool)

(assert (=> b!1352866 (= res!898132 (not (contains!9294 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352867 () Bool)

(declare-fun Unit!44375 () Unit!44373)

(assert (=> b!1352867 (= e!768945 Unit!44375)))

(declare-fun b!1352868 () Bool)

(declare-fun res!898128 () Bool)

(assert (=> b!1352868 (=> (not res!898128) (not e!768946))))

(assert (=> b!1352868 (= res!898128 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352869 () Bool)

(declare-fun res!898129 () Bool)

(assert (=> b!1352869 (=> (not res!898129) (not e!768946))))

(assert (=> b!1352869 (= res!898129 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45094 a!3742))))))

(declare-fun b!1352870 () Bool)

(declare-fun res!898130 () Bool)

(assert (=> b!1352870 (=> (not res!898130) (not e!768944))))

(assert (=> b!1352870 (= res!898130 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!898137 () Bool)

(assert (=> start!114010 (=> (not res!898137) (not e!768946))))

(assert (=> start!114010 (= res!898137 (and (bvslt (size!45094 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45094 a!3742))))))

(assert (=> start!114010 e!768946))

(assert (=> start!114010 true))

(declare-fun array_inv!33572 (array!92192) Bool)

(assert (=> start!114010 (array_inv!33572 a!3742)))

(declare-fun b!1352860 () Bool)

(declare-fun lt!597682 () Unit!44373)

(assert (=> b!1352860 (= e!768945 lt!597682)))

(declare-fun lt!597680 () Unit!44373)

(declare-fun lemmaListSubSeqRefl!0 (List!31585) Unit!44373)

(assert (=> b!1352860 (= lt!597680 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!714 (List!31585 List!31585) Bool)

(assert (=> b!1352860 (subseq!714 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92192 List!31585 List!31585 (_ BitVec 32)) Unit!44373)

(declare-fun $colon$colon!729 (List!31585 (_ BitVec 64)) List!31585)

(assert (=> b!1352860 (= lt!597682 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!729 acc!759 (select (arr!44544 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352860 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352871 () Bool)

(declare-fun res!898131 () Bool)

(assert (=> b!1352871 (=> (not res!898131) (not e!768946))))

(assert (=> b!1352871 (= res!898131 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31582))))

(declare-fun b!1352872 () Bool)

(declare-fun res!898138 () Bool)

(assert (=> b!1352872 (=> (not res!898138) (not e!768946))))

(assert (=> b!1352872 (= res!898138 (not (contains!9294 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114010 res!898137) b!1352861))

(assert (= (and b!1352861 res!898136) b!1352866))

(assert (= (and b!1352866 res!898132) b!1352872))

(assert (= (and b!1352872 res!898138) b!1352871))

(assert (= (and b!1352871 res!898131) b!1352868))

(assert (= (and b!1352868 res!898128) b!1352869))

(assert (= (and b!1352869 res!898129) b!1352865))

(assert (= (and b!1352865 res!898134) b!1352862))

(assert (= (and b!1352862 res!898133) b!1352864))

(assert (= (and b!1352864 c!126806) b!1352860))

(assert (= (and b!1352864 (not c!126806)) b!1352867))

(assert (= (and b!1352864 res!898135) b!1352870))

(assert (= (and b!1352870 res!898130) b!1352863))

(declare-fun m!1239593 () Bool)

(assert (=> b!1352868 m!1239593))

(declare-fun m!1239595 () Bool)

(assert (=> b!1352864 m!1239595))

(assert (=> b!1352864 m!1239595))

(declare-fun m!1239597 () Bool)

(assert (=> b!1352864 m!1239597))

(declare-fun m!1239599 () Bool)

(assert (=> b!1352861 m!1239599))

(declare-fun m!1239601 () Bool)

(assert (=> b!1352866 m!1239601))

(declare-fun m!1239603 () Bool)

(assert (=> start!114010 m!1239603))

(declare-fun m!1239605 () Bool)

(assert (=> b!1352863 m!1239605))

(declare-fun m!1239607 () Bool)

(assert (=> b!1352863 m!1239607))

(declare-fun m!1239609 () Bool)

(assert (=> b!1352863 m!1239609))

(declare-fun m!1239611 () Bool)

(assert (=> b!1352860 m!1239611))

(assert (=> b!1352860 m!1239595))

(declare-fun m!1239613 () Bool)

(assert (=> b!1352860 m!1239613))

(declare-fun m!1239615 () Bool)

(assert (=> b!1352860 m!1239615))

(declare-fun m!1239617 () Bool)

(assert (=> b!1352860 m!1239617))

(assert (=> b!1352860 m!1239595))

(assert (=> b!1352860 m!1239613))

(declare-fun m!1239619 () Bool)

(assert (=> b!1352860 m!1239619))

(declare-fun m!1239621 () Bool)

(assert (=> b!1352871 m!1239621))

(declare-fun m!1239623 () Bool)

(assert (=> b!1352872 m!1239623))

(assert (=> b!1352870 m!1239617))

(declare-fun m!1239625 () Bool)

(assert (=> b!1352865 m!1239625))

(check-sat (not b!1352868) (not b!1352863) (not b!1352864) (not b!1352861) (not b!1352872) (not b!1352871) (not b!1352860) (not start!114010) (not b!1352865) (not b!1352870) (not b!1352866))
(check-sat)
