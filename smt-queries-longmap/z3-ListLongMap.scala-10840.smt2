; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126888 () Bool)

(assert start!126888)

(declare-fun b!1490788 () Bool)

(declare-fun res!1014035 () Bool)

(declare-fun e!835341 () Bool)

(assert (=> b!1490788 (=> (not res!1014035) (not e!835341))))

(declare-datatypes ((array!99661 0))(
  ( (array!99662 (arr!48102 (Array (_ BitVec 32) (_ BitVec 64))) (size!48652 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99661)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99661 (_ BitVec 32)) Bool)

(assert (=> b!1490788 (= res!1014035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490789 () Bool)

(declare-fun e!835339 () Bool)

(assert (=> b!1490789 (= e!835341 e!835339)))

(declare-fun res!1014030 () Bool)

(assert (=> b!1490789 (=> (not res!1014030) (not e!835339))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490789 (= res!1014030 (= (select (store (arr!48102 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650061 () array!99661)

(assert (=> b!1490789 (= lt!650061 (array!99662 (store (arr!48102 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48652 a!2862)))))

(declare-fun b!1490790 () Bool)

(declare-fun res!1014037 () Bool)

(assert (=> b!1490790 (=> (not res!1014037) (not e!835341))))

(declare-datatypes ((List!34603 0))(
  ( (Nil!34600) (Cons!34599 (h!35982 (_ BitVec 64)) (t!49297 List!34603)) )
))
(declare-fun arrayNoDuplicates!0 (array!99661 (_ BitVec 32) List!34603) Bool)

(assert (=> b!1490790 (= res!1014037 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34600))))

(declare-fun b!1490791 () Bool)

(declare-fun e!835343 () Bool)

(assert (=> b!1490791 (= e!835339 e!835343)))

(declare-fun res!1014029 () Bool)

(assert (=> b!1490791 (=> (not res!1014029) (not e!835343))))

(declare-datatypes ((SeekEntryResult!12342 0))(
  ( (MissingZero!12342 (index!51760 (_ BitVec 32))) (Found!12342 (index!51761 (_ BitVec 32))) (Intermediate!12342 (undefined!13154 Bool) (index!51762 (_ BitVec 32)) (x!133350 (_ BitVec 32))) (Undefined!12342) (MissingVacant!12342 (index!51763 (_ BitVec 32))) )
))
(declare-fun lt!650059 () SeekEntryResult!12342)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99661 (_ BitVec 32)) SeekEntryResult!12342)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490791 (= res!1014029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48102 a!2862) j!93) mask!2687) (select (arr!48102 a!2862) j!93) a!2862 mask!2687) lt!650059))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490791 (= lt!650059 (Intermediate!12342 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1014031 () Bool)

(assert (=> start!126888 (=> (not res!1014031) (not e!835341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126888 (= res!1014031 (validMask!0 mask!2687))))

(assert (=> start!126888 e!835341))

(assert (=> start!126888 true))

(declare-fun array_inv!37130 (array!99661) Bool)

(assert (=> start!126888 (array_inv!37130 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!835336 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!650063 () SeekEntryResult!12342)

(declare-fun b!1490792 () Bool)

(declare-fun lt!650064 () (_ BitVec 64))

(assert (=> b!1490792 (= e!835336 (= lt!650063 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650064 lt!650061 mask!2687)))))

(declare-fun b!1490793 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99661 (_ BitVec 32)) SeekEntryResult!12342)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99661 (_ BitVec 32)) SeekEntryResult!12342)

(assert (=> b!1490793 (= e!835336 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650064 lt!650061 mask!2687) (seekEntryOrOpen!0 lt!650064 lt!650061 mask!2687)))))

(declare-fun e!835337 () Bool)

(declare-fun b!1490794 () Bool)

(assert (=> b!1490794 (= e!835337 (or (= (select (arr!48102 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48102 a!2862) intermediateBeforeIndex!19) (select (arr!48102 a!2862) j!93))))))

(declare-fun b!1490795 () Bool)

(declare-fun e!835342 () Bool)

(declare-fun e!835338 () Bool)

(assert (=> b!1490795 (= e!835342 (not e!835338))))

(declare-fun res!1014039 () Bool)

(assert (=> b!1490795 (=> res!1014039 e!835338)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490795 (= res!1014039 (or (and (= (select (arr!48102 a!2862) index!646) (select (store (arr!48102 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48102 a!2862) index!646) (select (arr!48102 a!2862) j!93))) (= (select (arr!48102 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490795 e!835337))

(declare-fun res!1014038 () Bool)

(assert (=> b!1490795 (=> (not res!1014038) (not e!835337))))

(assert (=> b!1490795 (= res!1014038 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50024 0))(
  ( (Unit!50025) )
))
(declare-fun lt!650062 () Unit!50024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50024)

(assert (=> b!1490795 (= lt!650062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490796 () Bool)

(declare-fun res!1014028 () Bool)

(assert (=> b!1490796 (=> (not res!1014028) (not e!835343))))

(assert (=> b!1490796 (= res!1014028 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48102 a!2862) j!93) a!2862 mask!2687) lt!650059))))

(declare-fun b!1490797 () Bool)

(declare-fun res!1014042 () Bool)

(assert (=> b!1490797 (=> (not res!1014042) (not e!835341))))

(assert (=> b!1490797 (= res!1014042 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48652 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48652 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48652 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490798 () Bool)

(declare-fun res!1014041 () Bool)

(assert (=> b!1490798 (=> (not res!1014041) (not e!835341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490798 (= res!1014041 (validKeyInArray!0 (select (arr!48102 a!2862) i!1006)))))

(declare-fun b!1490799 () Bool)

(assert (=> b!1490799 (= e!835338 true)))

(declare-fun lt!650060 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490799 (= lt!650060 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490800 () Bool)

(declare-fun res!1014033 () Bool)

(assert (=> b!1490800 (=> (not res!1014033) (not e!835341))))

(assert (=> b!1490800 (= res!1014033 (and (= (size!48652 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48652 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48652 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490801 () Bool)

(assert (=> b!1490801 (= e!835343 e!835342)))

(declare-fun res!1014034 () Bool)

(assert (=> b!1490801 (=> (not res!1014034) (not e!835342))))

(assert (=> b!1490801 (= res!1014034 (= lt!650063 (Intermediate!12342 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490801 (= lt!650063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650064 mask!2687) lt!650064 lt!650061 mask!2687))))

(assert (=> b!1490801 (= lt!650064 (select (store (arr!48102 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490802 () Bool)

(declare-fun res!1014032 () Bool)

(assert (=> b!1490802 (=> (not res!1014032) (not e!835342))))

(assert (=> b!1490802 (= res!1014032 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490803 () Bool)

(declare-fun res!1014036 () Bool)

(assert (=> b!1490803 (=> (not res!1014036) (not e!835342))))

(assert (=> b!1490803 (= res!1014036 e!835336)))

(declare-fun c!137907 () Bool)

(assert (=> b!1490803 (= c!137907 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490804 () Bool)

(declare-fun res!1014043 () Bool)

(assert (=> b!1490804 (=> (not res!1014043) (not e!835337))))

(assert (=> b!1490804 (= res!1014043 (= (seekEntryOrOpen!0 (select (arr!48102 a!2862) j!93) a!2862 mask!2687) (Found!12342 j!93)))))

(declare-fun b!1490805 () Bool)

(declare-fun res!1014040 () Bool)

(assert (=> b!1490805 (=> (not res!1014040) (not e!835341))))

(assert (=> b!1490805 (= res!1014040 (validKeyInArray!0 (select (arr!48102 a!2862) j!93)))))

(assert (= (and start!126888 res!1014031) b!1490800))

(assert (= (and b!1490800 res!1014033) b!1490798))

(assert (= (and b!1490798 res!1014041) b!1490805))

(assert (= (and b!1490805 res!1014040) b!1490788))

(assert (= (and b!1490788 res!1014035) b!1490790))

(assert (= (and b!1490790 res!1014037) b!1490797))

(assert (= (and b!1490797 res!1014042) b!1490789))

(assert (= (and b!1490789 res!1014030) b!1490791))

(assert (= (and b!1490791 res!1014029) b!1490796))

(assert (= (and b!1490796 res!1014028) b!1490801))

(assert (= (and b!1490801 res!1014034) b!1490803))

(assert (= (and b!1490803 c!137907) b!1490792))

(assert (= (and b!1490803 (not c!137907)) b!1490793))

(assert (= (and b!1490803 res!1014036) b!1490802))

(assert (= (and b!1490802 res!1014032) b!1490795))

(assert (= (and b!1490795 res!1014038) b!1490804))

(assert (= (and b!1490804 res!1014043) b!1490794))

(assert (= (and b!1490795 (not res!1014039)) b!1490799))

(declare-fun m!1374935 () Bool)

(assert (=> b!1490801 m!1374935))

(assert (=> b!1490801 m!1374935))

(declare-fun m!1374937 () Bool)

(assert (=> b!1490801 m!1374937))

(declare-fun m!1374939 () Bool)

(assert (=> b!1490801 m!1374939))

(declare-fun m!1374941 () Bool)

(assert (=> b!1490801 m!1374941))

(declare-fun m!1374943 () Bool)

(assert (=> b!1490796 m!1374943))

(assert (=> b!1490796 m!1374943))

(declare-fun m!1374945 () Bool)

(assert (=> b!1490796 m!1374945))

(assert (=> b!1490791 m!1374943))

(assert (=> b!1490791 m!1374943))

(declare-fun m!1374947 () Bool)

(assert (=> b!1490791 m!1374947))

(assert (=> b!1490791 m!1374947))

(assert (=> b!1490791 m!1374943))

(declare-fun m!1374949 () Bool)

(assert (=> b!1490791 m!1374949))

(declare-fun m!1374951 () Bool)

(assert (=> b!1490798 m!1374951))

(assert (=> b!1490798 m!1374951))

(declare-fun m!1374953 () Bool)

(assert (=> b!1490798 m!1374953))

(declare-fun m!1374955 () Bool)

(assert (=> b!1490799 m!1374955))

(assert (=> b!1490789 m!1374939))

(declare-fun m!1374957 () Bool)

(assert (=> b!1490789 m!1374957))

(declare-fun m!1374959 () Bool)

(assert (=> b!1490790 m!1374959))

(assert (=> b!1490804 m!1374943))

(assert (=> b!1490804 m!1374943))

(declare-fun m!1374961 () Bool)

(assert (=> b!1490804 m!1374961))

(assert (=> b!1490805 m!1374943))

(assert (=> b!1490805 m!1374943))

(declare-fun m!1374963 () Bool)

(assert (=> b!1490805 m!1374963))

(declare-fun m!1374965 () Bool)

(assert (=> start!126888 m!1374965))

(declare-fun m!1374967 () Bool)

(assert (=> start!126888 m!1374967))

(declare-fun m!1374969 () Bool)

(assert (=> b!1490788 m!1374969))

(declare-fun m!1374971 () Bool)

(assert (=> b!1490795 m!1374971))

(assert (=> b!1490795 m!1374939))

(declare-fun m!1374973 () Bool)

(assert (=> b!1490795 m!1374973))

(declare-fun m!1374975 () Bool)

(assert (=> b!1490795 m!1374975))

(declare-fun m!1374977 () Bool)

(assert (=> b!1490795 m!1374977))

(assert (=> b!1490795 m!1374943))

(declare-fun m!1374979 () Bool)

(assert (=> b!1490793 m!1374979))

(declare-fun m!1374981 () Bool)

(assert (=> b!1490793 m!1374981))

(declare-fun m!1374983 () Bool)

(assert (=> b!1490794 m!1374983))

(assert (=> b!1490794 m!1374943))

(declare-fun m!1374985 () Bool)

(assert (=> b!1490792 m!1374985))

(check-sat (not b!1490798) (not start!126888) (not b!1490796) (not b!1490799) (not b!1490801) (not b!1490804) (not b!1490793) (not b!1490790) (not b!1490795) (not b!1490788) (not b!1490791) (not b!1490805) (not b!1490792))
(check-sat)
