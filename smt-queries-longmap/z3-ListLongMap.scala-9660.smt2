; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114100 () Bool)

(assert start!114100)

(declare-fun b!1354986 () Bool)

(declare-fun res!899993 () Bool)

(declare-fun e!769596 () Bool)

(assert (=> b!1354986 (=> (not res!899993) (not e!769596))))

(declare-datatypes ((List!31630 0))(
  ( (Nil!31627) (Cons!31626 (h!32835 (_ BitVec 64)) (t!46288 List!31630)) )
))
(declare-fun lt!598450 () List!31630)

(declare-fun contains!9339 (List!31630 (_ BitVec 64)) Bool)

(assert (=> b!1354986 (= res!899993 (not (contains!9339 lt!598450 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354987 () Bool)

(declare-fun res!899987 () Bool)

(assert (=> b!1354987 (=> (not res!899987) (not e!769596))))

(declare-fun noDuplicate!2196 (List!31630) Bool)

(assert (=> b!1354987 (= res!899987 (noDuplicate!2196 lt!598450))))

(declare-fun b!1354988 () Bool)

(declare-fun res!899988 () Bool)

(declare-fun e!769600 () Bool)

(assert (=> b!1354988 (=> (not res!899988) (not e!769600))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92282 0))(
  ( (array!92283 (arr!44589 (Array (_ BitVec 32) (_ BitVec 64))) (size!45139 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92282)

(assert (=> b!1354988 (= res!899988 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45139 a!3742))))))

(declare-fun b!1354989 () Bool)

(declare-fun e!769597 () Bool)

(assert (=> b!1354989 (= e!769600 e!769597)))

(declare-fun res!899989 () Bool)

(assert (=> b!1354989 (=> (not res!899989) (not e!769597))))

(declare-fun lt!598447 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1354989 (= res!899989 (and (not (= from!3120 i!1404)) lt!598447))))

(declare-datatypes ((Unit!44508 0))(
  ( (Unit!44509) )
))
(declare-fun lt!598448 () Unit!44508)

(declare-fun e!769599 () Unit!44508)

(assert (=> b!1354989 (= lt!598448 e!769599)))

(declare-fun c!126941 () Bool)

(assert (=> b!1354989 (= c!126941 lt!598447)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354989 (= lt!598447 (validKeyInArray!0 (select (arr!44589 a!3742) from!3120)))))

(declare-fun b!1354990 () Bool)

(declare-fun res!899985 () Bool)

(assert (=> b!1354990 (=> (not res!899985) (not e!769600))))

(declare-fun acc!759 () List!31630)

(assert (=> b!1354990 (= res!899985 (noDuplicate!2196 acc!759))))

(declare-fun res!899998 () Bool)

(assert (=> start!114100 (=> (not res!899998) (not e!769600))))

(assert (=> start!114100 (= res!899998 (and (bvslt (size!45139 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45139 a!3742))))))

(assert (=> start!114100 e!769600))

(assert (=> start!114100 true))

(declare-fun array_inv!33617 (array!92282) Bool)

(assert (=> start!114100 (array_inv!33617 a!3742)))

(declare-fun b!1354991 () Bool)

(declare-fun res!899995 () Bool)

(assert (=> b!1354991 (=> (not res!899995) (not e!769600))))

(declare-fun arrayNoDuplicates!0 (array!92282 (_ BitVec 32) List!31630) Bool)

(assert (=> b!1354991 (= res!899995 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31627))))

(declare-fun b!1354992 () Bool)

(declare-fun res!899996 () Bool)

(assert (=> b!1354992 (=> (not res!899996) (not e!769600))))

(assert (=> b!1354992 (= res!899996 (not (contains!9339 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354993 () Bool)

(declare-fun res!899984 () Bool)

(assert (=> b!1354993 (=> (not res!899984) (not e!769596))))

(assert (=> b!1354993 (= res!899984 (not (contains!9339 lt!598450 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354994 () Bool)

(declare-fun lt!598445 () Unit!44508)

(assert (=> b!1354994 (= e!769599 lt!598445)))

(declare-fun lt!598446 () Unit!44508)

(declare-fun lemmaListSubSeqRefl!0 (List!31630) Unit!44508)

(assert (=> b!1354994 (= lt!598446 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!759 (List!31630 List!31630) Bool)

(assert (=> b!1354994 (subseq!759 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92282 List!31630 List!31630 (_ BitVec 32)) Unit!44508)

(declare-fun $colon$colon!774 (List!31630 (_ BitVec 64)) List!31630)

(assert (=> b!1354994 (= lt!598445 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!774 acc!759 (select (arr!44589 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354994 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354995 () Bool)

(assert (=> b!1354995 (= e!769596 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354995 (arrayNoDuplicates!0 (array!92283 (store (arr!44589 a!3742) i!1404 l!3587) (size!45139 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598450)))

(declare-fun lt!598449 () Unit!44508)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92282 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31630) Unit!44508)

(assert (=> b!1354995 (= lt!598449 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598450))))

(declare-fun b!1354996 () Bool)

(declare-fun res!899990 () Bool)

(assert (=> b!1354996 (=> (not res!899990) (not e!769596))))

(assert (=> b!1354996 (= res!899990 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598450))))

(declare-fun b!1354997 () Bool)

(declare-fun res!899991 () Bool)

(assert (=> b!1354997 (=> (not res!899991) (not e!769600))))

(assert (=> b!1354997 (= res!899991 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45139 a!3742)))))

(declare-fun b!1354998 () Bool)

(declare-fun res!899992 () Bool)

(assert (=> b!1354998 (=> (not res!899992) (not e!769600))))

(assert (=> b!1354998 (= res!899992 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354999 () Bool)

(declare-fun Unit!44510 () Unit!44508)

(assert (=> b!1354999 (= e!769599 Unit!44510)))

(declare-fun b!1355000 () Bool)

(declare-fun res!899997 () Bool)

(assert (=> b!1355000 (=> (not res!899997) (not e!769600))))

(assert (=> b!1355000 (= res!899997 (not (contains!9339 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355001 () Bool)

(declare-fun res!899986 () Bool)

(assert (=> b!1355001 (=> (not res!899986) (not e!769600))))

(assert (=> b!1355001 (= res!899986 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355002 () Bool)

(assert (=> b!1355002 (= e!769597 e!769596)))

(declare-fun res!899994 () Bool)

(assert (=> b!1355002 (=> (not res!899994) (not e!769596))))

(assert (=> b!1355002 (= res!899994 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1355002 (= lt!598450 ($colon$colon!774 acc!759 (select (arr!44589 a!3742) from!3120)))))

(assert (= (and start!114100 res!899998) b!1354990))

(assert (= (and b!1354990 res!899985) b!1355000))

(assert (= (and b!1355000 res!899997) b!1354992))

(assert (= (and b!1354992 res!899996) b!1354991))

(assert (= (and b!1354991 res!899995) b!1355001))

(assert (= (and b!1355001 res!899986) b!1354988))

(assert (= (and b!1354988 res!899988) b!1354998))

(assert (= (and b!1354998 res!899992) b!1354997))

(assert (= (and b!1354997 res!899991) b!1354989))

(assert (= (and b!1354989 c!126941) b!1354994))

(assert (= (and b!1354989 (not c!126941)) b!1354999))

(assert (= (and b!1354989 res!899989) b!1355002))

(assert (= (and b!1355002 res!899994) b!1354987))

(assert (= (and b!1354987 res!899987) b!1354986))

(assert (= (and b!1354986 res!899993) b!1354993))

(assert (= (and b!1354993 res!899984) b!1354996))

(assert (= (and b!1354996 res!899990) b!1354995))

(declare-fun m!1241257 () Bool)

(assert (=> b!1354990 m!1241257))

(declare-fun m!1241259 () Bool)

(assert (=> start!114100 m!1241259))

(declare-fun m!1241261 () Bool)

(assert (=> b!1354994 m!1241261))

(declare-fun m!1241263 () Bool)

(assert (=> b!1354994 m!1241263))

(declare-fun m!1241265 () Bool)

(assert (=> b!1354994 m!1241265))

(declare-fun m!1241267 () Bool)

(assert (=> b!1354994 m!1241267))

(declare-fun m!1241269 () Bool)

(assert (=> b!1354994 m!1241269))

(assert (=> b!1354994 m!1241263))

(assert (=> b!1354994 m!1241265))

(declare-fun m!1241271 () Bool)

(assert (=> b!1354994 m!1241271))

(assert (=> b!1355002 m!1241263))

(assert (=> b!1355002 m!1241263))

(assert (=> b!1355002 m!1241265))

(declare-fun m!1241273 () Bool)

(assert (=> b!1355000 m!1241273))

(declare-fun m!1241275 () Bool)

(assert (=> b!1354996 m!1241275))

(declare-fun m!1241277 () Bool)

(assert (=> b!1354995 m!1241277))

(declare-fun m!1241279 () Bool)

(assert (=> b!1354995 m!1241279))

(declare-fun m!1241281 () Bool)

(assert (=> b!1354995 m!1241281))

(assert (=> b!1354989 m!1241263))

(assert (=> b!1354989 m!1241263))

(declare-fun m!1241283 () Bool)

(assert (=> b!1354989 m!1241283))

(declare-fun m!1241285 () Bool)

(assert (=> b!1354987 m!1241285))

(declare-fun m!1241287 () Bool)

(assert (=> b!1354993 m!1241287))

(declare-fun m!1241289 () Bool)

(assert (=> b!1354991 m!1241289))

(declare-fun m!1241291 () Bool)

(assert (=> b!1355001 m!1241291))

(declare-fun m!1241293 () Bool)

(assert (=> b!1354992 m!1241293))

(declare-fun m!1241295 () Bool)

(assert (=> b!1354986 m!1241295))

(declare-fun m!1241297 () Bool)

(assert (=> b!1354998 m!1241297))

(check-sat (not b!1354996) (not b!1354989) (not b!1354986) (not b!1354987) (not b!1354993) (not b!1354991) (not b!1354995) (not b!1354990) (not start!114100) (not b!1354994) (not b!1355001) (not b!1355002) (not b!1354998) (not b!1354992) (not b!1355000))
(check-sat)
