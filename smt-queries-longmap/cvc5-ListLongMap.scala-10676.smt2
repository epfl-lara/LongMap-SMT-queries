; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125194 () Bool)

(assert start!125194)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639697 () (_ BitVec 64))

(declare-fun e!821010 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98642 0))(
  ( (array!98643 (arr!47609 (Array (_ BitVec 32) (_ BitVec 64))) (size!48159 (_ BitVec 32))) )
))
(declare-fun lt!639698 () array!98642)

(declare-datatypes ((SeekEntryResult!11861 0))(
  ( (MissingZero!11861 (index!49836 (_ BitVec 32))) (Found!11861 (index!49837 (_ BitVec 32))) (Intermediate!11861 (undefined!12673 Bool) (index!49838 (_ BitVec 32)) (x!131446 (_ BitVec 32))) (Undefined!11861) (MissingVacant!11861 (index!49839 (_ BitVec 32))) )
))
(declare-fun lt!639699 () SeekEntryResult!11861)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1460048 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98642 (_ BitVec 32)) SeekEntryResult!11861)

(assert (=> b!1460048 (= e!821010 (= lt!639699 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639697 lt!639698 mask!2687)))))

(declare-fun b!1460049 () Bool)

(declare-fun e!821014 () Bool)

(declare-fun e!821017 () Bool)

(assert (=> b!1460049 (= e!821014 e!821017)))

(declare-fun res!989889 () Bool)

(assert (=> b!1460049 (=> res!989889 e!821017)))

(declare-fun lt!639692 () (_ BitVec 32))

(declare-fun a!2862 () array!98642)

(assert (=> b!1460049 (= res!989889 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639692 #b00000000000000000000000000000000) (bvsge lt!639692 (size!48159 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460049 (= lt!639692 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639694 () SeekEntryResult!11861)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98642 (_ BitVec 32)) SeekEntryResult!11861)

(assert (=> b!1460049 (= lt!639694 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639697 lt!639698 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98642 (_ BitVec 32)) SeekEntryResult!11861)

(assert (=> b!1460049 (= lt!639694 (seekEntryOrOpen!0 lt!639697 lt!639698 mask!2687))))

(declare-fun b!1460050 () Bool)

(declare-fun e!821009 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460050 (= e!821009 (validKeyInArray!0 lt!639697))))

(declare-fun b!1460051 () Bool)

(declare-fun e!821015 () Bool)

(assert (=> b!1460051 (= e!821015 (not e!821014))))

(declare-fun res!989886 () Bool)

(assert (=> b!1460051 (=> res!989886 e!821014)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460051 (= res!989886 (or (and (= (select (arr!47609 a!2862) index!646) (select (store (arr!47609 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47609 a!2862) index!646) (select (arr!47609 a!2862) j!93))) (= (select (arr!47609 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!639693 () SeekEntryResult!11861)

(assert (=> b!1460051 (and (= lt!639693 (Found!11861 j!93)) (or (= (select (arr!47609 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47609 a!2862) intermediateBeforeIndex!19) (select (arr!47609 a!2862) j!93))) (let ((bdg!53561 (select (store (arr!47609 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47609 a!2862) index!646) bdg!53561) (= (select (arr!47609 a!2862) index!646) (select (arr!47609 a!2862) j!93))) (= (select (arr!47609 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53561 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1460051 (= lt!639693 (seekEntryOrOpen!0 (select (arr!47609 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98642 (_ BitVec 32)) Bool)

(assert (=> b!1460051 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49218 0))(
  ( (Unit!49219) )
))
(declare-fun lt!639696 () Unit!49218)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49218)

(assert (=> b!1460051 (= lt!639696 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460052 () Bool)

(declare-fun res!989878 () Bool)

(assert (=> b!1460052 (=> (not res!989878) (not e!821015))))

(assert (=> b!1460052 (= res!989878 e!821010)))

(declare-fun c!134597 () Bool)

(assert (=> b!1460052 (= c!134597 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460053 () Bool)

(assert (=> b!1460053 (= e!821010 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639697 lt!639698 mask!2687) (seekEntryOrOpen!0 lt!639697 lt!639698 mask!2687)))))

(declare-fun b!1460054 () Bool)

(assert (=> b!1460054 (= e!821017 e!821009)))

(declare-fun res!989887 () Bool)

(assert (=> b!1460054 (=> res!989887 e!821009)))

(assert (=> b!1460054 (= res!989887 (bvslt mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1460054 (= lt!639693 lt!639694)))

(declare-fun lt!639691 () Unit!49218)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49218)

(assert (=> b!1460054 (= lt!639691 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639692 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun res!989881 () Bool)

(declare-fun e!821011 () Bool)

(assert (=> start!125194 (=> (not res!989881) (not e!821011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125194 (= res!989881 (validMask!0 mask!2687))))

(assert (=> start!125194 e!821011))

(assert (=> start!125194 true))

(declare-fun array_inv!36637 (array!98642) Bool)

(assert (=> start!125194 (array_inv!36637 a!2862)))

(declare-fun b!1460055 () Bool)

(declare-fun e!821016 () Bool)

(declare-fun e!821013 () Bool)

(assert (=> b!1460055 (= e!821016 e!821013)))

(declare-fun res!989890 () Bool)

(assert (=> b!1460055 (=> (not res!989890) (not e!821013))))

(declare-fun lt!639695 () SeekEntryResult!11861)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460055 (= res!989890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47609 a!2862) j!93) mask!2687) (select (arr!47609 a!2862) j!93) a!2862 mask!2687) lt!639695))))

(assert (=> b!1460055 (= lt!639695 (Intermediate!11861 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460056 () Bool)

(declare-fun res!989879 () Bool)

(assert (=> b!1460056 (=> (not res!989879) (not e!821011))))

(assert (=> b!1460056 (= res!989879 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48159 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48159 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48159 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460057 () Bool)

(declare-fun res!989875 () Bool)

(assert (=> b!1460057 (=> (not res!989875) (not e!821015))))

(assert (=> b!1460057 (= res!989875 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460058 () Bool)

(assert (=> b!1460058 (= e!821013 e!821015)))

(declare-fun res!989876 () Bool)

(assert (=> b!1460058 (=> (not res!989876) (not e!821015))))

(assert (=> b!1460058 (= res!989876 (= lt!639699 (Intermediate!11861 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460058 (= lt!639699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639697 mask!2687) lt!639697 lt!639698 mask!2687))))

(assert (=> b!1460058 (= lt!639697 (select (store (arr!47609 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460059 () Bool)

(declare-fun res!989883 () Bool)

(assert (=> b!1460059 (=> res!989883 e!821017)))

(declare-fun e!821012 () Bool)

(assert (=> b!1460059 (= res!989883 e!821012)))

(declare-fun c!134598 () Bool)

(assert (=> b!1460059 (= c!134598 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460060 () Bool)

(declare-fun res!989893 () Bool)

(assert (=> b!1460060 (=> (not res!989893) (not e!821011))))

(assert (=> b!1460060 (= res!989893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460061 () Bool)

(assert (=> b!1460061 (= e!821011 e!821016)))

(declare-fun res!989888 () Bool)

(assert (=> b!1460061 (=> (not res!989888) (not e!821016))))

(assert (=> b!1460061 (= res!989888 (= (select (store (arr!47609 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460061 (= lt!639698 (array!98643 (store (arr!47609 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48159 a!2862)))))

(declare-fun b!1460062 () Bool)

(declare-fun res!989884 () Bool)

(assert (=> b!1460062 (=> (not res!989884) (not e!821011))))

(assert (=> b!1460062 (= res!989884 (validKeyInArray!0 (select (arr!47609 a!2862) j!93)))))

(declare-fun b!1460063 () Bool)

(assert (=> b!1460063 (= e!821012 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639692 intermediateAfterIndex!19 lt!639697 lt!639698 mask!2687) lt!639694)))))

(declare-fun b!1460064 () Bool)

(declare-fun res!989885 () Bool)

(assert (=> b!1460064 (=> res!989885 e!821017)))

(assert (=> b!1460064 (= res!989885 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1460065 () Bool)

(declare-fun res!989892 () Bool)

(assert (=> b!1460065 (=> (not res!989892) (not e!821011))))

(assert (=> b!1460065 (= res!989892 (validKeyInArray!0 (select (arr!47609 a!2862) i!1006)))))

(declare-fun b!1460066 () Bool)

(declare-fun res!989891 () Bool)

(assert (=> b!1460066 (=> res!989891 e!821017)))

(assert (=> b!1460066 (= res!989891 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639692 (select (arr!47609 a!2862) j!93) a!2862 mask!2687) lt!639695)))))

(declare-fun b!1460067 () Bool)

(assert (=> b!1460067 (= e!821012 (not (= lt!639699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639692 lt!639697 lt!639698 mask!2687))))))

(declare-fun b!1460068 () Bool)

(declare-fun res!989882 () Bool)

(assert (=> b!1460068 (=> (not res!989882) (not e!821013))))

(assert (=> b!1460068 (= res!989882 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47609 a!2862) j!93) a!2862 mask!2687) lt!639695))))

(declare-fun b!1460069 () Bool)

(declare-fun res!989880 () Bool)

(assert (=> b!1460069 (=> (not res!989880) (not e!821011))))

(assert (=> b!1460069 (= res!989880 (and (= (size!48159 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48159 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48159 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460070 () Bool)

(declare-fun res!989877 () Bool)

(assert (=> b!1460070 (=> (not res!989877) (not e!821011))))

(declare-datatypes ((List!34110 0))(
  ( (Nil!34107) (Cons!34106 (h!35456 (_ BitVec 64)) (t!48804 List!34110)) )
))
(declare-fun arrayNoDuplicates!0 (array!98642 (_ BitVec 32) List!34110) Bool)

(assert (=> b!1460070 (= res!989877 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34107))))

(assert (= (and start!125194 res!989881) b!1460069))

(assert (= (and b!1460069 res!989880) b!1460065))

(assert (= (and b!1460065 res!989892) b!1460062))

(assert (= (and b!1460062 res!989884) b!1460060))

(assert (= (and b!1460060 res!989893) b!1460070))

(assert (= (and b!1460070 res!989877) b!1460056))

(assert (= (and b!1460056 res!989879) b!1460061))

(assert (= (and b!1460061 res!989888) b!1460055))

(assert (= (and b!1460055 res!989890) b!1460068))

(assert (= (and b!1460068 res!989882) b!1460058))

(assert (= (and b!1460058 res!989876) b!1460052))

(assert (= (and b!1460052 c!134597) b!1460048))

(assert (= (and b!1460052 (not c!134597)) b!1460053))

(assert (= (and b!1460052 res!989878) b!1460057))

(assert (= (and b!1460057 res!989875) b!1460051))

(assert (= (and b!1460051 (not res!989886)) b!1460049))

(assert (= (and b!1460049 (not res!989889)) b!1460066))

(assert (= (and b!1460066 (not res!989891)) b!1460059))

(assert (= (and b!1460059 c!134598) b!1460067))

(assert (= (and b!1460059 (not c!134598)) b!1460063))

(assert (= (and b!1460059 (not res!989883)) b!1460064))

(assert (= (and b!1460064 (not res!989885)) b!1460054))

(assert (= (and b!1460054 (not res!989887)) b!1460050))

(declare-fun m!1347751 () Bool)

(assert (=> b!1460048 m!1347751))

(declare-fun m!1347753 () Bool)

(assert (=> b!1460055 m!1347753))

(assert (=> b!1460055 m!1347753))

(declare-fun m!1347755 () Bool)

(assert (=> b!1460055 m!1347755))

(assert (=> b!1460055 m!1347755))

(assert (=> b!1460055 m!1347753))

(declare-fun m!1347757 () Bool)

(assert (=> b!1460055 m!1347757))

(assert (=> b!1460062 m!1347753))

(assert (=> b!1460062 m!1347753))

(declare-fun m!1347759 () Bool)

(assert (=> b!1460062 m!1347759))

(declare-fun m!1347761 () Bool)

(assert (=> b!1460050 m!1347761))

(declare-fun m!1347763 () Bool)

(assert (=> start!125194 m!1347763))

(declare-fun m!1347765 () Bool)

(assert (=> start!125194 m!1347765))

(declare-fun m!1347767 () Bool)

(assert (=> b!1460065 m!1347767))

(assert (=> b!1460065 m!1347767))

(declare-fun m!1347769 () Bool)

(assert (=> b!1460065 m!1347769))

(declare-fun m!1347771 () Bool)

(assert (=> b!1460061 m!1347771))

(declare-fun m!1347773 () Bool)

(assert (=> b!1460061 m!1347773))

(declare-fun m!1347775 () Bool)

(assert (=> b!1460053 m!1347775))

(declare-fun m!1347777 () Bool)

(assert (=> b!1460053 m!1347777))

(assert (=> b!1460068 m!1347753))

(assert (=> b!1460068 m!1347753))

(declare-fun m!1347779 () Bool)

(assert (=> b!1460068 m!1347779))

(declare-fun m!1347781 () Bool)

(assert (=> b!1460051 m!1347781))

(assert (=> b!1460051 m!1347771))

(declare-fun m!1347783 () Bool)

(assert (=> b!1460051 m!1347783))

(declare-fun m!1347785 () Bool)

(assert (=> b!1460051 m!1347785))

(declare-fun m!1347787 () Bool)

(assert (=> b!1460051 m!1347787))

(assert (=> b!1460051 m!1347753))

(declare-fun m!1347789 () Bool)

(assert (=> b!1460051 m!1347789))

(declare-fun m!1347791 () Bool)

(assert (=> b!1460051 m!1347791))

(assert (=> b!1460051 m!1347753))

(declare-fun m!1347793 () Bool)

(assert (=> b!1460054 m!1347793))

(declare-fun m!1347795 () Bool)

(assert (=> b!1460060 m!1347795))

(declare-fun m!1347797 () Bool)

(assert (=> b!1460067 m!1347797))

(declare-fun m!1347799 () Bool)

(assert (=> b!1460049 m!1347799))

(assert (=> b!1460049 m!1347775))

(assert (=> b!1460049 m!1347777))

(declare-fun m!1347801 () Bool)

(assert (=> b!1460058 m!1347801))

(assert (=> b!1460058 m!1347801))

(declare-fun m!1347803 () Bool)

(assert (=> b!1460058 m!1347803))

(assert (=> b!1460058 m!1347771))

(declare-fun m!1347805 () Bool)

(assert (=> b!1460058 m!1347805))

(declare-fun m!1347807 () Bool)

(assert (=> b!1460063 m!1347807))

(assert (=> b!1460066 m!1347753))

(assert (=> b!1460066 m!1347753))

(declare-fun m!1347809 () Bool)

(assert (=> b!1460066 m!1347809))

(declare-fun m!1347811 () Bool)

(assert (=> b!1460070 m!1347811))

(push 1)

