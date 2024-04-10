; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125066 () Bool)

(assert start!125066)

(declare-fun b!1455822 () Bool)

(declare-fun e!819154 () Bool)

(declare-fun e!819160 () Bool)

(assert (=> b!1455822 (= e!819154 e!819160)))

(declare-fun res!986426 () Bool)

(assert (=> b!1455822 (=> res!986426 e!819160)))

(declare-fun lt!638097 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98514 0))(
  ( (array!98515 (arr!47545 (Array (_ BitVec 32) (_ BitVec 64))) (size!48095 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98514)

(assert (=> b!1455822 (= res!986426 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638097 #b00000000000000000000000000000000) (bvsge lt!638097 (size!48095 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455822 (= lt!638097 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638096 () array!98514)

(declare-fun lt!638094 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11797 0))(
  ( (MissingZero!11797 (index!49580 (_ BitVec 32))) (Found!11797 (index!49581 (_ BitVec 32))) (Intermediate!11797 (undefined!12609 Bool) (index!49582 (_ BitVec 32)) (x!131206 (_ BitVec 32))) (Undefined!11797) (MissingVacant!11797 (index!49583 (_ BitVec 32))) )
))
(declare-fun lt!638091 () SeekEntryResult!11797)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98514 (_ BitVec 32)) SeekEntryResult!11797)

(assert (=> b!1455822 (= lt!638091 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638094 lt!638096 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98514 (_ BitVec 32)) SeekEntryResult!11797)

(assert (=> b!1455822 (= lt!638091 (seekEntryOrOpen!0 lt!638094 lt!638096 mask!2687))))

(declare-fun b!1455823 () Bool)

(declare-fun res!986421 () Bool)

(assert (=> b!1455823 (=> res!986421 e!819160)))

(declare-fun lt!638090 () SeekEntryResult!11797)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98514 (_ BitVec 32)) SeekEntryResult!11797)

(assert (=> b!1455823 (= res!986421 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638097 (select (arr!47545 a!2862) j!93) a!2862 mask!2687) lt!638090)))))

(declare-fun b!1455824 () Bool)

(declare-fun e!819152 () Bool)

(assert (=> b!1455824 (= e!819152 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638097 intermediateAfterIndex!19 lt!638094 lt!638096 mask!2687) lt!638091)))))

(declare-fun e!819159 () Bool)

(declare-fun b!1455825 () Bool)

(assert (=> b!1455825 (= e!819159 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638094 lt!638096 mask!2687) (seekEntryOrOpen!0 lt!638094 lt!638096 mask!2687)))))

(declare-fun b!1455826 () Bool)

(declare-fun lt!638095 () SeekEntryResult!11797)

(assert (=> b!1455826 (= e!819159 (= lt!638095 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638094 lt!638096 mask!2687)))))

(declare-fun b!1455827 () Bool)

(declare-fun res!986434 () Bool)

(declare-fun e!819153 () Bool)

(assert (=> b!1455827 (=> (not res!986434) (not e!819153))))

(declare-datatypes ((List!34046 0))(
  ( (Nil!34043) (Cons!34042 (h!35392 (_ BitVec 64)) (t!48740 List!34046)) )
))
(declare-fun arrayNoDuplicates!0 (array!98514 (_ BitVec 32) List!34046) Bool)

(assert (=> b!1455827 (= res!986434 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34043))))

(declare-fun b!1455828 () Bool)

(declare-fun res!986427 () Bool)

(assert (=> b!1455828 (=> (not res!986427) (not e!819153))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455828 (= res!986427 (and (= (size!48095 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48095 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48095 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455829 () Bool)

(declare-fun e!819158 () Bool)

(declare-fun e!819156 () Bool)

(assert (=> b!1455829 (= e!819158 e!819156)))

(declare-fun res!986420 () Bool)

(assert (=> b!1455829 (=> (not res!986420) (not e!819156))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455829 (= res!986420 (= lt!638095 (Intermediate!11797 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455829 (= lt!638095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638094 mask!2687) lt!638094 lt!638096 mask!2687))))

(assert (=> b!1455829 (= lt!638094 (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1455830 () Bool)

(declare-fun e!819155 () Bool)

(assert (=> b!1455830 (= e!819155 (and (or (= (select (arr!47545 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47545 a!2862) intermediateBeforeIndex!19) (select (arr!47545 a!2862) j!93))) (let ((bdg!53185 (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47545 a!2862) index!646) bdg!53185) (= (select (arr!47545 a!2862) index!646) (select (arr!47545 a!2862) j!93))) (= (select (arr!47545 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53185 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455831 () Bool)

(declare-fun res!986418 () Bool)

(assert (=> b!1455831 (=> (not res!986418) (not e!819153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455831 (= res!986418 (validKeyInArray!0 (select (arr!47545 a!2862) i!1006)))))

(declare-fun b!1455832 () Bool)

(assert (=> b!1455832 (= e!819152 (not (= lt!638095 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638097 lt!638094 lt!638096 mask!2687))))))

(declare-fun b!1455833 () Bool)

(assert (=> b!1455833 (= e!819156 (not e!819154))))

(declare-fun res!986419 () Bool)

(assert (=> b!1455833 (=> res!986419 e!819154)))

(assert (=> b!1455833 (= res!986419 (or (and (= (select (arr!47545 a!2862) index!646) (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47545 a!2862) index!646) (select (arr!47545 a!2862) j!93))) (= (select (arr!47545 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455833 e!819155))

(declare-fun res!986423 () Bool)

(assert (=> b!1455833 (=> (not res!986423) (not e!819155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98514 (_ BitVec 32)) Bool)

(assert (=> b!1455833 (= res!986423 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49090 0))(
  ( (Unit!49091) )
))
(declare-fun lt!638092 () Unit!49090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49090)

(assert (=> b!1455833 (= lt!638092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455834 () Bool)

(declare-fun e!819157 () Bool)

(assert (=> b!1455834 (= e!819153 e!819157)))

(declare-fun res!986432 () Bool)

(assert (=> b!1455834 (=> (not res!986432) (not e!819157))))

(assert (=> b!1455834 (= res!986432 (= (select (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455834 (= lt!638096 (array!98515 (store (arr!47545 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48095 a!2862)))))

(declare-fun b!1455835 () Bool)

(declare-fun res!986424 () Bool)

(assert (=> b!1455835 (=> (not res!986424) (not e!819158))))

(assert (=> b!1455835 (= res!986424 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47545 a!2862) j!93) a!2862 mask!2687) lt!638090))))

(declare-fun b!1455836 () Bool)

(assert (=> b!1455836 (= e!819160 true)))

(declare-fun lt!638093 () Bool)

(assert (=> b!1455836 (= lt!638093 e!819152)))

(declare-fun c!134214 () Bool)

(assert (=> b!1455836 (= c!134214 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!986429 () Bool)

(assert (=> start!125066 (=> (not res!986429) (not e!819153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125066 (= res!986429 (validMask!0 mask!2687))))

(assert (=> start!125066 e!819153))

(assert (=> start!125066 true))

(declare-fun array_inv!36573 (array!98514) Bool)

(assert (=> start!125066 (array_inv!36573 a!2862)))

(declare-fun b!1455837 () Bool)

(declare-fun res!986417 () Bool)

(assert (=> b!1455837 (=> (not res!986417) (not e!819153))))

(assert (=> b!1455837 (= res!986417 (validKeyInArray!0 (select (arr!47545 a!2862) j!93)))))

(declare-fun b!1455838 () Bool)

(assert (=> b!1455838 (= e!819157 e!819158)))

(declare-fun res!986433 () Bool)

(assert (=> b!1455838 (=> (not res!986433) (not e!819158))))

(assert (=> b!1455838 (= res!986433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47545 a!2862) j!93) mask!2687) (select (arr!47545 a!2862) j!93) a!2862 mask!2687) lt!638090))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455838 (= lt!638090 (Intermediate!11797 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455839 () Bool)

(declare-fun res!986431 () Bool)

(assert (=> b!1455839 (=> (not res!986431) (not e!819156))))

(assert (=> b!1455839 (= res!986431 e!819159)))

(declare-fun c!134213 () Bool)

(assert (=> b!1455839 (= c!134213 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455840 () Bool)

(declare-fun res!986425 () Bool)

(assert (=> b!1455840 (=> (not res!986425) (not e!819153))))

(assert (=> b!1455840 (= res!986425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455841 () Bool)

(declare-fun res!986428 () Bool)

(assert (=> b!1455841 (=> (not res!986428) (not e!819155))))

(assert (=> b!1455841 (= res!986428 (= (seekEntryOrOpen!0 (select (arr!47545 a!2862) j!93) a!2862 mask!2687) (Found!11797 j!93)))))

(declare-fun b!1455842 () Bool)

(declare-fun res!986430 () Bool)

(assert (=> b!1455842 (=> (not res!986430) (not e!819153))))

(assert (=> b!1455842 (= res!986430 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48095 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48095 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48095 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455843 () Bool)

(declare-fun res!986422 () Bool)

(assert (=> b!1455843 (=> (not res!986422) (not e!819156))))

(assert (=> b!1455843 (= res!986422 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125066 res!986429) b!1455828))

(assert (= (and b!1455828 res!986427) b!1455831))

(assert (= (and b!1455831 res!986418) b!1455837))

(assert (= (and b!1455837 res!986417) b!1455840))

(assert (= (and b!1455840 res!986425) b!1455827))

(assert (= (and b!1455827 res!986434) b!1455842))

(assert (= (and b!1455842 res!986430) b!1455834))

(assert (= (and b!1455834 res!986432) b!1455838))

(assert (= (and b!1455838 res!986433) b!1455835))

(assert (= (and b!1455835 res!986424) b!1455829))

(assert (= (and b!1455829 res!986420) b!1455839))

(assert (= (and b!1455839 c!134213) b!1455826))

(assert (= (and b!1455839 (not c!134213)) b!1455825))

(assert (= (and b!1455839 res!986431) b!1455843))

(assert (= (and b!1455843 res!986422) b!1455833))

(assert (= (and b!1455833 res!986423) b!1455841))

(assert (= (and b!1455841 res!986428) b!1455830))

(assert (= (and b!1455833 (not res!986419)) b!1455822))

(assert (= (and b!1455822 (not res!986426)) b!1455823))

(assert (= (and b!1455823 (not res!986421)) b!1455836))

(assert (= (and b!1455836 c!134214) b!1455832))

(assert (= (and b!1455836 (not c!134214)) b!1455824))

(declare-fun m!1343997 () Bool)

(assert (=> b!1455826 m!1343997))

(declare-fun m!1343999 () Bool)

(assert (=> b!1455827 m!1343999))

(declare-fun m!1344001 () Bool)

(assert (=> b!1455829 m!1344001))

(assert (=> b!1455829 m!1344001))

(declare-fun m!1344003 () Bool)

(assert (=> b!1455829 m!1344003))

(declare-fun m!1344005 () Bool)

(assert (=> b!1455829 m!1344005))

(declare-fun m!1344007 () Bool)

(assert (=> b!1455829 m!1344007))

(declare-fun m!1344009 () Bool)

(assert (=> b!1455831 m!1344009))

(assert (=> b!1455831 m!1344009))

(declare-fun m!1344011 () Bool)

(assert (=> b!1455831 m!1344011))

(declare-fun m!1344013 () Bool)

(assert (=> b!1455840 m!1344013))

(declare-fun m!1344015 () Bool)

(assert (=> b!1455823 m!1344015))

(assert (=> b!1455823 m!1344015))

(declare-fun m!1344017 () Bool)

(assert (=> b!1455823 m!1344017))

(assert (=> b!1455830 m!1344005))

(declare-fun m!1344019 () Bool)

(assert (=> b!1455830 m!1344019))

(declare-fun m!1344021 () Bool)

(assert (=> b!1455830 m!1344021))

(declare-fun m!1344023 () Bool)

(assert (=> b!1455830 m!1344023))

(assert (=> b!1455830 m!1344015))

(assert (=> b!1455838 m!1344015))

(assert (=> b!1455838 m!1344015))

(declare-fun m!1344025 () Bool)

(assert (=> b!1455838 m!1344025))

(assert (=> b!1455838 m!1344025))

(assert (=> b!1455838 m!1344015))

(declare-fun m!1344027 () Bool)

(assert (=> b!1455838 m!1344027))

(declare-fun m!1344029 () Bool)

(assert (=> b!1455825 m!1344029))

(declare-fun m!1344031 () Bool)

(assert (=> b!1455825 m!1344031))

(declare-fun m!1344033 () Bool)

(assert (=> b!1455824 m!1344033))

(assert (=> b!1455837 m!1344015))

(assert (=> b!1455837 m!1344015))

(declare-fun m!1344035 () Bool)

(assert (=> b!1455837 m!1344035))

(declare-fun m!1344037 () Bool)

(assert (=> b!1455832 m!1344037))

(assert (=> b!1455834 m!1344005))

(declare-fun m!1344039 () Bool)

(assert (=> b!1455834 m!1344039))

(declare-fun m!1344041 () Bool)

(assert (=> start!125066 m!1344041))

(declare-fun m!1344043 () Bool)

(assert (=> start!125066 m!1344043))

(declare-fun m!1344045 () Bool)

(assert (=> b!1455822 m!1344045))

(assert (=> b!1455822 m!1344029))

(assert (=> b!1455822 m!1344031))

(assert (=> b!1455841 m!1344015))

(assert (=> b!1455841 m!1344015))

(declare-fun m!1344047 () Bool)

(assert (=> b!1455841 m!1344047))

(declare-fun m!1344049 () Bool)

(assert (=> b!1455833 m!1344049))

(assert (=> b!1455833 m!1344005))

(assert (=> b!1455833 m!1344021))

(assert (=> b!1455833 m!1344023))

(declare-fun m!1344051 () Bool)

(assert (=> b!1455833 m!1344051))

(assert (=> b!1455833 m!1344015))

(assert (=> b!1455835 m!1344015))

(assert (=> b!1455835 m!1344015))

(declare-fun m!1344053 () Bool)

(assert (=> b!1455835 m!1344053))

(push 1)

