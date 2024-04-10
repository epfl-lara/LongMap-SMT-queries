; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93164 () Bool)

(assert start!93164)

(declare-fun b!1056520 () Bool)

(declare-fun e!600657 () Bool)

(declare-fun e!600656 () Bool)

(assert (=> b!1056520 (= e!600657 e!600656)))

(declare-fun res!705268 () Bool)

(assert (=> b!1056520 (=> (not res!705268) (not e!600656))))

(declare-datatypes ((array!66635 0))(
  ( (array!66636 (arr!32042 (Array (_ BitVec 32) (_ BitVec 64))) (size!32578 (_ BitVec 32))) )
))
(declare-fun lt!466121 () array!66635)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056520 (= res!705268 (arrayContainsKey!0 lt!466121 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66635)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056520 (= lt!466121 (array!66636 (store (arr!32042 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32578 a!3488)))))

(declare-fun b!1056521 () Bool)

(declare-fun res!705262 () Bool)

(assert (=> b!1056521 (=> (not res!705262) (not e!600657))))

(declare-datatypes ((List!22354 0))(
  ( (Nil!22351) (Cons!22350 (h!23559 (_ BitVec 64)) (t!31661 List!22354)) )
))
(declare-fun arrayNoDuplicates!0 (array!66635 (_ BitVec 32) List!22354) Bool)

(assert (=> b!1056521 (= res!705262 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22351))))

(declare-fun e!600661 () Bool)

(declare-fun b!1056522 () Bool)

(assert (=> b!1056522 (= e!600661 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056523 () Bool)

(declare-fun e!600659 () Bool)

(assert (=> b!1056523 (= e!600656 e!600659)))

(declare-fun res!705269 () Bool)

(assert (=> b!1056523 (=> (not res!705269) (not e!600659))))

(declare-fun lt!466122 () (_ BitVec 32))

(assert (=> b!1056523 (= res!705269 (not (= lt!466122 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66635 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056523 (= lt!466122 (arrayScanForKey!0 lt!466121 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056524 () Bool)

(declare-fun res!705265 () Bool)

(assert (=> b!1056524 (=> (not res!705265) (not e!600657))))

(assert (=> b!1056524 (= res!705265 (= (select (arr!32042 a!3488) i!1381) k0!2747))))

(declare-fun res!705267 () Bool)

(assert (=> start!93164 (=> (not res!705267) (not e!600657))))

(assert (=> start!93164 (= res!705267 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32578 a!3488)) (bvslt (size!32578 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93164 e!600657))

(assert (=> start!93164 true))

(declare-fun array_inv!24822 (array!66635) Bool)

(assert (=> start!93164 (array_inv!24822 a!3488)))

(declare-fun b!1056525 () Bool)

(declare-fun e!600658 () Bool)

(assert (=> b!1056525 (= e!600658 e!600661)))

(declare-fun res!705264 () Bool)

(assert (=> b!1056525 (=> res!705264 e!600661)))

(assert (=> b!1056525 (= res!705264 (or (bvsgt lt!466122 i!1381) (bvsle i!1381 lt!466122)))))

(declare-fun b!1056526 () Bool)

(declare-fun res!705266 () Bool)

(assert (=> b!1056526 (=> (not res!705266) (not e!600657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056526 (= res!705266 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056527 () Bool)

(assert (=> b!1056527 (= e!600659 (not true))))

(assert (=> b!1056527 e!600658))

(declare-fun res!705263 () Bool)

(assert (=> b!1056527 (=> (not res!705263) (not e!600658))))

(assert (=> b!1056527 (= res!705263 (= (select (store (arr!32042 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466122) k0!2747))))

(assert (= (and start!93164 res!705267) b!1056521))

(assert (= (and b!1056521 res!705262) b!1056526))

(assert (= (and b!1056526 res!705266) b!1056524))

(assert (= (and b!1056524 res!705265) b!1056520))

(assert (= (and b!1056520 res!705268) b!1056523))

(assert (= (and b!1056523 res!705269) b!1056527))

(assert (= (and b!1056527 res!705263) b!1056525))

(assert (= (and b!1056525 (not res!705264)) b!1056522))

(declare-fun m!976349 () Bool)

(assert (=> b!1056521 m!976349))

(declare-fun m!976351 () Bool)

(assert (=> b!1056524 m!976351))

(declare-fun m!976353 () Bool)

(assert (=> b!1056522 m!976353))

(declare-fun m!976355 () Bool)

(assert (=> b!1056527 m!976355))

(declare-fun m!976357 () Bool)

(assert (=> b!1056527 m!976357))

(declare-fun m!976359 () Bool)

(assert (=> start!93164 m!976359))

(declare-fun m!976361 () Bool)

(assert (=> b!1056520 m!976361))

(assert (=> b!1056520 m!976355))

(declare-fun m!976363 () Bool)

(assert (=> b!1056526 m!976363))

(declare-fun m!976365 () Bool)

(assert (=> b!1056523 m!976365))

(check-sat (not b!1056520) (not b!1056523) (not b!1056526) (not b!1056522) (not start!93164) (not b!1056521))
(check-sat)
