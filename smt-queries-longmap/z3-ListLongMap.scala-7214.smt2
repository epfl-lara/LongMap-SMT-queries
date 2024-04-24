; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92580 () Bool)

(assert start!92580)

(declare-fun b!1051069 () Bool)

(declare-fun res!699401 () Bool)

(declare-fun e!596469 () Bool)

(assert (=> b!1051069 (=> res!699401 e!596469)))

(declare-datatypes ((List!22113 0))(
  ( (Nil!22110) (Cons!22109 (h!23327 (_ BitVec 64)) (t!31412 List!22113)) )
))
(declare-fun noDuplicate!1519 (List!22113) Bool)

(assert (=> b!1051069 (= res!699401 (not (noDuplicate!1519 Nil!22110)))))

(declare-fun res!699399 () Bool)

(declare-fun e!596470 () Bool)

(assert (=> start!92580 (=> (not res!699399) (not e!596470))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66196 0))(
  ( (array!66197 (arr!31831 (Array (_ BitVec 32) (_ BitVec 64))) (size!32368 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66196)

(assert (=> start!92580 (= res!699399 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32368 a!3488)) (bvslt (size!32368 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92580 e!596470))

(assert (=> start!92580 true))

(declare-fun array_inv!24613 (array!66196) Bool)

(assert (=> start!92580 (array_inv!24613 a!3488)))

(declare-fun b!1051070 () Bool)

(declare-fun res!699390 () Bool)

(assert (=> b!1051070 (=> res!699390 e!596469)))

(declare-fun contains!6143 (List!22113 (_ BitVec 64)) Bool)

(assert (=> b!1051070 (= res!699390 (contains!6143 Nil!22110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051071 () Bool)

(declare-fun e!596473 () Bool)

(declare-fun e!596472 () Bool)

(assert (=> b!1051071 (= e!596473 e!596472)))

(declare-fun res!699393 () Bool)

(assert (=> b!1051071 (=> (not res!699393) (not e!596472))))

(declare-fun lt!464159 () (_ BitVec 32))

(assert (=> b!1051071 (= res!699393 (not (= lt!464159 i!1381)))))

(declare-fun lt!464161 () array!66196)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66196 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051071 (= lt!464159 (arrayScanForKey!0 lt!464161 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051072 () Bool)

(declare-fun e!596467 () Bool)

(assert (=> b!1051072 (= e!596467 e!596469)))

(declare-fun res!699396 () Bool)

(assert (=> b!1051072 (=> res!699396 e!596469)))

(assert (=> b!1051072 (= res!699396 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32368 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051072 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34351 0))(
  ( (Unit!34352) )
))
(declare-fun lt!464162 () Unit!34351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66196 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34351)

(assert (=> b!1051072 (= lt!464162 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464159 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66196 (_ BitVec 32) List!22113) Bool)

(assert (=> b!1051072 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22110)))

(declare-fun lt!464158 () Unit!34351)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66196 (_ BitVec 32) (_ BitVec 32)) Unit!34351)

(assert (=> b!1051072 (= lt!464158 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1051073 () Bool)

(declare-fun res!699395 () Bool)

(assert (=> b!1051073 (=> (not res!699395) (not e!596470))))

(assert (=> b!1051073 (= res!699395 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22110))))

(declare-fun b!1051074 () Bool)

(declare-fun e!596468 () Bool)

(declare-fun e!596471 () Bool)

(assert (=> b!1051074 (= e!596468 e!596471)))

(declare-fun res!699391 () Bool)

(assert (=> b!1051074 (=> res!699391 e!596471)))

(assert (=> b!1051074 (= res!699391 (bvsle lt!464159 i!1381))))

(declare-fun b!1051075 () Bool)

(declare-fun res!699400 () Bool)

(assert (=> b!1051075 (=> (not res!699400) (not e!596470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051075 (= res!699400 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051076 () Bool)

(assert (=> b!1051076 (= e!596469 true)))

(declare-fun lt!464160 () Bool)

(assert (=> b!1051076 (= lt!464160 (contains!6143 Nil!22110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051077 () Bool)

(assert (=> b!1051077 (= e!596472 (not e!596467))))

(declare-fun res!699392 () Bool)

(assert (=> b!1051077 (=> res!699392 e!596467)))

(assert (=> b!1051077 (= res!699392 (bvsle lt!464159 i!1381))))

(assert (=> b!1051077 e!596468))

(declare-fun res!699394 () Bool)

(assert (=> b!1051077 (=> (not res!699394) (not e!596468))))

(assert (=> b!1051077 (= res!699394 (= (select (store (arr!31831 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464159) k0!2747))))

(declare-fun b!1051078 () Bool)

(declare-fun res!699397 () Bool)

(assert (=> b!1051078 (=> (not res!699397) (not e!596470))))

(assert (=> b!1051078 (= res!699397 (= (select (arr!31831 a!3488) i!1381) k0!2747))))

(declare-fun b!1051079 () Bool)

(assert (=> b!1051079 (= e!596470 e!596473)))

(declare-fun res!699398 () Bool)

(assert (=> b!1051079 (=> (not res!699398) (not e!596473))))

(assert (=> b!1051079 (= res!699398 (arrayContainsKey!0 lt!464161 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051079 (= lt!464161 (array!66197 (store (arr!31831 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32368 a!3488)))))

(declare-fun b!1051080 () Bool)

(assert (=> b!1051080 (= e!596471 (arrayContainsKey!0 a!3488 k0!2747 lt!464159))))

(assert (= (and start!92580 res!699399) b!1051073))

(assert (= (and b!1051073 res!699395) b!1051075))

(assert (= (and b!1051075 res!699400) b!1051078))

(assert (= (and b!1051078 res!699397) b!1051079))

(assert (= (and b!1051079 res!699398) b!1051071))

(assert (= (and b!1051071 res!699393) b!1051077))

(assert (= (and b!1051077 res!699394) b!1051074))

(assert (= (and b!1051074 (not res!699391)) b!1051080))

(assert (= (and b!1051077 (not res!699392)) b!1051072))

(assert (= (and b!1051072 (not res!699396)) b!1051069))

(assert (= (and b!1051069 (not res!699401)) b!1051070))

(assert (= (and b!1051070 (not res!699390)) b!1051076))

(declare-fun m!972149 () Bool)

(assert (=> b!1051073 m!972149))

(declare-fun m!972151 () Bool)

(assert (=> b!1051078 m!972151))

(declare-fun m!972153 () Bool)

(assert (=> b!1051076 m!972153))

(declare-fun m!972155 () Bool)

(assert (=> b!1051077 m!972155))

(declare-fun m!972157 () Bool)

(assert (=> b!1051077 m!972157))

(declare-fun m!972159 () Bool)

(assert (=> b!1051080 m!972159))

(declare-fun m!972161 () Bool)

(assert (=> start!92580 m!972161))

(declare-fun m!972163 () Bool)

(assert (=> b!1051072 m!972163))

(declare-fun m!972165 () Bool)

(assert (=> b!1051072 m!972165))

(declare-fun m!972167 () Bool)

(assert (=> b!1051072 m!972167))

(declare-fun m!972169 () Bool)

(assert (=> b!1051072 m!972169))

(declare-fun m!972171 () Bool)

(assert (=> b!1051071 m!972171))

(declare-fun m!972173 () Bool)

(assert (=> b!1051075 m!972173))

(declare-fun m!972175 () Bool)

(assert (=> b!1051070 m!972175))

(declare-fun m!972177 () Bool)

(assert (=> b!1051079 m!972177))

(assert (=> b!1051079 m!972155))

(declare-fun m!972179 () Bool)

(assert (=> b!1051069 m!972179))

(check-sat (not b!1051076) (not b!1051072) (not b!1051075) (not start!92580) (not b!1051079) (not b!1051071) (not b!1051069) (not b!1051073) (not b!1051080) (not b!1051070))
(check-sat)
