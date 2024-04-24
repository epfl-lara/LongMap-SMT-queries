; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114238 () Bool)

(assert start!114238)

(declare-fun b!1354237 () Bool)

(declare-fun res!898716 () Bool)

(declare-fun e!769810 () Bool)

(assert (=> b!1354237 (=> (not res!898716) (not e!769810))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354237 (= res!898716 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354238 () Bool)

(declare-fun res!898715 () Bool)

(assert (=> b!1354238 (=> (not res!898715) (not e!769810))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92311 0))(
  ( (array!92312 (arr!44599 (Array (_ BitVec 32) (_ BitVec 64))) (size!45150 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92311)

(assert (=> b!1354238 (= res!898715 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45150 a!3742)))))

(declare-fun b!1354239 () Bool)

(declare-fun e!769812 () Bool)

(assert (=> b!1354239 (= e!769812 (not true))))

(declare-datatypes ((List!31627 0))(
  ( (Nil!31624) (Cons!31623 (h!32841 (_ BitVec 64)) (t!46277 List!31627)) )
))
(declare-fun acc!759 () List!31627)

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92311 (_ BitVec 32) List!31627) Bool)

(assert (=> b!1354239 (arrayNoDuplicates!0 (array!92312 (store (arr!44599 a!3742) i!1404 l!3587) (size!45150 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44318 0))(
  ( (Unit!44319) )
))
(declare-fun lt!598180 () Unit!44318)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31627) Unit!44318)

(assert (=> b!1354239 (= lt!598180 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1354240 () Bool)

(declare-fun res!898714 () Bool)

(assert (=> b!1354240 (=> (not res!898714) (not e!769810))))

(assert (=> b!1354240 (= res!898714 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31624))))

(declare-fun b!1354241 () Bool)

(declare-fun res!898722 () Bool)

(assert (=> b!1354241 (=> (not res!898722) (not e!769810))))

(assert (=> b!1354241 (= res!898722 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45150 a!3742))))))

(declare-fun b!1354242 () Bool)

(declare-fun res!898720 () Bool)

(assert (=> b!1354242 (=> (not res!898720) (not e!769810))))

(declare-fun contains!9339 (List!31627 (_ BitVec 64)) Bool)

(assert (=> b!1354242 (= res!898720 (not (contains!9339 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354243 () Bool)

(declare-fun e!769811 () Unit!44318)

(declare-fun Unit!44320 () Unit!44318)

(assert (=> b!1354243 (= e!769811 Unit!44320)))

(declare-fun res!898717 () Bool)

(assert (=> start!114238 (=> (not res!898717) (not e!769810))))

(assert (=> start!114238 (= res!898717 (and (bvslt (size!45150 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45150 a!3742))))))

(assert (=> start!114238 e!769810))

(assert (=> start!114238 true))

(declare-fun array_inv!33880 (array!92311) Bool)

(assert (=> start!114238 (array_inv!33880 a!3742)))

(declare-fun b!1354244 () Bool)

(declare-fun res!898713 () Bool)

(assert (=> b!1354244 (=> (not res!898713) (not e!769810))))

(assert (=> b!1354244 (= res!898713 (not (contains!9339 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354245 () Bool)

(declare-fun res!898719 () Bool)

(assert (=> b!1354245 (=> (not res!898719) (not e!769810))))

(declare-fun noDuplicate!2170 (List!31627) Bool)

(assert (=> b!1354245 (= res!898719 (noDuplicate!2170 acc!759))))

(declare-fun b!1354246 () Bool)

(declare-fun res!898712 () Bool)

(assert (=> b!1354246 (=> (not res!898712) (not e!769812))))

(assert (=> b!1354246 (= res!898712 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1354247 () Bool)

(assert (=> b!1354247 (= e!769810 e!769812)))

(declare-fun res!898721 () Bool)

(assert (=> b!1354247 (=> (not res!898721) (not e!769812))))

(assert (=> b!1354247 (= res!898721 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598181 () Unit!44318)

(assert (=> b!1354247 (= lt!598181 e!769811)))

(declare-fun c!127210 () Bool)

(assert (=> b!1354247 (= c!127210 (validKeyInArray!0 (select (arr!44599 a!3742) from!3120)))))

(declare-fun b!1354248 () Bool)

(declare-fun res!898718 () Bool)

(assert (=> b!1354248 (=> (not res!898718) (not e!769810))))

(assert (=> b!1354248 (= res!898718 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354249 () Bool)

(declare-fun lt!598179 () Unit!44318)

(assert (=> b!1354249 (= e!769811 lt!598179)))

(declare-fun lt!598182 () Unit!44318)

(declare-fun lemmaListSubSeqRefl!0 (List!31627) Unit!44318)

(assert (=> b!1354249 (= lt!598182 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!716 (List!31627 List!31627) Bool)

(assert (=> b!1354249 (subseq!716 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92311 List!31627 List!31627 (_ BitVec 32)) Unit!44318)

(declare-fun $colon$colon!730 (List!31627 (_ BitVec 64)) List!31627)

(assert (=> b!1354249 (= lt!598179 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!730 acc!759 (select (arr!44599 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354249 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114238 res!898717) b!1354245))

(assert (= (and b!1354245 res!898719) b!1354242))

(assert (= (and b!1354242 res!898720) b!1354244))

(assert (= (and b!1354244 res!898713) b!1354240))

(assert (= (and b!1354240 res!898714) b!1354248))

(assert (= (and b!1354248 res!898718) b!1354241))

(assert (= (and b!1354241 res!898722) b!1354237))

(assert (= (and b!1354237 res!898716) b!1354238))

(assert (= (and b!1354238 res!898715) b!1354247))

(assert (= (and b!1354247 c!127210) b!1354249))

(assert (= (and b!1354247 (not c!127210)) b!1354243))

(assert (= (and b!1354247 res!898721) b!1354246))

(assert (= (and b!1354246 res!898712) b!1354239))

(declare-fun m!1241257 () Bool)

(assert (=> b!1354246 m!1241257))

(declare-fun m!1241259 () Bool)

(assert (=> b!1354244 m!1241259))

(declare-fun m!1241261 () Bool)

(assert (=> b!1354248 m!1241261))

(declare-fun m!1241263 () Bool)

(assert (=> b!1354245 m!1241263))

(declare-fun m!1241265 () Bool)

(assert (=> b!1354239 m!1241265))

(declare-fun m!1241267 () Bool)

(assert (=> b!1354239 m!1241267))

(declare-fun m!1241269 () Bool)

(assert (=> b!1354239 m!1241269))

(declare-fun m!1241271 () Bool)

(assert (=> b!1354237 m!1241271))

(declare-fun m!1241273 () Bool)

(assert (=> start!114238 m!1241273))

(declare-fun m!1241275 () Bool)

(assert (=> b!1354240 m!1241275))

(declare-fun m!1241277 () Bool)

(assert (=> b!1354242 m!1241277))

(declare-fun m!1241279 () Bool)

(assert (=> b!1354247 m!1241279))

(assert (=> b!1354247 m!1241279))

(declare-fun m!1241281 () Bool)

(assert (=> b!1354247 m!1241281))

(declare-fun m!1241283 () Bool)

(assert (=> b!1354249 m!1241283))

(assert (=> b!1354249 m!1241279))

(declare-fun m!1241285 () Bool)

(assert (=> b!1354249 m!1241285))

(declare-fun m!1241287 () Bool)

(assert (=> b!1354249 m!1241287))

(assert (=> b!1354249 m!1241257))

(assert (=> b!1354249 m!1241279))

(assert (=> b!1354249 m!1241285))

(declare-fun m!1241289 () Bool)

(assert (=> b!1354249 m!1241289))

(check-sat (not start!114238) (not b!1354245) (not b!1354249) (not b!1354247) (not b!1354237) (not b!1354239) (not b!1354242) (not b!1354244) (not b!1354240) (not b!1354246) (not b!1354248))
(check-sat)
