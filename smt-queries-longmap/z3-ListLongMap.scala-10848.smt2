; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127212 () Bool)

(assert start!127212)

(declare-fun b!1493738 () Bool)

(declare-fun res!1015750 () Bool)

(declare-fun e!836957 () Bool)

(assert (=> b!1493738 (=> (not res!1015750) (not e!836957))))

(declare-datatypes ((array!99823 0))(
  ( (array!99824 (arr!48178 (Array (_ BitVec 32) (_ BitVec 64))) (size!48729 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99823)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493738 (= res!1015750 (validKeyInArray!0 (select (arr!48178 a!2862) i!1006)))))

(declare-fun b!1493739 () Bool)

(declare-fun lt!651114 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!836953 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!651111 () array!99823)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12315 0))(
  ( (MissingZero!12315 (index!51652 (_ BitVec 32))) (Found!12315 (index!51653 (_ BitVec 32))) (Intermediate!12315 (undefined!13127 Bool) (index!51654 (_ BitVec 32)) (x!133420 (_ BitVec 32))) (Undefined!12315) (MissingVacant!12315 (index!51655 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99823 (_ BitVec 32)) SeekEntryResult!12315)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99823 (_ BitVec 32)) SeekEntryResult!12315)

(assert (=> b!1493739 (= e!836953 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651114 lt!651111 mask!2687) (seekEntryOrOpen!0 lt!651114 lt!651111 mask!2687)))))

(declare-fun b!1493740 () Bool)

(declare-fun res!1015743 () Bool)

(assert (=> b!1493740 (=> (not res!1015743) (not e!836957))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493740 (= res!1015743 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48729 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48729 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48729 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493741 () Bool)

(declare-fun lt!651112 () SeekEntryResult!12315)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99823 (_ BitVec 32)) SeekEntryResult!12315)

(assert (=> b!1493741 (= e!836953 (= lt!651112 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651114 lt!651111 mask!2687)))))

(declare-fun b!1493742 () Bool)

(declare-fun res!1015756 () Bool)

(declare-fun e!836952 () Bool)

(assert (=> b!1493742 (=> (not res!1015756) (not e!836952))))

(assert (=> b!1493742 (= res!1015756 e!836953)))

(declare-fun c!138535 () Bool)

(assert (=> b!1493742 (= c!138535 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493743 () Bool)

(declare-fun e!836956 () Bool)

(assert (=> b!1493743 (= e!836957 e!836956)))

(declare-fun res!1015747 () Bool)

(assert (=> b!1493743 (=> (not res!1015747) (not e!836956))))

(assert (=> b!1493743 (= res!1015747 (= (select (store (arr!48178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493743 (= lt!651111 (array!99824 (store (arr!48178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48729 a!2862)))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1493744 () Bool)

(declare-fun e!836955 () Bool)

(assert (=> b!1493744 (= e!836955 (or (= (select (arr!48178 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48178 a!2862) intermediateBeforeIndex!19) (select (arr!48178 a!2862) j!93))))))

(declare-fun b!1493745 () Bool)

(declare-fun e!836958 () Bool)

(assert (=> b!1493745 (= e!836958 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!651110 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493745 (= lt!651110 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun res!1015744 () Bool)

(assert (=> start!127212 (=> (not res!1015744) (not e!836957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127212 (= res!1015744 (validMask!0 mask!2687))))

(assert (=> start!127212 e!836957))

(assert (=> start!127212 true))

(declare-fun array_inv!37459 (array!99823) Bool)

(assert (=> start!127212 (array_inv!37459 a!2862)))

(declare-fun b!1493746 () Bool)

(declare-fun e!836951 () Bool)

(assert (=> b!1493746 (= e!836956 e!836951)))

(declare-fun res!1015755 () Bool)

(assert (=> b!1493746 (=> (not res!1015755) (not e!836951))))

(declare-fun lt!651115 () SeekEntryResult!12315)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493746 (= res!1015755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687) (select (arr!48178 a!2862) j!93) a!2862 mask!2687) lt!651115))))

(assert (=> b!1493746 (= lt!651115 (Intermediate!12315 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493747 () Bool)

(declare-fun res!1015752 () Bool)

(assert (=> b!1493747 (=> (not res!1015752) (not e!836957))))

(assert (=> b!1493747 (= res!1015752 (and (= (size!48729 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48729 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48729 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493748 () Bool)

(declare-fun res!1015748 () Bool)

(assert (=> b!1493748 (=> (not res!1015748) (not e!836957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99823 (_ BitVec 32)) Bool)

(assert (=> b!1493748 (= res!1015748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493749 () Bool)

(assert (=> b!1493749 (= e!836951 e!836952)))

(declare-fun res!1015745 () Bool)

(assert (=> b!1493749 (=> (not res!1015745) (not e!836952))))

(assert (=> b!1493749 (= res!1015745 (= lt!651112 (Intermediate!12315 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493749 (= lt!651112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651114 mask!2687) lt!651114 lt!651111 mask!2687))))

(assert (=> b!1493749 (= lt!651114 (select (store (arr!48178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493750 () Bool)

(declare-fun res!1015749 () Bool)

(assert (=> b!1493750 (=> (not res!1015749) (not e!836957))))

(assert (=> b!1493750 (= res!1015749 (validKeyInArray!0 (select (arr!48178 a!2862) j!93)))))

(declare-fun b!1493751 () Bool)

(declare-fun res!1015751 () Bool)

(assert (=> b!1493751 (=> (not res!1015751) (not e!836952))))

(assert (=> b!1493751 (= res!1015751 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493752 () Bool)

(declare-fun res!1015746 () Bool)

(assert (=> b!1493752 (=> (not res!1015746) (not e!836957))))

(declare-datatypes ((List!34666 0))(
  ( (Nil!34663) (Cons!34662 (h!36059 (_ BitVec 64)) (t!49352 List!34666)) )
))
(declare-fun arrayNoDuplicates!0 (array!99823 (_ BitVec 32) List!34666) Bool)

(assert (=> b!1493752 (= res!1015746 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34663))))

(declare-fun b!1493753 () Bool)

(declare-fun res!1015753 () Bool)

(assert (=> b!1493753 (=> (not res!1015753) (not e!836951))))

(assert (=> b!1493753 (= res!1015753 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48178 a!2862) j!93) a!2862 mask!2687) lt!651115))))

(declare-fun b!1493754 () Bool)

(declare-fun res!1015742 () Bool)

(assert (=> b!1493754 (=> (not res!1015742) (not e!836955))))

(assert (=> b!1493754 (= res!1015742 (= (seekEntryOrOpen!0 (select (arr!48178 a!2862) j!93) a!2862 mask!2687) (Found!12315 j!93)))))

(declare-fun b!1493755 () Bool)

(assert (=> b!1493755 (= e!836952 (not e!836958))))

(declare-fun res!1015757 () Bool)

(assert (=> b!1493755 (=> res!1015757 e!836958)))

(assert (=> b!1493755 (= res!1015757 (or (and (= (select (arr!48178 a!2862) index!646) (select (store (arr!48178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48178 a!2862) index!646) (select (arr!48178 a!2862) j!93))) (= (select (arr!48178 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493755 e!836955))

(declare-fun res!1015754 () Bool)

(assert (=> b!1493755 (=> (not res!1015754) (not e!836955))))

(assert (=> b!1493755 (= res!1015754 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50003 0))(
  ( (Unit!50004) )
))
(declare-fun lt!651113 () Unit!50003)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50003)

(assert (=> b!1493755 (= lt!651113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!127212 res!1015744) b!1493747))

(assert (= (and b!1493747 res!1015752) b!1493738))

(assert (= (and b!1493738 res!1015750) b!1493750))

(assert (= (and b!1493750 res!1015749) b!1493748))

(assert (= (and b!1493748 res!1015748) b!1493752))

(assert (= (and b!1493752 res!1015746) b!1493740))

(assert (= (and b!1493740 res!1015743) b!1493743))

(assert (= (and b!1493743 res!1015747) b!1493746))

(assert (= (and b!1493746 res!1015755) b!1493753))

(assert (= (and b!1493753 res!1015753) b!1493749))

(assert (= (and b!1493749 res!1015745) b!1493742))

(assert (= (and b!1493742 c!138535) b!1493741))

(assert (= (and b!1493742 (not c!138535)) b!1493739))

(assert (= (and b!1493742 res!1015756) b!1493751))

(assert (= (and b!1493751 res!1015751) b!1493755))

(assert (= (and b!1493755 res!1015754) b!1493754))

(assert (= (and b!1493754 res!1015742) b!1493744))

(assert (= (and b!1493755 (not res!1015757)) b!1493745))

(declare-fun m!1377835 () Bool)

(assert (=> b!1493743 m!1377835))

(declare-fun m!1377837 () Bool)

(assert (=> b!1493743 m!1377837))

(declare-fun m!1377839 () Bool)

(assert (=> b!1493739 m!1377839))

(declare-fun m!1377841 () Bool)

(assert (=> b!1493739 m!1377841))

(declare-fun m!1377843 () Bool)

(assert (=> b!1493738 m!1377843))

(assert (=> b!1493738 m!1377843))

(declare-fun m!1377845 () Bool)

(assert (=> b!1493738 m!1377845))

(declare-fun m!1377847 () Bool)

(assert (=> b!1493753 m!1377847))

(assert (=> b!1493753 m!1377847))

(declare-fun m!1377849 () Bool)

(assert (=> b!1493753 m!1377849))

(declare-fun m!1377851 () Bool)

(assert (=> b!1493748 m!1377851))

(declare-fun m!1377853 () Bool)

(assert (=> b!1493744 m!1377853))

(assert (=> b!1493744 m!1377847))

(declare-fun m!1377855 () Bool)

(assert (=> b!1493755 m!1377855))

(assert (=> b!1493755 m!1377835))

(declare-fun m!1377857 () Bool)

(assert (=> b!1493755 m!1377857))

(declare-fun m!1377859 () Bool)

(assert (=> b!1493755 m!1377859))

(declare-fun m!1377861 () Bool)

(assert (=> b!1493755 m!1377861))

(assert (=> b!1493755 m!1377847))

(declare-fun m!1377863 () Bool)

(assert (=> b!1493741 m!1377863))

(declare-fun m!1377865 () Bool)

(assert (=> b!1493745 m!1377865))

(declare-fun m!1377867 () Bool)

(assert (=> b!1493752 m!1377867))

(assert (=> b!1493746 m!1377847))

(assert (=> b!1493746 m!1377847))

(declare-fun m!1377869 () Bool)

(assert (=> b!1493746 m!1377869))

(assert (=> b!1493746 m!1377869))

(assert (=> b!1493746 m!1377847))

(declare-fun m!1377871 () Bool)

(assert (=> b!1493746 m!1377871))

(declare-fun m!1377873 () Bool)

(assert (=> b!1493749 m!1377873))

(assert (=> b!1493749 m!1377873))

(declare-fun m!1377875 () Bool)

(assert (=> b!1493749 m!1377875))

(assert (=> b!1493749 m!1377835))

(declare-fun m!1377877 () Bool)

(assert (=> b!1493749 m!1377877))

(declare-fun m!1377879 () Bool)

(assert (=> start!127212 m!1377879))

(declare-fun m!1377881 () Bool)

(assert (=> start!127212 m!1377881))

(assert (=> b!1493754 m!1377847))

(assert (=> b!1493754 m!1377847))

(declare-fun m!1377883 () Bool)

(assert (=> b!1493754 m!1377883))

(assert (=> b!1493750 m!1377847))

(assert (=> b!1493750 m!1377847))

(declare-fun m!1377885 () Bool)

(assert (=> b!1493750 m!1377885))

(check-sat (not b!1493738) (not b!1493748) (not b!1493754) (not b!1493739) (not b!1493749) (not b!1493750) (not b!1493755) (not start!127212) (not b!1493752) (not b!1493746) (not b!1493745) (not b!1493753) (not b!1493741))
(check-sat)
(get-model)

(declare-fun b!1493882 () Bool)

(declare-fun e!837018 () SeekEntryResult!12315)

(assert (=> b!1493882 (= e!837018 (Intermediate!12315 true index!646 x!665))))

(declare-fun b!1493883 () Bool)

(declare-fun e!837020 () Bool)

(declare-fun e!837019 () Bool)

(assert (=> b!1493883 (= e!837020 e!837019)))

(declare-fun res!1015862 () Bool)

(declare-fun lt!651156 () SeekEntryResult!12315)

(get-info :version)

(assert (=> b!1493883 (= res!1015862 (and ((_ is Intermediate!12315) lt!651156) (not (undefined!13127 lt!651156)) (bvslt (x!133420 lt!651156) #b01111111111111111111111111111110) (bvsge (x!133420 lt!651156) #b00000000000000000000000000000000) (bvsge (x!133420 lt!651156) x!665)))))

(assert (=> b!1493883 (=> (not res!1015862) (not e!837019))))

(declare-fun e!837021 () SeekEntryResult!12315)

(declare-fun b!1493884 () Bool)

(assert (=> b!1493884 (= e!837021 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!651114 lt!651111 mask!2687))))

(declare-fun b!1493885 () Bool)

(assert (=> b!1493885 (and (bvsge (index!51654 lt!651156) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651156) (size!48729 lt!651111)))))

(declare-fun e!837017 () Bool)

(assert (=> b!1493885 (= e!837017 (= (select (arr!48178 lt!651111) (index!51654 lt!651156)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493886 () Bool)

(assert (=> b!1493886 (= e!837020 (bvsge (x!133420 lt!651156) #b01111111111111111111111111111110))))

(declare-fun d!157309 () Bool)

(assert (=> d!157309 e!837020))

(declare-fun c!138550 () Bool)

(assert (=> d!157309 (= c!138550 (and ((_ is Intermediate!12315) lt!651156) (undefined!13127 lt!651156)))))

(assert (=> d!157309 (= lt!651156 e!837018)))

(declare-fun c!138548 () Bool)

(assert (=> d!157309 (= c!138548 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651157 () (_ BitVec 64))

(assert (=> d!157309 (= lt!651157 (select (arr!48178 lt!651111) index!646))))

(assert (=> d!157309 (validMask!0 mask!2687)))

(assert (=> d!157309 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651114 lt!651111 mask!2687) lt!651156)))

(declare-fun b!1493887 () Bool)

(assert (=> b!1493887 (and (bvsge (index!51654 lt!651156) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651156) (size!48729 lt!651111)))))

(declare-fun res!1015861 () Bool)

(assert (=> b!1493887 (= res!1015861 (= (select (arr!48178 lt!651111) (index!51654 lt!651156)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493887 (=> res!1015861 e!837017)))

(declare-fun b!1493888 () Bool)

(assert (=> b!1493888 (= e!837018 e!837021)))

(declare-fun c!138549 () Bool)

(assert (=> b!1493888 (= c!138549 (or (= lt!651157 lt!651114) (= (bvadd lt!651157 lt!651157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493889 () Bool)

(assert (=> b!1493889 (= e!837021 (Intermediate!12315 false index!646 x!665))))

(declare-fun b!1493890 () Bool)

(assert (=> b!1493890 (and (bvsge (index!51654 lt!651156) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651156) (size!48729 lt!651111)))))

(declare-fun res!1015860 () Bool)

(assert (=> b!1493890 (= res!1015860 (= (select (arr!48178 lt!651111) (index!51654 lt!651156)) lt!651114))))

(assert (=> b!1493890 (=> res!1015860 e!837017)))

(assert (=> b!1493890 (= e!837019 e!837017)))

(assert (= (and d!157309 c!138548) b!1493882))

(assert (= (and d!157309 (not c!138548)) b!1493888))

(assert (= (and b!1493888 c!138549) b!1493889))

(assert (= (and b!1493888 (not c!138549)) b!1493884))

(assert (= (and d!157309 c!138550) b!1493886))

(assert (= (and d!157309 (not c!138550)) b!1493883))

(assert (= (and b!1493883 res!1015862) b!1493890))

(assert (= (and b!1493890 (not res!1015860)) b!1493887))

(assert (= (and b!1493887 (not res!1015861)) b!1493885))

(declare-fun m!1377991 () Bool)

(assert (=> b!1493885 m!1377991))

(declare-fun m!1377993 () Bool)

(assert (=> d!157309 m!1377993))

(assert (=> d!157309 m!1377879))

(declare-fun m!1377995 () Bool)

(assert (=> b!1493884 m!1377995))

(assert (=> b!1493884 m!1377995))

(declare-fun m!1377997 () Bool)

(assert (=> b!1493884 m!1377997))

(assert (=> b!1493890 m!1377991))

(assert (=> b!1493887 m!1377991))

(assert (=> b!1493741 d!157309))

(declare-fun b!1493891 () Bool)

(declare-fun e!837023 () SeekEntryResult!12315)

(assert (=> b!1493891 (= e!837023 (Intermediate!12315 true index!646 x!665))))

(declare-fun b!1493892 () Bool)

(declare-fun e!837025 () Bool)

(declare-fun e!837024 () Bool)

(assert (=> b!1493892 (= e!837025 e!837024)))

(declare-fun res!1015865 () Bool)

(declare-fun lt!651158 () SeekEntryResult!12315)

(assert (=> b!1493892 (= res!1015865 (and ((_ is Intermediate!12315) lt!651158) (not (undefined!13127 lt!651158)) (bvslt (x!133420 lt!651158) #b01111111111111111111111111111110) (bvsge (x!133420 lt!651158) #b00000000000000000000000000000000) (bvsge (x!133420 lt!651158) x!665)))))

(assert (=> b!1493892 (=> (not res!1015865) (not e!837024))))

(declare-fun b!1493893 () Bool)

(declare-fun e!837026 () SeekEntryResult!12315)

(assert (=> b!1493893 (= e!837026 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48178 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493894 () Bool)

(assert (=> b!1493894 (and (bvsge (index!51654 lt!651158) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651158) (size!48729 a!2862)))))

(declare-fun e!837022 () Bool)

(assert (=> b!1493894 (= e!837022 (= (select (arr!48178 a!2862) (index!51654 lt!651158)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493895 () Bool)

(assert (=> b!1493895 (= e!837025 (bvsge (x!133420 lt!651158) #b01111111111111111111111111111110))))

(declare-fun d!157311 () Bool)

(assert (=> d!157311 e!837025))

(declare-fun c!138553 () Bool)

(assert (=> d!157311 (= c!138553 (and ((_ is Intermediate!12315) lt!651158) (undefined!13127 lt!651158)))))

(assert (=> d!157311 (= lt!651158 e!837023)))

(declare-fun c!138551 () Bool)

(assert (=> d!157311 (= c!138551 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651159 () (_ BitVec 64))

(assert (=> d!157311 (= lt!651159 (select (arr!48178 a!2862) index!646))))

(assert (=> d!157311 (validMask!0 mask!2687)))

(assert (=> d!157311 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48178 a!2862) j!93) a!2862 mask!2687) lt!651158)))

(declare-fun b!1493896 () Bool)

(assert (=> b!1493896 (and (bvsge (index!51654 lt!651158) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651158) (size!48729 a!2862)))))

(declare-fun res!1015864 () Bool)

(assert (=> b!1493896 (= res!1015864 (= (select (arr!48178 a!2862) (index!51654 lt!651158)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493896 (=> res!1015864 e!837022)))

(declare-fun b!1493897 () Bool)

(assert (=> b!1493897 (= e!837023 e!837026)))

(declare-fun c!138552 () Bool)

(assert (=> b!1493897 (= c!138552 (or (= lt!651159 (select (arr!48178 a!2862) j!93)) (= (bvadd lt!651159 lt!651159) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493898 () Bool)

(assert (=> b!1493898 (= e!837026 (Intermediate!12315 false index!646 x!665))))

(declare-fun b!1493899 () Bool)

(assert (=> b!1493899 (and (bvsge (index!51654 lt!651158) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651158) (size!48729 a!2862)))))

(declare-fun res!1015863 () Bool)

(assert (=> b!1493899 (= res!1015863 (= (select (arr!48178 a!2862) (index!51654 lt!651158)) (select (arr!48178 a!2862) j!93)))))

(assert (=> b!1493899 (=> res!1015863 e!837022)))

(assert (=> b!1493899 (= e!837024 e!837022)))

(assert (= (and d!157311 c!138551) b!1493891))

(assert (= (and d!157311 (not c!138551)) b!1493897))

(assert (= (and b!1493897 c!138552) b!1493898))

(assert (= (and b!1493897 (not c!138552)) b!1493893))

(assert (= (and d!157311 c!138553) b!1493895))

(assert (= (and d!157311 (not c!138553)) b!1493892))

(assert (= (and b!1493892 res!1015865) b!1493899))

(assert (= (and b!1493899 (not res!1015863)) b!1493896))

(assert (= (and b!1493896 (not res!1015864)) b!1493894))

(declare-fun m!1377999 () Bool)

(assert (=> b!1493894 m!1377999))

(assert (=> d!157311 m!1377859))

(assert (=> d!157311 m!1377879))

(assert (=> b!1493893 m!1377995))

(assert (=> b!1493893 m!1377995))

(assert (=> b!1493893 m!1377847))

(declare-fun m!1378001 () Bool)

(assert (=> b!1493893 m!1378001))

(assert (=> b!1493899 m!1377999))

(assert (=> b!1493896 m!1377999))

(assert (=> b!1493753 d!157311))

(declare-fun d!157313 () Bool)

(declare-fun res!1015872 () Bool)

(declare-fun e!837036 () Bool)

(assert (=> d!157313 (=> res!1015872 e!837036)))

(assert (=> d!157313 (= res!1015872 (bvsge #b00000000000000000000000000000000 (size!48729 a!2862)))))

(assert (=> d!157313 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34663) e!837036)))

(declare-fun b!1493910 () Bool)

(declare-fun e!837037 () Bool)

(declare-fun contains!9972 (List!34666 (_ BitVec 64)) Bool)

(assert (=> b!1493910 (= e!837037 (contains!9972 Nil!34663 (select (arr!48178 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493911 () Bool)

(declare-fun e!837038 () Bool)

(declare-fun e!837035 () Bool)

(assert (=> b!1493911 (= e!837038 e!837035)))

(declare-fun c!138556 () Bool)

(assert (=> b!1493911 (= c!138556 (validKeyInArray!0 (select (arr!48178 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493912 () Bool)

(assert (=> b!1493912 (= e!837036 e!837038)))

(declare-fun res!1015874 () Bool)

(assert (=> b!1493912 (=> (not res!1015874) (not e!837038))))

(assert (=> b!1493912 (= res!1015874 (not e!837037))))

(declare-fun res!1015873 () Bool)

(assert (=> b!1493912 (=> (not res!1015873) (not e!837037))))

(assert (=> b!1493912 (= res!1015873 (validKeyInArray!0 (select (arr!48178 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493913 () Bool)

(declare-fun call!68031 () Bool)

(assert (=> b!1493913 (= e!837035 call!68031)))

(declare-fun bm!68028 () Bool)

(assert (=> bm!68028 (= call!68031 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138556 (Cons!34662 (select (arr!48178 a!2862) #b00000000000000000000000000000000) Nil!34663) Nil!34663)))))

(declare-fun b!1493914 () Bool)

(assert (=> b!1493914 (= e!837035 call!68031)))

(assert (= (and d!157313 (not res!1015872)) b!1493912))

(assert (= (and b!1493912 res!1015873) b!1493910))

(assert (= (and b!1493912 res!1015874) b!1493911))

(assert (= (and b!1493911 c!138556) b!1493914))

(assert (= (and b!1493911 (not c!138556)) b!1493913))

(assert (= (or b!1493914 b!1493913) bm!68028))

(declare-fun m!1378003 () Bool)

(assert (=> b!1493910 m!1378003))

(assert (=> b!1493910 m!1378003))

(declare-fun m!1378005 () Bool)

(assert (=> b!1493910 m!1378005))

(assert (=> b!1493911 m!1378003))

(assert (=> b!1493911 m!1378003))

(declare-fun m!1378007 () Bool)

(assert (=> b!1493911 m!1378007))

(assert (=> b!1493912 m!1378003))

(assert (=> b!1493912 m!1378003))

(assert (=> b!1493912 m!1378007))

(assert (=> bm!68028 m!1378003))

(declare-fun m!1378009 () Bool)

(assert (=> bm!68028 m!1378009))

(assert (=> b!1493752 d!157313))

(declare-fun b!1493915 () Bool)

(declare-fun e!837040 () SeekEntryResult!12315)

(assert (=> b!1493915 (= e!837040 (Intermediate!12315 true (toIndex!0 lt!651114 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493916 () Bool)

(declare-fun e!837042 () Bool)

(declare-fun e!837041 () Bool)

(assert (=> b!1493916 (= e!837042 e!837041)))

(declare-fun res!1015877 () Bool)

(declare-fun lt!651160 () SeekEntryResult!12315)

(assert (=> b!1493916 (= res!1015877 (and ((_ is Intermediate!12315) lt!651160) (not (undefined!13127 lt!651160)) (bvslt (x!133420 lt!651160) #b01111111111111111111111111111110) (bvsge (x!133420 lt!651160) #b00000000000000000000000000000000) (bvsge (x!133420 lt!651160) #b00000000000000000000000000000000)))))

(assert (=> b!1493916 (=> (not res!1015877) (not e!837041))))

(declare-fun e!837043 () SeekEntryResult!12315)

(declare-fun b!1493917 () Bool)

(assert (=> b!1493917 (= e!837043 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651114 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!651114 lt!651111 mask!2687))))

(declare-fun b!1493918 () Bool)

(assert (=> b!1493918 (and (bvsge (index!51654 lt!651160) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651160) (size!48729 lt!651111)))))

(declare-fun e!837039 () Bool)

(assert (=> b!1493918 (= e!837039 (= (select (arr!48178 lt!651111) (index!51654 lt!651160)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493919 () Bool)

(assert (=> b!1493919 (= e!837042 (bvsge (x!133420 lt!651160) #b01111111111111111111111111111110))))

(declare-fun d!157315 () Bool)

(assert (=> d!157315 e!837042))

(declare-fun c!138559 () Bool)

(assert (=> d!157315 (= c!138559 (and ((_ is Intermediate!12315) lt!651160) (undefined!13127 lt!651160)))))

(assert (=> d!157315 (= lt!651160 e!837040)))

(declare-fun c!138557 () Bool)

(assert (=> d!157315 (= c!138557 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651161 () (_ BitVec 64))

(assert (=> d!157315 (= lt!651161 (select (arr!48178 lt!651111) (toIndex!0 lt!651114 mask!2687)))))

(assert (=> d!157315 (validMask!0 mask!2687)))

(assert (=> d!157315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651114 mask!2687) lt!651114 lt!651111 mask!2687) lt!651160)))

(declare-fun b!1493920 () Bool)

(assert (=> b!1493920 (and (bvsge (index!51654 lt!651160) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651160) (size!48729 lt!651111)))))

(declare-fun res!1015876 () Bool)

(assert (=> b!1493920 (= res!1015876 (= (select (arr!48178 lt!651111) (index!51654 lt!651160)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493920 (=> res!1015876 e!837039)))

(declare-fun b!1493921 () Bool)

(assert (=> b!1493921 (= e!837040 e!837043)))

(declare-fun c!138558 () Bool)

(assert (=> b!1493921 (= c!138558 (or (= lt!651161 lt!651114) (= (bvadd lt!651161 lt!651161) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493922 () Bool)

(assert (=> b!1493922 (= e!837043 (Intermediate!12315 false (toIndex!0 lt!651114 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493923 () Bool)

(assert (=> b!1493923 (and (bvsge (index!51654 lt!651160) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651160) (size!48729 lt!651111)))))

(declare-fun res!1015875 () Bool)

(assert (=> b!1493923 (= res!1015875 (= (select (arr!48178 lt!651111) (index!51654 lt!651160)) lt!651114))))

(assert (=> b!1493923 (=> res!1015875 e!837039)))

(assert (=> b!1493923 (= e!837041 e!837039)))

(assert (= (and d!157315 c!138557) b!1493915))

(assert (= (and d!157315 (not c!138557)) b!1493921))

(assert (= (and b!1493921 c!138558) b!1493922))

(assert (= (and b!1493921 (not c!138558)) b!1493917))

(assert (= (and d!157315 c!138559) b!1493919))

(assert (= (and d!157315 (not c!138559)) b!1493916))

(assert (= (and b!1493916 res!1015877) b!1493923))

(assert (= (and b!1493923 (not res!1015875)) b!1493920))

(assert (= (and b!1493920 (not res!1015876)) b!1493918))

(declare-fun m!1378011 () Bool)

(assert (=> b!1493918 m!1378011))

(assert (=> d!157315 m!1377873))

(declare-fun m!1378013 () Bool)

(assert (=> d!157315 m!1378013))

(assert (=> d!157315 m!1377879))

(assert (=> b!1493917 m!1377873))

(declare-fun m!1378015 () Bool)

(assert (=> b!1493917 m!1378015))

(assert (=> b!1493917 m!1378015))

(declare-fun m!1378017 () Bool)

(assert (=> b!1493917 m!1378017))

(assert (=> b!1493923 m!1378011))

(assert (=> b!1493920 m!1378011))

(assert (=> b!1493749 d!157315))

(declare-fun d!157317 () Bool)

(declare-fun lt!651167 () (_ BitVec 32))

(declare-fun lt!651166 () (_ BitVec 32))

(assert (=> d!157317 (= lt!651167 (bvmul (bvxor lt!651166 (bvlshr lt!651166 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157317 (= lt!651166 ((_ extract 31 0) (bvand (bvxor lt!651114 (bvlshr lt!651114 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157317 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015878 (let ((h!36062 ((_ extract 31 0) (bvand (bvxor lt!651114 (bvlshr lt!651114 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133424 (bvmul (bvxor h!36062 (bvlshr h!36062 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133424 (bvlshr x!133424 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015878 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015878 #b00000000000000000000000000000000))))))

(assert (=> d!157317 (= (toIndex!0 lt!651114 mask!2687) (bvand (bvxor lt!651167 (bvlshr lt!651167 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1493749 d!157317))

(declare-fun d!157319 () Bool)

(assert (=> d!157319 (= (validKeyInArray!0 (select (arr!48178 a!2862) i!1006)) (and (not (= (select (arr!48178 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48178 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1493738 d!157319))

(declare-fun b!1493932 () Bool)

(declare-fun e!837052 () Bool)

(declare-fun e!837050 () Bool)

(assert (=> b!1493932 (= e!837052 e!837050)))

(declare-fun c!138562 () Bool)

(assert (=> b!1493932 (= c!138562 (validKeyInArray!0 (select (arr!48178 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493933 () Bool)

(declare-fun e!837051 () Bool)

(assert (=> b!1493933 (= e!837050 e!837051)))

(declare-fun lt!651175 () (_ BitVec 64))

(assert (=> b!1493933 (= lt!651175 (select (arr!48178 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651174 () Unit!50003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99823 (_ BitVec 64) (_ BitVec 32)) Unit!50003)

(assert (=> b!1493933 (= lt!651174 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651175 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1493933 (arrayContainsKey!0 a!2862 lt!651175 #b00000000000000000000000000000000)))

(declare-fun lt!651176 () Unit!50003)

(assert (=> b!1493933 (= lt!651176 lt!651174)))

(declare-fun res!1015884 () Bool)

(assert (=> b!1493933 (= res!1015884 (= (seekEntryOrOpen!0 (select (arr!48178 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12315 #b00000000000000000000000000000000)))))

(assert (=> b!1493933 (=> (not res!1015884) (not e!837051))))

(declare-fun d!157321 () Bool)

(declare-fun res!1015883 () Bool)

(assert (=> d!157321 (=> res!1015883 e!837052)))

(assert (=> d!157321 (= res!1015883 (bvsge #b00000000000000000000000000000000 (size!48729 a!2862)))))

(assert (=> d!157321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837052)))

(declare-fun b!1493934 () Bool)

(declare-fun call!68034 () Bool)

(assert (=> b!1493934 (= e!837051 call!68034)))

(declare-fun bm!68031 () Bool)

(assert (=> bm!68031 (= call!68034 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1493935 () Bool)

(assert (=> b!1493935 (= e!837050 call!68034)))

(assert (= (and d!157321 (not res!1015883)) b!1493932))

(assert (= (and b!1493932 c!138562) b!1493933))

(assert (= (and b!1493932 (not c!138562)) b!1493935))

(assert (= (and b!1493933 res!1015884) b!1493934))

(assert (= (or b!1493934 b!1493935) bm!68031))

(assert (=> b!1493932 m!1378003))

(assert (=> b!1493932 m!1378003))

(assert (=> b!1493932 m!1378007))

(assert (=> b!1493933 m!1378003))

(declare-fun m!1378019 () Bool)

(assert (=> b!1493933 m!1378019))

(declare-fun m!1378021 () Bool)

(assert (=> b!1493933 m!1378021))

(assert (=> b!1493933 m!1378003))

(declare-fun m!1378023 () Bool)

(assert (=> b!1493933 m!1378023))

(declare-fun m!1378025 () Bool)

(assert (=> bm!68031 m!1378025))

(assert (=> b!1493748 d!157321))

(declare-fun d!157323 () Bool)

(assert (=> d!157323 (= (validKeyInArray!0 (select (arr!48178 a!2862) j!93)) (and (not (= (select (arr!48178 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48178 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1493750 d!157323))

(declare-fun b!1493948 () Bool)

(declare-fun e!837059 () SeekEntryResult!12315)

(assert (=> b!1493948 (= e!837059 (MissingVacant!12315 intermediateAfterIndex!19))))

(declare-fun b!1493949 () Bool)

(declare-fun e!837061 () SeekEntryResult!12315)

(assert (=> b!1493949 (= e!837061 Undefined!12315)))

(declare-fun b!1493950 () Bool)

(declare-fun e!837060 () SeekEntryResult!12315)

(assert (=> b!1493950 (= e!837060 (Found!12315 index!646))))

(declare-fun b!1493951 () Bool)

(declare-fun c!138571 () Bool)

(declare-fun lt!651182 () (_ BitVec 64))

(assert (=> b!1493951 (= c!138571 (= lt!651182 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493951 (= e!837060 e!837059)))

(declare-fun b!1493952 () Bool)

(assert (=> b!1493952 (= e!837059 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!651114 lt!651111 mask!2687))))

(declare-fun b!1493953 () Bool)

(assert (=> b!1493953 (= e!837061 e!837060)))

(declare-fun c!138570 () Bool)

(assert (=> b!1493953 (= c!138570 (= lt!651182 lt!651114))))

(declare-fun d!157325 () Bool)

(declare-fun lt!651181 () SeekEntryResult!12315)

(assert (=> d!157325 (and (or ((_ is Undefined!12315) lt!651181) (not ((_ is Found!12315) lt!651181)) (and (bvsge (index!51653 lt!651181) #b00000000000000000000000000000000) (bvslt (index!51653 lt!651181) (size!48729 lt!651111)))) (or ((_ is Undefined!12315) lt!651181) ((_ is Found!12315) lt!651181) (not ((_ is MissingVacant!12315) lt!651181)) (not (= (index!51655 lt!651181) intermediateAfterIndex!19)) (and (bvsge (index!51655 lt!651181) #b00000000000000000000000000000000) (bvslt (index!51655 lt!651181) (size!48729 lt!651111)))) (or ((_ is Undefined!12315) lt!651181) (ite ((_ is Found!12315) lt!651181) (= (select (arr!48178 lt!651111) (index!51653 lt!651181)) lt!651114) (and ((_ is MissingVacant!12315) lt!651181) (= (index!51655 lt!651181) intermediateAfterIndex!19) (= (select (arr!48178 lt!651111) (index!51655 lt!651181)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157325 (= lt!651181 e!837061)))

(declare-fun c!138569 () Bool)

(assert (=> d!157325 (= c!138569 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157325 (= lt!651182 (select (arr!48178 lt!651111) index!646))))

(assert (=> d!157325 (validMask!0 mask!2687)))

(assert (=> d!157325 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651114 lt!651111 mask!2687) lt!651181)))

(assert (= (and d!157325 c!138569) b!1493949))

(assert (= (and d!157325 (not c!138569)) b!1493953))

(assert (= (and b!1493953 c!138570) b!1493950))

(assert (= (and b!1493953 (not c!138570)) b!1493951))

(assert (= (and b!1493951 c!138571) b!1493948))

(assert (= (and b!1493951 (not c!138571)) b!1493952))

(assert (=> b!1493952 m!1377995))

(assert (=> b!1493952 m!1377995))

(declare-fun m!1378027 () Bool)

(assert (=> b!1493952 m!1378027))

(declare-fun m!1378029 () Bool)

(assert (=> d!157325 m!1378029))

(declare-fun m!1378031 () Bool)

(assert (=> d!157325 m!1378031))

(assert (=> d!157325 m!1377993))

(assert (=> d!157325 m!1377879))

(assert (=> b!1493739 d!157325))

(declare-fun b!1493993 () Bool)

(declare-fun c!138588 () Bool)

(declare-fun lt!651195 () (_ BitVec 64))

(assert (=> b!1493993 (= c!138588 (= lt!651195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837084 () SeekEntryResult!12315)

(declare-fun e!837085 () SeekEntryResult!12315)

(assert (=> b!1493993 (= e!837084 e!837085)))

(declare-fun b!1493994 () Bool)

(declare-fun e!837083 () SeekEntryResult!12315)

(assert (=> b!1493994 (= e!837083 Undefined!12315)))

(declare-fun b!1493995 () Bool)

(declare-fun lt!651196 () SeekEntryResult!12315)

(assert (=> b!1493995 (= e!837085 (MissingZero!12315 (index!51654 lt!651196)))))

(declare-fun d!157333 () Bool)

(declare-fun lt!651197 () SeekEntryResult!12315)

(assert (=> d!157333 (and (or ((_ is Undefined!12315) lt!651197) (not ((_ is Found!12315) lt!651197)) (and (bvsge (index!51653 lt!651197) #b00000000000000000000000000000000) (bvslt (index!51653 lt!651197) (size!48729 lt!651111)))) (or ((_ is Undefined!12315) lt!651197) ((_ is Found!12315) lt!651197) (not ((_ is MissingZero!12315) lt!651197)) (and (bvsge (index!51652 lt!651197) #b00000000000000000000000000000000) (bvslt (index!51652 lt!651197) (size!48729 lt!651111)))) (or ((_ is Undefined!12315) lt!651197) ((_ is Found!12315) lt!651197) ((_ is MissingZero!12315) lt!651197) (not ((_ is MissingVacant!12315) lt!651197)) (and (bvsge (index!51655 lt!651197) #b00000000000000000000000000000000) (bvslt (index!51655 lt!651197) (size!48729 lt!651111)))) (or ((_ is Undefined!12315) lt!651197) (ite ((_ is Found!12315) lt!651197) (= (select (arr!48178 lt!651111) (index!51653 lt!651197)) lt!651114) (ite ((_ is MissingZero!12315) lt!651197) (= (select (arr!48178 lt!651111) (index!51652 lt!651197)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12315) lt!651197) (= (select (arr!48178 lt!651111) (index!51655 lt!651197)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157333 (= lt!651197 e!837083)))

(declare-fun c!138587 () Bool)

(assert (=> d!157333 (= c!138587 (and ((_ is Intermediate!12315) lt!651196) (undefined!13127 lt!651196)))))

(assert (=> d!157333 (= lt!651196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651114 mask!2687) lt!651114 lt!651111 mask!2687))))

(assert (=> d!157333 (validMask!0 mask!2687)))

(assert (=> d!157333 (= (seekEntryOrOpen!0 lt!651114 lt!651111 mask!2687) lt!651197)))

(declare-fun b!1493996 () Bool)

(assert (=> b!1493996 (= e!837084 (Found!12315 (index!51654 lt!651196)))))

(declare-fun b!1493997 () Bool)

(assert (=> b!1493997 (= e!837083 e!837084)))

(assert (=> b!1493997 (= lt!651195 (select (arr!48178 lt!651111) (index!51654 lt!651196)))))

(declare-fun c!138589 () Bool)

(assert (=> b!1493997 (= c!138589 (= lt!651195 lt!651114))))

(declare-fun b!1493998 () Bool)

(assert (=> b!1493998 (= e!837085 (seekKeyOrZeroReturnVacant!0 (x!133420 lt!651196) (index!51654 lt!651196) (index!51654 lt!651196) lt!651114 lt!651111 mask!2687))))

(assert (= (and d!157333 c!138587) b!1493994))

(assert (= (and d!157333 (not c!138587)) b!1493997))

(assert (= (and b!1493997 c!138589) b!1493996))

(assert (= (and b!1493997 (not c!138589)) b!1493993))

(assert (= (and b!1493993 c!138588) b!1493995))

(assert (= (and b!1493993 (not c!138588)) b!1493998))

(assert (=> d!157333 m!1377879))

(assert (=> d!157333 m!1377873))

(assert (=> d!157333 m!1377873))

(assert (=> d!157333 m!1377875))

(declare-fun m!1378041 () Bool)

(assert (=> d!157333 m!1378041))

(declare-fun m!1378043 () Bool)

(assert (=> d!157333 m!1378043))

(declare-fun m!1378045 () Bool)

(assert (=> d!157333 m!1378045))

(declare-fun m!1378047 () Bool)

(assert (=> b!1493997 m!1378047))

(declare-fun m!1378049 () Bool)

(assert (=> b!1493998 m!1378049))

(assert (=> b!1493739 d!157333))

(declare-fun e!837087 () SeekEntryResult!12315)

(declare-fun b!1493999 () Bool)

(assert (=> b!1493999 (= e!837087 (Intermediate!12315 true (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494000 () Bool)

(declare-fun e!837089 () Bool)

(declare-fun e!837088 () Bool)

(assert (=> b!1494000 (= e!837089 e!837088)))

(declare-fun res!1015897 () Bool)

(declare-fun lt!651202 () SeekEntryResult!12315)

(assert (=> b!1494000 (= res!1015897 (and ((_ is Intermediate!12315) lt!651202) (not (undefined!13127 lt!651202)) (bvslt (x!133420 lt!651202) #b01111111111111111111111111111110) (bvsge (x!133420 lt!651202) #b00000000000000000000000000000000) (bvsge (x!133420 lt!651202) #b00000000000000000000000000000000)))))

(assert (=> b!1494000 (=> (not res!1015897) (not e!837088))))

(declare-fun b!1494001 () Bool)

(declare-fun e!837090 () SeekEntryResult!12315)

(assert (=> b!1494001 (= e!837090 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48178 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494002 () Bool)

(assert (=> b!1494002 (and (bvsge (index!51654 lt!651202) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651202) (size!48729 a!2862)))))

(declare-fun e!837086 () Bool)

(assert (=> b!1494002 (= e!837086 (= (select (arr!48178 a!2862) (index!51654 lt!651202)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494003 () Bool)

(assert (=> b!1494003 (= e!837089 (bvsge (x!133420 lt!651202) #b01111111111111111111111111111110))))

(declare-fun d!157339 () Bool)

(assert (=> d!157339 e!837089))

(declare-fun c!138592 () Bool)

(assert (=> d!157339 (= c!138592 (and ((_ is Intermediate!12315) lt!651202) (undefined!13127 lt!651202)))))

(assert (=> d!157339 (= lt!651202 e!837087)))

(declare-fun c!138590 () Bool)

(assert (=> d!157339 (= c!138590 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651203 () (_ BitVec 64))

(assert (=> d!157339 (= lt!651203 (select (arr!48178 a!2862) (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687)))))

(assert (=> d!157339 (validMask!0 mask!2687)))

(assert (=> d!157339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687) (select (arr!48178 a!2862) j!93) a!2862 mask!2687) lt!651202)))

(declare-fun b!1494004 () Bool)

(assert (=> b!1494004 (and (bvsge (index!51654 lt!651202) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651202) (size!48729 a!2862)))))

(declare-fun res!1015896 () Bool)

(assert (=> b!1494004 (= res!1015896 (= (select (arr!48178 a!2862) (index!51654 lt!651202)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494004 (=> res!1015896 e!837086)))

(declare-fun b!1494005 () Bool)

(assert (=> b!1494005 (= e!837087 e!837090)))

(declare-fun c!138591 () Bool)

(assert (=> b!1494005 (= c!138591 (or (= lt!651203 (select (arr!48178 a!2862) j!93)) (= (bvadd lt!651203 lt!651203) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494006 () Bool)

(assert (=> b!1494006 (= e!837090 (Intermediate!12315 false (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494007 () Bool)

(assert (=> b!1494007 (and (bvsge (index!51654 lt!651202) #b00000000000000000000000000000000) (bvslt (index!51654 lt!651202) (size!48729 a!2862)))))

(declare-fun res!1015895 () Bool)

(assert (=> b!1494007 (= res!1015895 (= (select (arr!48178 a!2862) (index!51654 lt!651202)) (select (arr!48178 a!2862) j!93)))))

(assert (=> b!1494007 (=> res!1015895 e!837086)))

(assert (=> b!1494007 (= e!837088 e!837086)))

(assert (= (and d!157339 c!138590) b!1493999))

(assert (= (and d!157339 (not c!138590)) b!1494005))

(assert (= (and b!1494005 c!138591) b!1494006))

(assert (= (and b!1494005 (not c!138591)) b!1494001))

(assert (= (and d!157339 c!138592) b!1494003))

(assert (= (and d!157339 (not c!138592)) b!1494000))

(assert (= (and b!1494000 res!1015897) b!1494007))

(assert (= (and b!1494007 (not res!1015895)) b!1494004))

(assert (= (and b!1494004 (not res!1015896)) b!1494002))

(declare-fun m!1378051 () Bool)

(assert (=> b!1494002 m!1378051))

(assert (=> d!157339 m!1377869))

(declare-fun m!1378053 () Bool)

(assert (=> d!157339 m!1378053))

(assert (=> d!157339 m!1377879))

(assert (=> b!1494001 m!1377869))

(declare-fun m!1378055 () Bool)

(assert (=> b!1494001 m!1378055))

(assert (=> b!1494001 m!1378055))

(assert (=> b!1494001 m!1377847))

(declare-fun m!1378057 () Bool)

(assert (=> b!1494001 m!1378057))

(assert (=> b!1494007 m!1378051))

(assert (=> b!1494004 m!1378051))

(assert (=> b!1493746 d!157339))

(declare-fun d!157343 () Bool)

(declare-fun lt!651209 () (_ BitVec 32))

(declare-fun lt!651208 () (_ BitVec 32))

(assert (=> d!157343 (= lt!651209 (bvmul (bvxor lt!651208 (bvlshr lt!651208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157343 (= lt!651208 ((_ extract 31 0) (bvand (bvxor (select (arr!48178 a!2862) j!93) (bvlshr (select (arr!48178 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157343 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015878 (let ((h!36062 ((_ extract 31 0) (bvand (bvxor (select (arr!48178 a!2862) j!93) (bvlshr (select (arr!48178 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133424 (bvmul (bvxor h!36062 (bvlshr h!36062 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133424 (bvlshr x!133424 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015878 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015878 #b00000000000000000000000000000000))))))

(assert (=> d!157343 (= (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687) (bvand (bvxor lt!651209 (bvlshr lt!651209 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1493746 d!157343))

(declare-fun d!157345 () Bool)

(assert (=> d!157345 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127212 d!157345))

(declare-fun d!157351 () Bool)

(assert (=> d!157351 (= (array_inv!37459 a!2862) (bvsge (size!48729 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127212 d!157351))

(declare-fun b!1494032 () Bool)

(declare-fun c!138600 () Bool)

(declare-fun lt!651210 () (_ BitVec 64))

(assert (=> b!1494032 (= c!138600 (= lt!651210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837109 () SeekEntryResult!12315)

(declare-fun e!837110 () SeekEntryResult!12315)

(assert (=> b!1494032 (= e!837109 e!837110)))

(declare-fun b!1494033 () Bool)

(declare-fun e!837108 () SeekEntryResult!12315)

(assert (=> b!1494033 (= e!837108 Undefined!12315)))

(declare-fun b!1494034 () Bool)

(declare-fun lt!651211 () SeekEntryResult!12315)

(assert (=> b!1494034 (= e!837110 (MissingZero!12315 (index!51654 lt!651211)))))

(declare-fun d!157353 () Bool)

(declare-fun lt!651212 () SeekEntryResult!12315)

(assert (=> d!157353 (and (or ((_ is Undefined!12315) lt!651212) (not ((_ is Found!12315) lt!651212)) (and (bvsge (index!51653 lt!651212) #b00000000000000000000000000000000) (bvslt (index!51653 lt!651212) (size!48729 a!2862)))) (or ((_ is Undefined!12315) lt!651212) ((_ is Found!12315) lt!651212) (not ((_ is MissingZero!12315) lt!651212)) (and (bvsge (index!51652 lt!651212) #b00000000000000000000000000000000) (bvslt (index!51652 lt!651212) (size!48729 a!2862)))) (or ((_ is Undefined!12315) lt!651212) ((_ is Found!12315) lt!651212) ((_ is MissingZero!12315) lt!651212) (not ((_ is MissingVacant!12315) lt!651212)) (and (bvsge (index!51655 lt!651212) #b00000000000000000000000000000000) (bvslt (index!51655 lt!651212) (size!48729 a!2862)))) (or ((_ is Undefined!12315) lt!651212) (ite ((_ is Found!12315) lt!651212) (= (select (arr!48178 a!2862) (index!51653 lt!651212)) (select (arr!48178 a!2862) j!93)) (ite ((_ is MissingZero!12315) lt!651212) (= (select (arr!48178 a!2862) (index!51652 lt!651212)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12315) lt!651212) (= (select (arr!48178 a!2862) (index!51655 lt!651212)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157353 (= lt!651212 e!837108)))

(declare-fun c!138599 () Bool)

(assert (=> d!157353 (= c!138599 (and ((_ is Intermediate!12315) lt!651211) (undefined!13127 lt!651211)))))

(assert (=> d!157353 (= lt!651211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48178 a!2862) j!93) mask!2687) (select (arr!48178 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157353 (validMask!0 mask!2687)))

(assert (=> d!157353 (= (seekEntryOrOpen!0 (select (arr!48178 a!2862) j!93) a!2862 mask!2687) lt!651212)))

(declare-fun b!1494035 () Bool)

(assert (=> b!1494035 (= e!837109 (Found!12315 (index!51654 lt!651211)))))

(declare-fun b!1494036 () Bool)

(assert (=> b!1494036 (= e!837108 e!837109)))

(assert (=> b!1494036 (= lt!651210 (select (arr!48178 a!2862) (index!51654 lt!651211)))))

(declare-fun c!138601 () Bool)

(assert (=> b!1494036 (= c!138601 (= lt!651210 (select (arr!48178 a!2862) j!93)))))

(declare-fun b!1494037 () Bool)

(assert (=> b!1494037 (= e!837110 (seekKeyOrZeroReturnVacant!0 (x!133420 lt!651211) (index!51654 lt!651211) (index!51654 lt!651211) (select (arr!48178 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!157353 c!138599) b!1494033))

(assert (= (and d!157353 (not c!138599)) b!1494036))

(assert (= (and b!1494036 c!138601) b!1494035))

(assert (= (and b!1494036 (not c!138601)) b!1494032))

(assert (= (and b!1494032 c!138600) b!1494034))

(assert (= (and b!1494032 (not c!138600)) b!1494037))

(assert (=> d!157353 m!1377879))

(assert (=> d!157353 m!1377847))

(assert (=> d!157353 m!1377869))

(assert (=> d!157353 m!1377869))

(assert (=> d!157353 m!1377847))

(assert (=> d!157353 m!1377871))

(declare-fun m!1378073 () Bool)

(assert (=> d!157353 m!1378073))

(declare-fun m!1378075 () Bool)

(assert (=> d!157353 m!1378075))

(declare-fun m!1378077 () Bool)

(assert (=> d!157353 m!1378077))

(declare-fun m!1378079 () Bool)

(assert (=> b!1494036 m!1378079))

(assert (=> b!1494037 m!1377847))

(declare-fun m!1378081 () Bool)

(assert (=> b!1494037 m!1378081))

(assert (=> b!1493754 d!157353))

(declare-fun d!157355 () Bool)

(declare-fun lt!651225 () (_ BitVec 32))

(assert (=> d!157355 (and (bvsge lt!651225 #b00000000000000000000000000000000) (bvslt lt!651225 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157355 (= lt!651225 (choose!52 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> d!157355 (validMask!0 mask!2687)))

(assert (=> d!157355 (= (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!651225)))

(declare-fun bs!42865 () Bool)

(assert (= bs!42865 d!157355))

(declare-fun m!1378083 () Bool)

(assert (=> bs!42865 m!1378083))

(assert (=> bs!42865 m!1377879))

(assert (=> b!1493745 d!157355))

(declare-fun b!1494060 () Bool)

(declare-fun e!837129 () Bool)

(declare-fun e!837127 () Bool)

(assert (=> b!1494060 (= e!837129 e!837127)))

(declare-fun c!138610 () Bool)

(assert (=> b!1494060 (= c!138610 (validKeyInArray!0 (select (arr!48178 a!2862) j!93)))))

(declare-fun b!1494061 () Bool)

(declare-fun e!837128 () Bool)

(assert (=> b!1494061 (= e!837127 e!837128)))

(declare-fun lt!651227 () (_ BitVec 64))

(assert (=> b!1494061 (= lt!651227 (select (arr!48178 a!2862) j!93))))

(declare-fun lt!651226 () Unit!50003)

(assert (=> b!1494061 (= lt!651226 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651227 j!93))))

(assert (=> b!1494061 (arrayContainsKey!0 a!2862 lt!651227 #b00000000000000000000000000000000)))

(declare-fun lt!651228 () Unit!50003)

(assert (=> b!1494061 (= lt!651228 lt!651226)))

(declare-fun res!1015919 () Bool)

(assert (=> b!1494061 (= res!1015919 (= (seekEntryOrOpen!0 (select (arr!48178 a!2862) j!93) a!2862 mask!2687) (Found!12315 j!93)))))

(assert (=> b!1494061 (=> (not res!1015919) (not e!837128))))

(declare-fun d!157357 () Bool)

(declare-fun res!1015918 () Bool)

(assert (=> d!157357 (=> res!1015918 e!837129)))

(assert (=> d!157357 (= res!1015918 (bvsge j!93 (size!48729 a!2862)))))

(assert (=> d!157357 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837129)))

(declare-fun b!1494062 () Bool)

(declare-fun call!68040 () Bool)

(assert (=> b!1494062 (= e!837128 call!68040)))

(declare-fun bm!68037 () Bool)

(assert (=> bm!68037 (= call!68040 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494063 () Bool)

(assert (=> b!1494063 (= e!837127 call!68040)))

(assert (= (and d!157357 (not res!1015918)) b!1494060))

(assert (= (and b!1494060 c!138610) b!1494061))

(assert (= (and b!1494060 (not c!138610)) b!1494063))

(assert (= (and b!1494061 res!1015919) b!1494062))

(assert (= (or b!1494062 b!1494063) bm!68037))

(assert (=> b!1494060 m!1377847))

(assert (=> b!1494060 m!1377847))

(assert (=> b!1494060 m!1377885))

(assert (=> b!1494061 m!1377847))

(declare-fun m!1378085 () Bool)

(assert (=> b!1494061 m!1378085))

(declare-fun m!1378087 () Bool)

(assert (=> b!1494061 m!1378087))

(assert (=> b!1494061 m!1377847))

(assert (=> b!1494061 m!1377883))

(declare-fun m!1378089 () Bool)

(assert (=> bm!68037 m!1378089))

(assert (=> b!1493755 d!157357))

(declare-fun d!157359 () Bool)

(assert (=> d!157359 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651242 () Unit!50003)

(declare-fun choose!38 (array!99823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50003)

(assert (=> d!157359 (= lt!651242 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157359 (validMask!0 mask!2687)))

(assert (=> d!157359 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651242)))

(declare-fun bs!42866 () Bool)

(assert (= bs!42866 d!157359))

(assert (=> bs!42866 m!1377861))

(declare-fun m!1378113 () Bool)

(assert (=> bs!42866 m!1378113))

(assert (=> bs!42866 m!1377879))

(assert (=> b!1493755 d!157359))

(check-sat (not b!1493917) (not b!1494061) (not b!1493910) (not d!157333) (not d!157353) (not d!157325) (not d!157311) (not b!1493952) (not bm!68037) (not b!1494060) (not d!157315) (not b!1493998) (not b!1493911) (not b!1493912) (not b!1494037) (not bm!68028) (not d!157359) (not bm!68031) (not b!1493893) (not d!157339) (not b!1494001) (not d!157309) (not d!157355) (not b!1493933) (not b!1493932) (not b!1493884))
(check-sat)
