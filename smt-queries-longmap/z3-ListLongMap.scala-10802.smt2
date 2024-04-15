; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126350 () Bool)

(assert start!126350)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1481657 () Bool)

(declare-fun e!830893 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99367 0))(
  ( (array!99368 (arr!47962 (Array (_ BitVec 32) (_ BitVec 64))) (size!48514 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99367)

(assert (=> b!1481657 (= e!830893 (and (or (= (select (arr!47962 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47962 a!2862) intermediateBeforeIndex!19) (select (arr!47962 a!2862) j!93))) (or (and (= (select (arr!47962 a!2862) index!646) (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47962 a!2862) index!646) (select (arr!47962 a!2862) j!93))) (= (select (arr!47962 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481658 () Bool)

(declare-fun res!1007140 () Bool)

(declare-fun e!830892 () Bool)

(assert (=> b!1481658 (=> (not res!1007140) (not e!830892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481658 (= res!1007140 (validKeyInArray!0 (select (arr!47962 a!2862) j!93)))))

(declare-fun b!1481659 () Bool)

(declare-fun res!1007138 () Bool)

(declare-fun e!830890 () Bool)

(assert (=> b!1481659 (=> (not res!1007138) (not e!830890))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481659 (= res!1007138 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481660 () Bool)

(declare-fun e!830894 () Bool)

(declare-fun e!830891 () Bool)

(assert (=> b!1481660 (= e!830894 e!830891)))

(declare-fun res!1007147 () Bool)

(assert (=> b!1481660 (=> (not res!1007147) (not e!830891))))

(declare-datatypes ((SeekEntryResult!12227 0))(
  ( (MissingZero!12227 (index!51300 (_ BitVec 32))) (Found!12227 (index!51301 (_ BitVec 32))) (Intermediate!12227 (undefined!13039 Bool) (index!51302 (_ BitVec 32)) (x!132879 (_ BitVec 32))) (Undefined!12227) (MissingVacant!12227 (index!51303 (_ BitVec 32))) )
))
(declare-fun lt!646649 () SeekEntryResult!12227)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99367 (_ BitVec 32)) SeekEntryResult!12227)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481660 (= res!1007147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47962 a!2862) j!93) mask!2687) (select (arr!47962 a!2862) j!93) a!2862 mask!2687) lt!646649))))

(assert (=> b!1481660 (= lt!646649 (Intermediate!12227 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481661 () Bool)

(assert (=> b!1481661 (= e!830890 (not true))))

(assert (=> b!1481661 e!830893))

(declare-fun res!1007149 () Bool)

(assert (=> b!1481661 (=> (not res!1007149) (not e!830893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99367 (_ BitVec 32)) Bool)

(assert (=> b!1481661 (= res!1007149 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49635 0))(
  ( (Unit!49636) )
))
(declare-fun lt!646645 () Unit!49635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49635)

(assert (=> b!1481661 (= lt!646645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481662 () Bool)

(declare-fun res!1007144 () Bool)

(assert (=> b!1481662 (=> (not res!1007144) (not e!830893))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99367 (_ BitVec 32)) SeekEntryResult!12227)

(assert (=> b!1481662 (= res!1007144 (= (seekEntryOrOpen!0 (select (arr!47962 a!2862) j!93) a!2862 mask!2687) (Found!12227 j!93)))))

(declare-fun b!1481663 () Bool)

(declare-fun res!1007139 () Bool)

(assert (=> b!1481663 (=> (not res!1007139) (not e!830892))))

(assert (=> b!1481663 (= res!1007139 (and (= (size!48514 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48514 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48514 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481664 () Bool)

(declare-fun res!1007152 () Bool)

(assert (=> b!1481664 (=> (not res!1007152) (not e!830890))))

(declare-fun e!830888 () Bool)

(assert (=> b!1481664 (= res!1007152 e!830888)))

(declare-fun c!136783 () Bool)

(assert (=> b!1481664 (= c!136783 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481666 () Bool)

(declare-fun res!1007150 () Bool)

(assert (=> b!1481666 (=> (not res!1007150) (not e!830892))))

(assert (=> b!1481666 (= res!1007150 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48514 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48514 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48514 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481667 () Bool)

(assert (=> b!1481667 (= e!830892 e!830894)))

(declare-fun res!1007145 () Bool)

(assert (=> b!1481667 (=> (not res!1007145) (not e!830894))))

(assert (=> b!1481667 (= res!1007145 (= (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646648 () array!99367)

(assert (=> b!1481667 (= lt!646648 (array!99368 (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48514 a!2862)))))

(declare-fun b!1481668 () Bool)

(declare-fun res!1007148 () Bool)

(assert (=> b!1481668 (=> (not res!1007148) (not e!830892))))

(assert (=> b!1481668 (= res!1007148 (validKeyInArray!0 (select (arr!47962 a!2862) i!1006)))))

(declare-fun b!1481669 () Bool)

(assert (=> b!1481669 (= e!830891 e!830890)))

(declare-fun res!1007146 () Bool)

(assert (=> b!1481669 (=> (not res!1007146) (not e!830890))))

(declare-fun lt!646646 () SeekEntryResult!12227)

(assert (=> b!1481669 (= res!1007146 (= lt!646646 (Intermediate!12227 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646647 () (_ BitVec 64))

(assert (=> b!1481669 (= lt!646646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646647 mask!2687) lt!646647 lt!646648 mask!2687))))

(assert (=> b!1481669 (= lt!646647 (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481670 () Bool)

(assert (=> b!1481670 (= e!830888 (= lt!646646 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646647 lt!646648 mask!2687)))))

(declare-fun b!1481671 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99367 (_ BitVec 32)) SeekEntryResult!12227)

(assert (=> b!1481671 (= e!830888 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646647 lt!646648 mask!2687) (seekEntryOrOpen!0 lt!646647 lt!646648 mask!2687)))))

(declare-fun b!1481672 () Bool)

(declare-fun res!1007142 () Bool)

(assert (=> b!1481672 (=> (not res!1007142) (not e!830891))))

(assert (=> b!1481672 (= res!1007142 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47962 a!2862) j!93) a!2862 mask!2687) lt!646649))))

(declare-fun b!1481673 () Bool)

(declare-fun res!1007151 () Bool)

(assert (=> b!1481673 (=> (not res!1007151) (not e!830892))))

(assert (=> b!1481673 (= res!1007151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1007143 () Bool)

(assert (=> start!126350 (=> (not res!1007143) (not e!830892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126350 (= res!1007143 (validMask!0 mask!2687))))

(assert (=> start!126350 e!830892))

(assert (=> start!126350 true))

(declare-fun array_inv!37195 (array!99367) Bool)

(assert (=> start!126350 (array_inv!37195 a!2862)))

(declare-fun b!1481665 () Bool)

(declare-fun res!1007141 () Bool)

(assert (=> b!1481665 (=> (not res!1007141) (not e!830892))))

(declare-datatypes ((List!34541 0))(
  ( (Nil!34538) (Cons!34537 (h!35908 (_ BitVec 64)) (t!49227 List!34541)) )
))
(declare-fun arrayNoDuplicates!0 (array!99367 (_ BitVec 32) List!34541) Bool)

(assert (=> b!1481665 (= res!1007141 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34538))))

(assert (= (and start!126350 res!1007143) b!1481663))

(assert (= (and b!1481663 res!1007139) b!1481668))

(assert (= (and b!1481668 res!1007148) b!1481658))

(assert (= (and b!1481658 res!1007140) b!1481673))

(assert (= (and b!1481673 res!1007151) b!1481665))

(assert (= (and b!1481665 res!1007141) b!1481666))

(assert (= (and b!1481666 res!1007150) b!1481667))

(assert (= (and b!1481667 res!1007145) b!1481660))

(assert (= (and b!1481660 res!1007147) b!1481672))

(assert (= (and b!1481672 res!1007142) b!1481669))

(assert (= (and b!1481669 res!1007146) b!1481664))

(assert (= (and b!1481664 c!136783) b!1481670))

(assert (= (and b!1481664 (not c!136783)) b!1481671))

(assert (= (and b!1481664 res!1007152) b!1481659))

(assert (= (and b!1481659 res!1007138) b!1481661))

(assert (= (and b!1481661 res!1007149) b!1481662))

(assert (= (and b!1481662 res!1007144) b!1481657))

(declare-fun m!1366851 () Bool)

(assert (=> b!1481668 m!1366851))

(assert (=> b!1481668 m!1366851))

(declare-fun m!1366853 () Bool)

(assert (=> b!1481668 m!1366853))

(declare-fun m!1366855 () Bool)

(assert (=> b!1481673 m!1366855))

(declare-fun m!1366857 () Bool)

(assert (=> b!1481669 m!1366857))

(assert (=> b!1481669 m!1366857))

(declare-fun m!1366859 () Bool)

(assert (=> b!1481669 m!1366859))

(declare-fun m!1366861 () Bool)

(assert (=> b!1481669 m!1366861))

(declare-fun m!1366863 () Bool)

(assert (=> b!1481669 m!1366863))

(declare-fun m!1366865 () Bool)

(assert (=> b!1481671 m!1366865))

(declare-fun m!1366867 () Bool)

(assert (=> b!1481671 m!1366867))

(declare-fun m!1366869 () Bool)

(assert (=> b!1481665 m!1366869))

(declare-fun m!1366871 () Bool)

(assert (=> b!1481672 m!1366871))

(assert (=> b!1481672 m!1366871))

(declare-fun m!1366873 () Bool)

(assert (=> b!1481672 m!1366873))

(assert (=> b!1481658 m!1366871))

(assert (=> b!1481658 m!1366871))

(declare-fun m!1366875 () Bool)

(assert (=> b!1481658 m!1366875))

(declare-fun m!1366877 () Bool)

(assert (=> start!126350 m!1366877))

(declare-fun m!1366879 () Bool)

(assert (=> start!126350 m!1366879))

(assert (=> b!1481657 m!1366861))

(declare-fun m!1366881 () Bool)

(assert (=> b!1481657 m!1366881))

(declare-fun m!1366883 () Bool)

(assert (=> b!1481657 m!1366883))

(declare-fun m!1366885 () Bool)

(assert (=> b!1481657 m!1366885))

(assert (=> b!1481657 m!1366871))

(declare-fun m!1366887 () Bool)

(assert (=> b!1481670 m!1366887))

(assert (=> b!1481660 m!1366871))

(assert (=> b!1481660 m!1366871))

(declare-fun m!1366889 () Bool)

(assert (=> b!1481660 m!1366889))

(assert (=> b!1481660 m!1366889))

(assert (=> b!1481660 m!1366871))

(declare-fun m!1366891 () Bool)

(assert (=> b!1481660 m!1366891))

(declare-fun m!1366893 () Bool)

(assert (=> b!1481661 m!1366893))

(declare-fun m!1366895 () Bool)

(assert (=> b!1481661 m!1366895))

(assert (=> b!1481662 m!1366871))

(assert (=> b!1481662 m!1366871))

(declare-fun m!1366897 () Bool)

(assert (=> b!1481662 m!1366897))

(assert (=> b!1481667 m!1366861))

(declare-fun m!1366899 () Bool)

(assert (=> b!1481667 m!1366899))

(check-sat (not b!1481662) (not b!1481672) (not b!1481669) (not b!1481668) (not b!1481661) (not start!126350) (not b!1481671) (not b!1481660) (not b!1481658) (not b!1481670) (not b!1481673) (not b!1481665))
(check-sat)
