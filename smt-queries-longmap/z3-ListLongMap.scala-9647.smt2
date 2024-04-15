; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114020 () Bool)

(assert start!114020)

(declare-fun b!1352985 () Bool)

(declare-datatypes ((Unit!44229 0))(
  ( (Unit!44230) )
))
(declare-fun e!768973 () Unit!44229)

(declare-fun Unit!44231 () Unit!44229)

(assert (=> b!1352985 (= e!768973 Unit!44231)))

(declare-fun b!1352986 () Bool)

(declare-fun res!898271 () Bool)

(declare-fun e!768972 () Bool)

(assert (=> b!1352986 (=> (not res!898271) (not e!768972))))

(declare-datatypes ((List!31643 0))(
  ( (Nil!31640) (Cons!31639 (h!32848 (_ BitVec 64)) (t!46293 List!31643)) )
))
(declare-fun acc!759 () List!31643)

(declare-datatypes ((array!92151 0))(
  ( (array!92152 (arr!44524 (Array (_ BitVec 32) (_ BitVec 64))) (size!45076 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92151)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92151 (_ BitVec 32) List!31643) Bool)

(assert (=> b!1352986 (= res!898271 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352987 () Bool)

(declare-fun res!898264 () Bool)

(assert (=> b!1352987 (=> (not res!898264) (not e!768972))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352987 (= res!898264 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45076 a!3742))))))

(declare-fun b!1352988 () Bool)

(declare-fun res!898266 () Bool)

(assert (=> b!1352988 (=> (not res!898266) (not e!768972))))

(assert (=> b!1352988 (= res!898266 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45076 a!3742)))))

(declare-fun b!1352989 () Bool)

(declare-fun res!898265 () Bool)

(assert (=> b!1352989 (=> (not res!898265) (not e!768972))))

(declare-fun noDuplicate!2178 (List!31643) Bool)

(assert (=> b!1352989 (= res!898265 (noDuplicate!2178 acc!759))))

(declare-fun b!1352990 () Bool)

(declare-fun e!768970 () Bool)

(assert (=> b!1352990 (= e!768970 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352990 (arrayNoDuplicates!0 (array!92152 (store (arr!44524 a!3742) i!1404 l!3587) (size!45076 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597553 () Unit!44229)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31643) Unit!44229)

(assert (=> b!1352990 (= lt!597553 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352991 () Bool)

(declare-fun lt!597556 () Unit!44229)

(assert (=> b!1352991 (= e!768973 lt!597556)))

(declare-fun lt!597554 () Unit!44229)

(declare-fun lemmaListSubSeqRefl!0 (List!31643) Unit!44229)

(assert (=> b!1352991 (= lt!597554 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!719 (List!31643 List!31643) Bool)

(assert (=> b!1352991 (subseq!719 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92151 List!31643 List!31643 (_ BitVec 32)) Unit!44229)

(declare-fun $colon$colon!736 (List!31643 (_ BitVec 64)) List!31643)

(assert (=> b!1352991 (= lt!597556 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!736 acc!759 (select (arr!44524 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352991 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352992 () Bool)

(declare-fun res!898274 () Bool)

(assert (=> b!1352992 (=> (not res!898274) (not e!768972))))

(declare-fun contains!9263 (List!31643 (_ BitVec 64)) Bool)

(assert (=> b!1352992 (= res!898274 (not (contains!9263 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352993 () Bool)

(declare-fun res!898268 () Bool)

(assert (=> b!1352993 (=> (not res!898268) (not e!768972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352993 (= res!898268 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352994 () Bool)

(declare-fun res!898270 () Bool)

(assert (=> b!1352994 (=> (not res!898270) (not e!768972))))

(assert (=> b!1352994 (= res!898270 (not (contains!9263 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352995 () Bool)

(declare-fun res!898269 () Bool)

(assert (=> b!1352995 (=> (not res!898269) (not e!768970))))

(assert (=> b!1352995 (= res!898269 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!898272 () Bool)

(assert (=> start!114020 (=> (not res!898272) (not e!768972))))

(assert (=> start!114020 (= res!898272 (and (bvslt (size!45076 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45076 a!3742))))))

(assert (=> start!114020 e!768972))

(assert (=> start!114020 true))

(declare-fun array_inv!33757 (array!92151) Bool)

(assert (=> start!114020 (array_inv!33757 a!3742)))

(declare-fun b!1352996 () Bool)

(assert (=> b!1352996 (= e!768972 e!768970)))

(declare-fun res!898267 () Bool)

(assert (=> b!1352996 (=> (not res!898267) (not e!768970))))

(assert (=> b!1352996 (= res!898267 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597555 () Unit!44229)

(assert (=> b!1352996 (= lt!597555 e!768973)))

(declare-fun c!126803 () Bool)

(assert (=> b!1352996 (= c!126803 (validKeyInArray!0 (select (arr!44524 a!3742) from!3120)))))

(declare-fun b!1352997 () Bool)

(declare-fun res!898273 () Bool)

(assert (=> b!1352997 (=> (not res!898273) (not e!768972))))

(assert (=> b!1352997 (= res!898273 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31640))))

(assert (= (and start!114020 res!898272) b!1352989))

(assert (= (and b!1352989 res!898265) b!1352992))

(assert (= (and b!1352992 res!898274) b!1352994))

(assert (= (and b!1352994 res!898270) b!1352997))

(assert (= (and b!1352997 res!898273) b!1352986))

(assert (= (and b!1352986 res!898271) b!1352987))

(assert (= (and b!1352987 res!898264) b!1352993))

(assert (= (and b!1352993 res!898268) b!1352988))

(assert (= (and b!1352988 res!898266) b!1352996))

(assert (= (and b!1352996 c!126803) b!1352991))

(assert (= (and b!1352996 (not c!126803)) b!1352985))

(assert (= (and b!1352996 res!898267) b!1352995))

(assert (= (and b!1352995 res!898269) b!1352990))

(declare-fun m!1239247 () Bool)

(assert (=> start!114020 m!1239247))

(declare-fun m!1239249 () Bool)

(assert (=> b!1352996 m!1239249))

(assert (=> b!1352996 m!1239249))

(declare-fun m!1239251 () Bool)

(assert (=> b!1352996 m!1239251))

(declare-fun m!1239253 () Bool)

(assert (=> b!1352989 m!1239253))

(declare-fun m!1239255 () Bool)

(assert (=> b!1352993 m!1239255))

(declare-fun m!1239257 () Bool)

(assert (=> b!1352986 m!1239257))

(declare-fun m!1239259 () Bool)

(assert (=> b!1352997 m!1239259))

(declare-fun m!1239261 () Bool)

(assert (=> b!1352995 m!1239261))

(declare-fun m!1239263 () Bool)

(assert (=> b!1352992 m!1239263))

(declare-fun m!1239265 () Bool)

(assert (=> b!1352991 m!1239265))

(assert (=> b!1352991 m!1239249))

(declare-fun m!1239267 () Bool)

(assert (=> b!1352991 m!1239267))

(declare-fun m!1239269 () Bool)

(assert (=> b!1352991 m!1239269))

(assert (=> b!1352991 m!1239261))

(assert (=> b!1352991 m!1239249))

(assert (=> b!1352991 m!1239267))

(declare-fun m!1239271 () Bool)

(assert (=> b!1352991 m!1239271))

(declare-fun m!1239273 () Bool)

(assert (=> b!1352994 m!1239273))

(declare-fun m!1239275 () Bool)

(assert (=> b!1352990 m!1239275))

(declare-fun m!1239277 () Bool)

(assert (=> b!1352990 m!1239277))

(declare-fun m!1239279 () Bool)

(assert (=> b!1352990 m!1239279))

(check-sat (not b!1352994) (not b!1352997) (not b!1352993) (not b!1352995) (not b!1352986) (not start!114020) (not b!1352996) (not b!1352989) (not b!1352991) (not b!1352990) (not b!1352992))
(check-sat)
