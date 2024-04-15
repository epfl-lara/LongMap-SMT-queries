; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125182 () Bool)

(assert start!125182)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1460354 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!821104 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98608 0))(
  ( (array!98609 (arr!47593 (Array (_ BitVec 32) (_ BitVec 64))) (size!48145 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98608)

(assert (=> b!1460354 (= e!821104 (not (or (and (= (select (arr!47593 a!2862) index!646) (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47593 a!2862) index!646) (select (arr!47593 a!2862) j!93))) (= (select (arr!47593 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!821106 () Bool)

(assert (=> b!1460354 e!821106))

(declare-fun res!990237 () Bool)

(assert (=> b!1460354 (=> (not res!990237) (not e!821106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98608 (_ BitVec 32)) Bool)

(assert (=> b!1460354 (= res!990237 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49077 0))(
  ( (Unit!49078) )
))
(declare-fun lt!639621 () Unit!49077)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49077)

(assert (=> b!1460354 (= lt!639621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460355 () Bool)

(declare-fun e!821107 () Bool)

(assert (=> b!1460355 (= e!821107 e!821104)))

(declare-fun res!990238 () Bool)

(assert (=> b!1460355 (=> (not res!990238) (not e!821104))))

(declare-datatypes ((SeekEntryResult!11870 0))(
  ( (MissingZero!11870 (index!49872 (_ BitVec 32))) (Found!11870 (index!49873 (_ BitVec 32))) (Intermediate!11870 (undefined!12682 Bool) (index!49874 (_ BitVec 32)) (x!131474 (_ BitVec 32))) (Undefined!11870) (MissingVacant!11870 (index!49875 (_ BitVec 32))) )
))
(declare-fun lt!639624 () SeekEntryResult!11870)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460355 (= res!990238 (= lt!639624 (Intermediate!11870 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639622 () (_ BitVec 64))

(declare-fun lt!639623 () array!98608)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98608 (_ BitVec 32)) SeekEntryResult!11870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460355 (= lt!639624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639622 mask!2687) lt!639622 lt!639623 mask!2687))))

(assert (=> b!1460355 (= lt!639622 (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460356 () Bool)

(declare-fun e!821108 () Bool)

(assert (=> b!1460356 (= e!821108 e!821107)))

(declare-fun res!990241 () Bool)

(assert (=> b!1460356 (=> (not res!990241) (not e!821107))))

(declare-fun lt!639620 () SeekEntryResult!11870)

(assert (=> b!1460356 (= res!990241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47593 a!2862) j!93) mask!2687) (select (arr!47593 a!2862) j!93) a!2862 mask!2687) lt!639620))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460356 (= lt!639620 (Intermediate!11870 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460357 () Bool)

(declare-fun res!990235 () Bool)

(declare-fun e!821109 () Bool)

(assert (=> b!1460357 (=> (not res!990235) (not e!821109))))

(assert (=> b!1460357 (= res!990235 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48145 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48145 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48145 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460358 () Bool)

(declare-fun res!990232 () Bool)

(assert (=> b!1460358 (=> (not res!990232) (not e!821109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460358 (= res!990232 (validKeyInArray!0 (select (arr!47593 a!2862) i!1006)))))

(declare-fun b!1460359 () Bool)

(declare-fun res!990231 () Bool)

(assert (=> b!1460359 (=> (not res!990231) (not e!821109))))

(assert (=> b!1460359 (= res!990231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460360 () Bool)

(declare-fun res!990239 () Bool)

(assert (=> b!1460360 (=> (not res!990239) (not e!821104))))

(declare-fun e!821103 () Bool)

(assert (=> b!1460360 (= res!990239 e!821103)))

(declare-fun c!134575 () Bool)

(assert (=> b!1460360 (= c!134575 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460361 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98608 (_ BitVec 32)) SeekEntryResult!11870)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98608 (_ BitVec 32)) SeekEntryResult!11870)

(assert (=> b!1460361 (= e!821103 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639622 lt!639623 mask!2687) (seekEntryOrOpen!0 lt!639622 lt!639623 mask!2687)))))

(declare-fun res!990234 () Bool)

(assert (=> start!125182 (=> (not res!990234) (not e!821109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125182 (= res!990234 (validMask!0 mask!2687))))

(assert (=> start!125182 e!821109))

(assert (=> start!125182 true))

(declare-fun array_inv!36826 (array!98608) Bool)

(assert (=> start!125182 (array_inv!36826 a!2862)))

(declare-fun b!1460362 () Bool)

(declare-fun res!990236 () Bool)

(assert (=> b!1460362 (=> (not res!990236) (not e!821109))))

(assert (=> b!1460362 (= res!990236 (validKeyInArray!0 (select (arr!47593 a!2862) j!93)))))

(declare-fun b!1460363 () Bool)

(declare-fun res!990240 () Bool)

(assert (=> b!1460363 (=> (not res!990240) (not e!821104))))

(assert (=> b!1460363 (= res!990240 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460364 () Bool)

(assert (=> b!1460364 (= e!821109 e!821108)))

(declare-fun res!990230 () Bool)

(assert (=> b!1460364 (=> (not res!990230) (not e!821108))))

(assert (=> b!1460364 (= res!990230 (= (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460364 (= lt!639623 (array!98609 (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48145 a!2862)))))

(declare-fun b!1460365 () Bool)

(assert (=> b!1460365 (= e!821103 (= lt!639624 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639622 lt!639623 mask!2687)))))

(declare-fun b!1460366 () Bool)

(assert (=> b!1460366 (= e!821106 (or (= (select (arr!47593 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47593 a!2862) intermediateBeforeIndex!19) (select (arr!47593 a!2862) j!93))))))

(declare-fun b!1460367 () Bool)

(declare-fun res!990233 () Bool)

(assert (=> b!1460367 (=> (not res!990233) (not e!821109))))

(assert (=> b!1460367 (= res!990233 (and (= (size!48145 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48145 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48145 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460368 () Bool)

(declare-fun res!990242 () Bool)

(assert (=> b!1460368 (=> (not res!990242) (not e!821106))))

(assert (=> b!1460368 (= res!990242 (= (seekEntryOrOpen!0 (select (arr!47593 a!2862) j!93) a!2862 mask!2687) (Found!11870 j!93)))))

(declare-fun b!1460369 () Bool)

(declare-fun res!990244 () Bool)

(assert (=> b!1460369 (=> (not res!990244) (not e!821107))))

(assert (=> b!1460369 (= res!990244 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47593 a!2862) j!93) a!2862 mask!2687) lt!639620))))

(declare-fun b!1460370 () Bool)

(declare-fun res!990243 () Bool)

(assert (=> b!1460370 (=> (not res!990243) (not e!821109))))

(declare-datatypes ((List!34172 0))(
  ( (Nil!34169) (Cons!34168 (h!35518 (_ BitVec 64)) (t!48858 List!34172)) )
))
(declare-fun arrayNoDuplicates!0 (array!98608 (_ BitVec 32) List!34172) Bool)

(assert (=> b!1460370 (= res!990243 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34169))))

(assert (= (and start!125182 res!990234) b!1460367))

(assert (= (and b!1460367 res!990233) b!1460358))

(assert (= (and b!1460358 res!990232) b!1460362))

(assert (= (and b!1460362 res!990236) b!1460359))

(assert (= (and b!1460359 res!990231) b!1460370))

(assert (= (and b!1460370 res!990243) b!1460357))

(assert (= (and b!1460357 res!990235) b!1460364))

(assert (= (and b!1460364 res!990230) b!1460356))

(assert (= (and b!1460356 res!990241) b!1460369))

(assert (= (and b!1460369 res!990244) b!1460355))

(assert (= (and b!1460355 res!990238) b!1460360))

(assert (= (and b!1460360 c!134575) b!1460365))

(assert (= (and b!1460360 (not c!134575)) b!1460361))

(assert (= (and b!1460360 res!990239) b!1460363))

(assert (= (and b!1460363 res!990240) b!1460354))

(assert (= (and b!1460354 res!990237) b!1460368))

(assert (= (and b!1460368 res!990242) b!1460366))

(declare-fun m!1347549 () Bool)

(assert (=> b!1460365 m!1347549))

(declare-fun m!1347551 () Bool)

(assert (=> b!1460368 m!1347551))

(assert (=> b!1460368 m!1347551))

(declare-fun m!1347553 () Bool)

(assert (=> b!1460368 m!1347553))

(declare-fun m!1347555 () Bool)

(assert (=> start!125182 m!1347555))

(declare-fun m!1347557 () Bool)

(assert (=> start!125182 m!1347557))

(declare-fun m!1347559 () Bool)

(assert (=> b!1460354 m!1347559))

(declare-fun m!1347561 () Bool)

(assert (=> b!1460354 m!1347561))

(declare-fun m!1347563 () Bool)

(assert (=> b!1460354 m!1347563))

(declare-fun m!1347565 () Bool)

(assert (=> b!1460354 m!1347565))

(declare-fun m!1347567 () Bool)

(assert (=> b!1460354 m!1347567))

(assert (=> b!1460354 m!1347551))

(assert (=> b!1460369 m!1347551))

(assert (=> b!1460369 m!1347551))

(declare-fun m!1347569 () Bool)

(assert (=> b!1460369 m!1347569))

(assert (=> b!1460356 m!1347551))

(assert (=> b!1460356 m!1347551))

(declare-fun m!1347571 () Bool)

(assert (=> b!1460356 m!1347571))

(assert (=> b!1460356 m!1347571))

(assert (=> b!1460356 m!1347551))

(declare-fun m!1347573 () Bool)

(assert (=> b!1460356 m!1347573))

(declare-fun m!1347575 () Bool)

(assert (=> b!1460358 m!1347575))

(assert (=> b!1460358 m!1347575))

(declare-fun m!1347577 () Bool)

(assert (=> b!1460358 m!1347577))

(declare-fun m!1347579 () Bool)

(assert (=> b!1460366 m!1347579))

(assert (=> b!1460366 m!1347551))

(declare-fun m!1347581 () Bool)

(assert (=> b!1460370 m!1347581))

(declare-fun m!1347583 () Bool)

(assert (=> b!1460361 m!1347583))

(declare-fun m!1347585 () Bool)

(assert (=> b!1460361 m!1347585))

(declare-fun m!1347587 () Bool)

(assert (=> b!1460355 m!1347587))

(assert (=> b!1460355 m!1347587))

(declare-fun m!1347589 () Bool)

(assert (=> b!1460355 m!1347589))

(assert (=> b!1460355 m!1347561))

(declare-fun m!1347591 () Bool)

(assert (=> b!1460355 m!1347591))

(declare-fun m!1347593 () Bool)

(assert (=> b!1460359 m!1347593))

(assert (=> b!1460362 m!1347551))

(assert (=> b!1460362 m!1347551))

(declare-fun m!1347595 () Bool)

(assert (=> b!1460362 m!1347595))

(assert (=> b!1460364 m!1347561))

(declare-fun m!1347597 () Bool)

(assert (=> b!1460364 m!1347597))

(check-sat (not b!1460362) (not b!1460359) (not b!1460370) (not start!125182) (not b!1460355) (not b!1460369) (not b!1460356) (not b!1460368) (not b!1460365) (not b!1460361) (not b!1460354) (not b!1460358))
(check-sat)
