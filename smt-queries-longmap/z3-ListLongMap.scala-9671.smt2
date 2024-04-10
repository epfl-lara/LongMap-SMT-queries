; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114166 () Bool)

(assert start!114166)

(declare-fun b!1356208 () Bool)

(declare-fun res!901014 () Bool)

(declare-fun e!769996 () Bool)

(assert (=> b!1356208 (=> (not res!901014) (not e!769996))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92348 0))(
  ( (array!92349 (arr!44622 (Array (_ BitVec 32) (_ BitVec 64))) (size!45172 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92348)

(assert (=> b!1356208 (= res!901014 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45172 a!3742)))))

(declare-fun b!1356209 () Bool)

(declare-fun e!769997 () Bool)

(assert (=> b!1356209 (= e!769997 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((List!31663 0))(
  ( (Nil!31660) (Cons!31659 (h!32868 (_ BitVec 64)) (t!46321 List!31663)) )
))
(declare-fun acc!759 () List!31663)

(declare-fun arrayNoDuplicates!0 (array!92348 (_ BitVec 32) List!31663) Bool)

(assert (=> b!1356209 (arrayNoDuplicates!0 (array!92349 (store (arr!44622 a!3742) i!1404 l!3587) (size!45172 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44607 0))(
  ( (Unit!44608) )
))
(declare-fun lt!598945 () Unit!44607)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92348 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31663) Unit!44607)

(assert (=> b!1356209 (= lt!598945 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356210 () Bool)

(declare-fun res!901016 () Bool)

(assert (=> b!1356210 (=> (not res!901016) (not e!769996))))

(assert (=> b!1356210 (= res!901016 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31660))))

(declare-fun b!1356211 () Bool)

(declare-fun res!901009 () Bool)

(assert (=> b!1356211 (=> (not res!901009) (not e!769996))))

(declare-fun contains!9372 (List!31663 (_ BitVec 64)) Bool)

(assert (=> b!1356211 (= res!901009 (not (contains!9372 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356212 () Bool)

(declare-fun res!901008 () Bool)

(assert (=> b!1356212 (=> (not res!901008) (not e!769996))))

(assert (=> b!1356212 (= res!901008 (not (contains!9372 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356214 () Bool)

(declare-fun e!769999 () Unit!44607)

(declare-fun lt!598946 () Unit!44607)

(assert (=> b!1356214 (= e!769999 lt!598946)))

(declare-fun lt!598944 () Unit!44607)

(declare-fun lemmaListSubSeqRefl!0 (List!31663) Unit!44607)

(assert (=> b!1356214 (= lt!598944 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!792 (List!31663 List!31663) Bool)

(assert (=> b!1356214 (subseq!792 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92348 List!31663 List!31663 (_ BitVec 32)) Unit!44607)

(declare-fun $colon$colon!807 (List!31663 (_ BitVec 64)) List!31663)

(assert (=> b!1356214 (= lt!598946 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!807 acc!759 (select (arr!44622 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356214 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356215 () Bool)

(declare-fun res!901011 () Bool)

(assert (=> b!1356215 (=> (not res!901011) (not e!769996))))

(assert (=> b!1356215 (= res!901011 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356216 () Bool)

(declare-fun res!901017 () Bool)

(assert (=> b!1356216 (=> (not res!901017) (not e!769996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356216 (= res!901017 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356217 () Bool)

(assert (=> b!1356217 (= e!769996 e!769997)))

(declare-fun res!901015 () Bool)

(assert (=> b!1356217 (=> (not res!901015) (not e!769997))))

(declare-fun lt!598948 () Bool)

(assert (=> b!1356217 (= res!901015 (and (not (= from!3120 i!1404)) (not lt!598948) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598947 () Unit!44607)

(assert (=> b!1356217 (= lt!598947 e!769999)))

(declare-fun c!127040 () Bool)

(assert (=> b!1356217 (= c!127040 lt!598948)))

(assert (=> b!1356217 (= lt!598948 (validKeyInArray!0 (select (arr!44622 a!3742) from!3120)))))

(declare-fun b!1356218 () Bool)

(declare-fun res!901010 () Bool)

(assert (=> b!1356218 (=> (not res!901010) (not e!769997))))

(assert (=> b!1356218 (= res!901010 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356219 () Bool)

(declare-fun res!901018 () Bool)

(assert (=> b!1356219 (=> (not res!901018) (not e!769996))))

(declare-fun noDuplicate!2229 (List!31663) Bool)

(assert (=> b!1356219 (= res!901018 (noDuplicate!2229 acc!759))))

(declare-fun b!1356220 () Bool)

(declare-fun Unit!44609 () Unit!44607)

(assert (=> b!1356220 (= e!769999 Unit!44609)))

(declare-fun res!901013 () Bool)

(assert (=> start!114166 (=> (not res!901013) (not e!769996))))

(assert (=> start!114166 (= res!901013 (and (bvslt (size!45172 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45172 a!3742))))))

(assert (=> start!114166 e!769996))

(assert (=> start!114166 true))

(declare-fun array_inv!33650 (array!92348) Bool)

(assert (=> start!114166 (array_inv!33650 a!3742)))

(declare-fun b!1356213 () Bool)

(declare-fun res!901012 () Bool)

(assert (=> b!1356213 (=> (not res!901012) (not e!769996))))

(assert (=> b!1356213 (= res!901012 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45172 a!3742))))))

(assert (= (and start!114166 res!901013) b!1356219))

(assert (= (and b!1356219 res!901018) b!1356212))

(assert (= (and b!1356212 res!901008) b!1356211))

(assert (= (and b!1356211 res!901009) b!1356210))

(assert (= (and b!1356210 res!901016) b!1356215))

(assert (= (and b!1356215 res!901011) b!1356213))

(assert (= (and b!1356213 res!901012) b!1356216))

(assert (= (and b!1356216 res!901017) b!1356208))

(assert (= (and b!1356208 res!901014) b!1356217))

(assert (= (and b!1356217 c!127040) b!1356214))

(assert (= (and b!1356217 (not c!127040)) b!1356220))

(assert (= (and b!1356217 res!901015) b!1356218))

(assert (= (and b!1356218 res!901010) b!1356209))

(declare-fun m!1242233 () Bool)

(assert (=> b!1356219 m!1242233))

(declare-fun m!1242235 () Bool)

(assert (=> b!1356218 m!1242235))

(declare-fun m!1242237 () Bool)

(assert (=> b!1356211 m!1242237))

(declare-fun m!1242239 () Bool)

(assert (=> b!1356214 m!1242239))

(declare-fun m!1242241 () Bool)

(assert (=> b!1356214 m!1242241))

(declare-fun m!1242243 () Bool)

(assert (=> b!1356214 m!1242243))

(declare-fun m!1242245 () Bool)

(assert (=> b!1356214 m!1242245))

(assert (=> b!1356214 m!1242235))

(assert (=> b!1356214 m!1242241))

(assert (=> b!1356214 m!1242243))

(declare-fun m!1242247 () Bool)

(assert (=> b!1356214 m!1242247))

(declare-fun m!1242249 () Bool)

(assert (=> b!1356216 m!1242249))

(assert (=> b!1356217 m!1242241))

(assert (=> b!1356217 m!1242241))

(declare-fun m!1242251 () Bool)

(assert (=> b!1356217 m!1242251))

(declare-fun m!1242253 () Bool)

(assert (=> b!1356209 m!1242253))

(declare-fun m!1242255 () Bool)

(assert (=> b!1356209 m!1242255))

(declare-fun m!1242257 () Bool)

(assert (=> b!1356209 m!1242257))

(declare-fun m!1242259 () Bool)

(assert (=> start!114166 m!1242259))

(declare-fun m!1242261 () Bool)

(assert (=> b!1356215 m!1242261))

(declare-fun m!1242263 () Bool)

(assert (=> b!1356212 m!1242263))

(declare-fun m!1242265 () Bool)

(assert (=> b!1356210 m!1242265))

(check-sat (not b!1356211) (not b!1356209) (not b!1356210) (not b!1356212) (not b!1356219) (not b!1356218) (not b!1356214) (not b!1356215) (not b!1356216) (not b!1356217) (not start!114166))
(check-sat)
