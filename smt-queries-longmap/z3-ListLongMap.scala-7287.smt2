; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93348 () Bool)

(assert start!93348)

(declare-fun res!705482 () Bool)

(declare-fun e!601250 () Bool)

(assert (=> start!93348 (=> (not res!705482) (not e!601250))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66661 0))(
  ( (array!66662 (arr!32050 (Array (_ BitVec 32) (_ BitVec 64))) (size!32587 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66661)

(assert (=> start!93348 (= res!705482 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32587 a!3488)) (bvslt (size!32587 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93348 e!601250))

(assert (=> start!93348 true))

(declare-fun array_inv!24832 (array!66661) Bool)

(assert (=> start!93348 (array_inv!24832 a!3488)))

(declare-fun b!1057508 () Bool)

(declare-fun e!601254 () Bool)

(assert (=> b!1057508 (= e!601250 e!601254)))

(declare-fun res!705485 () Bool)

(assert (=> b!1057508 (=> (not res!705485) (not e!601254))))

(declare-fun lt!466567 () array!66661)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057508 (= res!705485 (arrayContainsKey!0 lt!466567 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057508 (= lt!466567 (array!66662 (store (arr!32050 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32587 a!3488)))))

(declare-fun b!1057509 () Bool)

(declare-fun e!601251 () Bool)

(declare-fun e!601252 () Bool)

(assert (=> b!1057509 (= e!601251 e!601252)))

(declare-fun res!705487 () Bool)

(assert (=> b!1057509 (=> res!705487 e!601252)))

(declare-fun lt!466568 () (_ BitVec 32))

(assert (=> b!1057509 (= res!705487 (or (bvsgt lt!466568 i!1381) (bvsle i!1381 lt!466568)))))

(declare-fun b!1057510 () Bool)

(assert (=> b!1057510 (= e!601252 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057511 () Bool)

(declare-fun e!601253 () Bool)

(assert (=> b!1057511 (= e!601254 e!601253)))

(declare-fun res!705483 () Bool)

(assert (=> b!1057511 (=> (not res!705483) (not e!601253))))

(assert (=> b!1057511 (= res!705483 (not (= lt!466568 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66661 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057511 (= lt!466568 (arrayScanForKey!0 lt!466567 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057512 () Bool)

(declare-fun res!705484 () Bool)

(assert (=> b!1057512 (=> (not res!705484) (not e!601250))))

(declare-datatypes ((List!22332 0))(
  ( (Nil!22329) (Cons!22328 (h!23546 (_ BitVec 64)) (t!31631 List!22332)) )
))
(declare-fun arrayNoDuplicates!0 (array!66661 (_ BitVec 32) List!22332) Bool)

(assert (=> b!1057512 (= res!705484 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22329))))

(declare-fun b!1057513 () Bool)

(declare-fun res!705481 () Bool)

(assert (=> b!1057513 (=> (not res!705481) (not e!601250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057513 (= res!705481 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057514 () Bool)

(assert (=> b!1057514 (= e!601253 (not true))))

(assert (=> b!1057514 e!601251))

(declare-fun res!705488 () Bool)

(assert (=> b!1057514 (=> (not res!705488) (not e!601251))))

(assert (=> b!1057514 (= res!705488 (= (select (store (arr!32050 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466568) k0!2747))))

(declare-fun b!1057515 () Bool)

(declare-fun res!705486 () Bool)

(assert (=> b!1057515 (=> (not res!705486) (not e!601250))))

(assert (=> b!1057515 (= res!705486 (= (select (arr!32050 a!3488) i!1381) k0!2747))))

(assert (= (and start!93348 res!705482) b!1057512))

(assert (= (and b!1057512 res!705484) b!1057513))

(assert (= (and b!1057513 res!705481) b!1057515))

(assert (= (and b!1057515 res!705486) b!1057508))

(assert (= (and b!1057508 res!705485) b!1057511))

(assert (= (and b!1057511 res!705483) b!1057514))

(assert (= (and b!1057514 res!705488) b!1057509))

(assert (= (and b!1057509 (not res!705487)) b!1057510))

(declare-fun m!977783 () Bool)

(assert (=> b!1057515 m!977783))

(declare-fun m!977785 () Bool)

(assert (=> b!1057514 m!977785))

(declare-fun m!977787 () Bool)

(assert (=> b!1057514 m!977787))

(declare-fun m!977789 () Bool)

(assert (=> b!1057510 m!977789))

(declare-fun m!977791 () Bool)

(assert (=> start!93348 m!977791))

(declare-fun m!977793 () Bool)

(assert (=> b!1057508 m!977793))

(assert (=> b!1057508 m!977785))

(declare-fun m!977795 () Bool)

(assert (=> b!1057513 m!977795))

(declare-fun m!977797 () Bool)

(assert (=> b!1057511 m!977797))

(declare-fun m!977799 () Bool)

(assert (=> b!1057512 m!977799))

(check-sat (not b!1057511) (not b!1057510) (not b!1057512) (not b!1057513) (not start!93348) (not b!1057508))
(check-sat)
