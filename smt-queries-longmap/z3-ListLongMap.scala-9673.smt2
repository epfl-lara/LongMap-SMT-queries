; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114176 () Bool)

(assert start!114176)

(declare-fun b!1356333 () Bool)

(declare-fun res!901148 () Bool)

(declare-fun e!770025 () Bool)

(assert (=> b!1356333 (=> (not res!901148) (not e!770025))))

(declare-datatypes ((List!31721 0))(
  ( (Nil!31718) (Cons!31717 (h!32926 (_ BitVec 64)) (t!46371 List!31721)) )
))
(declare-fun acc!759 () List!31721)

(declare-datatypes ((array!92307 0))(
  ( (array!92308 (arr!44602 (Array (_ BitVec 32) (_ BitVec 64))) (size!45154 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92307)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92307 (_ BitVec 32) List!31721) Bool)

(assert (=> b!1356333 (= res!901148 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356334 () Bool)

(declare-datatypes ((Unit!44463 0))(
  ( (Unit!44464) )
))
(declare-fun e!770023 () Unit!44463)

(declare-fun Unit!44465 () Unit!44463)

(assert (=> b!1356334 (= e!770023 Unit!44465)))

(declare-fun b!1356335 () Bool)

(declare-fun res!901153 () Bool)

(assert (=> b!1356335 (=> (not res!901153) (not e!770025))))

(declare-fun contains!9341 (List!31721 (_ BitVec 64)) Bool)

(assert (=> b!1356335 (= res!901153 (not (contains!9341 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356336 () Bool)

(declare-fun res!901151 () Bool)

(assert (=> b!1356336 (=> (not res!901151) (not e!770025))))

(assert (=> b!1356336 (= res!901151 (not (contains!9341 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356337 () Bool)

(declare-fun res!901150 () Bool)

(assert (=> b!1356337 (=> (not res!901150) (not e!770025))))

(declare-fun noDuplicate!2256 (List!31721) Bool)

(assert (=> b!1356337 (= res!901150 (noDuplicate!2256 acc!759))))

(declare-fun b!1356339 () Bool)

(declare-fun e!770026 () Bool)

(assert (=> b!1356339 (= e!770025 e!770026)))

(declare-fun res!901147 () Bool)

(assert (=> b!1356339 (=> (not res!901147) (not e!770026))))

(declare-fun lt!598837 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356339 (= res!901147 (and (not (= from!3120 i!1404)) (not lt!598837) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598836 () Unit!44463)

(assert (=> b!1356339 (= lt!598836 e!770023)))

(declare-fun c!127037 () Bool)

(assert (=> b!1356339 (= c!127037 lt!598837)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356339 (= lt!598837 (validKeyInArray!0 (select (arr!44602 a!3742) from!3120)))))

(declare-fun b!1356340 () Bool)

(assert (=> b!1356340 (= e!770026 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356340 (arrayNoDuplicates!0 (array!92308 (store (arr!44602 a!3742) i!1404 l!3587) (size!45154 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598835 () Unit!44463)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92307 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31721) Unit!44463)

(assert (=> b!1356340 (= lt!598835 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356341 () Bool)

(declare-fun res!901145 () Bool)

(assert (=> b!1356341 (=> (not res!901145) (not e!770026))))

(assert (=> b!1356341 (= res!901145 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356342 () Bool)

(declare-fun res!901152 () Bool)

(assert (=> b!1356342 (=> (not res!901152) (not e!770025))))

(assert (=> b!1356342 (= res!901152 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31718))))

(declare-fun b!1356343 () Bool)

(declare-fun res!901144 () Bool)

(assert (=> b!1356343 (=> (not res!901144) (not e!770025))))

(assert (=> b!1356343 (= res!901144 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45154 a!3742)))))

(declare-fun res!901154 () Bool)

(assert (=> start!114176 (=> (not res!901154) (not e!770025))))

(assert (=> start!114176 (= res!901154 (and (bvslt (size!45154 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45154 a!3742))))))

(assert (=> start!114176 e!770025))

(assert (=> start!114176 true))

(declare-fun array_inv!33835 (array!92307) Bool)

(assert (=> start!114176 (array_inv!33835 a!3742)))

(declare-fun b!1356338 () Bool)

(declare-fun res!901149 () Bool)

(assert (=> b!1356338 (=> (not res!901149) (not e!770025))))

(assert (=> b!1356338 (= res!901149 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45154 a!3742))))))

(declare-fun b!1356344 () Bool)

(declare-fun res!901146 () Bool)

(assert (=> b!1356344 (=> (not res!901146) (not e!770025))))

(assert (=> b!1356344 (= res!901146 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356345 () Bool)

(declare-fun lt!598834 () Unit!44463)

(assert (=> b!1356345 (= e!770023 lt!598834)))

(declare-fun lt!598833 () Unit!44463)

(declare-fun lemmaListSubSeqRefl!0 (List!31721) Unit!44463)

(assert (=> b!1356345 (= lt!598833 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!797 (List!31721 List!31721) Bool)

(assert (=> b!1356345 (subseq!797 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92307 List!31721 List!31721 (_ BitVec 32)) Unit!44463)

(declare-fun $colon$colon!814 (List!31721 (_ BitVec 64)) List!31721)

(assert (=> b!1356345 (= lt!598834 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!814 acc!759 (select (arr!44602 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356345 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114176 res!901154) b!1356337))

(assert (= (and b!1356337 res!901150) b!1356336))

(assert (= (and b!1356336 res!901151) b!1356335))

(assert (= (and b!1356335 res!901153) b!1356342))

(assert (= (and b!1356342 res!901152) b!1356333))

(assert (= (and b!1356333 res!901148) b!1356338))

(assert (= (and b!1356338 res!901149) b!1356344))

(assert (= (and b!1356344 res!901146) b!1356343))

(assert (= (and b!1356343 res!901144) b!1356339))

(assert (= (and b!1356339 c!127037) b!1356345))

(assert (= (and b!1356339 (not c!127037)) b!1356334))

(assert (= (and b!1356339 res!901147) b!1356341))

(assert (= (and b!1356341 res!901145) b!1356340))

(declare-fun m!1241887 () Bool)

(assert (=> b!1356341 m!1241887))

(declare-fun m!1241889 () Bool)

(assert (=> b!1356344 m!1241889))

(declare-fun m!1241891 () Bool)

(assert (=> b!1356337 m!1241891))

(declare-fun m!1241893 () Bool)

(assert (=> b!1356345 m!1241893))

(declare-fun m!1241895 () Bool)

(assert (=> b!1356345 m!1241895))

(declare-fun m!1241897 () Bool)

(assert (=> b!1356345 m!1241897))

(declare-fun m!1241899 () Bool)

(assert (=> b!1356345 m!1241899))

(assert (=> b!1356345 m!1241887))

(assert (=> b!1356345 m!1241895))

(assert (=> b!1356345 m!1241897))

(declare-fun m!1241901 () Bool)

(assert (=> b!1356345 m!1241901))

(declare-fun m!1241903 () Bool)

(assert (=> b!1356342 m!1241903))

(declare-fun m!1241905 () Bool)

(assert (=> start!114176 m!1241905))

(declare-fun m!1241907 () Bool)

(assert (=> b!1356333 m!1241907))

(assert (=> b!1356339 m!1241895))

(assert (=> b!1356339 m!1241895))

(declare-fun m!1241909 () Bool)

(assert (=> b!1356339 m!1241909))

(declare-fun m!1241911 () Bool)

(assert (=> b!1356340 m!1241911))

(declare-fun m!1241913 () Bool)

(assert (=> b!1356340 m!1241913))

(declare-fun m!1241915 () Bool)

(assert (=> b!1356340 m!1241915))

(declare-fun m!1241917 () Bool)

(assert (=> b!1356336 m!1241917))

(declare-fun m!1241919 () Bool)

(assert (=> b!1356335 m!1241919))

(check-sat (not b!1356342) (not b!1356337) (not start!114176) (not b!1356344) (not b!1356333) (not b!1356336) (not b!1356335) (not b!1356341) (not b!1356345) (not b!1356340) (not b!1356339))
(check-sat)
