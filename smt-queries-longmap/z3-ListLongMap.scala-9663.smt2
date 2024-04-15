; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114116 () Bool)

(assert start!114116)

(declare-fun res!900221 () Bool)

(declare-fun e!769666 () Bool)

(assert (=> start!114116 (=> (not res!900221) (not e!769666))))

(declare-datatypes ((array!92247 0))(
  ( (array!92248 (arr!44572 (Array (_ BitVec 32) (_ BitVec 64))) (size!45124 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92247)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114116 (= res!900221 (and (bvslt (size!45124 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45124 a!3742))))))

(assert (=> start!114116 e!769666))

(assert (=> start!114116 true))

(declare-fun array_inv!33805 (array!92247) Bool)

(assert (=> start!114116 (array_inv!33805 a!3742)))

(declare-fun b!1355224 () Bool)

(declare-fun res!900218 () Bool)

(assert (=> b!1355224 (=> (not res!900218) (not e!769666))))

(assert (=> b!1355224 (= res!900218 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45124 a!3742)))))

(declare-fun b!1355225 () Bool)

(declare-datatypes ((Unit!44373 0))(
  ( (Unit!44374) )
))
(declare-fun e!769665 () Unit!44373)

(declare-fun lt!598386 () Unit!44373)

(assert (=> b!1355225 (= e!769665 lt!598386)))

(declare-fun lt!598383 () Unit!44373)

(declare-datatypes ((List!31691 0))(
  ( (Nil!31688) (Cons!31687 (h!32896 (_ BitVec 64)) (t!46341 List!31691)) )
))
(declare-fun acc!759 () List!31691)

(declare-fun lemmaListSubSeqRefl!0 (List!31691) Unit!44373)

(assert (=> b!1355225 (= lt!598383 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!767 (List!31691 List!31691) Bool)

(assert (=> b!1355225 (subseq!767 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92247 List!31691 List!31691 (_ BitVec 32)) Unit!44373)

(declare-fun $colon$colon!784 (List!31691 (_ BitVec 64)) List!31691)

(assert (=> b!1355225 (= lt!598386 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!784 acc!759 (select (arr!44572 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92247 (_ BitVec 32) List!31691) Bool)

(assert (=> b!1355225 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355226 () Bool)

(declare-fun res!900223 () Bool)

(assert (=> b!1355226 (=> (not res!900223) (not e!769666))))

(assert (=> b!1355226 (= res!900223 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355227 () Bool)

(declare-fun res!900216 () Bool)

(assert (=> b!1355227 (=> (not res!900216) (not e!769666))))

(declare-fun contains!9311 (List!31691 (_ BitVec 64)) Bool)

(assert (=> b!1355227 (= res!900216 (not (contains!9311 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355228 () Bool)

(declare-fun res!900217 () Bool)

(assert (=> b!1355228 (=> (not res!900217) (not e!769666))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355228 (= res!900217 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45124 a!3742))))))

(declare-fun b!1355229 () Bool)

(declare-fun res!900215 () Bool)

(assert (=> b!1355229 (=> (not res!900215) (not e!769666))))

(assert (=> b!1355229 (= res!900215 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31688))))

(declare-fun b!1355230 () Bool)

(declare-fun Unit!44375 () Unit!44373)

(assert (=> b!1355230 (= e!769665 Unit!44375)))

(declare-fun b!1355231 () Bool)

(declare-fun res!900222 () Bool)

(assert (=> b!1355231 (=> (not res!900222) (not e!769666))))

(declare-fun noDuplicate!2226 (List!31691) Bool)

(assert (=> b!1355231 (= res!900222 (noDuplicate!2226 acc!759))))

(declare-fun b!1355232 () Bool)

(declare-fun res!900219 () Bool)

(assert (=> b!1355232 (=> (not res!900219) (not e!769666))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355232 (= res!900219 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355233 () Bool)

(declare-fun res!900224 () Bool)

(assert (=> b!1355233 (=> (not res!900224) (not e!769666))))

(assert (=> b!1355233 (= res!900224 (not (contains!9311 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355234 () Bool)

(declare-fun e!769664 () Bool)

(assert (=> b!1355234 (= e!769666 e!769664)))

(declare-fun res!900220 () Bool)

(assert (=> b!1355234 (=> (not res!900220) (not e!769664))))

(declare-fun lt!598385 () Bool)

(assert (=> b!1355234 (= res!900220 (and (not (= from!3120 i!1404)) (not lt!598385) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598384 () Unit!44373)

(assert (=> b!1355234 (= lt!598384 e!769665)))

(declare-fun c!126947 () Bool)

(assert (=> b!1355234 (= c!126947 lt!598385)))

(assert (=> b!1355234 (= lt!598385 (validKeyInArray!0 (select (arr!44572 a!3742) from!3120)))))

(declare-fun b!1355235 () Bool)

(assert (=> b!1355235 (= e!769664 false)))

(declare-fun lt!598387 () Bool)

(assert (=> b!1355235 (= lt!598387 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114116 res!900221) b!1355231))

(assert (= (and b!1355231 res!900222) b!1355233))

(assert (= (and b!1355233 res!900224) b!1355227))

(assert (= (and b!1355227 res!900216) b!1355229))

(assert (= (and b!1355229 res!900215) b!1355226))

(assert (= (and b!1355226 res!900223) b!1355228))

(assert (= (and b!1355228 res!900217) b!1355232))

(assert (= (and b!1355232 res!900219) b!1355224))

(assert (= (and b!1355224 res!900218) b!1355234))

(assert (= (and b!1355234 c!126947) b!1355225))

(assert (= (and b!1355234 (not c!126947)) b!1355230))

(assert (= (and b!1355234 res!900220) b!1355235))

(declare-fun m!1240993 () Bool)

(assert (=> b!1355226 m!1240993))

(declare-fun m!1240995 () Bool)

(assert (=> b!1355229 m!1240995))

(declare-fun m!1240997 () Bool)

(assert (=> b!1355234 m!1240997))

(assert (=> b!1355234 m!1240997))

(declare-fun m!1240999 () Bool)

(assert (=> b!1355234 m!1240999))

(declare-fun m!1241001 () Bool)

(assert (=> start!114116 m!1241001))

(declare-fun m!1241003 () Bool)

(assert (=> b!1355231 m!1241003))

(declare-fun m!1241005 () Bool)

(assert (=> b!1355235 m!1241005))

(declare-fun m!1241007 () Bool)

(assert (=> b!1355227 m!1241007))

(declare-fun m!1241009 () Bool)

(assert (=> b!1355232 m!1241009))

(declare-fun m!1241011 () Bool)

(assert (=> b!1355233 m!1241011))

(declare-fun m!1241013 () Bool)

(assert (=> b!1355225 m!1241013))

(assert (=> b!1355225 m!1240997))

(declare-fun m!1241015 () Bool)

(assert (=> b!1355225 m!1241015))

(declare-fun m!1241017 () Bool)

(assert (=> b!1355225 m!1241017))

(assert (=> b!1355225 m!1241005))

(assert (=> b!1355225 m!1240997))

(assert (=> b!1355225 m!1241015))

(declare-fun m!1241019 () Bool)

(assert (=> b!1355225 m!1241019))

(check-sat (not b!1355231) (not b!1355235) (not b!1355225) (not b!1355226) (not b!1355233) (not b!1355232) (not start!114116) (not b!1355229) (not b!1355227) (not b!1355234))
(check-sat)
