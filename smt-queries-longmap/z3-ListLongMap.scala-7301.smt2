; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93308 () Bool)

(assert start!93308)

(declare-fun b!1057617 () Bool)

(declare-fun e!601514 () Bool)

(declare-fun e!601516 () Bool)

(assert (=> b!1057617 (= e!601514 e!601516)))

(declare-fun res!706276 () Bool)

(assert (=> b!1057617 (=> (not res!706276) (not e!601516))))

(declare-fun lt!466545 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057617 (= res!706276 (not (= lt!466545 i!1381)))))

(declare-datatypes ((array!66707 0))(
  ( (array!66708 (arr!32075 (Array (_ BitVec 32) (_ BitVec 64))) (size!32611 (_ BitVec 32))) )
))
(declare-fun lt!466543 () array!66707)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66707 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057617 (= lt!466545 (arrayScanForKey!0 lt!466543 k0!2747 #b00000000000000000000000000000000))))

(declare-fun e!601519 () Bool)

(declare-fun b!1057618 () Bool)

(declare-fun a!3488 () array!66707)

(declare-fun arrayContainsKey!0 (array!66707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057618 (= e!601519 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057619 () Bool)

(declare-fun e!601518 () Bool)

(assert (=> b!1057619 (= e!601518 e!601519)))

(declare-fun res!706275 () Bool)

(assert (=> b!1057619 (=> res!706275 e!601519)))

(assert (=> b!1057619 (= res!706275 (or (bvsgt lt!466545 i!1381) (bvsle i!1381 lt!466545)))))

(declare-fun res!706278 () Bool)

(declare-fun e!601515 () Bool)

(assert (=> start!93308 (=> (not res!706278) (not e!601515))))

(assert (=> start!93308 (= res!706278 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32611 a!3488)) (bvslt (size!32611 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93308 e!601515))

(assert (=> start!93308 true))

(declare-fun array_inv!24855 (array!66707) Bool)

(assert (=> start!93308 (array_inv!24855 a!3488)))

(declare-fun b!1057620 () Bool)

(declare-fun res!706281 () Bool)

(assert (=> b!1057620 (=> (not res!706281) (not e!601515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057620 (= res!706281 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057621 () Bool)

(assert (=> b!1057621 (= e!601515 e!601514)))

(declare-fun res!706277 () Bool)

(assert (=> b!1057621 (=> (not res!706277) (not e!601514))))

(assert (=> b!1057621 (= res!706277 (arrayContainsKey!0 lt!466543 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057621 (= lt!466543 (array!66708 (store (arr!32075 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32611 a!3488)))))

(declare-fun b!1057622 () Bool)

(declare-fun res!706283 () Bool)

(assert (=> b!1057622 (=> (not res!706283) (not e!601515))))

(declare-datatypes ((List!22387 0))(
  ( (Nil!22384) (Cons!22383 (h!23592 (_ BitVec 64)) (t!31694 List!22387)) )
))
(declare-fun arrayNoDuplicates!0 (array!66707 (_ BitVec 32) List!22387) Bool)

(assert (=> b!1057622 (= res!706283 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22384))))

(declare-fun b!1057623 () Bool)

(declare-fun res!706280 () Bool)

(assert (=> b!1057623 (=> (not res!706280) (not e!601515))))

(assert (=> b!1057623 (= res!706280 (= (select (arr!32075 a!3488) i!1381) k0!2747))))

(declare-fun b!1057624 () Bool)

(declare-fun e!601513 () Bool)

(assert (=> b!1057624 (= e!601516 (not e!601513))))

(declare-fun res!706279 () Bool)

(assert (=> b!1057624 (=> res!706279 e!601513)))

(assert (=> b!1057624 (= res!706279 (or (bvsgt lt!466545 i!1381) (bvsle i!1381 lt!466545)))))

(assert (=> b!1057624 e!601518))

(declare-fun res!706282 () Bool)

(assert (=> b!1057624 (=> (not res!706282) (not e!601518))))

(assert (=> b!1057624 (= res!706282 (= (select (store (arr!32075 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466545) k0!2747))))

(declare-fun b!1057625 () Bool)

(declare-fun lt!466542 () (_ BitVec 32))

(assert (=> b!1057625 (= e!601513 (or (bvslt lt!466545 #b00000000000000000000000000000000) (bvsge lt!466542 (size!32611 a!3488)) (bvslt lt!466545 (size!32611 a!3488))))))

(assert (=> b!1057625 (arrayContainsKey!0 a!3488 k0!2747 lt!466542)))

(declare-datatypes ((Unit!34672 0))(
  ( (Unit!34673) )
))
(declare-fun lt!466541 () Unit!34672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66707 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34672)

(assert (=> b!1057625 (= lt!466541 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466542))))

(assert (=> b!1057625 (= lt!466542 (bvadd #b00000000000000000000000000000001 lt!466545))))

(assert (=> b!1057625 (arrayNoDuplicates!0 a!3488 lt!466545 Nil!22384)))

(declare-fun lt!466544 () Unit!34672)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66707 (_ BitVec 32) (_ BitVec 32)) Unit!34672)

(assert (=> b!1057625 (= lt!466544 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466545))))

(assert (= (and start!93308 res!706278) b!1057622))

(assert (= (and b!1057622 res!706283) b!1057620))

(assert (= (and b!1057620 res!706281) b!1057623))

(assert (= (and b!1057623 res!706280) b!1057621))

(assert (= (and b!1057621 res!706277) b!1057617))

(assert (= (and b!1057617 res!706276) b!1057624))

(assert (= (and b!1057624 res!706282) b!1057619))

(assert (= (and b!1057619 (not res!706275)) b!1057618))

(assert (= (and b!1057624 (not res!706279)) b!1057625))

(declare-fun m!977305 () Bool)

(assert (=> b!1057617 m!977305))

(declare-fun m!977307 () Bool)

(assert (=> b!1057620 m!977307))

(declare-fun m!977309 () Bool)

(assert (=> b!1057622 m!977309))

(declare-fun m!977311 () Bool)

(assert (=> b!1057621 m!977311))

(declare-fun m!977313 () Bool)

(assert (=> b!1057621 m!977313))

(declare-fun m!977315 () Bool)

(assert (=> b!1057625 m!977315))

(declare-fun m!977317 () Bool)

(assert (=> b!1057625 m!977317))

(declare-fun m!977319 () Bool)

(assert (=> b!1057625 m!977319))

(declare-fun m!977321 () Bool)

(assert (=> b!1057625 m!977321))

(declare-fun m!977323 () Bool)

(assert (=> start!93308 m!977323))

(declare-fun m!977325 () Bool)

(assert (=> b!1057618 m!977325))

(assert (=> b!1057624 m!977313))

(declare-fun m!977327 () Bool)

(assert (=> b!1057624 m!977327))

(declare-fun m!977329 () Bool)

(assert (=> b!1057623 m!977329))

(check-sat (not start!93308) (not b!1057618) (not b!1057617) (not b!1057620) (not b!1057622) (not b!1057625) (not b!1057621))
(check-sat)
