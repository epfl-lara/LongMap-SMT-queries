; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126538 () Bool)

(assert start!126538)

(declare-fun b!1484737 () Bool)

(declare-fun res!1009490 () Bool)

(declare-fun e!832422 () Bool)

(assert (=> b!1484737 (=> (not res!1009490) (not e!832422))))

(declare-fun e!832427 () Bool)

(assert (=> b!1484737 (= res!1009490 e!832427)))

(declare-fun c!137148 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484737 (= c!137148 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484738 () Bool)

(declare-fun res!1009493 () Bool)

(declare-fun e!832419 () Bool)

(assert (=> b!1484738 (=> (not res!1009493) (not e!832419))))

(declare-datatypes ((array!99500 0))(
  ( (array!99501 (arr!48026 (Array (_ BitVec 32) (_ BitVec 64))) (size!48576 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99500)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484738 (= res!1009493 (validKeyInArray!0 (select (arr!48026 a!2862) i!1006)))))

(declare-fun lt!647861 () (_ BitVec 64))

(declare-fun lt!647862 () array!99500)

(declare-fun b!1484739 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12266 0))(
  ( (MissingZero!12266 (index!51456 (_ BitVec 32))) (Found!12266 (index!51457 (_ BitVec 32))) (Intermediate!12266 (undefined!13078 Bool) (index!51458 (_ BitVec 32)) (x!133038 (_ BitVec 32))) (Undefined!12266) (MissingVacant!12266 (index!51459 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99500 (_ BitVec 32)) SeekEntryResult!12266)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99500 (_ BitVec 32)) SeekEntryResult!12266)

(assert (=> b!1484739 (= e!832427 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647861 lt!647862 mask!2687) (seekEntryOrOpen!0 lt!647861 lt!647862 mask!2687)))))

(declare-fun b!1484740 () Bool)

(declare-fun e!832425 () Bool)

(declare-fun e!832420 () Bool)

(assert (=> b!1484740 (= e!832425 e!832420)))

(declare-fun res!1009492 () Bool)

(assert (=> b!1484740 (=> (not res!1009492) (not e!832420))))

(declare-fun lt!647863 () (_ BitVec 64))

(assert (=> b!1484740 (= res!1009492 (and (= index!646 intermediateAfterIndex!19) (= lt!647863 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484741 () Bool)

(declare-fun res!1009491 () Bool)

(declare-fun e!832424 () Bool)

(assert (=> b!1484741 (=> (not res!1009491) (not e!832424))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1484741 (= res!1009491 (= (seekEntryOrOpen!0 (select (arr!48026 a!2862) j!93) a!2862 mask!2687) (Found!12266 j!93)))))

(declare-fun b!1484742 () Bool)

(declare-fun res!1009494 () Bool)

(assert (=> b!1484742 (=> (not res!1009494) (not e!832424))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1484742 (= res!1009494 (or (= (select (arr!48026 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48026 a!2862) intermediateBeforeIndex!19) (select (arr!48026 a!2862) j!93))))))

(declare-fun b!1484743 () Bool)

(assert (=> b!1484743 (= e!832424 e!832425)))

(declare-fun res!1009501 () Bool)

(assert (=> b!1484743 (=> res!1009501 e!832425)))

(assert (=> b!1484743 (= res!1009501 (or (and (= (select (arr!48026 a!2862) index!646) lt!647863) (= (select (arr!48026 a!2862) index!646) (select (arr!48026 a!2862) j!93))) (= (select (arr!48026 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484743 (= lt!647863 (select (store (arr!48026 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484744 () Bool)

(declare-fun res!1009488 () Bool)

(assert (=> b!1484744 (=> (not res!1009488) (not e!832419))))

(assert (=> b!1484744 (= res!1009488 (and (= (size!48576 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48576 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48576 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484745 () Bool)

(declare-fun e!832421 () Bool)

(assert (=> b!1484745 (= e!832419 e!832421)))

(declare-fun res!1009502 () Bool)

(assert (=> b!1484745 (=> (not res!1009502) (not e!832421))))

(assert (=> b!1484745 (= res!1009502 (= (select (store (arr!48026 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484745 (= lt!647862 (array!99501 (store (arr!48026 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48576 a!2862)))))

(declare-fun b!1484746 () Bool)

(declare-fun res!1009497 () Bool)

(assert (=> b!1484746 (=> (not res!1009497) (not e!832419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99500 (_ BitVec 32)) Bool)

(assert (=> b!1484746 (= res!1009497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484747 () Bool)

(declare-fun res!1009504 () Bool)

(assert (=> b!1484747 (=> (not res!1009504) (not e!832419))))

(declare-datatypes ((List!34527 0))(
  ( (Nil!34524) (Cons!34523 (h!35897 (_ BitVec 64)) (t!49221 List!34527)) )
))
(declare-fun arrayNoDuplicates!0 (array!99500 (_ BitVec 32) List!34527) Bool)

(assert (=> b!1484747 (= res!1009504 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34524))))

(declare-fun b!1484748 () Bool)

(declare-fun res!1009496 () Bool)

(assert (=> b!1484748 (=> (not res!1009496) (not e!832419))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484748 (= res!1009496 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48576 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48576 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48576 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484749 () Bool)

(assert (=> b!1484749 (= e!832420 (= (seekEntryOrOpen!0 lt!647861 lt!647862 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647861 lt!647862 mask!2687)))))

(declare-fun b!1484751 () Bool)

(declare-fun e!832418 () Bool)

(assert (=> b!1484751 (= e!832418 e!832422)))

(declare-fun res!1009500 () Bool)

(assert (=> b!1484751 (=> (not res!1009500) (not e!832422))))

(declare-fun lt!647859 () SeekEntryResult!12266)

(assert (=> b!1484751 (= res!1009500 (= lt!647859 (Intermediate!12266 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99500 (_ BitVec 32)) SeekEntryResult!12266)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484751 (= lt!647859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647861 mask!2687) lt!647861 lt!647862 mask!2687))))

(assert (=> b!1484751 (= lt!647861 (select (store (arr!48026 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484752 () Bool)

(assert (=> b!1484752 (= e!832427 (= lt!647859 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647861 lt!647862 mask!2687)))))

(declare-fun b!1484753 () Bool)

(assert (=> b!1484753 (= e!832421 e!832418)))

(declare-fun res!1009486 () Bool)

(assert (=> b!1484753 (=> (not res!1009486) (not e!832418))))

(declare-fun lt!647865 () SeekEntryResult!12266)

(assert (=> b!1484753 (= res!1009486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48026 a!2862) j!93) mask!2687) (select (arr!48026 a!2862) j!93) a!2862 mask!2687) lt!647865))))

(assert (=> b!1484753 (= lt!647865 (Intermediate!12266 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484754 () Bool)

(declare-fun e!832426 () Bool)

(assert (=> b!1484754 (= e!832422 (not e!832426))))

(declare-fun res!1009487 () Bool)

(assert (=> b!1484754 (=> res!1009487 e!832426)))

(assert (=> b!1484754 (= res!1009487 (or (and (= (select (arr!48026 a!2862) index!646) (select (store (arr!48026 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48026 a!2862) index!646) (select (arr!48026 a!2862) j!93))) (= (select (arr!48026 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484754 e!832424))

(declare-fun res!1009499 () Bool)

(assert (=> b!1484754 (=> (not res!1009499) (not e!832424))))

(assert (=> b!1484754 (= res!1009499 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49872 0))(
  ( (Unit!49873) )
))
(declare-fun lt!647860 () Unit!49872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49872)

(assert (=> b!1484754 (= lt!647860 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484755 () Bool)

(assert (=> b!1484755 (= e!832426 true)))

(declare-fun lt!647864 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484755 (= lt!647864 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484756 () Bool)

(declare-fun res!1009495 () Bool)

(assert (=> b!1484756 (=> (not res!1009495) (not e!832419))))

(assert (=> b!1484756 (= res!1009495 (validKeyInArray!0 (select (arr!48026 a!2862) j!93)))))

(declare-fun b!1484757 () Bool)

(declare-fun res!1009498 () Bool)

(assert (=> b!1484757 (=> (not res!1009498) (not e!832422))))

(assert (=> b!1484757 (= res!1009498 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484750 () Bool)

(declare-fun res!1009503 () Bool)

(assert (=> b!1484750 (=> (not res!1009503) (not e!832418))))

(assert (=> b!1484750 (= res!1009503 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48026 a!2862) j!93) a!2862 mask!2687) lt!647865))))

(declare-fun res!1009489 () Bool)

(assert (=> start!126538 (=> (not res!1009489) (not e!832419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126538 (= res!1009489 (validMask!0 mask!2687))))

(assert (=> start!126538 e!832419))

(assert (=> start!126538 true))

(declare-fun array_inv!37054 (array!99500) Bool)

(assert (=> start!126538 (array_inv!37054 a!2862)))

(assert (= (and start!126538 res!1009489) b!1484744))

(assert (= (and b!1484744 res!1009488) b!1484738))

(assert (= (and b!1484738 res!1009493) b!1484756))

(assert (= (and b!1484756 res!1009495) b!1484746))

(assert (= (and b!1484746 res!1009497) b!1484747))

(assert (= (and b!1484747 res!1009504) b!1484748))

(assert (= (and b!1484748 res!1009496) b!1484745))

(assert (= (and b!1484745 res!1009502) b!1484753))

(assert (= (and b!1484753 res!1009486) b!1484750))

(assert (= (and b!1484750 res!1009503) b!1484751))

(assert (= (and b!1484751 res!1009500) b!1484737))

(assert (= (and b!1484737 c!137148) b!1484752))

(assert (= (and b!1484737 (not c!137148)) b!1484739))

(assert (= (and b!1484737 res!1009490) b!1484757))

(assert (= (and b!1484757 res!1009498) b!1484754))

(assert (= (and b!1484754 res!1009499) b!1484741))

(assert (= (and b!1484741 res!1009491) b!1484742))

(assert (= (and b!1484742 res!1009494) b!1484743))

(assert (= (and b!1484743 (not res!1009501)) b!1484740))

(assert (= (and b!1484740 res!1009492) b!1484749))

(assert (= (and b!1484754 (not res!1009487)) b!1484755))

(declare-fun m!1369993 () Bool)

(assert (=> b!1484751 m!1369993))

(assert (=> b!1484751 m!1369993))

(declare-fun m!1369995 () Bool)

(assert (=> b!1484751 m!1369995))

(declare-fun m!1369997 () Bool)

(assert (=> b!1484751 m!1369997))

(declare-fun m!1369999 () Bool)

(assert (=> b!1484751 m!1369999))

(declare-fun m!1370001 () Bool)

(assert (=> b!1484741 m!1370001))

(assert (=> b!1484741 m!1370001))

(declare-fun m!1370003 () Bool)

(assert (=> b!1484741 m!1370003))

(declare-fun m!1370005 () Bool)

(assert (=> b!1484755 m!1370005))

(declare-fun m!1370007 () Bool)

(assert (=> b!1484739 m!1370007))

(declare-fun m!1370009 () Bool)

(assert (=> b!1484739 m!1370009))

(declare-fun m!1370011 () Bool)

(assert (=> b!1484752 m!1370011))

(assert (=> b!1484756 m!1370001))

(assert (=> b!1484756 m!1370001))

(declare-fun m!1370013 () Bool)

(assert (=> b!1484756 m!1370013))

(declare-fun m!1370015 () Bool)

(assert (=> b!1484747 m!1370015))

(declare-fun m!1370017 () Bool)

(assert (=> b!1484742 m!1370017))

(assert (=> b!1484742 m!1370001))

(declare-fun m!1370019 () Bool)

(assert (=> b!1484746 m!1370019))

(assert (=> b!1484750 m!1370001))

(assert (=> b!1484750 m!1370001))

(declare-fun m!1370021 () Bool)

(assert (=> b!1484750 m!1370021))

(assert (=> b!1484749 m!1370009))

(assert (=> b!1484749 m!1370007))

(assert (=> b!1484745 m!1369997))

(declare-fun m!1370023 () Bool)

(assert (=> b!1484745 m!1370023))

(declare-fun m!1370025 () Bool)

(assert (=> b!1484738 m!1370025))

(assert (=> b!1484738 m!1370025))

(declare-fun m!1370027 () Bool)

(assert (=> b!1484738 m!1370027))

(declare-fun m!1370029 () Bool)

(assert (=> start!126538 m!1370029))

(declare-fun m!1370031 () Bool)

(assert (=> start!126538 m!1370031))

(assert (=> b!1484753 m!1370001))

(assert (=> b!1484753 m!1370001))

(declare-fun m!1370033 () Bool)

(assert (=> b!1484753 m!1370033))

(assert (=> b!1484753 m!1370033))

(assert (=> b!1484753 m!1370001))

(declare-fun m!1370035 () Bool)

(assert (=> b!1484753 m!1370035))

(declare-fun m!1370037 () Bool)

(assert (=> b!1484754 m!1370037))

(assert (=> b!1484754 m!1369997))

(declare-fun m!1370039 () Bool)

(assert (=> b!1484754 m!1370039))

(declare-fun m!1370041 () Bool)

(assert (=> b!1484754 m!1370041))

(declare-fun m!1370043 () Bool)

(assert (=> b!1484754 m!1370043))

(assert (=> b!1484754 m!1370001))

(assert (=> b!1484743 m!1370041))

(assert (=> b!1484743 m!1370001))

(assert (=> b!1484743 m!1369997))

(assert (=> b!1484743 m!1370039))

(push 1)

