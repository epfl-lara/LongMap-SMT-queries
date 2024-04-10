; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92858 () Bool)

(assert start!92858)

(declare-fun b!1054554 () Bool)

(declare-fun res!703501 () Bool)

(declare-fun e!599141 () Bool)

(assert (=> b!1054554 (=> (not res!703501) (not e!599141))))

(declare-datatypes ((array!66518 0))(
  ( (array!66519 (arr!31991 (Array (_ BitVec 32) (_ BitVec 64))) (size!32527 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66518)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054554 (= res!703501 (= (select (arr!31991 a!3488) i!1381) k0!2747))))

(declare-fun res!703502 () Bool)

(assert (=> start!92858 (=> (not res!703502) (not e!599141))))

(assert (=> start!92858 (= res!703502 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32527 a!3488)) (bvslt (size!32527 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92858 e!599141))

(assert (=> start!92858 true))

(declare-fun array_inv!24771 (array!66518) Bool)

(assert (=> start!92858 (array_inv!24771 a!3488)))

(declare-fun b!1054555 () Bool)

(declare-fun res!703499 () Bool)

(assert (=> b!1054555 (=> (not res!703499) (not e!599141))))

(declare-datatypes ((List!22303 0))(
  ( (Nil!22300) (Cons!22299 (h!23508 (_ BitVec 64)) (t!31610 List!22303)) )
))
(declare-fun arrayNoDuplicates!0 (array!66518 (_ BitVec 32) List!22303) Bool)

(assert (=> b!1054555 (= res!703499 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22300))))

(declare-fun e!599140 () Bool)

(declare-fun b!1054556 () Bool)

(declare-fun lt!465454 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054556 (= e!599140 (arrayContainsKey!0 a!3488 k0!2747 lt!465454))))

(declare-fun b!1054557 () Bool)

(declare-fun e!599144 () Bool)

(declare-fun e!599146 () Bool)

(assert (=> b!1054557 (= e!599144 (not e!599146))))

(declare-fun res!703495 () Bool)

(assert (=> b!1054557 (=> res!703495 e!599146)))

(assert (=> b!1054557 (= res!703495 (bvsle lt!465454 i!1381))))

(declare-fun e!599145 () Bool)

(assert (=> b!1054557 e!599145))

(declare-fun res!703500 () Bool)

(assert (=> b!1054557 (=> (not res!703500) (not e!599145))))

(assert (=> b!1054557 (= res!703500 (= (select (store (arr!31991 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465454) k0!2747))))

(declare-fun b!1054558 () Bool)

(declare-fun e!599142 () Bool)

(assert (=> b!1054558 (= e!599142 e!599144)))

(declare-fun res!703498 () Bool)

(assert (=> b!1054558 (=> (not res!703498) (not e!599144))))

(assert (=> b!1054558 (= res!703498 (not (= lt!465454 i!1381)))))

(declare-fun lt!465453 () array!66518)

(declare-fun arrayScanForKey!0 (array!66518 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054558 (= lt!465454 (arrayScanForKey!0 lt!465453 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054559 () Bool)

(assert (=> b!1054559 (= e!599146 true)))

(assert (=> b!1054559 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34540 0))(
  ( (Unit!34541) )
))
(declare-fun lt!465455 () Unit!34540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34540)

(assert (=> b!1054559 (= lt!465455 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465454 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054559 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22300)))

(declare-fun lt!465456 () Unit!34540)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66518 (_ BitVec 32) (_ BitVec 32)) Unit!34540)

(assert (=> b!1054559 (= lt!465456 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054560 () Bool)

(assert (=> b!1054560 (= e!599141 e!599142)))

(declare-fun res!703494 () Bool)

(assert (=> b!1054560 (=> (not res!703494) (not e!599142))))

(assert (=> b!1054560 (= res!703494 (arrayContainsKey!0 lt!465453 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054560 (= lt!465453 (array!66519 (store (arr!31991 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32527 a!3488)))))

(declare-fun b!1054561 () Bool)

(assert (=> b!1054561 (= e!599145 e!599140)))

(declare-fun res!703497 () Bool)

(assert (=> b!1054561 (=> res!703497 e!599140)))

(assert (=> b!1054561 (= res!703497 (bvsle lt!465454 i!1381))))

(declare-fun b!1054562 () Bool)

(declare-fun res!703496 () Bool)

(assert (=> b!1054562 (=> (not res!703496) (not e!599141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054562 (= res!703496 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92858 res!703502) b!1054555))

(assert (= (and b!1054555 res!703499) b!1054562))

(assert (= (and b!1054562 res!703496) b!1054554))

(assert (= (and b!1054554 res!703501) b!1054560))

(assert (= (and b!1054560 res!703494) b!1054558))

(assert (= (and b!1054558 res!703498) b!1054557))

(assert (= (and b!1054557 res!703500) b!1054561))

(assert (= (and b!1054561 (not res!703497)) b!1054556))

(assert (= (and b!1054557 (not res!703495)) b!1054559))

(declare-fun m!974605 () Bool)

(assert (=> start!92858 m!974605))

(declare-fun m!974607 () Bool)

(assert (=> b!1054560 m!974607))

(declare-fun m!974609 () Bool)

(assert (=> b!1054560 m!974609))

(declare-fun m!974611 () Bool)

(assert (=> b!1054562 m!974611))

(declare-fun m!974613 () Bool)

(assert (=> b!1054556 m!974613))

(assert (=> b!1054557 m!974609))

(declare-fun m!974615 () Bool)

(assert (=> b!1054557 m!974615))

(declare-fun m!974617 () Bool)

(assert (=> b!1054558 m!974617))

(declare-fun m!974619 () Bool)

(assert (=> b!1054554 m!974619))

(declare-fun m!974621 () Bool)

(assert (=> b!1054559 m!974621))

(declare-fun m!974623 () Bool)

(assert (=> b!1054559 m!974623))

(declare-fun m!974625 () Bool)

(assert (=> b!1054559 m!974625))

(declare-fun m!974627 () Bool)

(assert (=> b!1054559 m!974627))

(declare-fun m!974629 () Bool)

(assert (=> b!1054555 m!974629))

(check-sat (not b!1054556) (not b!1054562) (not b!1054559) (not start!92858) (not b!1054560) (not b!1054558) (not b!1054555))
(check-sat)
