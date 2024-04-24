; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125562 () Bool)

(assert start!125562)

(declare-fun b!1464553 () Bool)

(declare-fun e!823319 () Bool)

(declare-fun e!823323 () Bool)

(assert (=> b!1464553 (= e!823319 e!823323)))

(declare-fun res!992816 () Bool)

(assert (=> b!1464553 (=> (not res!992816) (not e!823323))))

(declare-datatypes ((array!98848 0))(
  ( (array!98849 (arr!47707 (Array (_ BitVec 32) (_ BitVec 64))) (size!48258 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98848)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11856 0))(
  ( (MissingZero!11856 (index!49816 (_ BitVec 32))) (Found!11856 (index!49817 (_ BitVec 32))) (Intermediate!11856 (undefined!12668 Bool) (index!49818 (_ BitVec 32)) (x!131594 (_ BitVec 32))) (Undefined!11856) (MissingVacant!11856 (index!49819 (_ BitVec 32))) )
))
(declare-fun lt!641215 () SeekEntryResult!11856)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98848 (_ BitVec 32)) SeekEntryResult!11856)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464553 (= res!992816 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47707 a!2862) j!93) mask!2687) (select (arr!47707 a!2862) j!93) a!2862 mask!2687) lt!641215))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464553 (= lt!641215 (Intermediate!11856 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464554 () Bool)

(declare-fun res!992830 () Bool)

(declare-fun e!823318 () Bool)

(assert (=> b!1464554 (=> (not res!992830) (not e!823318))))

(declare-datatypes ((List!34195 0))(
  ( (Nil!34192) (Cons!34191 (h!35555 (_ BitVec 64)) (t!48881 List!34195)) )
))
(declare-fun arrayNoDuplicates!0 (array!98848 (_ BitVec 32) List!34195) Bool)

(assert (=> b!1464554 (= res!992830 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34192))))

(declare-fun b!1464555 () Bool)

(declare-fun e!823317 () Bool)

(declare-fun e!823322 () Bool)

(assert (=> b!1464555 (= e!823317 (not e!823322))))

(declare-fun res!992817 () Bool)

(assert (=> b!1464555 (=> res!992817 e!823322)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464555 (= res!992817 (or (and (= (select (arr!47707 a!2862) index!646) (select (store (arr!47707 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47707 a!2862) index!646) (select (arr!47707 a!2862) j!93))) (= (select (arr!47707 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823320 () Bool)

(assert (=> b!1464555 e!823320))

(declare-fun res!992815 () Bool)

(assert (=> b!1464555 (=> (not res!992815) (not e!823320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98848 (_ BitVec 32)) Bool)

(assert (=> b!1464555 (= res!992815 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49241 0))(
  ( (Unit!49242) )
))
(declare-fun lt!641220 () Unit!49241)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49241)

(assert (=> b!1464555 (= lt!641220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464556 () Bool)

(assert (=> b!1464556 (= e!823323 e!823317)))

(declare-fun res!992814 () Bool)

(assert (=> b!1464556 (=> (not res!992814) (not e!823317))))

(declare-fun lt!641221 () SeekEntryResult!11856)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464556 (= res!992814 (= lt!641221 (Intermediate!11856 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641217 () array!98848)

(declare-fun lt!641218 () (_ BitVec 64))

(assert (=> b!1464556 (= lt!641221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641218 mask!2687) lt!641218 lt!641217 mask!2687))))

(assert (=> b!1464556 (= lt!641218 (select (store (arr!47707 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464557 () Bool)

(declare-fun e!823315 () Bool)

(assert (=> b!1464557 (= e!823315 (= lt!641221 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641218 lt!641217 mask!2687)))))

(declare-fun b!1464558 () Bool)

(declare-fun res!992824 () Bool)

(assert (=> b!1464558 (=> (not res!992824) (not e!823318))))

(assert (=> b!1464558 (= res!992824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464559 () Bool)

(declare-fun res!992822 () Bool)

(assert (=> b!1464559 (=> (not res!992822) (not e!823317))))

(assert (=> b!1464559 (= res!992822 e!823315)))

(declare-fun c!135391 () Bool)

(assert (=> b!1464559 (= c!135391 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464560 () Bool)

(declare-fun res!992829 () Bool)

(assert (=> b!1464560 (=> (not res!992829) (not e!823323))))

(assert (=> b!1464560 (= res!992829 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47707 a!2862) j!93) a!2862 mask!2687) lt!641215))))

(declare-fun b!1464561 () Bool)

(declare-fun e!823316 () Bool)

(declare-fun lt!641216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98848 (_ BitVec 32)) SeekEntryResult!11856)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98848 (_ BitVec 32)) SeekEntryResult!11856)

(assert (=> b!1464561 (= e!823316 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641216 intermediateAfterIndex!19 lt!641218 lt!641217 mask!2687) (seekEntryOrOpen!0 lt!641218 lt!641217 mask!2687))))))

(declare-fun b!1464562 () Bool)

(declare-fun e!823314 () Bool)

(assert (=> b!1464562 (= e!823314 true)))

(declare-fun lt!641219 () Bool)

(assert (=> b!1464562 (= lt!641219 e!823316)))

(declare-fun c!135390 () Bool)

(assert (=> b!1464562 (= c!135390 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!992821 () Bool)

(assert (=> start!125562 (=> (not res!992821) (not e!823318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125562 (= res!992821 (validMask!0 mask!2687))))

(assert (=> start!125562 e!823318))

(assert (=> start!125562 true))

(declare-fun array_inv!36988 (array!98848) Bool)

(assert (=> start!125562 (array_inv!36988 a!2862)))

(declare-fun b!1464563 () Bool)

(declare-fun res!992827 () Bool)

(assert (=> b!1464563 (=> (not res!992827) (not e!823318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464563 (= res!992827 (validKeyInArray!0 (select (arr!47707 a!2862) i!1006)))))

(declare-fun b!1464564 () Bool)

(declare-fun res!992826 () Bool)

(assert (=> b!1464564 (=> (not res!992826) (not e!823320))))

(assert (=> b!1464564 (= res!992826 (= (seekEntryOrOpen!0 (select (arr!47707 a!2862) j!93) a!2862 mask!2687) (Found!11856 j!93)))))

(declare-fun b!1464565 () Bool)

(declare-fun res!992818 () Bool)

(assert (=> b!1464565 (=> (not res!992818) (not e!823318))))

(assert (=> b!1464565 (= res!992818 (and (= (size!48258 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48258 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48258 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464566 () Bool)

(assert (=> b!1464566 (= e!823318 e!823319)))

(declare-fun res!992823 () Bool)

(assert (=> b!1464566 (=> (not res!992823) (not e!823319))))

(assert (=> b!1464566 (= res!992823 (= (select (store (arr!47707 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464566 (= lt!641217 (array!98849 (store (arr!47707 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48258 a!2862)))))

(declare-fun b!1464567 () Bool)

(declare-fun res!992820 () Bool)

(assert (=> b!1464567 (=> (not res!992820) (not e!823318))))

(assert (=> b!1464567 (= res!992820 (validKeyInArray!0 (select (arr!47707 a!2862) j!93)))))

(declare-fun b!1464568 () Bool)

(assert (=> b!1464568 (= e!823316 (not (= lt!641221 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641216 lt!641218 lt!641217 mask!2687))))))

(declare-fun b!1464569 () Bool)

(declare-fun res!992825 () Bool)

(assert (=> b!1464569 (=> res!992825 e!823314)))

(assert (=> b!1464569 (= res!992825 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641216 (select (arr!47707 a!2862) j!93) a!2862 mask!2687) lt!641215)))))

(declare-fun b!1464570 () Bool)

(assert (=> b!1464570 (= e!823320 (or (= (select (arr!47707 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47707 a!2862) intermediateBeforeIndex!19) (select (arr!47707 a!2862) j!93))))))

(declare-fun b!1464571 () Bool)

(assert (=> b!1464571 (= e!823315 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641218 lt!641217 mask!2687) (seekEntryOrOpen!0 lt!641218 lt!641217 mask!2687)))))

(declare-fun b!1464572 () Bool)

(assert (=> b!1464572 (= e!823322 e!823314)))

(declare-fun res!992831 () Bool)

(assert (=> b!1464572 (=> res!992831 e!823314)))

(assert (=> b!1464572 (= res!992831 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641216 #b00000000000000000000000000000000) (bvsge lt!641216 (size!48258 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464572 (= lt!641216 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1464573 () Bool)

(declare-fun res!992819 () Bool)

(assert (=> b!1464573 (=> (not res!992819) (not e!823318))))

(assert (=> b!1464573 (= res!992819 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48258 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48258 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48258 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464574 () Bool)

(declare-fun res!992828 () Bool)

(assert (=> b!1464574 (=> (not res!992828) (not e!823317))))

(assert (=> b!1464574 (= res!992828 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125562 res!992821) b!1464565))

(assert (= (and b!1464565 res!992818) b!1464563))

(assert (= (and b!1464563 res!992827) b!1464567))

(assert (= (and b!1464567 res!992820) b!1464558))

(assert (= (and b!1464558 res!992824) b!1464554))

(assert (= (and b!1464554 res!992830) b!1464573))

(assert (= (and b!1464573 res!992819) b!1464566))

(assert (= (and b!1464566 res!992823) b!1464553))

(assert (= (and b!1464553 res!992816) b!1464560))

(assert (= (and b!1464560 res!992829) b!1464556))

(assert (= (and b!1464556 res!992814) b!1464559))

(assert (= (and b!1464559 c!135391) b!1464557))

(assert (= (and b!1464559 (not c!135391)) b!1464571))

(assert (= (and b!1464559 res!992822) b!1464574))

(assert (= (and b!1464574 res!992828) b!1464555))

(assert (= (and b!1464555 res!992815) b!1464564))

(assert (= (and b!1464564 res!992826) b!1464570))

(assert (= (and b!1464555 (not res!992817)) b!1464572))

(assert (= (and b!1464572 (not res!992831)) b!1464569))

(assert (= (and b!1464569 (not res!992825)) b!1464562))

(assert (= (and b!1464562 c!135390) b!1464568))

(assert (= (and b!1464562 (not c!135390)) b!1464561))

(declare-fun m!1351939 () Bool)

(assert (=> b!1464554 m!1351939))

(declare-fun m!1351941 () Bool)

(assert (=> b!1464564 m!1351941))

(assert (=> b!1464564 m!1351941))

(declare-fun m!1351943 () Bool)

(assert (=> b!1464564 m!1351943))

(declare-fun m!1351945 () Bool)

(assert (=> b!1464555 m!1351945))

(declare-fun m!1351947 () Bool)

(assert (=> b!1464555 m!1351947))

(declare-fun m!1351949 () Bool)

(assert (=> b!1464555 m!1351949))

(declare-fun m!1351951 () Bool)

(assert (=> b!1464555 m!1351951))

(declare-fun m!1351953 () Bool)

(assert (=> b!1464555 m!1351953))

(assert (=> b!1464555 m!1351941))

(declare-fun m!1351955 () Bool)

(assert (=> b!1464571 m!1351955))

(declare-fun m!1351957 () Bool)

(assert (=> b!1464571 m!1351957))

(declare-fun m!1351959 () Bool)

(assert (=> b!1464572 m!1351959))

(declare-fun m!1351961 () Bool)

(assert (=> b!1464561 m!1351961))

(assert (=> b!1464561 m!1351957))

(assert (=> b!1464566 m!1351947))

(declare-fun m!1351963 () Bool)

(assert (=> b!1464566 m!1351963))

(declare-fun m!1351965 () Bool)

(assert (=> b!1464556 m!1351965))

(assert (=> b!1464556 m!1351965))

(declare-fun m!1351967 () Bool)

(assert (=> b!1464556 m!1351967))

(assert (=> b!1464556 m!1351947))

(declare-fun m!1351969 () Bool)

(assert (=> b!1464556 m!1351969))

(assert (=> b!1464569 m!1351941))

(assert (=> b!1464569 m!1351941))

(declare-fun m!1351971 () Bool)

(assert (=> b!1464569 m!1351971))

(declare-fun m!1351973 () Bool)

(assert (=> b!1464568 m!1351973))

(assert (=> b!1464567 m!1351941))

(assert (=> b!1464567 m!1351941))

(declare-fun m!1351975 () Bool)

(assert (=> b!1464567 m!1351975))

(declare-fun m!1351977 () Bool)

(assert (=> b!1464557 m!1351977))

(declare-fun m!1351979 () Bool)

(assert (=> start!125562 m!1351979))

(declare-fun m!1351981 () Bool)

(assert (=> start!125562 m!1351981))

(declare-fun m!1351983 () Bool)

(assert (=> b!1464570 m!1351983))

(assert (=> b!1464570 m!1351941))

(declare-fun m!1351985 () Bool)

(assert (=> b!1464558 m!1351985))

(assert (=> b!1464553 m!1351941))

(assert (=> b!1464553 m!1351941))

(declare-fun m!1351987 () Bool)

(assert (=> b!1464553 m!1351987))

(assert (=> b!1464553 m!1351987))

(assert (=> b!1464553 m!1351941))

(declare-fun m!1351989 () Bool)

(assert (=> b!1464553 m!1351989))

(assert (=> b!1464560 m!1351941))

(assert (=> b!1464560 m!1351941))

(declare-fun m!1351991 () Bool)

(assert (=> b!1464560 m!1351991))

(declare-fun m!1351993 () Bool)

(assert (=> b!1464563 m!1351993))

(assert (=> b!1464563 m!1351993))

(declare-fun m!1351995 () Bool)

(assert (=> b!1464563 m!1351995))

(check-sat (not b!1464556) (not b!1464558) (not b!1464554) (not start!125562) (not b!1464553) (not b!1464560) (not b!1464555) (not b!1464572) (not b!1464563) (not b!1464568) (not b!1464569) (not b!1464557) (not b!1464571) (not b!1464564) (not b!1464561) (not b!1464567))
(check-sat)
