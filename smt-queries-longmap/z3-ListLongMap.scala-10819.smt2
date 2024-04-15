; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126512 () Bool)

(assert start!126512)

(declare-fun b!1485124 () Bool)

(declare-fun res!1010033 () Bool)

(declare-fun e!832559 () Bool)

(assert (=> b!1485124 (=> (not res!1010033) (not e!832559))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99472 0))(
  ( (array!99473 (arr!48013 (Array (_ BitVec 32) (_ BitVec 64))) (size!48565 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99472)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485124 (= res!1010033 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48565 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48565 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48565 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485125 () Bool)

(declare-fun e!832558 () Bool)

(declare-fun e!832550 () Bool)

(assert (=> b!1485125 (= e!832558 (not e!832550))))

(declare-fun res!1010026 () Bool)

(assert (=> b!1485125 (=> res!1010026 e!832550)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485125 (= res!1010026 (or (and (= (select (arr!48013 a!2862) index!646) (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48013 a!2862) index!646) (select (arr!48013 a!2862) j!93))) (= (select (arr!48013 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832555 () Bool)

(assert (=> b!1485125 e!832555))

(declare-fun res!1010030 () Bool)

(assert (=> b!1485125 (=> (not res!1010030) (not e!832555))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99472 (_ BitVec 32)) Bool)

(assert (=> b!1485125 (= res!1010030 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49737 0))(
  ( (Unit!49738) )
))
(declare-fun lt!647813 () Unit!49737)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49737)

(assert (=> b!1485125 (= lt!647813 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485126 () Bool)

(declare-fun res!1010036 () Bool)

(declare-fun e!832552 () Bool)

(assert (=> b!1485126 (=> (not res!1010036) (not e!832552))))

(declare-datatypes ((SeekEntryResult!12278 0))(
  ( (MissingZero!12278 (index!51504 (_ BitVec 32))) (Found!12278 (index!51505 (_ BitVec 32))) (Intermediate!12278 (undefined!13090 Bool) (index!51506 (_ BitVec 32)) (x!133075 (_ BitVec 32))) (Undefined!12278) (MissingVacant!12278 (index!51507 (_ BitVec 32))) )
))
(declare-fun lt!647810 () SeekEntryResult!12278)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12278)

(assert (=> b!1485126 (= res!1010036 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48013 a!2862) j!93) a!2862 mask!2687) lt!647810))))

(declare-fun b!1485127 () Bool)

(declare-fun res!1010032 () Bool)

(assert (=> b!1485127 (=> (not res!1010032) (not e!832559))))

(declare-datatypes ((List!34592 0))(
  ( (Nil!34589) (Cons!34588 (h!35962 (_ BitVec 64)) (t!49278 List!34592)) )
))
(declare-fun arrayNoDuplicates!0 (array!99472 (_ BitVec 32) List!34592) Bool)

(assert (=> b!1485127 (= res!1010032 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34589))))

(declare-fun b!1485128 () Bool)

(assert (=> b!1485128 (= e!832552 e!832558)))

(declare-fun res!1010041 () Bool)

(assert (=> b!1485128 (=> (not res!1010041) (not e!832558))))

(declare-fun lt!647809 () SeekEntryResult!12278)

(assert (=> b!1485128 (= res!1010041 (= lt!647809 (Intermediate!12278 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647807 () array!99472)

(declare-fun lt!647812 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485128 (= lt!647809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647812 mask!2687) lt!647812 lt!647807 mask!2687))))

(assert (=> b!1485128 (= lt!647812 (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485129 () Bool)

(declare-fun e!832553 () Bool)

(assert (=> b!1485129 (= e!832553 e!832552)))

(declare-fun res!1010027 () Bool)

(assert (=> b!1485129 (=> (not res!1010027) (not e!832552))))

(assert (=> b!1485129 (= res!1010027 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48013 a!2862) j!93) mask!2687) (select (arr!48013 a!2862) j!93) a!2862 mask!2687) lt!647810))))

(assert (=> b!1485129 (= lt!647810 (Intermediate!12278 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485130 () Bool)

(declare-fun res!1010038 () Bool)

(assert (=> b!1485130 (=> (not res!1010038) (not e!832559))))

(assert (=> b!1485130 (= res!1010038 (and (= (size!48565 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48565 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48565 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!832551 () Bool)

(declare-fun b!1485131 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12278)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12278)

(assert (=> b!1485131 (= e!832551 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647812 lt!647807 mask!2687) (seekEntryOrOpen!0 lt!647812 lt!647807 mask!2687)))))

(declare-fun b!1485132 () Bool)

(assert (=> b!1485132 (= e!832551 (= lt!647809 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647812 lt!647807 mask!2687)))))

(declare-fun b!1485133 () Bool)

(assert (=> b!1485133 (= e!832550 true)))

(declare-fun lt!647811 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485133 (= lt!647811 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485134 () Bool)

(declare-fun res!1010043 () Bool)

(assert (=> b!1485134 (=> (not res!1010043) (not e!832558))))

(assert (=> b!1485134 (= res!1010043 e!832551)))

(declare-fun c!137074 () Bool)

(assert (=> b!1485134 (= c!137074 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485136 () Bool)

(declare-fun e!832554 () Bool)

(assert (=> b!1485136 (= e!832554 (= (seekEntryOrOpen!0 lt!647812 lt!647807 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647812 lt!647807 mask!2687)))))

(declare-fun b!1485137 () Bool)

(declare-fun res!1010040 () Bool)

(assert (=> b!1485137 (=> (not res!1010040) (not e!832555))))

(assert (=> b!1485137 (= res!1010040 (or (= (select (arr!48013 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48013 a!2862) intermediateBeforeIndex!19) (select (arr!48013 a!2862) j!93))))))

(declare-fun b!1485138 () Bool)

(declare-fun res!1010039 () Bool)

(assert (=> b!1485138 (=> (not res!1010039) (not e!832559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485138 (= res!1010039 (validKeyInArray!0 (select (arr!48013 a!2862) j!93)))))

(declare-fun b!1485139 () Bool)

(declare-fun res!1010034 () Bool)

(assert (=> b!1485139 (=> (not res!1010034) (not e!832555))))

(assert (=> b!1485139 (= res!1010034 (= (seekEntryOrOpen!0 (select (arr!48013 a!2862) j!93) a!2862 mask!2687) (Found!12278 j!93)))))

(declare-fun b!1485140 () Bool)

(declare-fun res!1010028 () Bool)

(assert (=> b!1485140 (=> (not res!1010028) (not e!832559))))

(assert (=> b!1485140 (= res!1010028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485141 () Bool)

(declare-fun res!1010037 () Bool)

(assert (=> b!1485141 (=> (not res!1010037) (not e!832558))))

(assert (=> b!1485141 (= res!1010037 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485142 () Bool)

(declare-fun e!832556 () Bool)

(assert (=> b!1485142 (= e!832555 e!832556)))

(declare-fun res!1010035 () Bool)

(assert (=> b!1485142 (=> res!1010035 e!832556)))

(declare-fun lt!647808 () (_ BitVec 64))

(assert (=> b!1485142 (= res!1010035 (or (and (= (select (arr!48013 a!2862) index!646) lt!647808) (= (select (arr!48013 a!2862) index!646) (select (arr!48013 a!2862) j!93))) (= (select (arr!48013 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485142 (= lt!647808 (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485143 () Bool)

(assert (=> b!1485143 (= e!832556 e!832554)))

(declare-fun res!1010042 () Bool)

(assert (=> b!1485143 (=> (not res!1010042) (not e!832554))))

(assert (=> b!1485143 (= res!1010042 (and (= index!646 intermediateAfterIndex!19) (= lt!647808 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485144 () Bool)

(declare-fun res!1010044 () Bool)

(assert (=> b!1485144 (=> (not res!1010044) (not e!832559))))

(assert (=> b!1485144 (= res!1010044 (validKeyInArray!0 (select (arr!48013 a!2862) i!1006)))))

(declare-fun res!1010029 () Bool)

(assert (=> start!126512 (=> (not res!1010029) (not e!832559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126512 (= res!1010029 (validMask!0 mask!2687))))

(assert (=> start!126512 e!832559))

(assert (=> start!126512 true))

(declare-fun array_inv!37246 (array!99472) Bool)

(assert (=> start!126512 (array_inv!37246 a!2862)))

(declare-fun b!1485135 () Bool)

(assert (=> b!1485135 (= e!832559 e!832553)))

(declare-fun res!1010031 () Bool)

(assert (=> b!1485135 (=> (not res!1010031) (not e!832553))))

(assert (=> b!1485135 (= res!1010031 (= (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485135 (= lt!647807 (array!99473 (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48565 a!2862)))))

(assert (= (and start!126512 res!1010029) b!1485130))

(assert (= (and b!1485130 res!1010038) b!1485144))

(assert (= (and b!1485144 res!1010044) b!1485138))

(assert (= (and b!1485138 res!1010039) b!1485140))

(assert (= (and b!1485140 res!1010028) b!1485127))

(assert (= (and b!1485127 res!1010032) b!1485124))

(assert (= (and b!1485124 res!1010033) b!1485135))

(assert (= (and b!1485135 res!1010031) b!1485129))

(assert (= (and b!1485129 res!1010027) b!1485126))

(assert (= (and b!1485126 res!1010036) b!1485128))

(assert (= (and b!1485128 res!1010041) b!1485134))

(assert (= (and b!1485134 c!137074) b!1485132))

(assert (= (and b!1485134 (not c!137074)) b!1485131))

(assert (= (and b!1485134 res!1010043) b!1485141))

(assert (= (and b!1485141 res!1010037) b!1485125))

(assert (= (and b!1485125 res!1010030) b!1485139))

(assert (= (and b!1485139 res!1010034) b!1485137))

(assert (= (and b!1485137 res!1010040) b!1485142))

(assert (= (and b!1485142 (not res!1010035)) b!1485143))

(assert (= (and b!1485143 res!1010042) b!1485136))

(assert (= (and b!1485125 (not res!1010026)) b!1485133))

(declare-fun m!1369713 () Bool)

(assert (=> b!1485125 m!1369713))

(declare-fun m!1369715 () Bool)

(assert (=> b!1485125 m!1369715))

(declare-fun m!1369717 () Bool)

(assert (=> b!1485125 m!1369717))

(declare-fun m!1369719 () Bool)

(assert (=> b!1485125 m!1369719))

(declare-fun m!1369721 () Bool)

(assert (=> b!1485125 m!1369721))

(declare-fun m!1369723 () Bool)

(assert (=> b!1485125 m!1369723))

(assert (=> b!1485142 m!1369719))

(assert (=> b!1485142 m!1369723))

(assert (=> b!1485142 m!1369715))

(assert (=> b!1485142 m!1369717))

(declare-fun m!1369725 () Bool)

(assert (=> b!1485128 m!1369725))

(assert (=> b!1485128 m!1369725))

(declare-fun m!1369727 () Bool)

(assert (=> b!1485128 m!1369727))

(assert (=> b!1485128 m!1369715))

(declare-fun m!1369729 () Bool)

(assert (=> b!1485128 m!1369729))

(declare-fun m!1369731 () Bool)

(assert (=> b!1485144 m!1369731))

(assert (=> b!1485144 m!1369731))

(declare-fun m!1369733 () Bool)

(assert (=> b!1485144 m!1369733))

(declare-fun m!1369735 () Bool)

(assert (=> b!1485137 m!1369735))

(assert (=> b!1485137 m!1369723))

(declare-fun m!1369737 () Bool)

(assert (=> b!1485133 m!1369737))

(declare-fun m!1369739 () Bool)

(assert (=> b!1485140 m!1369739))

(assert (=> b!1485129 m!1369723))

(assert (=> b!1485129 m!1369723))

(declare-fun m!1369741 () Bool)

(assert (=> b!1485129 m!1369741))

(assert (=> b!1485129 m!1369741))

(assert (=> b!1485129 m!1369723))

(declare-fun m!1369743 () Bool)

(assert (=> b!1485129 m!1369743))

(declare-fun m!1369745 () Bool)

(assert (=> b!1485136 m!1369745))

(declare-fun m!1369747 () Bool)

(assert (=> b!1485136 m!1369747))

(declare-fun m!1369749 () Bool)

(assert (=> start!126512 m!1369749))

(declare-fun m!1369751 () Bool)

(assert (=> start!126512 m!1369751))

(assert (=> b!1485135 m!1369715))

(declare-fun m!1369753 () Bool)

(assert (=> b!1485135 m!1369753))

(assert (=> b!1485126 m!1369723))

(assert (=> b!1485126 m!1369723))

(declare-fun m!1369755 () Bool)

(assert (=> b!1485126 m!1369755))

(declare-fun m!1369757 () Bool)

(assert (=> b!1485132 m!1369757))

(assert (=> b!1485131 m!1369747))

(assert (=> b!1485131 m!1369745))

(assert (=> b!1485139 m!1369723))

(assert (=> b!1485139 m!1369723))

(declare-fun m!1369759 () Bool)

(assert (=> b!1485139 m!1369759))

(assert (=> b!1485138 m!1369723))

(assert (=> b!1485138 m!1369723))

(declare-fun m!1369761 () Bool)

(assert (=> b!1485138 m!1369761))

(declare-fun m!1369763 () Bool)

(assert (=> b!1485127 m!1369763))

(check-sat (not b!1485138) (not b!1485126) (not b!1485128) (not b!1485132) (not b!1485131) (not b!1485127) (not b!1485144) (not b!1485140) (not b!1485139) (not b!1485136) (not b!1485129) (not start!126512) (not b!1485125) (not b!1485133))
(check-sat)
