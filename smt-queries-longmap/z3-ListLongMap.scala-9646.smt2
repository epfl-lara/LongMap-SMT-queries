; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114014 () Bool)

(assert start!114014)

(declare-fun b!1352868 () Bool)

(declare-fun res!898169 () Bool)

(declare-fun e!768934 () Bool)

(assert (=> b!1352868 (=> (not res!898169) (not e!768934))))

(declare-datatypes ((List!31640 0))(
  ( (Nil!31637) (Cons!31636 (h!32845 (_ BitVec 64)) (t!46290 List!31640)) )
))
(declare-fun acc!759 () List!31640)

(declare-fun contains!9260 (List!31640 (_ BitVec 64)) Bool)

(assert (=> b!1352868 (= res!898169 (not (contains!9260 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352869 () Bool)

(declare-datatypes ((Unit!44220 0))(
  ( (Unit!44221) )
))
(declare-fun e!768935 () Unit!44220)

(declare-fun Unit!44222 () Unit!44220)

(assert (=> b!1352869 (= e!768935 Unit!44222)))

(declare-fun b!1352870 () Bool)

(declare-fun res!898175 () Bool)

(assert (=> b!1352870 (=> (not res!898175) (not e!768934))))

(declare-datatypes ((array!92145 0))(
  ( (array!92146 (arr!44521 (Array (_ BitVec 32) (_ BitVec 64))) (size!45073 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92145)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92145 (_ BitVec 32) List!31640) Bool)

(assert (=> b!1352870 (= res!898175 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352871 () Bool)

(declare-fun res!898167 () Bool)

(assert (=> b!1352871 (=> (not res!898167) (not e!768934))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352871 (= res!898167 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352872 () Bool)

(declare-fun res!898173 () Bool)

(assert (=> b!1352872 (=> (not res!898173) (not e!768934))))

(declare-fun noDuplicate!2175 (List!31640) Bool)

(assert (=> b!1352872 (= res!898173 (noDuplicate!2175 acc!759))))

(declare-fun b!1352873 () Bool)

(declare-fun e!768937 () Bool)

(assert (=> b!1352873 (= e!768937 (not true))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352873 (arrayNoDuplicates!0 (array!92146 (store (arr!44521 a!3742) i!1404 l!3587) (size!45073 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597519 () Unit!44220)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31640) Unit!44220)

(assert (=> b!1352873 (= lt!597519 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352875 () Bool)

(declare-fun res!898165 () Bool)

(assert (=> b!1352875 (=> (not res!898165) (not e!768934))))

(assert (=> b!1352875 (= res!898165 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31637))))

(declare-fun b!1352876 () Bool)

(declare-fun res!898168 () Bool)

(assert (=> b!1352876 (=> (not res!898168) (not e!768934))))

(assert (=> b!1352876 (= res!898168 (not (contains!9260 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352877 () Bool)

(declare-fun lt!597520 () Unit!44220)

(assert (=> b!1352877 (= e!768935 lt!597520)))

(declare-fun lt!597517 () Unit!44220)

(declare-fun lemmaListSubSeqRefl!0 (List!31640) Unit!44220)

(assert (=> b!1352877 (= lt!597517 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!716 (List!31640 List!31640) Bool)

(assert (=> b!1352877 (subseq!716 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92145 List!31640 List!31640 (_ BitVec 32)) Unit!44220)

(declare-fun $colon$colon!733 (List!31640 (_ BitVec 64)) List!31640)

(assert (=> b!1352877 (= lt!597520 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!733 acc!759 (select (arr!44521 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352877 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352878 () Bool)

(declare-fun res!898172 () Bool)

(assert (=> b!1352878 (=> (not res!898172) (not e!768934))))

(assert (=> b!1352878 (= res!898172 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45073 a!3742)))))

(declare-fun b!1352879 () Bool)

(declare-fun res!898174 () Bool)

(assert (=> b!1352879 (=> (not res!898174) (not e!768937))))

(assert (=> b!1352879 (= res!898174 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352880 () Bool)

(declare-fun res!898170 () Bool)

(assert (=> b!1352880 (=> (not res!898170) (not e!768934))))

(assert (=> b!1352880 (= res!898170 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45073 a!3742))))))

(declare-fun b!1352874 () Bool)

(assert (=> b!1352874 (= e!768934 e!768937)))

(declare-fun res!898166 () Bool)

(assert (=> b!1352874 (=> (not res!898166) (not e!768937))))

(assert (=> b!1352874 (= res!898166 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597518 () Unit!44220)

(assert (=> b!1352874 (= lt!597518 e!768935)))

(declare-fun c!126794 () Bool)

(assert (=> b!1352874 (= c!126794 (validKeyInArray!0 (select (arr!44521 a!3742) from!3120)))))

(declare-fun res!898171 () Bool)

(assert (=> start!114014 (=> (not res!898171) (not e!768934))))

(assert (=> start!114014 (= res!898171 (and (bvslt (size!45073 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45073 a!3742))))))

(assert (=> start!114014 e!768934))

(assert (=> start!114014 true))

(declare-fun array_inv!33754 (array!92145) Bool)

(assert (=> start!114014 (array_inv!33754 a!3742)))

(assert (= (and start!114014 res!898171) b!1352872))

(assert (= (and b!1352872 res!898173) b!1352876))

(assert (= (and b!1352876 res!898168) b!1352868))

(assert (= (and b!1352868 res!898169) b!1352875))

(assert (= (and b!1352875 res!898165) b!1352870))

(assert (= (and b!1352870 res!898175) b!1352880))

(assert (= (and b!1352880 res!898170) b!1352871))

(assert (= (and b!1352871 res!898167) b!1352878))

(assert (= (and b!1352878 res!898172) b!1352874))

(assert (= (and b!1352874 c!126794) b!1352877))

(assert (= (and b!1352874 (not c!126794)) b!1352869))

(assert (= (and b!1352874 res!898166) b!1352879))

(assert (= (and b!1352879 res!898174) b!1352873))

(declare-fun m!1239145 () Bool)

(assert (=> start!114014 m!1239145))

(declare-fun m!1239147 () Bool)

(assert (=> b!1352877 m!1239147))

(declare-fun m!1239149 () Bool)

(assert (=> b!1352877 m!1239149))

(declare-fun m!1239151 () Bool)

(assert (=> b!1352877 m!1239151))

(declare-fun m!1239153 () Bool)

(assert (=> b!1352877 m!1239153))

(declare-fun m!1239155 () Bool)

(assert (=> b!1352877 m!1239155))

(assert (=> b!1352877 m!1239149))

(assert (=> b!1352877 m!1239151))

(declare-fun m!1239157 () Bool)

(assert (=> b!1352877 m!1239157))

(declare-fun m!1239159 () Bool)

(assert (=> b!1352873 m!1239159))

(declare-fun m!1239161 () Bool)

(assert (=> b!1352873 m!1239161))

(declare-fun m!1239163 () Bool)

(assert (=> b!1352873 m!1239163))

(declare-fun m!1239165 () Bool)

(assert (=> b!1352871 m!1239165))

(assert (=> b!1352874 m!1239149))

(assert (=> b!1352874 m!1239149))

(declare-fun m!1239167 () Bool)

(assert (=> b!1352874 m!1239167))

(declare-fun m!1239169 () Bool)

(assert (=> b!1352872 m!1239169))

(assert (=> b!1352879 m!1239155))

(declare-fun m!1239171 () Bool)

(assert (=> b!1352876 m!1239171))

(declare-fun m!1239173 () Bool)

(assert (=> b!1352875 m!1239173))

(declare-fun m!1239175 () Bool)

(assert (=> b!1352870 m!1239175))

(declare-fun m!1239177 () Bool)

(assert (=> b!1352868 m!1239177))

(check-sat (not b!1352872) (not b!1352873) (not b!1352877) (not b!1352870) (not b!1352868) (not b!1352874) (not b!1352876) (not start!114014) (not b!1352879) (not b!1352871) (not b!1352875))
(check-sat)
