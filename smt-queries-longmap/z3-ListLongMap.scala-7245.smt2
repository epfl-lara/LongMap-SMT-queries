; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92530 () Bool)

(assert start!92530)

(declare-fun b!1052360 () Bool)

(declare-fun e!597488 () Bool)

(declare-fun e!597486 () Bool)

(assert (=> b!1052360 (= e!597488 e!597486)))

(declare-fun res!701573 () Bool)

(assert (=> b!1052360 (=> (not res!701573) (not e!597486))))

(declare-fun lt!464601 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052360 (= res!701573 (not (= lt!464601 i!1381)))))

(declare-datatypes ((array!66272 0))(
  ( (array!66273 (arr!31875 (Array (_ BitVec 32) (_ BitVec 64))) (size!32413 (_ BitVec 32))) )
))
(declare-fun lt!464600 () array!66272)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66272 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052360 (= lt!464601 (arrayScanForKey!0 lt!464600 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052361 () Bool)

(declare-fun e!597487 () Bool)

(assert (=> b!1052361 (= e!597486 (not e!597487))))

(declare-fun res!701572 () Bool)

(assert (=> b!1052361 (=> res!701572 e!597487)))

(assert (=> b!1052361 (= res!701572 (or (bvsgt lt!464601 i!1381) (bvsle i!1381 lt!464601)))))

(declare-fun e!597483 () Bool)

(assert (=> b!1052361 e!597483))

(declare-fun res!701574 () Bool)

(assert (=> b!1052361 (=> (not res!701574) (not e!597483))))

(declare-fun a!3488 () array!66272)

(assert (=> b!1052361 (= res!701574 (= (select (store (arr!31875 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464601) k0!2747))))

(declare-fun b!1052362 () Bool)

(declare-fun res!701575 () Bool)

(declare-fun e!597485 () Bool)

(assert (=> b!1052362 (=> (not res!701575) (not e!597485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052362 (= res!701575 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052363 () Bool)

(declare-fun e!597489 () Bool)

(assert (=> b!1052363 (= e!597483 e!597489)))

(declare-fun res!701578 () Bool)

(assert (=> b!1052363 (=> res!701578 e!597489)))

(assert (=> b!1052363 (= res!701578 (or (bvsgt lt!464601 i!1381) (bvsle i!1381 lt!464601)))))

(declare-fun b!1052364 () Bool)

(declare-fun arrayContainsKey!0 (array!66272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052364 (= e!597489 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052365 () Bool)

(assert (=> b!1052365 (= e!597485 e!597488)))

(declare-fun res!701577 () Bool)

(assert (=> b!1052365 (=> (not res!701577) (not e!597488))))

(assert (=> b!1052365 (= res!701577 (arrayContainsKey!0 lt!464600 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052365 (= lt!464600 (array!66273 (store (arr!31875 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32413 a!3488)))))

(declare-fun res!701570 () Bool)

(assert (=> start!92530 (=> (not res!701570) (not e!597485))))

(assert (=> start!92530 (= res!701570 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32413 a!3488)) (bvslt (size!32413 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92530 e!597485))

(assert (=> start!92530 true))

(declare-fun array_inv!24658 (array!66272) Bool)

(assert (=> start!92530 (array_inv!24658 a!3488)))

(declare-fun b!1052366 () Bool)

(declare-fun res!701571 () Bool)

(assert (=> b!1052366 (=> (not res!701571) (not e!597485))))

(declare-datatypes ((List!22246 0))(
  ( (Nil!22243) (Cons!22242 (h!23451 (_ BitVec 64)) (t!31544 List!22246)) )
))
(declare-fun arrayNoDuplicates!0 (array!66272 (_ BitVec 32) List!22246) Bool)

(assert (=> b!1052366 (= res!701571 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22243))))

(declare-fun b!1052367 () Bool)

(declare-fun res!701576 () Bool)

(assert (=> b!1052367 (=> (not res!701576) (not e!597485))))

(assert (=> b!1052367 (= res!701576 (= (select (arr!31875 a!3488) i!1381) k0!2747))))

(declare-fun b!1052368 () Bool)

(assert (=> b!1052368 (= e!597487 true)))

(assert (=> b!1052368 (not (= (select (arr!31875 a!3488) lt!464601) k0!2747))))

(declare-datatypes ((Unit!34355 0))(
  ( (Unit!34356) )
))
(declare-fun lt!464599 () Unit!34355)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66272 (_ BitVec 64) (_ BitVec 32) List!22246) Unit!34355)

(assert (=> b!1052368 (= lt!464599 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!464601 Nil!22243))))

(declare-fun lt!464598 () (_ BitVec 32))

(assert (=> b!1052368 (arrayContainsKey!0 a!3488 k0!2747 lt!464598)))

(declare-fun lt!464602 () Unit!34355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66272 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34355)

(assert (=> b!1052368 (= lt!464602 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464598))))

(assert (=> b!1052368 (= lt!464598 (bvadd #b00000000000000000000000000000001 lt!464601))))

(assert (=> b!1052368 (arrayNoDuplicates!0 a!3488 lt!464601 Nil!22243)))

(declare-fun lt!464597 () Unit!34355)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66272 (_ BitVec 32) (_ BitVec 32)) Unit!34355)

(assert (=> b!1052368 (= lt!464597 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464601))))

(assert (= (and start!92530 res!701570) b!1052366))

(assert (= (and b!1052366 res!701571) b!1052362))

(assert (= (and b!1052362 res!701575) b!1052367))

(assert (= (and b!1052367 res!701576) b!1052365))

(assert (= (and b!1052365 res!701577) b!1052360))

(assert (= (and b!1052360 res!701573) b!1052361))

(assert (= (and b!1052361 res!701574) b!1052363))

(assert (= (and b!1052363 (not res!701578)) b!1052364))

(assert (= (and b!1052361 (not res!701572)) b!1052368))

(declare-fun m!972271 () Bool)

(assert (=> b!1052367 m!972271))

(declare-fun m!972273 () Bool)

(assert (=> start!92530 m!972273))

(declare-fun m!972275 () Bool)

(assert (=> b!1052360 m!972275))

(declare-fun m!972277 () Bool)

(assert (=> b!1052364 m!972277))

(declare-fun m!972279 () Bool)

(assert (=> b!1052366 m!972279))

(declare-fun m!972281 () Bool)

(assert (=> b!1052362 m!972281))

(declare-fun m!972283 () Bool)

(assert (=> b!1052368 m!972283))

(declare-fun m!972285 () Bool)

(assert (=> b!1052368 m!972285))

(declare-fun m!972287 () Bool)

(assert (=> b!1052368 m!972287))

(declare-fun m!972289 () Bool)

(assert (=> b!1052368 m!972289))

(declare-fun m!972291 () Bool)

(assert (=> b!1052368 m!972291))

(declare-fun m!972293 () Bool)

(assert (=> b!1052368 m!972293))

(declare-fun m!972295 () Bool)

(assert (=> b!1052365 m!972295))

(declare-fun m!972297 () Bool)

(assert (=> b!1052365 m!972297))

(assert (=> b!1052361 m!972297))

(declare-fun m!972299 () Bool)

(assert (=> b!1052361 m!972299))

(check-sat (not b!1052366) (not b!1052360) (not b!1052368) (not b!1052362) (not b!1052364) (not start!92530) (not b!1052365))
(check-sat)
