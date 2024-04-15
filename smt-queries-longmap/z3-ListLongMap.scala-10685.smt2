; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125218 () Bool)

(assert start!125218)

(declare-fun b!1461462 () Bool)

(declare-fun res!991167 () Bool)

(declare-fun e!821600 () Bool)

(assert (=> b!1461462 (=> (not res!991167) (not e!821600))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98644 0))(
  ( (array!98645 (arr!47611 (Array (_ BitVec 32) (_ BitVec 64))) (size!48163 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98644)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461462 (= res!991167 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48163 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48163 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48163 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461463 () Bool)

(declare-fun res!991165 () Bool)

(assert (=> b!1461463 (=> (not res!991165) (not e!821600))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461463 (= res!991165 (validKeyInArray!0 (select (arr!47611 a!2862) j!93)))))

(declare-fun b!1461464 () Bool)

(declare-fun e!821603 () Bool)

(declare-fun e!821604 () Bool)

(assert (=> b!1461464 (= e!821603 e!821604)))

(declare-fun res!991166 () Bool)

(assert (=> b!1461464 (=> (not res!991166) (not e!821604))))

(declare-datatypes ((SeekEntryResult!11888 0))(
  ( (MissingZero!11888 (index!49944 (_ BitVec 32))) (Found!11888 (index!49945 (_ BitVec 32))) (Intermediate!11888 (undefined!12700 Bool) (index!49946 (_ BitVec 32)) (x!131540 (_ BitVec 32))) (Undefined!11888) (MissingVacant!11888 (index!49947 (_ BitVec 32))) )
))
(declare-fun lt!639971 () SeekEntryResult!11888)

(assert (=> b!1461464 (= res!991166 (= lt!639971 (Intermediate!11888 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639972 () (_ BitVec 64))

(declare-fun lt!639967 () array!98644)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98644 (_ BitVec 32)) SeekEntryResult!11888)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461464 (= lt!639971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639972 mask!2687) lt!639972 lt!639967 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461464 (= lt!639972 (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461465 () Bool)

(declare-fun res!991158 () Bool)

(assert (=> b!1461465 (=> (not res!991158) (not e!821603))))

(declare-fun lt!639968 () SeekEntryResult!11888)

(assert (=> b!1461465 (= res!991158 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!639968))))

(declare-fun b!1461466 () Bool)

(declare-fun res!991171 () Bool)

(assert (=> b!1461466 (=> (not res!991171) (not e!821604))))

(assert (=> b!1461466 (= res!991171 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461467 () Bool)

(declare-fun e!821599 () Bool)

(assert (=> b!1461467 (= e!821599 true)))

(declare-fun lt!639969 () Bool)

(declare-fun e!821596 () Bool)

(assert (=> b!1461467 (= lt!639969 e!821596)))

(declare-fun c!134668 () Bool)

(assert (=> b!1461467 (= c!134668 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461468 () Bool)

(declare-fun res!991162 () Bool)

(assert (=> b!1461468 (=> (not res!991162) (not e!821600))))

(declare-datatypes ((List!34190 0))(
  ( (Nil!34187) (Cons!34186 (h!35536 (_ BitVec 64)) (t!48876 List!34190)) )
))
(declare-fun arrayNoDuplicates!0 (array!98644 (_ BitVec 32) List!34190) Bool)

(assert (=> b!1461468 (= res!991162 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34187))))

(declare-fun b!1461469 () Bool)

(declare-fun res!991154 () Bool)

(assert (=> b!1461469 (=> (not res!991154) (not e!821600))))

(assert (=> b!1461469 (= res!991154 (validKeyInArray!0 (select (arr!47611 a!2862) i!1006)))))

(declare-fun b!1461470 () Bool)

(declare-fun res!991157 () Bool)

(assert (=> b!1461470 (=> (not res!991157) (not e!821600))))

(assert (=> b!1461470 (= res!991157 (and (= (size!48163 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48163 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48163 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461471 () Bool)

(declare-fun e!821595 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98644 (_ BitVec 32)) SeekEntryResult!11888)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98644 (_ BitVec 32)) SeekEntryResult!11888)

(assert (=> b!1461471 (= e!821595 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639972 lt!639967 mask!2687) (seekEntryOrOpen!0 lt!639972 lt!639967 mask!2687)))))

(declare-fun b!1461472 () Bool)

(declare-fun e!821598 () Bool)

(assert (=> b!1461472 (= e!821600 e!821598)))

(declare-fun res!991159 () Bool)

(assert (=> b!1461472 (=> (not res!991159) (not e!821598))))

(assert (=> b!1461472 (= res!991159 (= (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461472 (= lt!639967 (array!98645 (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48163 a!2862)))))

(declare-fun b!1461473 () Bool)

(assert (=> b!1461473 (= e!821598 e!821603)))

(declare-fun res!991160 () Bool)

(assert (=> b!1461473 (=> (not res!991160) (not e!821603))))

(assert (=> b!1461473 (= res!991160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47611 a!2862) j!93) mask!2687) (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!639968))))

(assert (=> b!1461473 (= lt!639968 (Intermediate!11888 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!991155 () Bool)

(assert (=> start!125218 (=> (not res!991155) (not e!821600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125218 (= res!991155 (validMask!0 mask!2687))))

(assert (=> start!125218 e!821600))

(assert (=> start!125218 true))

(declare-fun array_inv!36844 (array!98644) Bool)

(assert (=> start!125218 (array_inv!36844 a!2862)))

(declare-fun b!1461474 () Bool)

(declare-fun e!821602 () Bool)

(assert (=> b!1461474 (= e!821602 (or (= (select (arr!47611 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47611 a!2862) intermediateBeforeIndex!19) (select (arr!47611 a!2862) j!93))))))

(declare-fun b!1461475 () Bool)

(declare-fun e!821601 () Bool)

(assert (=> b!1461475 (= e!821601 e!821599)))

(declare-fun res!991168 () Bool)

(assert (=> b!1461475 (=> res!991168 e!821599)))

(declare-fun lt!639966 () (_ BitVec 32))

(assert (=> b!1461475 (= res!991168 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639966 #b00000000000000000000000000000000) (bvsge lt!639966 (size!48163 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461475 (= lt!639966 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461476 () Bool)

(assert (=> b!1461476 (= e!821596 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639966 intermediateAfterIndex!19 lt!639972 lt!639967 mask!2687) (seekEntryOrOpen!0 lt!639972 lt!639967 mask!2687))))))

(declare-fun b!1461477 () Bool)

(declare-fun res!991164 () Bool)

(assert (=> b!1461477 (=> (not res!991164) (not e!821600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98644 (_ BitVec 32)) Bool)

(assert (=> b!1461477 (= res!991164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461478 () Bool)

(assert (=> b!1461478 (= e!821604 (not e!821601))))

(declare-fun res!991170 () Bool)

(assert (=> b!1461478 (=> res!991170 e!821601)))

(assert (=> b!1461478 (= res!991170 (or (and (= (select (arr!47611 a!2862) index!646) (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47611 a!2862) index!646) (select (arr!47611 a!2862) j!93))) (= (select (arr!47611 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461478 e!821602))

(declare-fun res!991169 () Bool)

(assert (=> b!1461478 (=> (not res!991169) (not e!821602))))

(assert (=> b!1461478 (= res!991169 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49113 0))(
  ( (Unit!49114) )
))
(declare-fun lt!639970 () Unit!49113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49113)

(assert (=> b!1461478 (= lt!639970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461479 () Bool)

(assert (=> b!1461479 (= e!821596 (not (= lt!639971 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639966 lt!639972 lt!639967 mask!2687))))))

(declare-fun b!1461480 () Bool)

(declare-fun res!991163 () Bool)

(assert (=> b!1461480 (=> (not res!991163) (not e!821604))))

(assert (=> b!1461480 (= res!991163 e!821595)))

(declare-fun c!134667 () Bool)

(assert (=> b!1461480 (= c!134667 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461481 () Bool)

(assert (=> b!1461481 (= e!821595 (= lt!639971 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639972 lt!639967 mask!2687)))))

(declare-fun b!1461482 () Bool)

(declare-fun res!991161 () Bool)

(assert (=> b!1461482 (=> res!991161 e!821599)))

(assert (=> b!1461482 (= res!991161 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639966 (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!639968)))))

(declare-fun b!1461483 () Bool)

(declare-fun res!991156 () Bool)

(assert (=> b!1461483 (=> (not res!991156) (not e!821602))))

(assert (=> b!1461483 (= res!991156 (= (seekEntryOrOpen!0 (select (arr!47611 a!2862) j!93) a!2862 mask!2687) (Found!11888 j!93)))))

(assert (= (and start!125218 res!991155) b!1461470))

(assert (= (and b!1461470 res!991157) b!1461469))

(assert (= (and b!1461469 res!991154) b!1461463))

(assert (= (and b!1461463 res!991165) b!1461477))

(assert (= (and b!1461477 res!991164) b!1461468))

(assert (= (and b!1461468 res!991162) b!1461462))

(assert (= (and b!1461462 res!991167) b!1461472))

(assert (= (and b!1461472 res!991159) b!1461473))

(assert (= (and b!1461473 res!991160) b!1461465))

(assert (= (and b!1461465 res!991158) b!1461464))

(assert (= (and b!1461464 res!991166) b!1461480))

(assert (= (and b!1461480 c!134667) b!1461481))

(assert (= (and b!1461480 (not c!134667)) b!1461471))

(assert (= (and b!1461480 res!991163) b!1461466))

(assert (= (and b!1461466 res!991171) b!1461478))

(assert (= (and b!1461478 res!991169) b!1461483))

(assert (= (and b!1461483 res!991156) b!1461474))

(assert (= (and b!1461478 (not res!991170)) b!1461475))

(assert (= (and b!1461475 (not res!991168)) b!1461482))

(assert (= (and b!1461482 (not res!991161)) b!1461467))

(assert (= (and b!1461467 c!134668) b!1461479))

(assert (= (and b!1461467 (not c!134668)) b!1461476))

(declare-fun m!1348533 () Bool)

(assert (=> b!1461469 m!1348533))

(assert (=> b!1461469 m!1348533))

(declare-fun m!1348535 () Bool)

(assert (=> b!1461469 m!1348535))

(declare-fun m!1348537 () Bool)

(assert (=> b!1461481 m!1348537))

(declare-fun m!1348539 () Bool)

(assert (=> b!1461474 m!1348539))

(declare-fun m!1348541 () Bool)

(assert (=> b!1461474 m!1348541))

(assert (=> b!1461463 m!1348541))

(assert (=> b!1461463 m!1348541))

(declare-fun m!1348543 () Bool)

(assert (=> b!1461463 m!1348543))

(declare-fun m!1348545 () Bool)

(assert (=> start!125218 m!1348545))

(declare-fun m!1348547 () Bool)

(assert (=> start!125218 m!1348547))

(assert (=> b!1461482 m!1348541))

(assert (=> b!1461482 m!1348541))

(declare-fun m!1348549 () Bool)

(assert (=> b!1461482 m!1348549))

(declare-fun m!1348551 () Bool)

(assert (=> b!1461468 m!1348551))

(assert (=> b!1461483 m!1348541))

(assert (=> b!1461483 m!1348541))

(declare-fun m!1348553 () Bool)

(assert (=> b!1461483 m!1348553))

(declare-fun m!1348555 () Bool)

(assert (=> b!1461478 m!1348555))

(declare-fun m!1348557 () Bool)

(assert (=> b!1461478 m!1348557))

(declare-fun m!1348559 () Bool)

(assert (=> b!1461478 m!1348559))

(declare-fun m!1348561 () Bool)

(assert (=> b!1461478 m!1348561))

(declare-fun m!1348563 () Bool)

(assert (=> b!1461478 m!1348563))

(assert (=> b!1461478 m!1348541))

(assert (=> b!1461472 m!1348557))

(declare-fun m!1348565 () Bool)

(assert (=> b!1461472 m!1348565))

(declare-fun m!1348567 () Bool)

(assert (=> b!1461475 m!1348567))

(declare-fun m!1348569 () Bool)

(assert (=> b!1461477 m!1348569))

(declare-fun m!1348571 () Bool)

(assert (=> b!1461476 m!1348571))

(declare-fun m!1348573 () Bool)

(assert (=> b!1461476 m!1348573))

(assert (=> b!1461473 m!1348541))

(assert (=> b!1461473 m!1348541))

(declare-fun m!1348575 () Bool)

(assert (=> b!1461473 m!1348575))

(assert (=> b!1461473 m!1348575))

(assert (=> b!1461473 m!1348541))

(declare-fun m!1348577 () Bool)

(assert (=> b!1461473 m!1348577))

(declare-fun m!1348579 () Bool)

(assert (=> b!1461464 m!1348579))

(assert (=> b!1461464 m!1348579))

(declare-fun m!1348581 () Bool)

(assert (=> b!1461464 m!1348581))

(assert (=> b!1461464 m!1348557))

(declare-fun m!1348583 () Bool)

(assert (=> b!1461464 m!1348583))

(declare-fun m!1348585 () Bool)

(assert (=> b!1461479 m!1348585))

(assert (=> b!1461465 m!1348541))

(assert (=> b!1461465 m!1348541))

(declare-fun m!1348587 () Bool)

(assert (=> b!1461465 m!1348587))

(declare-fun m!1348589 () Bool)

(assert (=> b!1461471 m!1348589))

(assert (=> b!1461471 m!1348573))

(check-sat (not b!1461468) (not b!1461482) (not b!1461483) (not b!1461469) (not b!1461463) (not start!125218) (not b!1461464) (not b!1461471) (not b!1461477) (not b!1461473) (not b!1461478) (not b!1461465) (not b!1461476) (not b!1461479) (not b!1461481) (not b!1461475))
(check-sat)
