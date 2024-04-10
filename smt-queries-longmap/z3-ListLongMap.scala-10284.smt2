; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120866 () Bool)

(assert start!120866)

(declare-fun b!1406336 () Bool)

(declare-fun res!944558 () Bool)

(declare-fun e!795992 () Bool)

(assert (=> b!1406336 (=> (not res!944558) (not e!795992))))

(declare-datatypes ((array!96173 0))(
  ( (array!96174 (arr!46434 (Array (_ BitVec 32) (_ BitVec 64))) (size!46984 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96173)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406336 (= res!944558 (validKeyInArray!0 (select (arr!46434 a!2901) i!1037)))))

(declare-fun b!1406337 () Bool)

(declare-fun e!795990 () Bool)

(assert (=> b!1406337 (= e!795990 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10745 0))(
  ( (MissingZero!10745 (index!45357 (_ BitVec 32))) (Found!10745 (index!45358 (_ BitVec 32))) (Intermediate!10745 (undefined!11557 Bool) (index!45359 (_ BitVec 32)) (x!126960 (_ BitVec 32))) (Undefined!10745) (MissingVacant!10745 (index!45360 (_ BitVec 32))) )
))
(declare-fun lt!619345 () SeekEntryResult!10745)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96173 (_ BitVec 32)) SeekEntryResult!10745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406337 (= lt!619345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46434 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46434 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96174 (store (arr!46434 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46984 a!2901)) mask!2840))))

(declare-fun b!1406338 () Bool)

(declare-fun res!944555 () Bool)

(assert (=> b!1406338 (=> (not res!944555) (not e!795992))))

(assert (=> b!1406338 (= res!944555 (and (= (size!46984 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46984 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46984 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406340 () Bool)

(declare-fun e!795989 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96173 (_ BitVec 32)) SeekEntryResult!10745)

(assert (=> b!1406340 (= e!795989 (= (seekEntryOrOpen!0 (select (arr!46434 a!2901) j!112) a!2901 mask!2840) (Found!10745 j!112)))))

(declare-fun b!1406341 () Bool)

(assert (=> b!1406341 (= e!795992 (not e!795990))))

(declare-fun res!944559 () Bool)

(assert (=> b!1406341 (=> res!944559 e!795990)))

(declare-fun lt!619347 () SeekEntryResult!10745)

(get-info :version)

(assert (=> b!1406341 (= res!944559 (or (not ((_ is Intermediate!10745) lt!619347)) (undefined!11557 lt!619347)))))

(assert (=> b!1406341 e!795989))

(declare-fun res!944553 () Bool)

(assert (=> b!1406341 (=> (not res!944553) (not e!795989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96173 (_ BitVec 32)) Bool)

(assert (=> b!1406341 (= res!944553 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47464 0))(
  ( (Unit!47465) )
))
(declare-fun lt!619346 () Unit!47464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47464)

(assert (=> b!1406341 (= lt!619346 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406341 (= lt!619347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46434 a!2901) j!112) mask!2840) (select (arr!46434 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!944554 () Bool)

(assert (=> start!120866 (=> (not res!944554) (not e!795992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120866 (= res!944554 (validMask!0 mask!2840))))

(assert (=> start!120866 e!795992))

(assert (=> start!120866 true))

(declare-fun array_inv!35462 (array!96173) Bool)

(assert (=> start!120866 (array_inv!35462 a!2901)))

(declare-fun b!1406339 () Bool)

(declare-fun res!944560 () Bool)

(assert (=> b!1406339 (=> (not res!944560) (not e!795992))))

(declare-datatypes ((List!32953 0))(
  ( (Nil!32950) (Cons!32949 (h!34203 (_ BitVec 64)) (t!47647 List!32953)) )
))
(declare-fun arrayNoDuplicates!0 (array!96173 (_ BitVec 32) List!32953) Bool)

(assert (=> b!1406339 (= res!944560 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32950))))

(declare-fun b!1406342 () Bool)

(declare-fun res!944556 () Bool)

(assert (=> b!1406342 (=> (not res!944556) (not e!795992))))

(assert (=> b!1406342 (= res!944556 (validKeyInArray!0 (select (arr!46434 a!2901) j!112)))))

(declare-fun b!1406343 () Bool)

(declare-fun res!944557 () Bool)

(assert (=> b!1406343 (=> (not res!944557) (not e!795992))))

(assert (=> b!1406343 (= res!944557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120866 res!944554) b!1406338))

(assert (= (and b!1406338 res!944555) b!1406336))

(assert (= (and b!1406336 res!944558) b!1406342))

(assert (= (and b!1406342 res!944556) b!1406343))

(assert (= (and b!1406343 res!944557) b!1406339))

(assert (= (and b!1406339 res!944560) b!1406341))

(assert (= (and b!1406341 res!944553) b!1406340))

(assert (= (and b!1406341 (not res!944559)) b!1406337))

(declare-fun m!1295437 () Bool)

(assert (=> b!1406341 m!1295437))

(declare-fun m!1295439 () Bool)

(assert (=> b!1406341 m!1295439))

(assert (=> b!1406341 m!1295437))

(declare-fun m!1295441 () Bool)

(assert (=> b!1406341 m!1295441))

(assert (=> b!1406341 m!1295439))

(assert (=> b!1406341 m!1295437))

(declare-fun m!1295443 () Bool)

(assert (=> b!1406341 m!1295443))

(declare-fun m!1295445 () Bool)

(assert (=> b!1406341 m!1295445))

(declare-fun m!1295447 () Bool)

(assert (=> b!1406337 m!1295447))

(declare-fun m!1295449 () Bool)

(assert (=> b!1406337 m!1295449))

(assert (=> b!1406337 m!1295449))

(declare-fun m!1295451 () Bool)

(assert (=> b!1406337 m!1295451))

(assert (=> b!1406337 m!1295451))

(assert (=> b!1406337 m!1295449))

(declare-fun m!1295453 () Bool)

(assert (=> b!1406337 m!1295453))

(declare-fun m!1295455 () Bool)

(assert (=> b!1406339 m!1295455))

(declare-fun m!1295457 () Bool)

(assert (=> b!1406336 m!1295457))

(assert (=> b!1406336 m!1295457))

(declare-fun m!1295459 () Bool)

(assert (=> b!1406336 m!1295459))

(assert (=> b!1406342 m!1295437))

(assert (=> b!1406342 m!1295437))

(declare-fun m!1295461 () Bool)

(assert (=> b!1406342 m!1295461))

(declare-fun m!1295463 () Bool)

(assert (=> start!120866 m!1295463))

(declare-fun m!1295465 () Bool)

(assert (=> start!120866 m!1295465))

(declare-fun m!1295467 () Bool)

(assert (=> b!1406343 m!1295467))

(assert (=> b!1406340 m!1295437))

(assert (=> b!1406340 m!1295437))

(declare-fun m!1295469 () Bool)

(assert (=> b!1406340 m!1295469))

(check-sat (not b!1406336) (not b!1406337) (not b!1406343) (not b!1406341) (not b!1406342) (not start!120866) (not b!1406340) (not b!1406339))
(check-sat)
