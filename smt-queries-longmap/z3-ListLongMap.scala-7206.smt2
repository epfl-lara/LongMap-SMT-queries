; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92532 () Bool)

(assert start!92532)

(declare-fun b!1050307 () Bool)

(declare-fun e!595930 () Bool)

(declare-fun e!595927 () Bool)

(assert (=> b!1050307 (= e!595930 e!595927)))

(declare-fun res!698629 () Bool)

(assert (=> b!1050307 (=> (not res!698629) (not e!595927))))

(declare-fun lt!463866 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050307 (= res!698629 (not (= lt!463866 i!1381)))))

(declare-datatypes ((array!66148 0))(
  ( (array!66149 (arr!31807 (Array (_ BitVec 32) (_ BitVec 64))) (size!32344 (_ BitVec 32))) )
))
(declare-fun lt!463868 () array!66148)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66148 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050307 (= lt!463866 (arrayScanForKey!0 lt!463868 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050308 () Bool)

(declare-fun res!698633 () Bool)

(declare-fun e!595928 () Bool)

(assert (=> b!1050308 (=> (not res!698633) (not e!595928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050308 (= res!698633 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050309 () Bool)

(declare-fun e!595926 () Bool)

(assert (=> b!1050309 (= e!595927 (not e!595926))))

(declare-fun res!698630 () Bool)

(assert (=> b!1050309 (=> res!698630 e!595926)))

(assert (=> b!1050309 (= res!698630 (bvsle lt!463866 i!1381))))

(declare-fun e!595924 () Bool)

(assert (=> b!1050309 e!595924))

(declare-fun res!698631 () Bool)

(assert (=> b!1050309 (=> (not res!698631) (not e!595924))))

(declare-fun a!3488 () array!66148)

(assert (=> b!1050309 (= res!698631 (= (select (store (arr!31807 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463866) k0!2747))))

(declare-fun res!698635 () Bool)

(assert (=> start!92532 (=> (not res!698635) (not e!595928))))

(assert (=> start!92532 (= res!698635 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32344 a!3488)) (bvslt (size!32344 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92532 e!595928))

(assert (=> start!92532 true))

(declare-fun array_inv!24589 (array!66148) Bool)

(assert (=> start!92532 (array_inv!24589 a!3488)))

(declare-fun b!1050310 () Bool)

(assert (=> b!1050310 (= e!595926 true)))

(declare-datatypes ((List!22089 0))(
  ( (Nil!22086) (Cons!22085 (h!23303 (_ BitVec 64)) (t!31388 List!22089)) )
))
(declare-fun arrayNoDuplicates!0 (array!66148 (_ BitVec 32) List!22089) Bool)

(assert (=> b!1050310 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22086)))

(declare-datatypes ((Unit!34303 0))(
  ( (Unit!34304) )
))
(declare-fun lt!463867 () Unit!34303)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66148 (_ BitVec 32) (_ BitVec 32)) Unit!34303)

(assert (=> b!1050310 (= lt!463867 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050311 () Bool)

(assert (=> b!1050311 (= e!595928 e!595930)))

(declare-fun res!698634 () Bool)

(assert (=> b!1050311 (=> (not res!698634) (not e!595930))))

(declare-fun arrayContainsKey!0 (array!66148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050311 (= res!698634 (arrayContainsKey!0 lt!463868 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050311 (= lt!463868 (array!66149 (store (arr!31807 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32344 a!3488)))))

(declare-fun b!1050312 () Bool)

(declare-fun e!595929 () Bool)

(assert (=> b!1050312 (= e!595924 e!595929)))

(declare-fun res!698632 () Bool)

(assert (=> b!1050312 (=> res!698632 e!595929)))

(assert (=> b!1050312 (= res!698632 (bvsle lt!463866 i!1381))))

(declare-fun b!1050313 () Bool)

(declare-fun res!698628 () Bool)

(assert (=> b!1050313 (=> (not res!698628) (not e!595928))))

(assert (=> b!1050313 (= res!698628 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22086))))

(declare-fun b!1050314 () Bool)

(assert (=> b!1050314 (= e!595929 (arrayContainsKey!0 a!3488 k0!2747 lt!463866))))

(declare-fun b!1050315 () Bool)

(declare-fun res!698636 () Bool)

(assert (=> b!1050315 (=> (not res!698636) (not e!595928))))

(assert (=> b!1050315 (= res!698636 (= (select (arr!31807 a!3488) i!1381) k0!2747))))

(assert (= (and start!92532 res!698635) b!1050313))

(assert (= (and b!1050313 res!698628) b!1050308))

(assert (= (and b!1050308 res!698633) b!1050315))

(assert (= (and b!1050315 res!698636) b!1050311))

(assert (= (and b!1050311 res!698634) b!1050307))

(assert (= (and b!1050307 res!698629) b!1050309))

(assert (= (and b!1050309 res!698631) b!1050312))

(assert (= (and b!1050312 (not res!698632)) b!1050314))

(assert (= (and b!1050309 (not res!698630)) b!1050310))

(declare-fun m!971501 () Bool)

(assert (=> b!1050311 m!971501))

(declare-fun m!971503 () Bool)

(assert (=> b!1050311 m!971503))

(declare-fun m!971505 () Bool)

(assert (=> b!1050308 m!971505))

(declare-fun m!971507 () Bool)

(assert (=> b!1050307 m!971507))

(declare-fun m!971509 () Bool)

(assert (=> start!92532 m!971509))

(declare-fun m!971511 () Bool)

(assert (=> b!1050315 m!971511))

(declare-fun m!971513 () Bool)

(assert (=> b!1050310 m!971513))

(declare-fun m!971515 () Bool)

(assert (=> b!1050310 m!971515))

(declare-fun m!971517 () Bool)

(assert (=> b!1050314 m!971517))

(assert (=> b!1050309 m!971503))

(declare-fun m!971519 () Bool)

(assert (=> b!1050309 m!971519))

(declare-fun m!971521 () Bool)

(assert (=> b!1050313 m!971521))

(check-sat (not b!1050311) (not start!92532) (not b!1050313) (not b!1050314) (not b!1050308) (not b!1050307) (not b!1050310))
(check-sat)
