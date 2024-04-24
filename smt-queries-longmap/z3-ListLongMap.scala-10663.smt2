; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125334 () Bool)

(assert start!125334)

(declare-fun b!1458799 () Bool)

(declare-fun res!988272 () Bool)

(declare-fun e!820744 () Bool)

(assert (=> b!1458799 (=> (not res!988272) (not e!820744))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98677 0))(
  ( (array!98678 (arr!47623 (Array (_ BitVec 32) (_ BitVec 64))) (size!48174 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98677)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458799 (= res!988272 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48174 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48174 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48174 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458800 () Bool)

(declare-fun e!820740 () Bool)

(assert (=> b!1458800 (= e!820744 e!820740)))

(declare-fun res!988271 () Bool)

(assert (=> b!1458800 (=> (not res!988271) (not e!820740))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458800 (= res!988271 (= (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639172 () array!98677)

(assert (=> b!1458800 (= lt!639172 (array!98678 (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48174 a!2862)))))

(declare-fun b!1458801 () Bool)

(declare-fun e!820748 () Bool)

(declare-fun e!820743 () Bool)

(assert (=> b!1458801 (= e!820748 (not e!820743))))

(declare-fun res!988274 () Bool)

(assert (=> b!1458801 (=> res!988274 e!820743)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1458801 (= res!988274 (or (and (= (select (arr!47623 a!2862) index!646) (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47623 a!2862) index!646) (select (arr!47623 a!2862) j!93))) (= (select (arr!47623 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!820746 () Bool)

(assert (=> b!1458801 e!820746))

(declare-fun res!988276 () Bool)

(assert (=> b!1458801 (=> (not res!988276) (not e!820746))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98677 (_ BitVec 32)) Bool)

(assert (=> b!1458801 (= res!988276 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49073 0))(
  ( (Unit!49074) )
))
(declare-fun lt!639168 () Unit!49073)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49073)

(assert (=> b!1458801 (= lt!639168 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458802 () Bool)

(declare-fun res!988273 () Bool)

(assert (=> b!1458802 (=> (not res!988273) (not e!820746))))

(declare-datatypes ((SeekEntryResult!11772 0))(
  ( (MissingZero!11772 (index!49480 (_ BitVec 32))) (Found!11772 (index!49481 (_ BitVec 32))) (Intermediate!11772 (undefined!12584 Bool) (index!49482 (_ BitVec 32)) (x!131277 (_ BitVec 32))) (Undefined!11772) (MissingVacant!11772 (index!49483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98677 (_ BitVec 32)) SeekEntryResult!11772)

(assert (=> b!1458802 (= res!988273 (= (seekEntryOrOpen!0 (select (arr!47623 a!2862) j!93) a!2862 mask!2687) (Found!11772 j!93)))))

(declare-fun e!820741 () Bool)

(declare-fun lt!639169 () SeekEntryResult!11772)

(declare-fun lt!639170 () (_ BitVec 64))

(declare-fun b!1458803 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98677 (_ BitVec 32)) SeekEntryResult!11772)

(assert (=> b!1458803 (= e!820741 (= lt!639169 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639170 lt!639172 mask!2687)))))

(declare-fun b!1458804 () Bool)

(declare-fun e!820742 () Bool)

(assert (=> b!1458804 (= e!820743 e!820742)))

(declare-fun res!988269 () Bool)

(assert (=> b!1458804 (=> res!988269 e!820742)))

(declare-fun lt!639174 () (_ BitVec 32))

(assert (=> b!1458804 (= res!988269 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639174 #b00000000000000000000000000000000) (bvsge lt!639174 (size!48174 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458804 (= lt!639174 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!639175 () SeekEntryResult!11772)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98677 (_ BitVec 32)) SeekEntryResult!11772)

(assert (=> b!1458804 (= lt!639175 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639170 lt!639172 mask!2687))))

(assert (=> b!1458804 (= lt!639175 (seekEntryOrOpen!0 lt!639170 lt!639172 mask!2687))))

(declare-fun b!1458805 () Bool)

(declare-fun res!988284 () Bool)

(assert (=> b!1458805 (=> (not res!988284) (not e!820744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458805 (= res!988284 (validKeyInArray!0 (select (arr!47623 a!2862) i!1006)))))

(declare-fun b!1458806 () Bool)

(declare-fun e!820745 () Bool)

(assert (=> b!1458806 (= e!820740 e!820745)))

(declare-fun res!988275 () Bool)

(assert (=> b!1458806 (=> (not res!988275) (not e!820745))))

(declare-fun lt!639171 () SeekEntryResult!11772)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458806 (= res!988275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47623 a!2862) j!93) mask!2687) (select (arr!47623 a!2862) j!93) a!2862 mask!2687) lt!639171))))

(assert (=> b!1458806 (= lt!639171 (Intermediate!11772 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458807 () Bool)

(declare-fun res!988280 () Bool)

(assert (=> b!1458807 (=> (not res!988280) (not e!820748))))

(assert (=> b!1458807 (= res!988280 e!820741)))

(declare-fun c!134785 () Bool)

(assert (=> b!1458807 (= c!134785 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458808 () Bool)

(declare-fun res!988270 () Bool)

(assert (=> b!1458808 (=> (not res!988270) (not e!820748))))

(assert (=> b!1458808 (= res!988270 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458809 () Bool)

(declare-fun res!988277 () Bool)

(assert (=> b!1458809 (=> (not res!988277) (not e!820744))))

(declare-datatypes ((List!34111 0))(
  ( (Nil!34108) (Cons!34107 (h!35468 (_ BitVec 64)) (t!48797 List!34111)) )
))
(declare-fun arrayNoDuplicates!0 (array!98677 (_ BitVec 32) List!34111) Bool)

(assert (=> b!1458809 (= res!988277 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34108))))

(declare-fun b!1458810 () Bool)

(declare-fun res!988281 () Bool)

(assert (=> b!1458810 (=> (not res!988281) (not e!820744))))

(assert (=> b!1458810 (= res!988281 (and (= (size!48174 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48174 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48174 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458811 () Bool)

(declare-fun res!988286 () Bool)

(assert (=> b!1458811 (=> (not res!988286) (not e!820744))))

(assert (=> b!1458811 (= res!988286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!988278 () Bool)

(assert (=> start!125334 (=> (not res!988278) (not e!820744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125334 (= res!988278 (validMask!0 mask!2687))))

(assert (=> start!125334 e!820744))

(assert (=> start!125334 true))

(declare-fun array_inv!36904 (array!98677) Bool)

(assert (=> start!125334 (array_inv!36904 a!2862)))

(declare-fun b!1458812 () Bool)

(assert (=> b!1458812 (= e!820742 true)))

(declare-fun lt!639173 () Bool)

(declare-fun e!820749 () Bool)

(assert (=> b!1458812 (= lt!639173 e!820749)))

(declare-fun c!134784 () Bool)

(assert (=> b!1458812 (= c!134784 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458813 () Bool)

(declare-fun res!988282 () Bool)

(assert (=> b!1458813 (=> (not res!988282) (not e!820744))))

(assert (=> b!1458813 (= res!988282 (validKeyInArray!0 (select (arr!47623 a!2862) j!93)))))

(declare-fun b!1458814 () Bool)

(assert (=> b!1458814 (= e!820749 (not (= lt!639169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639174 lt!639170 lt!639172 mask!2687))))))

(declare-fun b!1458815 () Bool)

(declare-fun res!988279 () Bool)

(assert (=> b!1458815 (=> res!988279 e!820742)))

(assert (=> b!1458815 (= res!988279 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639174 (select (arr!47623 a!2862) j!93) a!2862 mask!2687) lt!639171)))))

(declare-fun b!1458816 () Bool)

(assert (=> b!1458816 (= e!820741 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639170 lt!639172 mask!2687) (seekEntryOrOpen!0 lt!639170 lt!639172 mask!2687)))))

(declare-fun b!1458817 () Bool)

(assert (=> b!1458817 (= e!820745 e!820748)))

(declare-fun res!988285 () Bool)

(assert (=> b!1458817 (=> (not res!988285) (not e!820748))))

(assert (=> b!1458817 (= res!988285 (= lt!639169 (Intermediate!11772 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458817 (= lt!639169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639170 mask!2687) lt!639170 lt!639172 mask!2687))))

(assert (=> b!1458817 (= lt!639170 (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458818 () Bool)

(assert (=> b!1458818 (= e!820749 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639174 intermediateAfterIndex!19 lt!639170 lt!639172 mask!2687) lt!639175)))))

(declare-fun b!1458819 () Bool)

(assert (=> b!1458819 (= e!820746 (and (or (= (select (arr!47623 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47623 a!2862) intermediateBeforeIndex!19) (select (arr!47623 a!2862) j!93))) (let ((bdg!53342 (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47623 a!2862) index!646) bdg!53342) (= (select (arr!47623 a!2862) index!646) (select (arr!47623 a!2862) j!93))) (= (select (arr!47623 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53342 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458820 () Bool)

(declare-fun res!988283 () Bool)

(assert (=> b!1458820 (=> (not res!988283) (not e!820745))))

(assert (=> b!1458820 (= res!988283 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47623 a!2862) j!93) a!2862 mask!2687) lt!639171))))

(assert (= (and start!125334 res!988278) b!1458810))

(assert (= (and b!1458810 res!988281) b!1458805))

(assert (= (and b!1458805 res!988284) b!1458813))

(assert (= (and b!1458813 res!988282) b!1458811))

(assert (= (and b!1458811 res!988286) b!1458809))

(assert (= (and b!1458809 res!988277) b!1458799))

(assert (= (and b!1458799 res!988272) b!1458800))

(assert (= (and b!1458800 res!988271) b!1458806))

(assert (= (and b!1458806 res!988275) b!1458820))

(assert (= (and b!1458820 res!988283) b!1458817))

(assert (= (and b!1458817 res!988285) b!1458807))

(assert (= (and b!1458807 c!134785) b!1458803))

(assert (= (and b!1458807 (not c!134785)) b!1458816))

(assert (= (and b!1458807 res!988280) b!1458808))

(assert (= (and b!1458808 res!988270) b!1458801))

(assert (= (and b!1458801 res!988276) b!1458802))

(assert (= (and b!1458802 res!988273) b!1458819))

(assert (= (and b!1458801 (not res!988274)) b!1458804))

(assert (= (and b!1458804 (not res!988269)) b!1458815))

(assert (= (and b!1458815 (not res!988279)) b!1458812))

(assert (= (and b!1458812 c!134784) b!1458814))

(assert (= (and b!1458812 (not c!134784)) b!1458818))

(declare-fun m!1346887 () Bool)

(assert (=> b!1458811 m!1346887))

(declare-fun m!1346889 () Bool)

(assert (=> b!1458815 m!1346889))

(assert (=> b!1458815 m!1346889))

(declare-fun m!1346891 () Bool)

(assert (=> b!1458815 m!1346891))

(declare-fun m!1346893 () Bool)

(assert (=> b!1458800 m!1346893))

(declare-fun m!1346895 () Bool)

(assert (=> b!1458800 m!1346895))

(declare-fun m!1346897 () Bool)

(assert (=> b!1458816 m!1346897))

(declare-fun m!1346899 () Bool)

(assert (=> b!1458816 m!1346899))

(assert (=> b!1458802 m!1346889))

(assert (=> b!1458802 m!1346889))

(declare-fun m!1346901 () Bool)

(assert (=> b!1458802 m!1346901))

(assert (=> b!1458806 m!1346889))

(assert (=> b!1458806 m!1346889))

(declare-fun m!1346903 () Bool)

(assert (=> b!1458806 m!1346903))

(assert (=> b!1458806 m!1346903))

(assert (=> b!1458806 m!1346889))

(declare-fun m!1346905 () Bool)

(assert (=> b!1458806 m!1346905))

(assert (=> b!1458820 m!1346889))

(assert (=> b!1458820 m!1346889))

(declare-fun m!1346907 () Bool)

(assert (=> b!1458820 m!1346907))

(declare-fun m!1346909 () Bool)

(assert (=> b!1458818 m!1346909))

(declare-fun m!1346911 () Bool)

(assert (=> b!1458803 m!1346911))

(declare-fun m!1346913 () Bool)

(assert (=> start!125334 m!1346913))

(declare-fun m!1346915 () Bool)

(assert (=> start!125334 m!1346915))

(declare-fun m!1346917 () Bool)

(assert (=> b!1458809 m!1346917))

(assert (=> b!1458819 m!1346893))

(declare-fun m!1346919 () Bool)

(assert (=> b!1458819 m!1346919))

(declare-fun m!1346921 () Bool)

(assert (=> b!1458819 m!1346921))

(declare-fun m!1346923 () Bool)

(assert (=> b!1458819 m!1346923))

(assert (=> b!1458819 m!1346889))

(declare-fun m!1346925 () Bool)

(assert (=> b!1458804 m!1346925))

(assert (=> b!1458804 m!1346897))

(assert (=> b!1458804 m!1346899))

(declare-fun m!1346927 () Bool)

(assert (=> b!1458801 m!1346927))

(assert (=> b!1458801 m!1346893))

(assert (=> b!1458801 m!1346921))

(assert (=> b!1458801 m!1346923))

(declare-fun m!1346929 () Bool)

(assert (=> b!1458801 m!1346929))

(assert (=> b!1458801 m!1346889))

(declare-fun m!1346931 () Bool)

(assert (=> b!1458814 m!1346931))

(declare-fun m!1346933 () Bool)

(assert (=> b!1458817 m!1346933))

(assert (=> b!1458817 m!1346933))

(declare-fun m!1346935 () Bool)

(assert (=> b!1458817 m!1346935))

(assert (=> b!1458817 m!1346893))

(declare-fun m!1346937 () Bool)

(assert (=> b!1458817 m!1346937))

(assert (=> b!1458813 m!1346889))

(assert (=> b!1458813 m!1346889))

(declare-fun m!1346939 () Bool)

(assert (=> b!1458813 m!1346939))

(declare-fun m!1346941 () Bool)

(assert (=> b!1458805 m!1346941))

(assert (=> b!1458805 m!1346941))

(declare-fun m!1346943 () Bool)

(assert (=> b!1458805 m!1346943))

(check-sat (not b!1458811) (not b!1458820) (not b!1458814) (not b!1458818) (not start!125334) (not b!1458803) (not b!1458817) (not b!1458813) (not b!1458816) (not b!1458815) (not b!1458804) (not b!1458802) (not b!1458805) (not b!1458806) (not b!1458801) (not b!1458809))
(check-sat)
