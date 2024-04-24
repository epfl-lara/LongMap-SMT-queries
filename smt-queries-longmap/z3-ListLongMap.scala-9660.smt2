; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114322 () Bool)

(assert start!114322)

(declare-fun b!1356234 () Bool)

(declare-fun res!900457 () Bool)

(declare-fun e!770426 () Bool)

(assert (=> b!1356234 (=> (not res!900457) (not e!770426))))

(declare-datatypes ((List!31669 0))(
  ( (Nil!31666) (Cons!31665 (h!32883 (_ BitVec 64)) (t!46319 List!31669)) )
))
(declare-fun acc!759 () List!31669)

(declare-fun noDuplicate!2212 (List!31669) Bool)

(assert (=> b!1356234 (= res!900457 (noDuplicate!2212 acc!759))))

(declare-fun b!1356235 () Bool)

(declare-fun e!770427 () Bool)

(assert (=> b!1356235 (= e!770426 e!770427)))

(declare-fun res!900468 () Bool)

(assert (=> b!1356235 (=> (not res!900468) (not e!770427))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!598905 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356235 (= res!900468 (and (not (= from!3120 i!1404)) lt!598905))))

(declare-datatypes ((Unit!44444 0))(
  ( (Unit!44445) )
))
(declare-fun lt!598907 () Unit!44444)

(declare-fun e!770428 () Unit!44444)

(assert (=> b!1356235 (= lt!598907 e!770428)))

(declare-fun c!127336 () Bool)

(assert (=> b!1356235 (= c!127336 lt!598905)))

(declare-datatypes ((array!92395 0))(
  ( (array!92396 (arr!44641 (Array (_ BitVec 32) (_ BitVec 64))) (size!45192 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92395)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356235 (= lt!598905 (validKeyInArray!0 (select (arr!44641 a!3742) from!3120)))))

(declare-fun b!1356237 () Bool)

(declare-fun e!770424 () Bool)

(assert (=> b!1356237 (= e!770427 e!770424)))

(declare-fun res!900469 () Bool)

(assert (=> b!1356237 (=> (not res!900469) (not e!770424))))

(assert (=> b!1356237 (= res!900469 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!598908 () List!31669)

(declare-fun $colon$colon!772 (List!31669 (_ BitVec 64)) List!31669)

(assert (=> b!1356237 (= lt!598908 ($colon$colon!772 acc!759 (select (arr!44641 a!3742) from!3120)))))

(declare-fun b!1356238 () Bool)

(declare-fun res!900466 () Bool)

(assert (=> b!1356238 (=> (not res!900466) (not e!770424))))

(declare-fun contains!9381 (List!31669 (_ BitVec 64)) Bool)

(assert (=> b!1356238 (= res!900466 (not (contains!9381 lt!598908 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356239 () Bool)

(declare-fun lt!598904 () Unit!44444)

(assert (=> b!1356239 (= e!770428 lt!598904)))

(declare-fun lt!598903 () Unit!44444)

(declare-fun lemmaListSubSeqRefl!0 (List!31669) Unit!44444)

(assert (=> b!1356239 (= lt!598903 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!758 (List!31669 List!31669) Bool)

(assert (=> b!1356239 (subseq!758 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92395 List!31669 List!31669 (_ BitVec 32)) Unit!44444)

(assert (=> b!1356239 (= lt!598904 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!772 acc!759 (select (arr!44641 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92395 (_ BitVec 32) List!31669) Bool)

(assert (=> b!1356239 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356240 () Bool)

(declare-fun res!900462 () Bool)

(assert (=> b!1356240 (=> (not res!900462) (not e!770424))))

(assert (=> b!1356240 (= res!900462 (noDuplicate!2212 lt!598908))))

(declare-fun b!1356241 () Bool)

(declare-fun res!900467 () Bool)

(assert (=> b!1356241 (=> (not res!900467) (not e!770424))))

(assert (=> b!1356241 (= res!900467 (not (contains!9381 lt!598908 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356242 () Bool)

(declare-fun res!900465 () Bool)

(assert (=> b!1356242 (=> (not res!900465) (not e!770424))))

(assert (=> b!1356242 (= res!900465 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598908))))

(declare-fun b!1356243 () Bool)

(declare-fun res!900460 () Bool)

(assert (=> b!1356243 (=> (not res!900460) (not e!770426))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356243 (= res!900460 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356244 () Bool)

(declare-fun res!900471 () Bool)

(assert (=> b!1356244 (=> (not res!900471) (not e!770426))))

(assert (=> b!1356244 (= res!900471 (not (contains!9381 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356245 () Bool)

(declare-fun res!900461 () Bool)

(assert (=> b!1356245 (=> (not res!900461) (not e!770426))))

(assert (=> b!1356245 (= res!900461 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356246 () Bool)

(declare-fun res!900458 () Bool)

(assert (=> b!1356246 (=> (not res!900458) (not e!770426))))

(assert (=> b!1356246 (= res!900458 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31666))))

(declare-fun b!1356247 () Bool)

(declare-fun res!900459 () Bool)

(assert (=> b!1356247 (=> (not res!900459) (not e!770426))))

(assert (=> b!1356247 (= res!900459 (not (contains!9381 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356248 () Bool)

(declare-fun Unit!44446 () Unit!44444)

(assert (=> b!1356248 (= e!770428 Unit!44446)))

(declare-fun b!1356236 () Bool)

(declare-fun res!900463 () Bool)

(assert (=> b!1356236 (=> (not res!900463) (not e!770426))))

(assert (=> b!1356236 (= res!900463 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45192 a!3742))))))

(declare-fun res!900470 () Bool)

(assert (=> start!114322 (=> (not res!900470) (not e!770426))))

(assert (=> start!114322 (= res!900470 (and (bvslt (size!45192 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45192 a!3742))))))

(assert (=> start!114322 e!770426))

(assert (=> start!114322 true))

(declare-fun array_inv!33922 (array!92395) Bool)

(assert (=> start!114322 (array_inv!33922 a!3742)))

(declare-fun b!1356249 () Bool)

(declare-fun res!900464 () Bool)

(assert (=> b!1356249 (=> (not res!900464) (not e!770426))))

(assert (=> b!1356249 (= res!900464 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45192 a!3742)))))

(declare-fun b!1356250 () Bool)

(assert (=> b!1356250 (= e!770424 (not true))))

(assert (=> b!1356250 (arrayNoDuplicates!0 (array!92396 (store (arr!44641 a!3742) i!1404 l!3587) (size!45192 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598908)))

(declare-fun lt!598906 () Unit!44444)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31669) Unit!44444)

(assert (=> b!1356250 (= lt!598906 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598908))))

(assert (= (and start!114322 res!900470) b!1356234))

(assert (= (and b!1356234 res!900457) b!1356247))

(assert (= (and b!1356247 res!900459) b!1356244))

(assert (= (and b!1356244 res!900471) b!1356246))

(assert (= (and b!1356246 res!900458) b!1356245))

(assert (= (and b!1356245 res!900461) b!1356236))

(assert (= (and b!1356236 res!900463) b!1356243))

(assert (= (and b!1356243 res!900460) b!1356249))

(assert (= (and b!1356249 res!900464) b!1356235))

(assert (= (and b!1356235 c!127336) b!1356239))

(assert (= (and b!1356235 (not c!127336)) b!1356248))

(assert (= (and b!1356235 res!900468) b!1356237))

(assert (= (and b!1356237 res!900469) b!1356240))

(assert (= (and b!1356240 res!900462) b!1356241))

(assert (= (and b!1356241 res!900467) b!1356238))

(assert (= (and b!1356238 res!900466) b!1356242))

(assert (= (and b!1356242 res!900465) b!1356250))

(declare-fun m!1242811 () Bool)

(assert (=> b!1356242 m!1242811))

(declare-fun m!1242813 () Bool)

(assert (=> b!1356235 m!1242813))

(assert (=> b!1356235 m!1242813))

(declare-fun m!1242815 () Bool)

(assert (=> b!1356235 m!1242815))

(declare-fun m!1242817 () Bool)

(assert (=> b!1356239 m!1242817))

(assert (=> b!1356239 m!1242813))

(declare-fun m!1242819 () Bool)

(assert (=> b!1356239 m!1242819))

(declare-fun m!1242821 () Bool)

(assert (=> b!1356239 m!1242821))

(declare-fun m!1242823 () Bool)

(assert (=> b!1356239 m!1242823))

(assert (=> b!1356239 m!1242813))

(assert (=> b!1356239 m!1242819))

(declare-fun m!1242825 () Bool)

(assert (=> b!1356239 m!1242825))

(declare-fun m!1242827 () Bool)

(assert (=> b!1356241 m!1242827))

(declare-fun m!1242829 () Bool)

(assert (=> b!1356238 m!1242829))

(assert (=> b!1356237 m!1242813))

(assert (=> b!1356237 m!1242813))

(assert (=> b!1356237 m!1242819))

(declare-fun m!1242831 () Bool)

(assert (=> b!1356244 m!1242831))

(declare-fun m!1242833 () Bool)

(assert (=> b!1356234 m!1242833))

(declare-fun m!1242835 () Bool)

(assert (=> b!1356246 m!1242835))

(declare-fun m!1242837 () Bool)

(assert (=> b!1356240 m!1242837))

(declare-fun m!1242839 () Bool)

(assert (=> b!1356243 m!1242839))

(declare-fun m!1242841 () Bool)

(assert (=> start!114322 m!1242841))

(declare-fun m!1242843 () Bool)

(assert (=> b!1356245 m!1242843))

(declare-fun m!1242845 () Bool)

(assert (=> b!1356250 m!1242845))

(declare-fun m!1242847 () Bool)

(assert (=> b!1356250 m!1242847))

(declare-fun m!1242849 () Bool)

(assert (=> b!1356250 m!1242849))

(declare-fun m!1242851 () Bool)

(assert (=> b!1356247 m!1242851))

(check-sat (not b!1356242) (not b!1356237) (not b!1356238) (not b!1356243) (not b!1356245) (not b!1356247) (not b!1356244) (not b!1356239) (not b!1356241) (not start!114322) (not b!1356246) (not b!1356235) (not b!1356240) (not b!1356234) (not b!1356250))
(check-sat)
