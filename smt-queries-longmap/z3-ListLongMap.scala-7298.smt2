; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93480 () Bool)

(assert start!93480)

(declare-fun b!1058554 () Bool)

(declare-fun e!602061 () Bool)

(declare-fun e!602060 () Bool)

(assert (=> b!1058554 (= e!602061 e!602060)))

(declare-fun res!706456 () Bool)

(assert (=> b!1058554 (=> (not res!706456) (not e!602060))))

(declare-datatypes ((array!66733 0))(
  ( (array!66734 (arr!32083 (Array (_ BitVec 32) (_ BitVec 64))) (size!32620 (_ BitVec 32))) )
))
(declare-fun lt!466879 () array!66733)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058554 (= res!706456 (arrayContainsKey!0 lt!466879 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66733)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058554 (= lt!466879 (array!66734 (store (arr!32083 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32620 a!3488)))))

(declare-fun b!1058555 () Bool)

(declare-fun res!706454 () Bool)

(assert (=> b!1058555 (=> (not res!706454) (not e!602061))))

(declare-datatypes ((List!22365 0))(
  ( (Nil!22362) (Cons!22361 (h!23579 (_ BitVec 64)) (t!31664 List!22365)) )
))
(declare-fun arrayNoDuplicates!0 (array!66733 (_ BitVec 32) List!22365) Bool)

(assert (=> b!1058555 (= res!706454 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22362))))

(declare-fun b!1058557 () Bool)

(declare-fun e!602065 () Bool)

(declare-fun e!602059 () Bool)

(assert (=> b!1058557 (= e!602065 e!602059)))

(declare-fun res!706453 () Bool)

(assert (=> b!1058557 (=> res!706453 e!602059)))

(declare-fun lt!466883 () (_ BitVec 32))

(assert (=> b!1058557 (= res!706453 (or (bvsgt lt!466883 i!1381) (bvsle i!1381 lt!466883)))))

(declare-fun b!1058558 () Bool)

(declare-fun res!706451 () Bool)

(assert (=> b!1058558 (=> (not res!706451) (not e!602061))))

(assert (=> b!1058558 (= res!706451 (= (select (arr!32083 a!3488) i!1381) k0!2747))))

(declare-fun b!1058559 () Bool)

(declare-fun e!602063 () Bool)

(assert (=> b!1058559 (= e!602060 e!602063)))

(declare-fun res!706457 () Bool)

(assert (=> b!1058559 (=> (not res!706457) (not e!602063))))

(assert (=> b!1058559 (= res!706457 (not (= lt!466883 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66733 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058559 (= lt!466883 (arrayScanForKey!0 lt!466879 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058560 () Bool)

(declare-fun e!602062 () Bool)

(assert (=> b!1058560 (= e!602062 true)))

(declare-fun lt!466880 () (_ BitVec 32))

(assert (=> b!1058560 (arrayContainsKey!0 a!3488 k0!2747 lt!466880)))

(declare-datatypes ((Unit!34657 0))(
  ( (Unit!34658) )
))
(declare-fun lt!466881 () Unit!34657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34657)

(assert (=> b!1058560 (= lt!466881 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466880))))

(assert (=> b!1058560 (= lt!466880 (bvadd #b00000000000000000000000000000001 lt!466883))))

(assert (=> b!1058560 (arrayNoDuplicates!0 a!3488 lt!466883 Nil!22362)))

(declare-fun lt!466882 () Unit!34657)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66733 (_ BitVec 32) (_ BitVec 32)) Unit!34657)

(assert (=> b!1058560 (= lt!466882 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466883))))

(declare-fun res!706450 () Bool)

(assert (=> start!93480 (=> (not res!706450) (not e!602061))))

(assert (=> start!93480 (= res!706450 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32620 a!3488)) (bvslt (size!32620 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93480 e!602061))

(assert (=> start!93480 true))

(declare-fun array_inv!24865 (array!66733) Bool)

(assert (=> start!93480 (array_inv!24865 a!3488)))

(declare-fun b!1058556 () Bool)

(assert (=> b!1058556 (= e!602059 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058561 () Bool)

(assert (=> b!1058561 (= e!602063 (not e!602062))))

(declare-fun res!706455 () Bool)

(assert (=> b!1058561 (=> res!706455 e!602062)))

(assert (=> b!1058561 (= res!706455 (or (bvsgt lt!466883 i!1381) (bvsle i!1381 lt!466883)))))

(assert (=> b!1058561 e!602065))

(declare-fun res!706449 () Bool)

(assert (=> b!1058561 (=> (not res!706449) (not e!602065))))

(assert (=> b!1058561 (= res!706449 (= (select (store (arr!32083 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466883) k0!2747))))

(declare-fun b!1058562 () Bool)

(declare-fun res!706452 () Bool)

(assert (=> b!1058562 (=> (not res!706452) (not e!602061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058562 (= res!706452 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93480 res!706450) b!1058555))

(assert (= (and b!1058555 res!706454) b!1058562))

(assert (= (and b!1058562 res!706452) b!1058558))

(assert (= (and b!1058558 res!706451) b!1058554))

(assert (= (and b!1058554 res!706456) b!1058559))

(assert (= (and b!1058559 res!706457) b!1058561))

(assert (= (and b!1058561 res!706449) b!1058557))

(assert (= (and b!1058557 (not res!706453)) b!1058556))

(assert (= (and b!1058561 (not res!706455)) b!1058560))

(declare-fun m!978611 () Bool)

(assert (=> b!1058555 m!978611))

(declare-fun m!978613 () Bool)

(assert (=> b!1058556 m!978613))

(declare-fun m!978615 () Bool)

(assert (=> b!1058560 m!978615))

(declare-fun m!978617 () Bool)

(assert (=> b!1058560 m!978617))

(declare-fun m!978619 () Bool)

(assert (=> b!1058560 m!978619))

(declare-fun m!978621 () Bool)

(assert (=> b!1058560 m!978621))

(declare-fun m!978623 () Bool)

(assert (=> b!1058558 m!978623))

(declare-fun m!978625 () Bool)

(assert (=> b!1058554 m!978625))

(declare-fun m!978627 () Bool)

(assert (=> b!1058554 m!978627))

(assert (=> b!1058561 m!978627))

(declare-fun m!978629 () Bool)

(assert (=> b!1058561 m!978629))

(declare-fun m!978631 () Bool)

(assert (=> b!1058562 m!978631))

(declare-fun m!978633 () Bool)

(assert (=> start!93480 m!978633))

(declare-fun m!978635 () Bool)

(assert (=> b!1058559 m!978635))

(check-sat (not b!1058562) (not start!93480) (not b!1058555) (not b!1058560) (not b!1058554) (not b!1058559) (not b!1058556))
(check-sat)
