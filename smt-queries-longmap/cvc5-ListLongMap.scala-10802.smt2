; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126400 () Bool)

(assert start!126400)

(declare-fun b!1482026 () Bool)

(declare-fun res!1007295 () Bool)

(declare-fun e!831122 () Bool)

(assert (=> b!1482026 (=> (not res!1007295) (not e!831122))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99419 0))(
  ( (array!99420 (arr!47987 (Array (_ BitVec 32) (_ BitVec 64))) (size!48537 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99419)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1482026 (= res!1007295 (and (= (size!48537 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48537 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48537 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482027 () Bool)

(declare-fun res!1007288 () Bool)

(assert (=> b!1482027 (=> (not res!1007288) (not e!831122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99419 (_ BitVec 32)) Bool)

(assert (=> b!1482027 (= res!1007288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482028 () Bool)

(declare-fun res!1007291 () Bool)

(declare-fun e!831120 () Bool)

(assert (=> b!1482028 (=> (not res!1007291) (not e!831120))))

(declare-datatypes ((SeekEntryResult!12227 0))(
  ( (MissingZero!12227 (index!51300 (_ BitVec 32))) (Found!12227 (index!51301 (_ BitVec 32))) (Intermediate!12227 (undefined!13039 Bool) (index!51302 (_ BitVec 32)) (x!132886 (_ BitVec 32))) (Undefined!12227) (MissingVacant!12227 (index!51303 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99419 (_ BitVec 32)) SeekEntryResult!12227)

(assert (=> b!1482028 (= res!1007291 (= (seekEntryOrOpen!0 (select (arr!47987 a!2862) j!93) a!2862 mask!2687) (Found!12227 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1482029 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482029 (= e!831120 (and (or (= (select (arr!47987 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47987 a!2862) intermediateBeforeIndex!19) (select (arr!47987 a!2862) j!93))) (or (and (= (select (arr!47987 a!2862) index!646) (select (store (arr!47987 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47987 a!2862) index!646) (select (arr!47987 a!2862) j!93))) (= (select (arr!47987 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47987 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!1007282 () Bool)

(assert (=> start!126400 (=> (not res!1007282) (not e!831122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126400 (= res!1007282 (validMask!0 mask!2687))))

(assert (=> start!126400 e!831122))

(assert (=> start!126400 true))

(declare-fun array_inv!37015 (array!99419) Bool)

(assert (=> start!126400 (array_inv!37015 a!2862)))

(declare-fun b!1482030 () Bool)

(declare-fun res!1007293 () Bool)

(declare-fun e!831118 () Bool)

(assert (=> b!1482030 (=> (not res!1007293) (not e!831118))))

(declare-fun e!831117 () Bool)

(assert (=> b!1482030 (= res!1007293 e!831117)))

(declare-fun c!136893 () Bool)

(assert (=> b!1482030 (= c!136893 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482031 () Bool)

(declare-fun res!1007284 () Bool)

(assert (=> b!1482031 (=> (not res!1007284) (not e!831118))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482031 (= res!1007284 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482032 () Bool)

(declare-fun res!1007292 () Bool)

(assert (=> b!1482032 (=> (not res!1007292) (not e!831122))))

(assert (=> b!1482032 (= res!1007292 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48537 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48537 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48537 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482033 () Bool)

(declare-fun e!831119 () Bool)

(declare-fun e!831121 () Bool)

(assert (=> b!1482033 (= e!831119 e!831121)))

(declare-fun res!1007283 () Bool)

(assert (=> b!1482033 (=> (not res!1007283) (not e!831121))))

(declare-fun lt!646950 () SeekEntryResult!12227)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99419 (_ BitVec 32)) SeekEntryResult!12227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482033 (= res!1007283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47987 a!2862) j!93) mask!2687) (select (arr!47987 a!2862) j!93) a!2862 mask!2687) lt!646950))))

(assert (=> b!1482033 (= lt!646950 (Intermediate!12227 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482034 () Bool)

(declare-fun res!1007289 () Bool)

(assert (=> b!1482034 (=> (not res!1007289) (not e!831121))))

(assert (=> b!1482034 (= res!1007289 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47987 a!2862) j!93) a!2862 mask!2687) lt!646950))))

(declare-fun b!1482035 () Bool)

(declare-fun res!1007290 () Bool)

(assert (=> b!1482035 (=> (not res!1007290) (not e!831122))))

(declare-datatypes ((List!34488 0))(
  ( (Nil!34485) (Cons!34484 (h!35855 (_ BitVec 64)) (t!49182 List!34488)) )
))
(declare-fun arrayNoDuplicates!0 (array!99419 (_ BitVec 32) List!34488) Bool)

(assert (=> b!1482035 (= res!1007290 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34485))))

(declare-fun b!1482036 () Bool)

(assert (=> b!1482036 (= e!831122 e!831119)))

(declare-fun res!1007286 () Bool)

(assert (=> b!1482036 (=> (not res!1007286) (not e!831119))))

(assert (=> b!1482036 (= res!1007286 (= (select (store (arr!47987 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646952 () array!99419)

(assert (=> b!1482036 (= lt!646952 (array!99420 (store (arr!47987 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48537 a!2862)))))

(declare-fun b!1482037 () Bool)

(assert (=> b!1482037 (= e!831121 e!831118)))

(declare-fun res!1007285 () Bool)

(assert (=> b!1482037 (=> (not res!1007285) (not e!831118))))

(declare-fun lt!646953 () SeekEntryResult!12227)

(assert (=> b!1482037 (= res!1007285 (= lt!646953 (Intermediate!12227 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646949 () (_ BitVec 64))

(assert (=> b!1482037 (= lt!646953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646949 mask!2687) lt!646949 lt!646952 mask!2687))))

(assert (=> b!1482037 (= lt!646949 (select (store (arr!47987 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482038 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99419 (_ BitVec 32)) SeekEntryResult!12227)

(assert (=> b!1482038 (= e!831117 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646949 lt!646952 mask!2687) (seekEntryOrOpen!0 lt!646949 lt!646952 mask!2687)))))

(declare-fun b!1482039 () Bool)

(declare-fun res!1007287 () Bool)

(assert (=> b!1482039 (=> (not res!1007287) (not e!831122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482039 (= res!1007287 (validKeyInArray!0 (select (arr!47987 a!2862) j!93)))))

(declare-fun b!1482040 () Bool)

(declare-fun res!1007296 () Bool)

(assert (=> b!1482040 (=> (not res!1007296) (not e!831122))))

(assert (=> b!1482040 (= res!1007296 (validKeyInArray!0 (select (arr!47987 a!2862) i!1006)))))

(declare-fun b!1482041 () Bool)

(assert (=> b!1482041 (= e!831117 (= lt!646953 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646949 lt!646952 mask!2687)))))

(declare-fun b!1482042 () Bool)

(assert (=> b!1482042 (= e!831118 (not true))))

(assert (=> b!1482042 e!831120))

(declare-fun res!1007294 () Bool)

(assert (=> b!1482042 (=> (not res!1007294) (not e!831120))))

(assert (=> b!1482042 (= res!1007294 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49794 0))(
  ( (Unit!49795) )
))
(declare-fun lt!646951 () Unit!49794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49794)

(assert (=> b!1482042 (= lt!646951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126400 res!1007282) b!1482026))

(assert (= (and b!1482026 res!1007295) b!1482040))

(assert (= (and b!1482040 res!1007296) b!1482039))

(assert (= (and b!1482039 res!1007287) b!1482027))

(assert (= (and b!1482027 res!1007288) b!1482035))

(assert (= (and b!1482035 res!1007290) b!1482032))

(assert (= (and b!1482032 res!1007292) b!1482036))

(assert (= (and b!1482036 res!1007286) b!1482033))

(assert (= (and b!1482033 res!1007283) b!1482034))

(assert (= (and b!1482034 res!1007289) b!1482037))

(assert (= (and b!1482037 res!1007285) b!1482030))

(assert (= (and b!1482030 c!136893) b!1482041))

(assert (= (and b!1482030 (not c!136893)) b!1482038))

(assert (= (and b!1482030 res!1007293) b!1482031))

(assert (= (and b!1482031 res!1007284) b!1482042))

(assert (= (and b!1482042 res!1007294) b!1482028))

(assert (= (and b!1482028 res!1007291) b!1482029))

(declare-fun m!1367755 () Bool)

(assert (=> b!1482033 m!1367755))

(assert (=> b!1482033 m!1367755))

(declare-fun m!1367757 () Bool)

(assert (=> b!1482033 m!1367757))

(assert (=> b!1482033 m!1367757))

(assert (=> b!1482033 m!1367755))

(declare-fun m!1367759 () Bool)

(assert (=> b!1482033 m!1367759))

(assert (=> b!1482028 m!1367755))

(assert (=> b!1482028 m!1367755))

(declare-fun m!1367761 () Bool)

(assert (=> b!1482028 m!1367761))

(declare-fun m!1367763 () Bool)

(assert (=> b!1482040 m!1367763))

(assert (=> b!1482040 m!1367763))

(declare-fun m!1367765 () Bool)

(assert (=> b!1482040 m!1367765))

(declare-fun m!1367767 () Bool)

(assert (=> b!1482027 m!1367767))

(declare-fun m!1367769 () Bool)

(assert (=> b!1482041 m!1367769))

(declare-fun m!1367771 () Bool)

(assert (=> b!1482029 m!1367771))

(declare-fun m!1367773 () Bool)

(assert (=> b!1482029 m!1367773))

(declare-fun m!1367775 () Bool)

(assert (=> b!1482029 m!1367775))

(declare-fun m!1367777 () Bool)

(assert (=> b!1482029 m!1367777))

(assert (=> b!1482029 m!1367755))

(declare-fun m!1367779 () Bool)

(assert (=> b!1482038 m!1367779))

(declare-fun m!1367781 () Bool)

(assert (=> b!1482038 m!1367781))

(declare-fun m!1367783 () Bool)

(assert (=> b!1482042 m!1367783))

(declare-fun m!1367785 () Bool)

(assert (=> b!1482042 m!1367785))

(declare-fun m!1367787 () Bool)

(assert (=> b!1482035 m!1367787))

(assert (=> b!1482036 m!1367771))

(declare-fun m!1367789 () Bool)

(assert (=> b!1482036 m!1367789))

(declare-fun m!1367791 () Bool)

(assert (=> start!126400 m!1367791))

(declare-fun m!1367793 () Bool)

(assert (=> start!126400 m!1367793))

(assert (=> b!1482039 m!1367755))

(assert (=> b!1482039 m!1367755))

(declare-fun m!1367795 () Bool)

(assert (=> b!1482039 m!1367795))

(assert (=> b!1482034 m!1367755))

(assert (=> b!1482034 m!1367755))

(declare-fun m!1367797 () Bool)

(assert (=> b!1482034 m!1367797))

(declare-fun m!1367799 () Bool)

(assert (=> b!1482037 m!1367799))

(assert (=> b!1482037 m!1367799))

(declare-fun m!1367801 () Bool)

(assert (=> b!1482037 m!1367801))

(assert (=> b!1482037 m!1367771))

(declare-fun m!1367803 () Bool)

(assert (=> b!1482037 m!1367803))

(push 1)

