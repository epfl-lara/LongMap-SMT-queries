; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126054 () Bool)

(assert start!126054)

(declare-fun b!1473666 () Bool)

(declare-fun res!1000294 () Bool)

(declare-fun e!827214 () Bool)

(assert (=> b!1473666 (=> (not res!1000294) (not e!827214))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99226 0))(
  ( (array!99227 (arr!47893 (Array (_ BitVec 32) (_ BitVec 64))) (size!48444 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99226)

(declare-datatypes ((SeekEntryResult!12030 0))(
  ( (MissingZero!12030 (index!50512 (_ BitVec 32))) (Found!12030 (index!50513 (_ BitVec 32))) (Intermediate!12030 (undefined!12842 Bool) (index!50514 (_ BitVec 32)) (x!132282 (_ BitVec 32))) (Undefined!12030) (MissingVacant!12030 (index!50515 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99226 (_ BitVec 32)) SeekEntryResult!12030)

(assert (=> b!1473666 (= res!1000294 (= (seekEntryOrOpen!0 (select (arr!47893 a!2862) j!93) a!2862 mask!2687) (Found!12030 j!93)))))

(declare-fun b!1473667 () Bool)

(declare-fun e!827215 () Bool)

(declare-fun e!827219 () Bool)

(assert (=> b!1473667 (= e!827215 e!827219)))

(declare-fun res!1000301 () Bool)

(assert (=> b!1473667 (=> (not res!1000301) (not e!827219))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!644068 () SeekEntryResult!12030)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473667 (= res!1000301 (= lt!644068 (Intermediate!12030 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644071 () array!99226)

(declare-fun lt!644070 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99226 (_ BitVec 32)) SeekEntryResult!12030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473667 (= lt!644068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644070 mask!2687) lt!644070 lt!644071 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473667 (= lt!644070 (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473668 () Bool)

(declare-fun res!1000290 () Bool)

(declare-fun e!827216 () Bool)

(assert (=> b!1473668 (=> (not res!1000290) (not e!827216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473668 (= res!1000290 (validKeyInArray!0 (select (arr!47893 a!2862) j!93)))))

(declare-fun b!1473669 () Bool)

(declare-fun res!1000292 () Bool)

(assert (=> b!1473669 (=> (not res!1000292) (not e!827215))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!644067 () SeekEntryResult!12030)

(assert (=> b!1473669 (= res!1000292 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47893 a!2862) j!93) a!2862 mask!2687) lt!644067))))

(declare-fun b!1473670 () Bool)

(declare-fun res!1000296 () Bool)

(assert (=> b!1473670 (=> (not res!1000296) (not e!827219))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473670 (= res!1000296 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473671 () Bool)

(declare-fun e!827220 () Bool)

(assert (=> b!1473671 (= e!827220 (= lt!644068 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644070 lt!644071 mask!2687)))))

(declare-fun b!1473672 () Bool)

(declare-fun e!827218 () Bool)

(assert (=> b!1473672 (= e!827218 e!827215)))

(declare-fun res!1000297 () Bool)

(assert (=> b!1473672 (=> (not res!1000297) (not e!827215))))

(assert (=> b!1473672 (= res!1000297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687) (select (arr!47893 a!2862) j!93) a!2862 mask!2687) lt!644067))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1473672 (= lt!644067 (Intermediate!12030 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473673 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99226 (_ BitVec 32)) SeekEntryResult!12030)

(assert (=> b!1473673 (= e!827220 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644070 lt!644071 mask!2687) (seekEntryOrOpen!0 lt!644070 lt!644071 mask!2687)))))

(declare-fun b!1473674 () Bool)

(assert (=> b!1473674 (= e!827216 e!827218)))

(declare-fun res!1000289 () Bool)

(assert (=> b!1473674 (=> (not res!1000289) (not e!827218))))

(assert (=> b!1473674 (= res!1000289 (= (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473674 (= lt!644071 (array!99227 (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48444 a!2862)))))

(declare-fun b!1473675 () Bool)

(declare-fun res!1000298 () Bool)

(assert (=> b!1473675 (=> (not res!1000298) (not e!827216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99226 (_ BitVec 32)) Bool)

(assert (=> b!1473675 (= res!1000298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473676 () Bool)

(assert (=> b!1473676 (= e!827219 (not true))))

(assert (=> b!1473676 e!827214))

(declare-fun res!1000291 () Bool)

(assert (=> b!1473676 (=> (not res!1000291) (not e!827214))))

(assert (=> b!1473676 (= res!1000291 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49433 0))(
  ( (Unit!49434) )
))
(declare-fun lt!644069 () Unit!49433)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49433)

(assert (=> b!1473676 (= lt!644069 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473677 () Bool)

(declare-fun res!1000295 () Bool)

(assert (=> b!1473677 (=> (not res!1000295) (not e!827216))))

(declare-datatypes ((List!34381 0))(
  ( (Nil!34378) (Cons!34377 (h!35747 (_ BitVec 64)) (t!49067 List!34381)) )
))
(declare-fun arrayNoDuplicates!0 (array!99226 (_ BitVec 32) List!34381) Bool)

(assert (=> b!1473677 (= res!1000295 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34378))))

(declare-fun b!1473678 () Bool)

(declare-fun res!1000299 () Bool)

(assert (=> b!1473678 (=> (not res!1000299) (not e!827216))))

(assert (=> b!1473678 (= res!1000299 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48444 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48444 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48444 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1000287 () Bool)

(assert (=> start!126054 (=> (not res!1000287) (not e!827216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126054 (= res!1000287 (validMask!0 mask!2687))))

(assert (=> start!126054 e!827216))

(assert (=> start!126054 true))

(declare-fun array_inv!37174 (array!99226) Bool)

(assert (=> start!126054 (array_inv!37174 a!2862)))

(declare-fun b!1473679 () Bool)

(declare-fun res!1000288 () Bool)

(assert (=> b!1473679 (=> (not res!1000288) (not e!827219))))

(assert (=> b!1473679 (= res!1000288 e!827220)))

(declare-fun c!136213 () Bool)

(assert (=> b!1473679 (= c!136213 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473680 () Bool)

(assert (=> b!1473680 (= e!827214 (or (= (select (arr!47893 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47893 a!2862) intermediateBeforeIndex!19) (select (arr!47893 a!2862) j!93))))))

(declare-fun b!1473681 () Bool)

(declare-fun res!1000293 () Bool)

(assert (=> b!1473681 (=> (not res!1000293) (not e!827216))))

(assert (=> b!1473681 (= res!1000293 (and (= (size!48444 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48444 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48444 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473682 () Bool)

(declare-fun res!1000300 () Bool)

(assert (=> b!1473682 (=> (not res!1000300) (not e!827216))))

(assert (=> b!1473682 (= res!1000300 (validKeyInArray!0 (select (arr!47893 a!2862) i!1006)))))

(assert (= (and start!126054 res!1000287) b!1473681))

(assert (= (and b!1473681 res!1000293) b!1473682))

(assert (= (and b!1473682 res!1000300) b!1473668))

(assert (= (and b!1473668 res!1000290) b!1473675))

(assert (= (and b!1473675 res!1000298) b!1473677))

(assert (= (and b!1473677 res!1000295) b!1473678))

(assert (= (and b!1473678 res!1000299) b!1473674))

(assert (= (and b!1473674 res!1000289) b!1473672))

(assert (= (and b!1473672 res!1000297) b!1473669))

(assert (= (and b!1473669 res!1000292) b!1473667))

(assert (= (and b!1473667 res!1000301) b!1473679))

(assert (= (and b!1473679 c!136213) b!1473671))

(assert (= (and b!1473679 (not c!136213)) b!1473673))

(assert (= (and b!1473679 res!1000288) b!1473670))

(assert (= (and b!1473670 res!1000296) b!1473676))

(assert (= (and b!1473676 res!1000291) b!1473666))

(assert (= (and b!1473666 res!1000294) b!1473680))

(declare-fun m!1360405 () Bool)

(assert (=> b!1473669 m!1360405))

(assert (=> b!1473669 m!1360405))

(declare-fun m!1360407 () Bool)

(assert (=> b!1473669 m!1360407))

(declare-fun m!1360409 () Bool)

(assert (=> b!1473682 m!1360409))

(assert (=> b!1473682 m!1360409))

(declare-fun m!1360411 () Bool)

(assert (=> b!1473682 m!1360411))

(declare-fun m!1360413 () Bool)

(assert (=> b!1473675 m!1360413))

(declare-fun m!1360415 () Bool)

(assert (=> b!1473667 m!1360415))

(assert (=> b!1473667 m!1360415))

(declare-fun m!1360417 () Bool)

(assert (=> b!1473667 m!1360417))

(declare-fun m!1360419 () Bool)

(assert (=> b!1473667 m!1360419))

(declare-fun m!1360421 () Bool)

(assert (=> b!1473667 m!1360421))

(declare-fun m!1360423 () Bool)

(assert (=> b!1473671 m!1360423))

(declare-fun m!1360425 () Bool)

(assert (=> b!1473677 m!1360425))

(declare-fun m!1360427 () Bool)

(assert (=> b!1473676 m!1360427))

(declare-fun m!1360429 () Bool)

(assert (=> b!1473676 m!1360429))

(assert (=> b!1473668 m!1360405))

(assert (=> b!1473668 m!1360405))

(declare-fun m!1360431 () Bool)

(assert (=> b!1473668 m!1360431))

(assert (=> b!1473666 m!1360405))

(assert (=> b!1473666 m!1360405))

(declare-fun m!1360433 () Bool)

(assert (=> b!1473666 m!1360433))

(declare-fun m!1360435 () Bool)

(assert (=> b!1473673 m!1360435))

(declare-fun m!1360437 () Bool)

(assert (=> b!1473673 m!1360437))

(declare-fun m!1360439 () Bool)

(assert (=> start!126054 m!1360439))

(declare-fun m!1360441 () Bool)

(assert (=> start!126054 m!1360441))

(assert (=> b!1473672 m!1360405))

(assert (=> b!1473672 m!1360405))

(declare-fun m!1360443 () Bool)

(assert (=> b!1473672 m!1360443))

(assert (=> b!1473672 m!1360443))

(assert (=> b!1473672 m!1360405))

(declare-fun m!1360445 () Bool)

(assert (=> b!1473672 m!1360445))

(assert (=> b!1473674 m!1360419))

(declare-fun m!1360447 () Bool)

(assert (=> b!1473674 m!1360447))

(declare-fun m!1360449 () Bool)

(assert (=> b!1473680 m!1360449))

(assert (=> b!1473680 m!1360405))

(check-sat (not b!1473671) (not b!1473673) (not b!1473672) (not b!1473669) (not b!1473668) (not b!1473676) (not b!1473675) (not b!1473677) (not b!1473666) (not b!1473682) (not start!126054) (not b!1473667))
(check-sat)
