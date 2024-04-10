; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124642 () Bool)

(assert start!124642)

(declare-fun b!1443793 () Bool)

(declare-fun res!975871 () Bool)

(declare-fun e!813557 () Bool)

(assert (=> b!1443793 (=> (not res!975871) (not e!813557))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11585 0))(
  ( (MissingZero!11585 (index!48732 (_ BitVec 32))) (Found!11585 (index!48733 (_ BitVec 32))) (Intermediate!11585 (undefined!12397 Bool) (index!48734 (_ BitVec 32)) (x!130434 (_ BitVec 32))) (Undefined!11585) (MissingVacant!11585 (index!48735 (_ BitVec 32))) )
))
(declare-fun lt!633984 () SeekEntryResult!11585)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98090 0))(
  ( (array!98091 (arr!47333 (Array (_ BitVec 32) (_ BitVec 64))) (size!47883 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98090)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98090 (_ BitVec 32)) SeekEntryResult!11585)

(assert (=> b!1443793 (= res!975871 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47333 a!2862) j!93) a!2862 mask!2687) lt!633984))))

(declare-fun b!1443794 () Bool)

(declare-fun e!813556 () Bool)

(declare-fun e!813559 () Bool)

(assert (=> b!1443794 (= e!813556 (not e!813559))))

(declare-fun res!975860 () Bool)

(assert (=> b!1443794 (=> res!975860 e!813559)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443794 (= res!975860 (or (not (= (select (arr!47333 a!2862) index!646) (select (store (arr!47333 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47333 a!2862) index!646) (select (arr!47333 a!2862) j!93)))))))

(declare-fun e!813555 () Bool)

(assert (=> b!1443794 e!813555))

(declare-fun res!975861 () Bool)

(assert (=> b!1443794 (=> (not res!975861) (not e!813555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98090 (_ BitVec 32)) Bool)

(assert (=> b!1443794 (= res!975861 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48666 0))(
  ( (Unit!48667) )
))
(declare-fun lt!633979 () Unit!48666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48666)

(assert (=> b!1443794 (= lt!633979 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443795 () Bool)

(assert (=> b!1443795 (= e!813557 e!813556)))

(declare-fun res!975867 () Bool)

(assert (=> b!1443795 (=> (not res!975867) (not e!813556))))

(declare-fun lt!633983 () SeekEntryResult!11585)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443795 (= res!975867 (= lt!633983 (Intermediate!11585 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633981 () array!98090)

(declare-fun lt!633982 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443795 (= lt!633983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633982 mask!2687) lt!633982 lt!633981 mask!2687))))

(assert (=> b!1443795 (= lt!633982 (select (store (arr!47333 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443796 () Bool)

(declare-fun res!975858 () Bool)

(assert (=> b!1443796 (=> (not res!975858) (not e!813556))))

(declare-fun e!813560 () Bool)

(assert (=> b!1443796 (= res!975858 e!813560)))

(declare-fun c!133479 () Bool)

(assert (=> b!1443796 (= c!133479 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443797 () Bool)

(declare-fun res!975866 () Bool)

(declare-fun e!813554 () Bool)

(assert (=> b!1443797 (=> (not res!975866) (not e!813554))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443797 (= res!975866 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47883 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47883 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47883 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443799 () Bool)

(declare-fun res!975857 () Bool)

(assert (=> b!1443799 (=> (not res!975857) (not e!813554))))

(declare-datatypes ((List!33834 0))(
  ( (Nil!33831) (Cons!33830 (h!35180 (_ BitVec 64)) (t!48528 List!33834)) )
))
(declare-fun arrayNoDuplicates!0 (array!98090 (_ BitVec 32) List!33834) Bool)

(assert (=> b!1443799 (= res!975857 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33831))))

(declare-fun b!1443800 () Bool)

(declare-fun e!813558 () Bool)

(assert (=> b!1443800 (= e!813554 e!813558)))

(declare-fun res!975868 () Bool)

(assert (=> b!1443800 (=> (not res!975868) (not e!813558))))

(assert (=> b!1443800 (= res!975868 (= (select (store (arr!47333 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443800 (= lt!633981 (array!98091 (store (arr!47333 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47883 a!2862)))))

(declare-fun b!1443801 () Bool)

(assert (=> b!1443801 (= e!813558 e!813557)))

(declare-fun res!975856 () Bool)

(assert (=> b!1443801 (=> (not res!975856) (not e!813557))))

(assert (=> b!1443801 (= res!975856 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47333 a!2862) j!93) mask!2687) (select (arr!47333 a!2862) j!93) a!2862 mask!2687) lt!633984))))

(assert (=> b!1443801 (= lt!633984 (Intermediate!11585 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443802 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98090 (_ BitVec 32)) SeekEntryResult!11585)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98090 (_ BitVec 32)) SeekEntryResult!11585)

(assert (=> b!1443802 (= e!813560 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633982 lt!633981 mask!2687) (seekEntryOrOpen!0 lt!633982 lt!633981 mask!2687)))))

(declare-fun b!1443803 () Bool)

(assert (=> b!1443803 (= e!813555 (or (= (select (arr!47333 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47333 a!2862) intermediateBeforeIndex!19) (select (arr!47333 a!2862) j!93))))))

(declare-fun b!1443804 () Bool)

(declare-fun res!975870 () Bool)

(assert (=> b!1443804 (=> (not res!975870) (not e!813555))))

(assert (=> b!1443804 (= res!975870 (= (seekEntryOrOpen!0 (select (arr!47333 a!2862) j!93) a!2862 mask!2687) (Found!11585 j!93)))))

(declare-fun b!1443805 () Bool)

(assert (=> b!1443805 (= e!813559 true)))

(declare-fun lt!633980 () SeekEntryResult!11585)

(assert (=> b!1443805 (= lt!633980 (seekEntryOrOpen!0 lt!633982 lt!633981 mask!2687))))

(declare-fun b!1443806 () Bool)

(assert (=> b!1443806 (= e!813560 (= lt!633983 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633982 lt!633981 mask!2687)))))

(declare-fun b!1443798 () Bool)

(declare-fun res!975859 () Bool)

(assert (=> b!1443798 (=> (not res!975859) (not e!813554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443798 (= res!975859 (validKeyInArray!0 (select (arr!47333 a!2862) j!93)))))

(declare-fun res!975869 () Bool)

(assert (=> start!124642 (=> (not res!975869) (not e!813554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124642 (= res!975869 (validMask!0 mask!2687))))

(assert (=> start!124642 e!813554))

(assert (=> start!124642 true))

(declare-fun array_inv!36361 (array!98090) Bool)

(assert (=> start!124642 (array_inv!36361 a!2862)))

(declare-fun b!1443807 () Bool)

(declare-fun res!975864 () Bool)

(assert (=> b!1443807 (=> (not res!975864) (not e!813554))))

(assert (=> b!1443807 (= res!975864 (validKeyInArray!0 (select (arr!47333 a!2862) i!1006)))))

(declare-fun b!1443808 () Bool)

(declare-fun res!975865 () Bool)

(assert (=> b!1443808 (=> (not res!975865) (not e!813556))))

(assert (=> b!1443808 (= res!975865 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443809 () Bool)

(declare-fun res!975862 () Bool)

(assert (=> b!1443809 (=> (not res!975862) (not e!813554))))

(assert (=> b!1443809 (= res!975862 (and (= (size!47883 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47883 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47883 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443810 () Bool)

(declare-fun res!975863 () Bool)

(assert (=> b!1443810 (=> (not res!975863) (not e!813554))))

(assert (=> b!1443810 (= res!975863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124642 res!975869) b!1443809))

(assert (= (and b!1443809 res!975862) b!1443807))

(assert (= (and b!1443807 res!975864) b!1443798))

(assert (= (and b!1443798 res!975859) b!1443810))

(assert (= (and b!1443810 res!975863) b!1443799))

(assert (= (and b!1443799 res!975857) b!1443797))

(assert (= (and b!1443797 res!975866) b!1443800))

(assert (= (and b!1443800 res!975868) b!1443801))

(assert (= (and b!1443801 res!975856) b!1443793))

(assert (= (and b!1443793 res!975871) b!1443795))

(assert (= (and b!1443795 res!975867) b!1443796))

(assert (= (and b!1443796 c!133479) b!1443806))

(assert (= (and b!1443796 (not c!133479)) b!1443802))

(assert (= (and b!1443796 res!975858) b!1443808))

(assert (= (and b!1443808 res!975865) b!1443794))

(assert (= (and b!1443794 res!975861) b!1443804))

(assert (= (and b!1443804 res!975870) b!1443803))

(assert (= (and b!1443794 (not res!975860)) b!1443805))

(declare-fun m!1332853 () Bool)

(assert (=> b!1443793 m!1332853))

(assert (=> b!1443793 m!1332853))

(declare-fun m!1332855 () Bool)

(assert (=> b!1443793 m!1332855))

(assert (=> b!1443801 m!1332853))

(assert (=> b!1443801 m!1332853))

(declare-fun m!1332857 () Bool)

(assert (=> b!1443801 m!1332857))

(assert (=> b!1443801 m!1332857))

(assert (=> b!1443801 m!1332853))

(declare-fun m!1332859 () Bool)

(assert (=> b!1443801 m!1332859))

(assert (=> b!1443804 m!1332853))

(assert (=> b!1443804 m!1332853))

(declare-fun m!1332861 () Bool)

(assert (=> b!1443804 m!1332861))

(declare-fun m!1332863 () Bool)

(assert (=> b!1443799 m!1332863))

(declare-fun m!1332865 () Bool)

(assert (=> b!1443803 m!1332865))

(assert (=> b!1443803 m!1332853))

(declare-fun m!1332867 () Bool)

(assert (=> b!1443802 m!1332867))

(declare-fun m!1332869 () Bool)

(assert (=> b!1443802 m!1332869))

(declare-fun m!1332871 () Bool)

(assert (=> b!1443800 m!1332871))

(declare-fun m!1332873 () Bool)

(assert (=> b!1443800 m!1332873))

(declare-fun m!1332875 () Bool)

(assert (=> b!1443794 m!1332875))

(assert (=> b!1443794 m!1332871))

(declare-fun m!1332877 () Bool)

(assert (=> b!1443794 m!1332877))

(declare-fun m!1332879 () Bool)

(assert (=> b!1443794 m!1332879))

(declare-fun m!1332881 () Bool)

(assert (=> b!1443794 m!1332881))

(assert (=> b!1443794 m!1332853))

(declare-fun m!1332883 () Bool)

(assert (=> b!1443806 m!1332883))

(declare-fun m!1332885 () Bool)

(assert (=> b!1443807 m!1332885))

(assert (=> b!1443807 m!1332885))

(declare-fun m!1332887 () Bool)

(assert (=> b!1443807 m!1332887))

(assert (=> b!1443798 m!1332853))

(assert (=> b!1443798 m!1332853))

(declare-fun m!1332889 () Bool)

(assert (=> b!1443798 m!1332889))

(declare-fun m!1332891 () Bool)

(assert (=> start!124642 m!1332891))

(declare-fun m!1332893 () Bool)

(assert (=> start!124642 m!1332893))

(declare-fun m!1332895 () Bool)

(assert (=> b!1443810 m!1332895))

(declare-fun m!1332897 () Bool)

(assert (=> b!1443795 m!1332897))

(assert (=> b!1443795 m!1332897))

(declare-fun m!1332899 () Bool)

(assert (=> b!1443795 m!1332899))

(assert (=> b!1443795 m!1332871))

(declare-fun m!1332901 () Bool)

(assert (=> b!1443795 m!1332901))

(assert (=> b!1443805 m!1332869))

(push 1)

