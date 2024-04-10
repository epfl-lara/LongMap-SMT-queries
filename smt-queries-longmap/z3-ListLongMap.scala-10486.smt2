; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123350 () Bool)

(assert start!123350)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97460 0))(
  ( (array!97461 (arr!47040 (Array (_ BitVec 32) (_ BitVec 64))) (size!47590 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97460)

(declare-fun e!807556 () Bool)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun b!1430348 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430348 (= e!807556 (or (= (select (arr!47040 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47040 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47040 a!2831) index!585) (select (arr!47040 a!2831) j!81)) (not (= (select (store (arr!47040 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13)))))

(declare-fun b!1430349 () Bool)

(declare-fun e!807558 () Bool)

(declare-fun e!807560 () Bool)

(assert (=> b!1430349 (= e!807558 e!807560)))

(declare-fun res!964788 () Bool)

(assert (=> b!1430349 (=> (not res!964788) (not e!807560))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11319 0))(
  ( (MissingZero!11319 (index!47668 (_ BitVec 32))) (Found!11319 (index!47669 (_ BitVec 32))) (Intermediate!11319 (undefined!12131 Bool) (index!47670 (_ BitVec 32)) (x!129303 (_ BitVec 32))) (Undefined!11319) (MissingVacant!11319 (index!47671 (_ BitVec 32))) )
))
(declare-fun lt!629728 () SeekEntryResult!11319)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97460 (_ BitVec 32)) SeekEntryResult!11319)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430349 (= res!964788 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47040 a!2831) j!81) mask!2608) (select (arr!47040 a!2831) j!81) a!2831 mask!2608) lt!629728))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1430349 (= lt!629728 (Intermediate!11319 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430350 () Bool)

(declare-fun res!964780 () Bool)

(assert (=> b!1430350 (=> (not res!964780) (not e!807556))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97460 (_ BitVec 32)) SeekEntryResult!11319)

(assert (=> b!1430350 (= res!964780 (= (seekEntryOrOpen!0 (select (arr!47040 a!2831) j!81) a!2831 mask!2608) (Found!11319 j!81)))))

(declare-fun b!1430351 () Bool)

(declare-fun res!964789 () Bool)

(assert (=> b!1430351 (=> (not res!964789) (not e!807558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430351 (= res!964789 (validKeyInArray!0 (select (arr!47040 a!2831) i!982)))))

(declare-fun b!1430352 () Bool)

(declare-fun res!964782 () Bool)

(declare-fun e!807557 () Bool)

(assert (=> b!1430352 (=> (not res!964782) (not e!807557))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1430352 (= res!964782 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47040 a!2831) j!81) a!2831 mask!2608) lt!629728))))

(declare-fun b!1430353 () Bool)

(declare-fun res!964787 () Bool)

(assert (=> b!1430353 (=> (not res!964787) (not e!807557))))

(declare-fun lt!629726 () array!97460)

(declare-fun lt!629727 () SeekEntryResult!11319)

(declare-fun lt!629729 () (_ BitVec 64))

(assert (=> b!1430353 (= res!964787 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629729 lt!629726 mask!2608) lt!629727))))

(declare-fun b!1430354 () Bool)

(declare-fun res!964786 () Bool)

(assert (=> b!1430354 (=> (not res!964786) (not e!807558))))

(assert (=> b!1430354 (= res!964786 (and (= (size!47590 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47590 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47590 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430355 () Bool)

(declare-fun res!964779 () Bool)

(assert (=> b!1430355 (=> (not res!964779) (not e!807558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97460 (_ BitVec 32)) Bool)

(assert (=> b!1430355 (= res!964779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430356 () Bool)

(declare-fun res!964781 () Bool)

(assert (=> b!1430356 (=> (not res!964781) (not e!807557))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430356 (= res!964781 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!964776 () Bool)

(assert (=> start!123350 (=> (not res!964776) (not e!807558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123350 (= res!964776 (validMask!0 mask!2608))))

(assert (=> start!123350 e!807558))

(assert (=> start!123350 true))

(declare-fun array_inv!36068 (array!97460) Bool)

(assert (=> start!123350 (array_inv!36068 a!2831)))

(declare-fun b!1430357 () Bool)

(assert (=> b!1430357 (= e!807557 (not (or (= (select (arr!47040 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47040 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47040 a!2831) index!585) (select (arr!47040 a!2831) j!81)) (not (= (select (store (arr!47040 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= intermediateAfterIndex!13 i!982))))))

(assert (=> b!1430357 e!807556))

(declare-fun res!964785 () Bool)

(assert (=> b!1430357 (=> (not res!964785) (not e!807556))))

(assert (=> b!1430357 (= res!964785 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48384 0))(
  ( (Unit!48385) )
))
(declare-fun lt!629730 () Unit!48384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48384)

(assert (=> b!1430357 (= lt!629730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430358 () Bool)

(assert (=> b!1430358 (= e!807560 e!807557)))

(declare-fun res!964778 () Bool)

(assert (=> b!1430358 (=> (not res!964778) (not e!807557))))

(assert (=> b!1430358 (= res!964778 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629729 mask!2608) lt!629729 lt!629726 mask!2608) lt!629727))))

(assert (=> b!1430358 (= lt!629727 (Intermediate!11319 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430358 (= lt!629729 (select (store (arr!47040 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430358 (= lt!629726 (array!97461 (store (arr!47040 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47590 a!2831)))))

(declare-fun b!1430359 () Bool)

(declare-fun res!964777 () Bool)

(assert (=> b!1430359 (=> (not res!964777) (not e!807558))))

(assert (=> b!1430359 (= res!964777 (validKeyInArray!0 (select (arr!47040 a!2831) j!81)))))

(declare-fun b!1430360 () Bool)

(declare-fun res!964784 () Bool)

(assert (=> b!1430360 (=> (not res!964784) (not e!807558))))

(declare-datatypes ((List!33550 0))(
  ( (Nil!33547) (Cons!33546 (h!34863 (_ BitVec 64)) (t!48244 List!33550)) )
))
(declare-fun arrayNoDuplicates!0 (array!97460 (_ BitVec 32) List!33550) Bool)

(assert (=> b!1430360 (= res!964784 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33547))))

(declare-fun b!1430361 () Bool)

(declare-fun res!964783 () Bool)

(assert (=> b!1430361 (=> (not res!964783) (not e!807558))))

(assert (=> b!1430361 (= res!964783 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47590 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47590 a!2831))))))

(assert (= (and start!123350 res!964776) b!1430354))

(assert (= (and b!1430354 res!964786) b!1430351))

(assert (= (and b!1430351 res!964789) b!1430359))

(assert (= (and b!1430359 res!964777) b!1430355))

(assert (= (and b!1430355 res!964779) b!1430360))

(assert (= (and b!1430360 res!964784) b!1430361))

(assert (= (and b!1430361 res!964783) b!1430349))

(assert (= (and b!1430349 res!964788) b!1430358))

(assert (= (and b!1430358 res!964778) b!1430352))

(assert (= (and b!1430352 res!964782) b!1430353))

(assert (= (and b!1430353 res!964787) b!1430356))

(assert (= (and b!1430356 res!964781) b!1430357))

(assert (= (and b!1430357 res!964785) b!1430350))

(assert (= (and b!1430350 res!964780) b!1430348))

(declare-fun m!1320321 () Bool)

(assert (=> b!1430357 m!1320321))

(declare-fun m!1320323 () Bool)

(assert (=> b!1430357 m!1320323))

(declare-fun m!1320325 () Bool)

(assert (=> b!1430357 m!1320325))

(declare-fun m!1320327 () Bool)

(assert (=> b!1430357 m!1320327))

(declare-fun m!1320329 () Bool)

(assert (=> b!1430357 m!1320329))

(declare-fun m!1320331 () Bool)

(assert (=> b!1430357 m!1320331))

(declare-fun m!1320333 () Bool)

(assert (=> b!1430355 m!1320333))

(assert (=> b!1430350 m!1320329))

(assert (=> b!1430350 m!1320329))

(declare-fun m!1320335 () Bool)

(assert (=> b!1430350 m!1320335))

(assert (=> b!1430352 m!1320329))

(assert (=> b!1430352 m!1320329))

(declare-fun m!1320337 () Bool)

(assert (=> b!1430352 m!1320337))

(assert (=> b!1430348 m!1320325))

(assert (=> b!1430348 m!1320329))

(assert (=> b!1430348 m!1320321))

(assert (=> b!1430348 m!1320323))

(declare-fun m!1320339 () Bool)

(assert (=> b!1430353 m!1320339))

(declare-fun m!1320341 () Bool)

(assert (=> start!123350 m!1320341))

(declare-fun m!1320343 () Bool)

(assert (=> start!123350 m!1320343))

(declare-fun m!1320345 () Bool)

(assert (=> b!1430351 m!1320345))

(assert (=> b!1430351 m!1320345))

(declare-fun m!1320347 () Bool)

(assert (=> b!1430351 m!1320347))

(declare-fun m!1320349 () Bool)

(assert (=> b!1430360 m!1320349))

(assert (=> b!1430359 m!1320329))

(assert (=> b!1430359 m!1320329))

(declare-fun m!1320351 () Bool)

(assert (=> b!1430359 m!1320351))

(assert (=> b!1430349 m!1320329))

(assert (=> b!1430349 m!1320329))

(declare-fun m!1320353 () Bool)

(assert (=> b!1430349 m!1320353))

(assert (=> b!1430349 m!1320353))

(assert (=> b!1430349 m!1320329))

(declare-fun m!1320355 () Bool)

(assert (=> b!1430349 m!1320355))

(declare-fun m!1320357 () Bool)

(assert (=> b!1430358 m!1320357))

(assert (=> b!1430358 m!1320357))

(declare-fun m!1320359 () Bool)

(assert (=> b!1430358 m!1320359))

(assert (=> b!1430358 m!1320321))

(declare-fun m!1320361 () Bool)

(assert (=> b!1430358 m!1320361))

(check-sat (not b!1430349) (not b!1430359) (not b!1430353) (not b!1430350) (not b!1430352) (not start!123350) (not b!1430358) (not b!1430360) (not b!1430355) (not b!1430357) (not b!1430351))
(check-sat)
