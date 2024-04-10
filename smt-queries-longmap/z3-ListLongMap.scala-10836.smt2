; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126864 () Bool)

(assert start!126864)

(declare-fun b!1490124 () Bool)

(declare-fun res!1013454 () Bool)

(declare-fun e!835044 () Bool)

(assert (=> b!1490124 (=> (not res!1013454) (not e!835044))))

(declare-datatypes ((array!99637 0))(
  ( (array!99638 (arr!48090 (Array (_ BitVec 32) (_ BitVec 64))) (size!48640 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99637)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490124 (= res!1013454 (validKeyInArray!0 (select (arr!48090 a!2862) i!1006)))))

(declare-fun b!1490126 () Bool)

(declare-fun e!835045 () Bool)

(declare-fun e!835049 () Bool)

(assert (=> b!1490126 (= e!835045 e!835049)))

(declare-fun res!1013459 () Bool)

(assert (=> b!1490126 (=> (not res!1013459) (not e!835049))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12330 0))(
  ( (MissingZero!12330 (index!51712 (_ BitVec 32))) (Found!12330 (index!51713 (_ BitVec 32))) (Intermediate!12330 (undefined!13142 Bool) (index!51714 (_ BitVec 32)) (x!133306 (_ BitVec 32))) (Undefined!12330) (MissingVacant!12330 (index!51715 (_ BitVec 32))) )
))
(declare-fun lt!649835 () SeekEntryResult!12330)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490126 (= res!1013459 (= lt!649835 (Intermediate!12330 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649834 () (_ BitVec 64))

(declare-fun lt!649831 () array!99637)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99637 (_ BitVec 32)) SeekEntryResult!12330)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490126 (= lt!649835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649834 mask!2687) lt!649834 lt!649831 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1490126 (= lt!649834 (select (store (arr!48090 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490127 () Bool)

(declare-fun res!1013448 () Bool)

(assert (=> b!1490127 (=> (not res!1013448) (not e!835045))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!649832 () SeekEntryResult!12330)

(assert (=> b!1490127 (= res!1013448 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48090 a!2862) j!93) a!2862 mask!2687) lt!649832))))

(declare-fun b!1490128 () Bool)

(declare-fun e!835052 () Bool)

(declare-fun lt!649833 () (_ BitVec 32))

(assert (=> b!1490128 (= e!835052 (not (= lt!649835 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649833 lt!649834 lt!649831 mask!2687))))))

(declare-fun b!1490129 () Bool)

(declare-fun e!835046 () Bool)

(assert (=> b!1490129 (= e!835046 true)))

(declare-fun lt!649839 () SeekEntryResult!12330)

(declare-fun lt!649838 () SeekEntryResult!12330)

(assert (=> b!1490129 (= lt!649839 lt!649838)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!50000 0))(
  ( (Unit!50001) )
))
(declare-fun lt!649836 () Unit!50000)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50000)

(assert (=> b!1490129 (= lt!649836 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649833 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1490130 () Bool)

(declare-fun res!1013453 () Bool)

(assert (=> b!1490130 (=> (not res!1013453) (not e!835044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99637 (_ BitVec 32)) Bool)

(assert (=> b!1490130 (= res!1013453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490131 () Bool)

(declare-fun e!835048 () Bool)

(assert (=> b!1490131 (= e!835048 e!835045)))

(declare-fun res!1013444 () Bool)

(assert (=> b!1490131 (=> (not res!1013444) (not e!835045))))

(assert (=> b!1490131 (= res!1013444 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48090 a!2862) j!93) mask!2687) (select (arr!48090 a!2862) j!93) a!2862 mask!2687) lt!649832))))

(assert (=> b!1490131 (= lt!649832 (Intermediate!12330 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490132 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99637 (_ BitVec 32)) SeekEntryResult!12330)

(assert (=> b!1490132 (= e!835052 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649833 intermediateAfterIndex!19 lt!649834 lt!649831 mask!2687) lt!649838)))))

(declare-fun b!1490133 () Bool)

(declare-fun res!1013458 () Bool)

(assert (=> b!1490133 (=> res!1013458 e!835046)))

(assert (=> b!1490133 (= res!1013458 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1490134 () Bool)

(declare-fun res!1013456 () Bool)

(assert (=> b!1490134 (=> (not res!1013456) (not e!835044))))

(assert (=> b!1490134 (= res!1013456 (and (= (size!48640 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48640 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48640 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490135 () Bool)

(declare-fun e!835050 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99637 (_ BitVec 32)) SeekEntryResult!12330)

(assert (=> b!1490135 (= e!835050 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649834 lt!649831 mask!2687) (seekEntryOrOpen!0 lt!649834 lt!649831 mask!2687)))))

(declare-fun b!1490136 () Bool)

(declare-fun res!1013460 () Bool)

(assert (=> b!1490136 (=> res!1013460 e!835046)))

(assert (=> b!1490136 (= res!1013460 e!835052)))

(declare-fun c!137868 () Bool)

(assert (=> b!1490136 (= c!137868 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1490137 () Bool)

(declare-fun res!1013447 () Bool)

(assert (=> b!1490137 (=> (not res!1013447) (not e!835044))))

(declare-datatypes ((List!34591 0))(
  ( (Nil!34588) (Cons!34587 (h!35970 (_ BitVec 64)) (t!49285 List!34591)) )
))
(declare-fun arrayNoDuplicates!0 (array!99637 (_ BitVec 32) List!34591) Bool)

(assert (=> b!1490137 (= res!1013447 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34588))))

(declare-fun res!1013446 () Bool)

(assert (=> start!126864 (=> (not res!1013446) (not e!835044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126864 (= res!1013446 (validMask!0 mask!2687))))

(assert (=> start!126864 e!835044))

(assert (=> start!126864 true))

(declare-fun array_inv!37118 (array!99637) Bool)

(assert (=> start!126864 (array_inv!37118 a!2862)))

(declare-fun b!1490125 () Bool)

(assert (=> b!1490125 (= e!835044 e!835048)))

(declare-fun res!1013450 () Bool)

(assert (=> b!1490125 (=> (not res!1013450) (not e!835048))))

(assert (=> b!1490125 (= res!1013450 (= (select (store (arr!48090 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490125 (= lt!649831 (array!99638 (store (arr!48090 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48640 a!2862)))))

(declare-fun b!1490138 () Bool)

(declare-fun e!835047 () Bool)

(assert (=> b!1490138 (= e!835047 e!835046)))

(declare-fun res!1013445 () Bool)

(assert (=> b!1490138 (=> res!1013445 e!835046)))

(assert (=> b!1490138 (= res!1013445 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649833 #b00000000000000000000000000000000) (bvsge lt!649833 (size!48640 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490138 (= lt!649833 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1490138 (= lt!649838 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649834 lt!649831 mask!2687))))

(assert (=> b!1490138 (= lt!649838 (seekEntryOrOpen!0 lt!649834 lt!649831 mask!2687))))

(declare-fun b!1490139 () Bool)

(declare-fun res!1013461 () Bool)

(assert (=> b!1490139 (=> (not res!1013461) (not e!835049))))

(assert (=> b!1490139 (= res!1013461 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490140 () Bool)

(assert (=> b!1490140 (= e!835049 (not e!835047))))

(declare-fun res!1013452 () Bool)

(assert (=> b!1490140 (=> res!1013452 e!835047)))

(assert (=> b!1490140 (= res!1013452 (or (and (= (select (arr!48090 a!2862) index!646) (select (store (arr!48090 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48090 a!2862) index!646) (select (arr!48090 a!2862) j!93))) (= (select (arr!48090 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1490140 (and (= lt!649839 (Found!12330 j!93)) (or (= (select (arr!48090 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48090 a!2862) intermediateBeforeIndex!19) (select (arr!48090 a!2862) j!93))) (let ((bdg!54772 (select (store (arr!48090 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48090 a!2862) index!646) bdg!54772) (= (select (arr!48090 a!2862) index!646) (select (arr!48090 a!2862) j!93))) (= (select (arr!48090 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54772 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1490140 (= lt!649839 (seekEntryOrOpen!0 (select (arr!48090 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1490140 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649837 () Unit!50000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50000)

(assert (=> b!1490140 (= lt!649837 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490141 () Bool)

(declare-fun res!1013457 () Bool)

(assert (=> b!1490141 (=> (not res!1013457) (not e!835044))))

(assert (=> b!1490141 (= res!1013457 (validKeyInArray!0 (select (arr!48090 a!2862) j!93)))))

(declare-fun b!1490142 () Bool)

(assert (=> b!1490142 (= e!835050 (= lt!649835 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649834 lt!649831 mask!2687)))))

(declare-fun b!1490143 () Bool)

(declare-fun res!1013455 () Bool)

(assert (=> b!1490143 (=> res!1013455 e!835046)))

(assert (=> b!1490143 (= res!1013455 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649833 (select (arr!48090 a!2862) j!93) a!2862 mask!2687) lt!649832)))))

(declare-fun b!1490144 () Bool)

(declare-fun res!1013449 () Bool)

(assert (=> b!1490144 (=> (not res!1013449) (not e!835044))))

(assert (=> b!1490144 (= res!1013449 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48640 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48640 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48640 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490145 () Bool)

(declare-fun res!1013451 () Bool)

(assert (=> b!1490145 (=> (not res!1013451) (not e!835049))))

(assert (=> b!1490145 (= res!1013451 e!835050)))

(declare-fun c!137867 () Bool)

(assert (=> b!1490145 (= c!137867 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126864 res!1013446) b!1490134))

(assert (= (and b!1490134 res!1013456) b!1490124))

(assert (= (and b!1490124 res!1013454) b!1490141))

(assert (= (and b!1490141 res!1013457) b!1490130))

(assert (= (and b!1490130 res!1013453) b!1490137))

(assert (= (and b!1490137 res!1013447) b!1490144))

(assert (= (and b!1490144 res!1013449) b!1490125))

(assert (= (and b!1490125 res!1013450) b!1490131))

(assert (= (and b!1490131 res!1013444) b!1490127))

(assert (= (and b!1490127 res!1013448) b!1490126))

(assert (= (and b!1490126 res!1013459) b!1490145))

(assert (= (and b!1490145 c!137867) b!1490142))

(assert (= (and b!1490145 (not c!137867)) b!1490135))

(assert (= (and b!1490145 res!1013451) b!1490139))

(assert (= (and b!1490139 res!1013461) b!1490140))

(assert (= (and b!1490140 (not res!1013452)) b!1490138))

(assert (= (and b!1490138 (not res!1013445)) b!1490143))

(assert (= (and b!1490143 (not res!1013455)) b!1490136))

(assert (= (and b!1490136 c!137868) b!1490128))

(assert (= (and b!1490136 (not c!137868)) b!1490132))

(assert (= (and b!1490136 (not res!1013460)) b!1490133))

(assert (= (and b!1490133 (not res!1013458)) b!1490129))

(declare-fun m!1374295 () Bool)

(assert (=> b!1490130 m!1374295))

(declare-fun m!1374297 () Bool)

(assert (=> b!1490128 m!1374297))

(declare-fun m!1374299 () Bool)

(assert (=> b!1490127 m!1374299))

(assert (=> b!1490127 m!1374299))

(declare-fun m!1374301 () Bool)

(assert (=> b!1490127 m!1374301))

(assert (=> b!1490143 m!1374299))

(assert (=> b!1490143 m!1374299))

(declare-fun m!1374303 () Bool)

(assert (=> b!1490143 m!1374303))

(declare-fun m!1374305 () Bool)

(assert (=> b!1490125 m!1374305))

(declare-fun m!1374307 () Bool)

(assert (=> b!1490125 m!1374307))

(declare-fun m!1374309 () Bool)

(assert (=> b!1490138 m!1374309))

(declare-fun m!1374311 () Bool)

(assert (=> b!1490138 m!1374311))

(declare-fun m!1374313 () Bool)

(assert (=> b!1490138 m!1374313))

(declare-fun m!1374315 () Bool)

(assert (=> b!1490137 m!1374315))

(declare-fun m!1374317 () Bool)

(assert (=> b!1490142 m!1374317))

(declare-fun m!1374319 () Bool)

(assert (=> b!1490129 m!1374319))

(declare-fun m!1374321 () Bool)

(assert (=> b!1490140 m!1374321))

(assert (=> b!1490140 m!1374305))

(declare-fun m!1374323 () Bool)

(assert (=> b!1490140 m!1374323))

(declare-fun m!1374325 () Bool)

(assert (=> b!1490140 m!1374325))

(declare-fun m!1374327 () Bool)

(assert (=> b!1490140 m!1374327))

(assert (=> b!1490140 m!1374299))

(declare-fun m!1374329 () Bool)

(assert (=> b!1490140 m!1374329))

(declare-fun m!1374331 () Bool)

(assert (=> b!1490140 m!1374331))

(assert (=> b!1490140 m!1374299))

(assert (=> b!1490135 m!1374311))

(assert (=> b!1490135 m!1374313))

(declare-fun m!1374333 () Bool)

(assert (=> b!1490124 m!1374333))

(assert (=> b!1490124 m!1374333))

(declare-fun m!1374335 () Bool)

(assert (=> b!1490124 m!1374335))

(assert (=> b!1490131 m!1374299))

(assert (=> b!1490131 m!1374299))

(declare-fun m!1374337 () Bool)

(assert (=> b!1490131 m!1374337))

(assert (=> b!1490131 m!1374337))

(assert (=> b!1490131 m!1374299))

(declare-fun m!1374339 () Bool)

(assert (=> b!1490131 m!1374339))

(declare-fun m!1374341 () Bool)

(assert (=> start!126864 m!1374341))

(declare-fun m!1374343 () Bool)

(assert (=> start!126864 m!1374343))

(assert (=> b!1490141 m!1374299))

(assert (=> b!1490141 m!1374299))

(declare-fun m!1374345 () Bool)

(assert (=> b!1490141 m!1374345))

(declare-fun m!1374347 () Bool)

(assert (=> b!1490126 m!1374347))

(assert (=> b!1490126 m!1374347))

(declare-fun m!1374349 () Bool)

(assert (=> b!1490126 m!1374349))

(assert (=> b!1490126 m!1374305))

(declare-fun m!1374351 () Bool)

(assert (=> b!1490126 m!1374351))

(declare-fun m!1374353 () Bool)

(assert (=> b!1490132 m!1374353))

(check-sat (not b!1490140) (not b!1490142) (not b!1490130) (not b!1490128) (not b!1490138) (not b!1490127) (not b!1490135) (not b!1490143) (not b!1490129) (not start!126864) (not b!1490141) (not b!1490131) (not b!1490126) (not b!1490132) (not b!1490124) (not b!1490137))
(check-sat)
