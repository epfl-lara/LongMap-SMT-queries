; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126886 () Bool)

(assert start!126886)

(declare-fun b!1490734 () Bool)

(declare-fun e!835317 () Bool)

(declare-fun e!835315 () Bool)

(assert (=> b!1490734 (= e!835317 e!835315)))

(declare-fun res!1013990 () Bool)

(assert (=> b!1490734 (=> (not res!1013990) (not e!835315))))

(declare-datatypes ((array!99659 0))(
  ( (array!99660 (arr!48101 (Array (_ BitVec 32) (_ BitVec 64))) (size!48651 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99659)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12341 0))(
  ( (MissingZero!12341 (index!51756 (_ BitVec 32))) (Found!12341 (index!51757 (_ BitVec 32))) (Intermediate!12341 (undefined!13153 Bool) (index!51758 (_ BitVec 32)) (x!133349 (_ BitVec 32))) (Undefined!12341) (MissingVacant!12341 (index!51759 (_ BitVec 32))) )
))
(declare-fun lt!650046 () SeekEntryResult!12341)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99659 (_ BitVec 32)) SeekEntryResult!12341)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490734 (= res!1013990 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48101 a!2862) j!93) mask!2687) (select (arr!48101 a!2862) j!93) a!2862 mask!2687) lt!650046))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490734 (= lt!650046 (Intermediate!12341 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!650041 () array!99659)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1490735 () Bool)

(declare-fun lt!650045 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!835314 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99659 (_ BitVec 32)) SeekEntryResult!12341)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99659 (_ BitVec 32)) SeekEntryResult!12341)

(assert (=> b!1490735 (= e!835314 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650045 lt!650041 mask!2687) (seekEntryOrOpen!0 lt!650045 lt!650041 mask!2687)))))

(declare-fun b!1490736 () Bool)

(declare-fun res!1013983 () Bool)

(declare-fun e!835318 () Bool)

(assert (=> b!1490736 (=> (not res!1013983) (not e!835318))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490736 (= res!1013983 (validKeyInArray!0 (select (arr!48101 a!2862) i!1006)))))

(declare-fun b!1490737 () Bool)

(declare-fun e!835316 () Bool)

(assert (=> b!1490737 (= e!835316 (or (= (select (arr!48101 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48101 a!2862) intermediateBeforeIndex!19) (select (arr!48101 a!2862) j!93))))))

(declare-fun b!1490738 () Bool)

(declare-fun res!1013993 () Bool)

(assert (=> b!1490738 (=> (not res!1013993) (not e!835316))))

(assert (=> b!1490738 (= res!1013993 (= (seekEntryOrOpen!0 (select (arr!48101 a!2862) j!93) a!2862 mask!2687) (Found!12341 j!93)))))

(declare-fun b!1490739 () Bool)

(declare-fun res!1013987 () Bool)

(assert (=> b!1490739 (=> (not res!1013987) (not e!835318))))

(declare-datatypes ((List!34602 0))(
  ( (Nil!34599) (Cons!34598 (h!35981 (_ BitVec 64)) (t!49296 List!34602)) )
))
(declare-fun arrayNoDuplicates!0 (array!99659 (_ BitVec 32) List!34602) Bool)

(assert (=> b!1490739 (= res!1013987 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34599))))

(declare-fun b!1490740 () Bool)

(declare-fun e!835312 () Bool)

(declare-fun e!835319 () Bool)

(assert (=> b!1490740 (= e!835312 (not e!835319))))

(declare-fun res!1013985 () Bool)

(assert (=> b!1490740 (=> res!1013985 e!835319)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490740 (= res!1013985 (or (and (= (select (arr!48101 a!2862) index!646) (select (store (arr!48101 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48101 a!2862) index!646) (select (arr!48101 a!2862) j!93))) (= (select (arr!48101 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490740 e!835316))

(declare-fun res!1013986 () Bool)

(assert (=> b!1490740 (=> (not res!1013986) (not e!835316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99659 (_ BitVec 32)) Bool)

(assert (=> b!1490740 (= res!1013986 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50022 0))(
  ( (Unit!50023) )
))
(declare-fun lt!650042 () Unit!50022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50022)

(assert (=> b!1490740 (= lt!650042 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490741 () Bool)

(declare-fun res!1013981 () Bool)

(assert (=> b!1490741 (=> (not res!1013981) (not e!835312))))

(assert (=> b!1490741 (= res!1013981 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490742 () Bool)

(declare-fun res!1013995 () Bool)

(assert (=> b!1490742 (=> (not res!1013995) (not e!835318))))

(assert (=> b!1490742 (= res!1013995 (and (= (size!48651 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48651 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48651 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490743 () Bool)

(assert (=> b!1490743 (= e!835319 true)))

(declare-fun lt!650044 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490743 (= lt!650044 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490745 () Bool)

(declare-fun res!1013982 () Bool)

(assert (=> b!1490745 (=> (not res!1013982) (not e!835315))))

(assert (=> b!1490745 (= res!1013982 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48101 a!2862) j!93) a!2862 mask!2687) lt!650046))))

(declare-fun b!1490746 () Bool)

(assert (=> b!1490746 (= e!835315 e!835312)))

(declare-fun res!1013994 () Bool)

(assert (=> b!1490746 (=> (not res!1013994) (not e!835312))))

(declare-fun lt!650043 () SeekEntryResult!12341)

(assert (=> b!1490746 (= res!1013994 (= lt!650043 (Intermediate!12341 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490746 (= lt!650043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650045 mask!2687) lt!650045 lt!650041 mask!2687))))

(assert (=> b!1490746 (= lt!650045 (select (store (arr!48101 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490747 () Bool)

(declare-fun res!1013988 () Bool)

(assert (=> b!1490747 (=> (not res!1013988) (not e!835318))))

(assert (=> b!1490747 (= res!1013988 (validKeyInArray!0 (select (arr!48101 a!2862) j!93)))))

(declare-fun b!1490748 () Bool)

(declare-fun res!1013980 () Bool)

(assert (=> b!1490748 (=> (not res!1013980) (not e!835312))))

(assert (=> b!1490748 (= res!1013980 e!835314)))

(declare-fun c!137904 () Bool)

(assert (=> b!1490748 (= c!137904 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490749 () Bool)

(assert (=> b!1490749 (= e!835318 e!835317)))

(declare-fun res!1013991 () Bool)

(assert (=> b!1490749 (=> (not res!1013991) (not e!835317))))

(assert (=> b!1490749 (= res!1013991 (= (select (store (arr!48101 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490749 (= lt!650041 (array!99660 (store (arr!48101 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48651 a!2862)))))

(declare-fun b!1490750 () Bool)

(assert (=> b!1490750 (= e!835314 (= lt!650043 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650045 lt!650041 mask!2687)))))

(declare-fun b!1490751 () Bool)

(declare-fun res!1013984 () Bool)

(assert (=> b!1490751 (=> (not res!1013984) (not e!835318))))

(assert (=> b!1490751 (= res!1013984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490744 () Bool)

(declare-fun res!1013989 () Bool)

(assert (=> b!1490744 (=> (not res!1013989) (not e!835318))))

(assert (=> b!1490744 (= res!1013989 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48651 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48651 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48651 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1013992 () Bool)

(assert (=> start!126886 (=> (not res!1013992) (not e!835318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126886 (= res!1013992 (validMask!0 mask!2687))))

(assert (=> start!126886 e!835318))

(assert (=> start!126886 true))

(declare-fun array_inv!37129 (array!99659) Bool)

(assert (=> start!126886 (array_inv!37129 a!2862)))

(assert (= (and start!126886 res!1013992) b!1490742))

(assert (= (and b!1490742 res!1013995) b!1490736))

(assert (= (and b!1490736 res!1013983) b!1490747))

(assert (= (and b!1490747 res!1013988) b!1490751))

(assert (= (and b!1490751 res!1013984) b!1490739))

(assert (= (and b!1490739 res!1013987) b!1490744))

(assert (= (and b!1490744 res!1013989) b!1490749))

(assert (= (and b!1490749 res!1013991) b!1490734))

(assert (= (and b!1490734 res!1013990) b!1490745))

(assert (= (and b!1490745 res!1013982) b!1490746))

(assert (= (and b!1490746 res!1013994) b!1490748))

(assert (= (and b!1490748 c!137904) b!1490750))

(assert (= (and b!1490748 (not c!137904)) b!1490735))

(assert (= (and b!1490748 res!1013980) b!1490741))

(assert (= (and b!1490741 res!1013981) b!1490740))

(assert (= (and b!1490740 res!1013986) b!1490738))

(assert (= (and b!1490738 res!1013993) b!1490737))

(assert (= (and b!1490740 (not res!1013985)) b!1490743))

(declare-fun m!1374883 () Bool)

(assert (=> start!126886 m!1374883))

(declare-fun m!1374885 () Bool)

(assert (=> start!126886 m!1374885))

(declare-fun m!1374887 () Bool)

(assert (=> b!1490736 m!1374887))

(assert (=> b!1490736 m!1374887))

(declare-fun m!1374889 () Bool)

(assert (=> b!1490736 m!1374889))

(declare-fun m!1374891 () Bool)

(assert (=> b!1490739 m!1374891))

(declare-fun m!1374893 () Bool)

(assert (=> b!1490738 m!1374893))

(assert (=> b!1490738 m!1374893))

(declare-fun m!1374895 () Bool)

(assert (=> b!1490738 m!1374895))

(assert (=> b!1490745 m!1374893))

(assert (=> b!1490745 m!1374893))

(declare-fun m!1374897 () Bool)

(assert (=> b!1490745 m!1374897))

(declare-fun m!1374899 () Bool)

(assert (=> b!1490743 m!1374899))

(declare-fun m!1374901 () Bool)

(assert (=> b!1490749 m!1374901))

(declare-fun m!1374903 () Bool)

(assert (=> b!1490749 m!1374903))

(assert (=> b!1490734 m!1374893))

(assert (=> b!1490734 m!1374893))

(declare-fun m!1374905 () Bool)

(assert (=> b!1490734 m!1374905))

(assert (=> b!1490734 m!1374905))

(assert (=> b!1490734 m!1374893))

(declare-fun m!1374907 () Bool)

(assert (=> b!1490734 m!1374907))

(declare-fun m!1374909 () Bool)

(assert (=> b!1490737 m!1374909))

(assert (=> b!1490737 m!1374893))

(declare-fun m!1374911 () Bool)

(assert (=> b!1490751 m!1374911))

(declare-fun m!1374913 () Bool)

(assert (=> b!1490750 m!1374913))

(assert (=> b!1490747 m!1374893))

(assert (=> b!1490747 m!1374893))

(declare-fun m!1374915 () Bool)

(assert (=> b!1490747 m!1374915))

(declare-fun m!1374917 () Bool)

(assert (=> b!1490746 m!1374917))

(assert (=> b!1490746 m!1374917))

(declare-fun m!1374919 () Bool)

(assert (=> b!1490746 m!1374919))

(assert (=> b!1490746 m!1374901))

(declare-fun m!1374921 () Bool)

(assert (=> b!1490746 m!1374921))

(declare-fun m!1374923 () Bool)

(assert (=> b!1490740 m!1374923))

(assert (=> b!1490740 m!1374901))

(declare-fun m!1374925 () Bool)

(assert (=> b!1490740 m!1374925))

(declare-fun m!1374927 () Bool)

(assert (=> b!1490740 m!1374927))

(declare-fun m!1374929 () Bool)

(assert (=> b!1490740 m!1374929))

(assert (=> b!1490740 m!1374893))

(declare-fun m!1374931 () Bool)

(assert (=> b!1490735 m!1374931))

(declare-fun m!1374933 () Bool)

(assert (=> b!1490735 m!1374933))

(push 1)

