; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126140 () Bool)

(assert start!126140)

(declare-fun b!1476760 () Bool)

(declare-fun res!1002974 () Bool)

(declare-fun e!828511 () Bool)

(assert (=> b!1476760 (=> (not res!1002974) (not e!828511))))

(declare-datatypes ((array!99246 0))(
  ( (array!99247 (arr!47902 (Array (_ BitVec 32) (_ BitVec 64))) (size!48452 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99246)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99246 (_ BitVec 32)) Bool)

(assert (=> b!1476760 (= res!1002974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476761 () Bool)

(declare-fun e!828505 () Bool)

(declare-fun e!828508 () Bool)

(assert (=> b!1476761 (= e!828505 e!828508)))

(declare-fun res!1002967 () Bool)

(assert (=> b!1476761 (=> (not res!1002967) (not e!828508))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12142 0))(
  ( (MissingZero!12142 (index!50960 (_ BitVec 32))) (Found!12142 (index!50961 (_ BitVec 32))) (Intermediate!12142 (undefined!12954 Bool) (index!50962 (_ BitVec 32)) (x!132557 (_ BitVec 32))) (Undefined!12142) (MissingVacant!12142 (index!50963 (_ BitVec 32))) )
))
(declare-fun lt!645123 () SeekEntryResult!12142)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99246 (_ BitVec 32)) SeekEntryResult!12142)

(assert (=> b!1476761 (= res!1002967 (= lt!645123 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47902 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476762 () Bool)

(declare-fun e!828507 () Bool)

(assert (=> b!1476762 (= e!828511 e!828507)))

(declare-fun res!1002976 () Bool)

(assert (=> b!1476762 (=> (not res!1002976) (not e!828507))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476762 (= res!1002976 (= (select (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645125 () array!99246)

(assert (=> b!1476762 (= lt!645125 (array!99247 (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48452 a!2862)))))

(declare-fun b!1476763 () Bool)

(declare-fun e!828509 () Bool)

(assert (=> b!1476763 (= e!828509 e!828505)))

(declare-fun res!1002966 () Bool)

(assert (=> b!1476763 (=> res!1002966 e!828505)))

(assert (=> b!1476763 (= res!1002966 (or (and (= (select (arr!47902 a!2862) index!646) (select (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47902 a!2862) index!646) (select (arr!47902 a!2862) j!93))) (not (= (select (arr!47902 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476764 () Bool)

(declare-fun res!1002969 () Bool)

(declare-fun e!828512 () Bool)

(assert (=> b!1476764 (=> (not res!1002969) (not e!828512))))

(declare-fun e!828504 () Bool)

(assert (=> b!1476764 (= res!1002969 e!828504)))

(declare-fun c!136419 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476764 (= c!136419 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1476765 () Bool)

(assert (=> b!1476765 (= e!828508 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476766 () Bool)

(assert (=> b!1476766 (= e!828512 (not true))))

(assert (=> b!1476766 e!828509))

(declare-fun res!1002963 () Bool)

(assert (=> b!1476766 (=> (not res!1002963) (not e!828509))))

(assert (=> b!1476766 (= res!1002963 (and (= lt!645123 (Found!12142 j!93)) (or (= (select (arr!47902 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47902 a!2862) intermediateBeforeIndex!19) (select (arr!47902 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99246 (_ BitVec 32)) SeekEntryResult!12142)

(assert (=> b!1476766 (= lt!645123 (seekEntryOrOpen!0 (select (arr!47902 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476766 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49624 0))(
  ( (Unit!49625) )
))
(declare-fun lt!645124 () Unit!49624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49624)

(assert (=> b!1476766 (= lt!645124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!645122 () (_ BitVec 64))

(declare-fun b!1476767 () Bool)

(assert (=> b!1476767 (= e!828504 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645122 lt!645125 mask!2687) (seekEntryOrOpen!0 lt!645122 lt!645125 mask!2687)))))

(declare-fun res!1002965 () Bool)

(assert (=> start!126140 (=> (not res!1002965) (not e!828511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126140 (= res!1002965 (validMask!0 mask!2687))))

(assert (=> start!126140 e!828511))

(assert (=> start!126140 true))

(declare-fun array_inv!36930 (array!99246) Bool)

(assert (=> start!126140 (array_inv!36930 a!2862)))

(declare-fun b!1476768 () Bool)

(declare-fun res!1002971 () Bool)

(assert (=> b!1476768 (=> (not res!1002971) (not e!828511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476768 (= res!1002971 (validKeyInArray!0 (select (arr!47902 a!2862) j!93)))))

(declare-fun b!1476769 () Bool)

(declare-fun e!828510 () Bool)

(assert (=> b!1476769 (= e!828510 e!828512)))

(declare-fun res!1002972 () Bool)

(assert (=> b!1476769 (=> (not res!1002972) (not e!828512))))

(declare-fun lt!645126 () SeekEntryResult!12142)

(assert (=> b!1476769 (= res!1002972 (= lt!645126 (Intermediate!12142 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99246 (_ BitVec 32)) SeekEntryResult!12142)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476769 (= lt!645126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645122 mask!2687) lt!645122 lt!645125 mask!2687))))

(assert (=> b!1476769 (= lt!645122 (select (store (arr!47902 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476770 () Bool)

(declare-fun res!1002970 () Bool)

(assert (=> b!1476770 (=> (not res!1002970) (not e!828511))))

(assert (=> b!1476770 (= res!1002970 (and (= (size!48452 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48452 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48452 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476771 () Bool)

(declare-fun res!1002962 () Bool)

(assert (=> b!1476771 (=> (not res!1002962) (not e!828511))))

(assert (=> b!1476771 (= res!1002962 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48452 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48452 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48452 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476772 () Bool)

(assert (=> b!1476772 (= e!828504 (= lt!645126 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645122 lt!645125 mask!2687)))))

(declare-fun b!1476773 () Bool)

(assert (=> b!1476773 (= e!828507 e!828510)))

(declare-fun res!1002961 () Bool)

(assert (=> b!1476773 (=> (not res!1002961) (not e!828510))))

(declare-fun lt!645121 () SeekEntryResult!12142)

(assert (=> b!1476773 (= res!1002961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47902 a!2862) j!93) mask!2687) (select (arr!47902 a!2862) j!93) a!2862 mask!2687) lt!645121))))

(assert (=> b!1476773 (= lt!645121 (Intermediate!12142 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476774 () Bool)

(declare-fun res!1002973 () Bool)

(assert (=> b!1476774 (=> (not res!1002973) (not e!828510))))

(assert (=> b!1476774 (= res!1002973 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47902 a!2862) j!93) a!2862 mask!2687) lt!645121))))

(declare-fun b!1476775 () Bool)

(declare-fun res!1002975 () Bool)

(assert (=> b!1476775 (=> (not res!1002975) (not e!828512))))

(assert (=> b!1476775 (= res!1002975 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476776 () Bool)

(declare-fun res!1002968 () Bool)

(assert (=> b!1476776 (=> (not res!1002968) (not e!828511))))

(assert (=> b!1476776 (= res!1002968 (validKeyInArray!0 (select (arr!47902 a!2862) i!1006)))))

(declare-fun b!1476777 () Bool)

(declare-fun res!1002964 () Bool)

(assert (=> b!1476777 (=> (not res!1002964) (not e!828511))))

(declare-datatypes ((List!34403 0))(
  ( (Nil!34400) (Cons!34399 (h!35767 (_ BitVec 64)) (t!49097 List!34403)) )
))
(declare-fun arrayNoDuplicates!0 (array!99246 (_ BitVec 32) List!34403) Bool)

(assert (=> b!1476777 (= res!1002964 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34400))))

(assert (= (and start!126140 res!1002965) b!1476770))

(assert (= (and b!1476770 res!1002970) b!1476776))

(assert (= (and b!1476776 res!1002968) b!1476768))

(assert (= (and b!1476768 res!1002971) b!1476760))

(assert (= (and b!1476760 res!1002974) b!1476777))

(assert (= (and b!1476777 res!1002964) b!1476771))

(assert (= (and b!1476771 res!1002962) b!1476762))

(assert (= (and b!1476762 res!1002976) b!1476773))

(assert (= (and b!1476773 res!1002961) b!1476774))

(assert (= (and b!1476774 res!1002973) b!1476769))

(assert (= (and b!1476769 res!1002972) b!1476764))

(assert (= (and b!1476764 c!136419) b!1476772))

(assert (= (and b!1476764 (not c!136419)) b!1476767))

(assert (= (and b!1476764 res!1002969) b!1476775))

(assert (= (and b!1476775 res!1002975) b!1476766))

(assert (= (and b!1476766 res!1002963) b!1476763))

(assert (= (and b!1476763 (not res!1002966)) b!1476761))

(assert (= (and b!1476761 res!1002967) b!1476765))

(declare-fun m!1362735 () Bool)

(assert (=> b!1476767 m!1362735))

(declare-fun m!1362737 () Bool)

(assert (=> b!1476767 m!1362737))

(declare-fun m!1362739 () Bool)

(assert (=> b!1476776 m!1362739))

(assert (=> b!1476776 m!1362739))

(declare-fun m!1362741 () Bool)

(assert (=> b!1476776 m!1362741))

(declare-fun m!1362743 () Bool)

(assert (=> b!1476777 m!1362743))

(declare-fun m!1362745 () Bool)

(assert (=> b!1476774 m!1362745))

(assert (=> b!1476774 m!1362745))

(declare-fun m!1362747 () Bool)

(assert (=> b!1476774 m!1362747))

(declare-fun m!1362749 () Bool)

(assert (=> b!1476766 m!1362749))

(declare-fun m!1362751 () Bool)

(assert (=> b!1476766 m!1362751))

(assert (=> b!1476766 m!1362745))

(declare-fun m!1362753 () Bool)

(assert (=> b!1476766 m!1362753))

(declare-fun m!1362755 () Bool)

(assert (=> b!1476766 m!1362755))

(assert (=> b!1476766 m!1362745))

(declare-fun m!1362757 () Bool)

(assert (=> b!1476772 m!1362757))

(assert (=> b!1476761 m!1362745))

(assert (=> b!1476761 m!1362745))

(declare-fun m!1362759 () Bool)

(assert (=> b!1476761 m!1362759))

(assert (=> b!1476773 m!1362745))

(assert (=> b!1476773 m!1362745))

(declare-fun m!1362761 () Bool)

(assert (=> b!1476773 m!1362761))

(assert (=> b!1476773 m!1362761))

(assert (=> b!1476773 m!1362745))

(declare-fun m!1362763 () Bool)

(assert (=> b!1476773 m!1362763))

(declare-fun m!1362765 () Bool)

(assert (=> b!1476763 m!1362765))

(declare-fun m!1362767 () Bool)

(assert (=> b!1476763 m!1362767))

(declare-fun m!1362769 () Bool)

(assert (=> b!1476763 m!1362769))

(assert (=> b!1476763 m!1362745))

(assert (=> b!1476768 m!1362745))

(assert (=> b!1476768 m!1362745))

(declare-fun m!1362771 () Bool)

(assert (=> b!1476768 m!1362771))

(assert (=> b!1476762 m!1362767))

(declare-fun m!1362773 () Bool)

(assert (=> b!1476762 m!1362773))

(declare-fun m!1362775 () Bool)

(assert (=> start!126140 m!1362775))

(declare-fun m!1362777 () Bool)

(assert (=> start!126140 m!1362777))

(declare-fun m!1362779 () Bool)

(assert (=> b!1476769 m!1362779))

(assert (=> b!1476769 m!1362779))

(declare-fun m!1362781 () Bool)

(assert (=> b!1476769 m!1362781))

(assert (=> b!1476769 m!1362767))

(declare-fun m!1362783 () Bool)

(assert (=> b!1476769 m!1362783))

(declare-fun m!1362785 () Bool)

(assert (=> b!1476760 m!1362785))

(push 1)

