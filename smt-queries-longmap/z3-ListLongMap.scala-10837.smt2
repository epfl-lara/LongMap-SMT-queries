; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126870 () Bool)

(assert start!126870)

(declare-fun res!1013606 () Bool)

(declare-fun e!835122 () Bool)

(assert (=> start!126870 (=> (not res!1013606) (not e!835122))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126870 (= res!1013606 (validMask!0 mask!2687))))

(assert (=> start!126870 e!835122))

(assert (=> start!126870 true))

(declare-datatypes ((array!99643 0))(
  ( (array!99644 (arr!48093 (Array (_ BitVec 32) (_ BitVec 64))) (size!48643 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99643)

(declare-fun array_inv!37121 (array!99643) Bool)

(assert (=> start!126870 (array_inv!37121 a!2862)))

(declare-fun b!1490302 () Bool)

(declare-fun res!1013601 () Bool)

(declare-fun e!835126 () Bool)

(assert (=> b!1490302 (=> (not res!1013601) (not e!835126))))

(declare-fun e!835127 () Bool)

(assert (=> b!1490302 (= res!1013601 e!835127)))

(declare-fun c!137880 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490302 (= c!137880 (bvsle x!665 intermediateAfterX!19))))

(declare-datatypes ((SeekEntryResult!12333 0))(
  ( (MissingZero!12333 (index!51724 (_ BitVec 32))) (Found!12333 (index!51725 (_ BitVec 32))) (Intermediate!12333 (undefined!13145 Bool) (index!51726 (_ BitVec 32)) (x!133317 (_ BitVec 32))) (Undefined!12333) (MissingVacant!12333 (index!51727 (_ BitVec 32))) )
))
(declare-fun lt!649898 () SeekEntryResult!12333)

(declare-fun lt!649902 () array!99643)

(declare-fun lt!649901 () (_ BitVec 64))

(declare-fun b!1490303 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99643 (_ BitVec 32)) SeekEntryResult!12333)

(assert (=> b!1490303 (= e!835127 (= lt!649898 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649901 lt!649902 mask!2687)))))

(declare-fun b!1490304 () Bool)

(declare-fun e!835124 () Bool)

(assert (=> b!1490304 (= e!835122 e!835124)))

(declare-fun res!1013610 () Bool)

(assert (=> b!1490304 (=> (not res!1013610) (not e!835124))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490304 (= res!1013610 (= (select (store (arr!48093 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490304 (= lt!649902 (array!99644 (store (arr!48093 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48643 a!2862)))))

(declare-fun b!1490305 () Bool)

(declare-fun e!835125 () Bool)

(assert (=> b!1490305 (= e!835124 e!835125)))

(declare-fun res!1013600 () Bool)

(assert (=> b!1490305 (=> (not res!1013600) (not e!835125))))

(declare-fun lt!649899 () SeekEntryResult!12333)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490305 (= res!1013600 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48093 a!2862) j!93) mask!2687) (select (arr!48093 a!2862) j!93) a!2862 mask!2687) lt!649899))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490305 (= lt!649899 (Intermediate!12333 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490306 () Bool)

(declare-fun res!1013603 () Bool)

(assert (=> b!1490306 (=> (not res!1013603) (not e!835122))))

(assert (=> b!1490306 (= res!1013603 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48643 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48643 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48643 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490307 () Bool)

(assert (=> b!1490307 (= e!835125 e!835126)))

(declare-fun res!1013611 () Bool)

(assert (=> b!1490307 (=> (not res!1013611) (not e!835126))))

(assert (=> b!1490307 (= res!1013611 (= lt!649898 (Intermediate!12333 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490307 (= lt!649898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649901 mask!2687) lt!649901 lt!649902 mask!2687))))

(assert (=> b!1490307 (= lt!649901 (select (store (arr!48093 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490308 () Bool)

(declare-fun res!1013607 () Bool)

(declare-fun e!835120 () Bool)

(assert (=> b!1490308 (=> (not res!1013607) (not e!835120))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99643 (_ BitVec 32)) SeekEntryResult!12333)

(assert (=> b!1490308 (= res!1013607 (= (seekEntryOrOpen!0 (select (arr!48093 a!2862) j!93) a!2862 mask!2687) (Found!12333 j!93)))))

(declare-fun b!1490309 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99643 (_ BitVec 32)) SeekEntryResult!12333)

(assert (=> b!1490309 (= e!835127 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649901 lt!649902 mask!2687) (seekEntryOrOpen!0 lt!649901 lt!649902 mask!2687)))))

(declare-fun b!1490310 () Bool)

(declare-fun res!1013599 () Bool)

(assert (=> b!1490310 (=> (not res!1013599) (not e!835122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490310 (= res!1013599 (validKeyInArray!0 (select (arr!48093 a!2862) j!93)))))

(declare-fun b!1490311 () Bool)

(declare-fun res!1013602 () Bool)

(assert (=> b!1490311 (=> (not res!1013602) (not e!835125))))

(assert (=> b!1490311 (= res!1013602 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48093 a!2862) j!93) a!2862 mask!2687) lt!649899))))

(declare-fun b!1490312 () Bool)

(declare-fun res!1013597 () Bool)

(assert (=> b!1490312 (=> (not res!1013597) (not e!835122))))

(declare-datatypes ((List!34594 0))(
  ( (Nil!34591) (Cons!34590 (h!35973 (_ BitVec 64)) (t!49288 List!34594)) )
))
(declare-fun arrayNoDuplicates!0 (array!99643 (_ BitVec 32) List!34594) Bool)

(assert (=> b!1490312 (= res!1013597 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34591))))

(declare-fun b!1490313 () Bool)

(declare-fun e!835121 () Bool)

(assert (=> b!1490313 (= e!835126 (not e!835121))))

(declare-fun res!1013598 () Bool)

(assert (=> b!1490313 (=> res!1013598 e!835121)))

(assert (=> b!1490313 (= res!1013598 (or (and (= (select (arr!48093 a!2862) index!646) (select (store (arr!48093 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48093 a!2862) index!646) (select (arr!48093 a!2862) j!93))) (= (select (arr!48093 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490313 e!835120))

(declare-fun res!1013604 () Bool)

(assert (=> b!1490313 (=> (not res!1013604) (not e!835120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99643 (_ BitVec 32)) Bool)

(assert (=> b!1490313 (= res!1013604 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50006 0))(
  ( (Unit!50007) )
))
(declare-fun lt!649897 () Unit!50006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50006)

(assert (=> b!1490313 (= lt!649897 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490314 () Bool)

(assert (=> b!1490314 (= e!835121 true)))

(declare-fun lt!649900 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490314 (= lt!649900 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490315 () Bool)

(declare-fun res!1013609 () Bool)

(assert (=> b!1490315 (=> (not res!1013609) (not e!835126))))

(assert (=> b!1490315 (= res!1013609 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490316 () Bool)

(declare-fun res!1013596 () Bool)

(assert (=> b!1490316 (=> (not res!1013596) (not e!835122))))

(assert (=> b!1490316 (= res!1013596 (and (= (size!48643 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48643 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48643 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490317 () Bool)

(declare-fun res!1013608 () Bool)

(assert (=> b!1490317 (=> (not res!1013608) (not e!835122))))

(assert (=> b!1490317 (= res!1013608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490318 () Bool)

(assert (=> b!1490318 (= e!835120 (or (= (select (arr!48093 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48093 a!2862) intermediateBeforeIndex!19) (select (arr!48093 a!2862) j!93))))))

(declare-fun b!1490319 () Bool)

(declare-fun res!1013605 () Bool)

(assert (=> b!1490319 (=> (not res!1013605) (not e!835122))))

(assert (=> b!1490319 (= res!1013605 (validKeyInArray!0 (select (arr!48093 a!2862) i!1006)))))

(assert (= (and start!126870 res!1013606) b!1490316))

(assert (= (and b!1490316 res!1013596) b!1490319))

(assert (= (and b!1490319 res!1013605) b!1490310))

(assert (= (and b!1490310 res!1013599) b!1490317))

(assert (= (and b!1490317 res!1013608) b!1490312))

(assert (= (and b!1490312 res!1013597) b!1490306))

(assert (= (and b!1490306 res!1013603) b!1490304))

(assert (= (and b!1490304 res!1013610) b!1490305))

(assert (= (and b!1490305 res!1013600) b!1490311))

(assert (= (and b!1490311 res!1013602) b!1490307))

(assert (= (and b!1490307 res!1013611) b!1490302))

(assert (= (and b!1490302 c!137880) b!1490303))

(assert (= (and b!1490302 (not c!137880)) b!1490309))

(assert (= (and b!1490302 res!1013601) b!1490315))

(assert (= (and b!1490315 res!1013609) b!1490313))

(assert (= (and b!1490313 res!1013604) b!1490308))

(assert (= (and b!1490308 res!1013607) b!1490318))

(assert (= (and b!1490313 (not res!1013598)) b!1490314))

(declare-fun m!1374467 () Bool)

(assert (=> b!1490305 m!1374467))

(assert (=> b!1490305 m!1374467))

(declare-fun m!1374469 () Bool)

(assert (=> b!1490305 m!1374469))

(assert (=> b!1490305 m!1374469))

(assert (=> b!1490305 m!1374467))

(declare-fun m!1374471 () Bool)

(assert (=> b!1490305 m!1374471))

(declare-fun m!1374473 () Bool)

(assert (=> b!1490313 m!1374473))

(declare-fun m!1374475 () Bool)

(assert (=> b!1490313 m!1374475))

(declare-fun m!1374477 () Bool)

(assert (=> b!1490313 m!1374477))

(declare-fun m!1374479 () Bool)

(assert (=> b!1490313 m!1374479))

(declare-fun m!1374481 () Bool)

(assert (=> b!1490313 m!1374481))

(assert (=> b!1490313 m!1374467))

(declare-fun m!1374483 () Bool)

(assert (=> start!126870 m!1374483))

(declare-fun m!1374485 () Bool)

(assert (=> start!126870 m!1374485))

(declare-fun m!1374487 () Bool)

(assert (=> b!1490319 m!1374487))

(assert (=> b!1490319 m!1374487))

(declare-fun m!1374489 () Bool)

(assert (=> b!1490319 m!1374489))

(declare-fun m!1374491 () Bool)

(assert (=> b!1490318 m!1374491))

(assert (=> b!1490318 m!1374467))

(declare-fun m!1374493 () Bool)

(assert (=> b!1490314 m!1374493))

(assert (=> b!1490308 m!1374467))

(assert (=> b!1490308 m!1374467))

(declare-fun m!1374495 () Bool)

(assert (=> b!1490308 m!1374495))

(assert (=> b!1490310 m!1374467))

(assert (=> b!1490310 m!1374467))

(declare-fun m!1374497 () Bool)

(assert (=> b!1490310 m!1374497))

(declare-fun m!1374499 () Bool)

(assert (=> b!1490303 m!1374499))

(declare-fun m!1374501 () Bool)

(assert (=> b!1490307 m!1374501))

(assert (=> b!1490307 m!1374501))

(declare-fun m!1374503 () Bool)

(assert (=> b!1490307 m!1374503))

(assert (=> b!1490307 m!1374475))

(declare-fun m!1374505 () Bool)

(assert (=> b!1490307 m!1374505))

(assert (=> b!1490311 m!1374467))

(assert (=> b!1490311 m!1374467))

(declare-fun m!1374507 () Bool)

(assert (=> b!1490311 m!1374507))

(declare-fun m!1374509 () Bool)

(assert (=> b!1490317 m!1374509))

(declare-fun m!1374511 () Bool)

(assert (=> b!1490309 m!1374511))

(declare-fun m!1374513 () Bool)

(assert (=> b!1490309 m!1374513))

(assert (=> b!1490304 m!1374475))

(declare-fun m!1374515 () Bool)

(assert (=> b!1490304 m!1374515))

(declare-fun m!1374517 () Bool)

(assert (=> b!1490312 m!1374517))

(check-sat (not b!1490311) (not b!1490319) (not b!1490303) (not b!1490317) (not b!1490312) (not b!1490310) (not b!1490313) (not b!1490314) (not b!1490309) (not b!1490305) (not start!126870) (not b!1490307) (not b!1490308))
(check-sat)
