; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93342 () Bool)

(assert start!93342)

(declare-fun b!1057436 () Bool)

(declare-fun e!601196 () Bool)

(declare-fun e!601200 () Bool)

(assert (=> b!1057436 (= e!601196 e!601200)))

(declare-fun res!705412 () Bool)

(assert (=> b!1057436 (=> res!705412 e!601200)))

(declare-fun lt!466549 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057436 (= res!705412 (or (bvsgt lt!466549 i!1381) (bvsle i!1381 lt!466549)))))

(declare-fun b!1057437 () Bool)

(declare-datatypes ((array!66655 0))(
  ( (array!66656 (arr!32047 (Array (_ BitVec 32) (_ BitVec 64))) (size!32584 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66655)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057437 (= e!601200 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057438 () Bool)

(declare-fun res!705415 () Bool)

(declare-fun e!601197 () Bool)

(assert (=> b!1057438 (=> (not res!705415) (not e!601197))))

(declare-datatypes ((List!22329 0))(
  ( (Nil!22326) (Cons!22325 (h!23543 (_ BitVec 64)) (t!31628 List!22329)) )
))
(declare-fun arrayNoDuplicates!0 (array!66655 (_ BitVec 32) List!22329) Bool)

(assert (=> b!1057438 (= res!705415 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22326))))

(declare-fun b!1057439 () Bool)

(declare-fun e!601198 () Bool)

(declare-fun e!601199 () Bool)

(assert (=> b!1057439 (= e!601198 e!601199)))

(declare-fun res!705413 () Bool)

(assert (=> b!1057439 (=> (not res!705413) (not e!601199))))

(assert (=> b!1057439 (= res!705413 (not (= lt!466549 i!1381)))))

(declare-fun lt!466550 () array!66655)

(declare-fun arrayScanForKey!0 (array!66655 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057439 (= lt!466549 (arrayScanForKey!0 lt!466550 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057440 () Bool)

(assert (=> b!1057440 (= e!601197 e!601198)))

(declare-fun res!705411 () Bool)

(assert (=> b!1057440 (=> (not res!705411) (not e!601198))))

(assert (=> b!1057440 (= res!705411 (arrayContainsKey!0 lt!466550 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057440 (= lt!466550 (array!66656 (store (arr!32047 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32584 a!3488)))))

(declare-fun b!1057441 () Bool)

(declare-fun res!705416 () Bool)

(assert (=> b!1057441 (=> (not res!705416) (not e!601197))))

(assert (=> b!1057441 (= res!705416 (= (select (arr!32047 a!3488) i!1381) k0!2747))))

(declare-fun b!1057442 () Bool)

(assert (=> b!1057442 (= e!601199 (not true))))

(assert (=> b!1057442 e!601196))

(declare-fun res!705414 () Bool)

(assert (=> b!1057442 (=> (not res!705414) (not e!601196))))

(assert (=> b!1057442 (= res!705414 (= (select (store (arr!32047 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466549) k0!2747))))

(declare-fun res!705409 () Bool)

(assert (=> start!93342 (=> (not res!705409) (not e!601197))))

(assert (=> start!93342 (= res!705409 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32584 a!3488)) (bvslt (size!32584 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93342 e!601197))

(assert (=> start!93342 true))

(declare-fun array_inv!24829 (array!66655) Bool)

(assert (=> start!93342 (array_inv!24829 a!3488)))

(declare-fun b!1057443 () Bool)

(declare-fun res!705410 () Bool)

(assert (=> b!1057443 (=> (not res!705410) (not e!601197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057443 (= res!705410 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93342 res!705409) b!1057438))

(assert (= (and b!1057438 res!705415) b!1057443))

(assert (= (and b!1057443 res!705410) b!1057441))

(assert (= (and b!1057441 res!705416) b!1057440))

(assert (= (and b!1057440 res!705411) b!1057439))

(assert (= (and b!1057439 res!705413) b!1057442))

(assert (= (and b!1057442 res!705414) b!1057436))

(assert (= (and b!1057436 (not res!705412)) b!1057437))

(declare-fun m!977729 () Bool)

(assert (=> b!1057443 m!977729))

(declare-fun m!977731 () Bool)

(assert (=> b!1057439 m!977731))

(declare-fun m!977733 () Bool)

(assert (=> b!1057440 m!977733))

(declare-fun m!977735 () Bool)

(assert (=> b!1057440 m!977735))

(declare-fun m!977737 () Bool)

(assert (=> b!1057438 m!977737))

(declare-fun m!977739 () Bool)

(assert (=> start!93342 m!977739))

(assert (=> b!1057442 m!977735))

(declare-fun m!977741 () Bool)

(assert (=> b!1057442 m!977741))

(declare-fun m!977743 () Bool)

(assert (=> b!1057437 m!977743))

(declare-fun m!977745 () Bool)

(assert (=> b!1057441 m!977745))

(check-sat (not b!1057438) (not b!1057439) (not b!1057440) (not start!93342) (not b!1057443) (not b!1057437))
(check-sat)
