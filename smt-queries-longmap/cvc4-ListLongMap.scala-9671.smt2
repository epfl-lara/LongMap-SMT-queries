; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114168 () Bool)

(assert start!114168)

(declare-fun b!1356247 () Bool)

(declare-fun res!901041 () Bool)

(declare-fun e!770010 () Bool)

(assert (=> b!1356247 (=> (not res!901041) (not e!770010))))

(declare-datatypes ((List!31664 0))(
  ( (Nil!31661) (Cons!31660 (h!32869 (_ BitVec 64)) (t!46322 List!31664)) )
))
(declare-fun acc!759 () List!31664)

(declare-datatypes ((array!92350 0))(
  ( (array!92351 (arr!44623 (Array (_ BitVec 32) (_ BitVec 64))) (size!45173 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92350)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92350 (_ BitVec 32) List!31664) Bool)

(assert (=> b!1356247 (= res!901041 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356248 () Bool)

(declare-fun res!901050 () Bool)

(assert (=> b!1356248 (=> (not res!901050) (not e!770010))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356248 (= res!901050 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356249 () Bool)

(declare-fun res!901044 () Bool)

(declare-fun e!770011 () Bool)

(assert (=> b!1356249 (=> (not res!901044) (not e!770011))))

(assert (=> b!1356249 (= res!901044 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356250 () Bool)

(assert (=> b!1356250 (= e!770010 e!770011)))

(declare-fun res!901042 () Bool)

(assert (=> b!1356250 (=> (not res!901042) (not e!770011))))

(declare-fun lt!598963 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356250 (= res!901042 (and (not (= from!3120 i!1404)) (not lt!598963) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44610 0))(
  ( (Unit!44611) )
))
(declare-fun lt!598959 () Unit!44610)

(declare-fun e!770009 () Unit!44610)

(assert (=> b!1356250 (= lt!598959 e!770009)))

(declare-fun c!127043 () Bool)

(assert (=> b!1356250 (= c!127043 lt!598963)))

(assert (=> b!1356250 (= lt!598963 (validKeyInArray!0 (select (arr!44623 a!3742) from!3120)))))

(declare-fun b!1356251 () Bool)

(declare-fun res!901046 () Bool)

(assert (=> b!1356251 (=> (not res!901046) (not e!770010))))

(assert (=> b!1356251 (= res!901046 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45173 a!3742))))))

(declare-fun b!1356252 () Bool)

(declare-fun res!901051 () Bool)

(assert (=> b!1356252 (=> (not res!901051) (not e!770010))))

(declare-fun noDuplicate!2230 (List!31664) Bool)

(assert (=> b!1356252 (= res!901051 (noDuplicate!2230 acc!759))))

(declare-fun b!1356253 () Bool)

(declare-fun res!901048 () Bool)

(assert (=> b!1356253 (=> (not res!901048) (not e!770010))))

(declare-fun contains!9373 (List!31664 (_ BitVec 64)) Bool)

(assert (=> b!1356253 (= res!901048 (not (contains!9373 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356254 () Bool)

(declare-fun Unit!44612 () Unit!44610)

(assert (=> b!1356254 (= e!770009 Unit!44612)))

(declare-fun b!1356255 () Bool)

(declare-fun res!901043 () Bool)

(assert (=> b!1356255 (=> (not res!901043) (not e!770010))))

(assert (=> b!1356255 (= res!901043 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45173 a!3742)))))

(declare-fun b!1356256 () Bool)

(assert (=> b!1356256 (= e!770011 (not true))))

(assert (=> b!1356256 (arrayNoDuplicates!0 (array!92351 (store (arr!44623 a!3742) i!1404 l!3587) (size!45173 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598962 () Unit!44610)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31664) Unit!44610)

(assert (=> b!1356256 (= lt!598962 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356258 () Bool)

(declare-fun lt!598961 () Unit!44610)

(assert (=> b!1356258 (= e!770009 lt!598961)))

(declare-fun lt!598960 () Unit!44610)

(declare-fun lemmaListSubSeqRefl!0 (List!31664) Unit!44610)

(assert (=> b!1356258 (= lt!598960 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!793 (List!31664 List!31664) Bool)

(assert (=> b!1356258 (subseq!793 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92350 List!31664 List!31664 (_ BitVec 32)) Unit!44610)

(declare-fun $colon$colon!808 (List!31664 (_ BitVec 64)) List!31664)

(assert (=> b!1356258 (= lt!598961 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!808 acc!759 (select (arr!44623 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356258 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356259 () Bool)

(declare-fun res!901049 () Bool)

(assert (=> b!1356259 (=> (not res!901049) (not e!770010))))

(assert (=> b!1356259 (= res!901049 (not (contains!9373 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356257 () Bool)

(declare-fun res!901045 () Bool)

(assert (=> b!1356257 (=> (not res!901045) (not e!770010))))

(assert (=> b!1356257 (= res!901045 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31661))))

(declare-fun res!901047 () Bool)

(assert (=> start!114168 (=> (not res!901047) (not e!770010))))

(assert (=> start!114168 (= res!901047 (and (bvslt (size!45173 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45173 a!3742))))))

(assert (=> start!114168 e!770010))

(assert (=> start!114168 true))

(declare-fun array_inv!33651 (array!92350) Bool)

(assert (=> start!114168 (array_inv!33651 a!3742)))

(assert (= (and start!114168 res!901047) b!1356252))

(assert (= (and b!1356252 res!901051) b!1356259))

(assert (= (and b!1356259 res!901049) b!1356253))

(assert (= (and b!1356253 res!901048) b!1356257))

(assert (= (and b!1356257 res!901045) b!1356247))

(assert (= (and b!1356247 res!901041) b!1356251))

(assert (= (and b!1356251 res!901046) b!1356248))

(assert (= (and b!1356248 res!901050) b!1356255))

(assert (= (and b!1356255 res!901043) b!1356250))

(assert (= (and b!1356250 c!127043) b!1356258))

(assert (= (and b!1356250 (not c!127043)) b!1356254))

(assert (= (and b!1356250 res!901042) b!1356249))

(assert (= (and b!1356249 res!901044) b!1356256))

(declare-fun m!1242267 () Bool)

(assert (=> b!1356256 m!1242267))

(declare-fun m!1242269 () Bool)

(assert (=> b!1356256 m!1242269))

(declare-fun m!1242271 () Bool)

(assert (=> b!1356256 m!1242271))

(declare-fun m!1242273 () Bool)

(assert (=> start!114168 m!1242273))

(declare-fun m!1242275 () Bool)

(assert (=> b!1356253 m!1242275))

(declare-fun m!1242277 () Bool)

(assert (=> b!1356249 m!1242277))

(declare-fun m!1242279 () Bool)

(assert (=> b!1356257 m!1242279))

(declare-fun m!1242281 () Bool)

(assert (=> b!1356258 m!1242281))

(declare-fun m!1242283 () Bool)

(assert (=> b!1356258 m!1242283))

(declare-fun m!1242285 () Bool)

(assert (=> b!1356258 m!1242285))

(declare-fun m!1242287 () Bool)

(assert (=> b!1356258 m!1242287))

(assert (=> b!1356258 m!1242277))

(assert (=> b!1356258 m!1242283))

(assert (=> b!1356258 m!1242285))

(declare-fun m!1242289 () Bool)

(assert (=> b!1356258 m!1242289))

(assert (=> b!1356250 m!1242283))

(assert (=> b!1356250 m!1242283))

(declare-fun m!1242291 () Bool)

(assert (=> b!1356250 m!1242291))

(declare-fun m!1242293 () Bool)

(assert (=> b!1356247 m!1242293))

(declare-fun m!1242295 () Bool)

(assert (=> b!1356248 m!1242295))

(declare-fun m!1242297 () Bool)

(assert (=> b!1356252 m!1242297))

(declare-fun m!1242299 () Bool)

(assert (=> b!1356259 m!1242299))

(push 1)

(assert (not b!1356247))

