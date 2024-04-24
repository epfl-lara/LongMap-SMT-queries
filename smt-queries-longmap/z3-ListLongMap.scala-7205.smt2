; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92526 () Bool)

(assert start!92526)

(declare-fun b!1050226 () Bool)

(declare-fun e!595864 () Bool)

(declare-fun e!595862 () Bool)

(assert (=> b!1050226 (= e!595864 (not e!595862))))

(declare-fun res!698555 () Bool)

(assert (=> b!1050226 (=> res!698555 e!595862)))

(declare-fun lt!463841 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050226 (= res!698555 (bvsle lt!463841 i!1381))))

(declare-fun e!595865 () Bool)

(assert (=> b!1050226 e!595865))

(declare-fun res!698550 () Bool)

(assert (=> b!1050226 (=> (not res!698550) (not e!595865))))

(declare-datatypes ((array!66142 0))(
  ( (array!66143 (arr!31804 (Array (_ BitVec 32) (_ BitVec 64))) (size!32341 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66142)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1050226 (= res!698550 (= (select (store (arr!31804 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463841) k0!2747))))

(declare-fun b!1050227 () Bool)

(declare-fun e!595866 () Bool)

(assert (=> b!1050227 (= e!595866 e!595864)))

(declare-fun res!698547 () Bool)

(assert (=> b!1050227 (=> (not res!698547) (not e!595864))))

(assert (=> b!1050227 (= res!698547 (not (= lt!463841 i!1381)))))

(declare-fun lt!463839 () array!66142)

(declare-fun arrayScanForKey!0 (array!66142 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050227 (= lt!463841 (arrayScanForKey!0 lt!463839 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!698552 () Bool)

(declare-fun e!595861 () Bool)

(assert (=> start!92526 (=> (not res!698552) (not e!595861))))

(assert (=> start!92526 (= res!698552 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32341 a!3488)) (bvslt (size!32341 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92526 e!595861))

(assert (=> start!92526 true))

(declare-fun array_inv!24586 (array!66142) Bool)

(assert (=> start!92526 (array_inv!24586 a!3488)))

(declare-fun b!1050228 () Bool)

(declare-fun res!698554 () Bool)

(assert (=> b!1050228 (=> (not res!698554) (not e!595861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050228 (= res!698554 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050229 () Bool)

(assert (=> b!1050229 (= e!595862 true)))

(declare-datatypes ((List!22086 0))(
  ( (Nil!22083) (Cons!22082 (h!23300 (_ BitVec 64)) (t!31385 List!22086)) )
))
(declare-fun arrayNoDuplicates!0 (array!66142 (_ BitVec 32) List!22086) Bool)

(assert (=> b!1050229 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22083)))

(declare-datatypes ((Unit!34297 0))(
  ( (Unit!34298) )
))
(declare-fun lt!463840 () Unit!34297)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66142 (_ BitVec 32) (_ BitVec 32)) Unit!34297)

(assert (=> b!1050229 (= lt!463840 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050230 () Bool)

(assert (=> b!1050230 (= e!595861 e!595866)))

(declare-fun res!698549 () Bool)

(assert (=> b!1050230 (=> (not res!698549) (not e!595866))))

(declare-fun arrayContainsKey!0 (array!66142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050230 (= res!698549 (arrayContainsKey!0 lt!463839 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050230 (= lt!463839 (array!66143 (store (arr!31804 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32341 a!3488)))))

(declare-fun b!1050231 () Bool)

(declare-fun res!698553 () Bool)

(assert (=> b!1050231 (=> (not res!698553) (not e!595861))))

(assert (=> b!1050231 (= res!698553 (= (select (arr!31804 a!3488) i!1381) k0!2747))))

(declare-fun b!1050232 () Bool)

(declare-fun e!595863 () Bool)

(assert (=> b!1050232 (= e!595865 e!595863)))

(declare-fun res!698551 () Bool)

(assert (=> b!1050232 (=> res!698551 e!595863)))

(assert (=> b!1050232 (= res!698551 (bvsle lt!463841 i!1381))))

(declare-fun b!1050233 () Bool)

(declare-fun res!698548 () Bool)

(assert (=> b!1050233 (=> (not res!698548) (not e!595861))))

(assert (=> b!1050233 (= res!698548 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22083))))

(declare-fun b!1050234 () Bool)

(assert (=> b!1050234 (= e!595863 (arrayContainsKey!0 a!3488 k0!2747 lt!463841))))

(assert (= (and start!92526 res!698552) b!1050233))

(assert (= (and b!1050233 res!698548) b!1050228))

(assert (= (and b!1050228 res!698554) b!1050231))

(assert (= (and b!1050231 res!698553) b!1050230))

(assert (= (and b!1050230 res!698549) b!1050227))

(assert (= (and b!1050227 res!698547) b!1050226))

(assert (= (and b!1050226 res!698550) b!1050232))

(assert (= (and b!1050232 (not res!698551)) b!1050234))

(assert (= (and b!1050226 (not res!698555)) b!1050229))

(declare-fun m!971435 () Bool)

(assert (=> b!1050226 m!971435))

(declare-fun m!971437 () Bool)

(assert (=> b!1050226 m!971437))

(declare-fun m!971439 () Bool)

(assert (=> start!92526 m!971439))

(declare-fun m!971441 () Bool)

(assert (=> b!1050234 m!971441))

(declare-fun m!971443 () Bool)

(assert (=> b!1050227 m!971443))

(declare-fun m!971445 () Bool)

(assert (=> b!1050233 m!971445))

(declare-fun m!971447 () Bool)

(assert (=> b!1050228 m!971447))

(declare-fun m!971449 () Bool)

(assert (=> b!1050230 m!971449))

(assert (=> b!1050230 m!971435))

(declare-fun m!971451 () Bool)

(assert (=> b!1050229 m!971451))

(declare-fun m!971453 () Bool)

(assert (=> b!1050229 m!971453))

(declare-fun m!971455 () Bool)

(assert (=> b!1050231 m!971455))

(check-sat (not b!1050233) (not start!92526) (not b!1050234) (not b!1050228) (not b!1050227) (not b!1050229) (not b!1050230))
(check-sat)
