; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126182 () Bool)

(assert start!126182)

(declare-fun b!1477894 () Bool)

(declare-fun res!1003983 () Bool)

(declare-fun e!829073 () Bool)

(assert (=> b!1477894 (=> (not res!1003983) (not e!829073))))

(declare-datatypes ((array!99288 0))(
  ( (array!99289 (arr!47923 (Array (_ BitVec 32) (_ BitVec 64))) (size!48473 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99288)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99288 (_ BitVec 32)) Bool)

(assert (=> b!1477894 (= res!1003983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477895 () Bool)

(declare-fun e!829075 () Bool)

(assert (=> b!1477895 (= e!829073 e!829075)))

(declare-fun res!1003981 () Bool)

(assert (=> b!1477895 (=> (not res!1003981) (not e!829075))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477895 (= res!1003981 (= (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645500 () array!99288)

(assert (=> b!1477895 (= lt!645500 (array!99289 (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48473 a!2862)))))

(declare-fun b!1477896 () Bool)

(declare-fun res!1003980 () Bool)

(declare-fun e!829072 () Bool)

(assert (=> b!1477896 (=> (not res!1003980) (not e!829072))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12163 0))(
  ( (MissingZero!12163 (index!51044 (_ BitVec 32))) (Found!12163 (index!51045 (_ BitVec 32))) (Intermediate!12163 (undefined!12975 Bool) (index!51046 (_ BitVec 32)) (x!132634 (_ BitVec 32))) (Undefined!12163) (MissingVacant!12163 (index!51047 (_ BitVec 32))) )
))
(declare-fun lt!645502 () SeekEntryResult!12163)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99288 (_ BitVec 32)) SeekEntryResult!12163)

(assert (=> b!1477896 (= res!1003980 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47923 a!2862) j!93) a!2862 mask!2687) lt!645502))))

(declare-fun b!1477897 () Bool)

(declare-fun e!829071 () Bool)

(assert (=> b!1477897 (= e!829072 e!829071)))

(declare-fun res!1003972 () Bool)

(assert (=> b!1477897 (=> (not res!1003972) (not e!829071))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!645503 () SeekEntryResult!12163)

(assert (=> b!1477897 (= res!1003972 (= lt!645503 (Intermediate!12163 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645501 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477897 (= lt!645503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645501 mask!2687) lt!645501 lt!645500 mask!2687))))

(assert (=> b!1477897 (= lt!645501 (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477898 () Bool)

(declare-fun res!1003971 () Bool)

(assert (=> b!1477898 (=> (not res!1003971) (not e!829073))))

(assert (=> b!1477898 (= res!1003971 (and (= (size!48473 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48473 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48473 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477899 () Bool)

(declare-fun res!1003974 () Bool)

(assert (=> b!1477899 (=> (not res!1003974) (not e!829073))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477899 (= res!1003974 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48473 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48473 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48473 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477900 () Bool)

(declare-fun res!1003984 () Bool)

(assert (=> b!1477900 (=> (not res!1003984) (not e!829073))))

(declare-datatypes ((List!34424 0))(
  ( (Nil!34421) (Cons!34420 (h!35788 (_ BitVec 64)) (t!49118 List!34424)) )
))
(declare-fun arrayNoDuplicates!0 (array!99288 (_ BitVec 32) List!34424) Bool)

(assert (=> b!1477900 (= res!1003984 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34421))))

(declare-fun res!1003978 () Bool)

(assert (=> start!126182 (=> (not res!1003978) (not e!829073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126182 (= res!1003978 (validMask!0 mask!2687))))

(assert (=> start!126182 e!829073))

(assert (=> start!126182 true))

(declare-fun array_inv!36951 (array!99288) Bool)

(assert (=> start!126182 (array_inv!36951 a!2862)))

(declare-fun b!1477901 () Bool)

(declare-fun e!829077 () Bool)

(declare-fun e!829076 () Bool)

(assert (=> b!1477901 (= e!829077 e!829076)))

(declare-fun res!1003973 () Bool)

(assert (=> b!1477901 (=> res!1003973 e!829076)))

(assert (=> b!1477901 (= res!1003973 (or (and (= (select (arr!47923 a!2862) index!646) (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47923 a!2862) index!646) (select (arr!47923 a!2862) j!93))) (not (= (select (arr!47923 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477902 () Bool)

(declare-fun res!1003975 () Bool)

(assert (=> b!1477902 (=> (not res!1003975) (not e!829071))))

(assert (=> b!1477902 (= res!1003975 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477903 () Bool)

(assert (=> b!1477903 (= e!829071 (not true))))

(assert (=> b!1477903 e!829077))

(declare-fun res!1003969 () Bool)

(assert (=> b!1477903 (=> (not res!1003969) (not e!829077))))

(declare-fun lt!645504 () SeekEntryResult!12163)

(assert (=> b!1477903 (= res!1003969 (and (= lt!645504 (Found!12163 j!93)) (or (= (select (arr!47923 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47923 a!2862) intermediateBeforeIndex!19) (select (arr!47923 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99288 (_ BitVec 32)) SeekEntryResult!12163)

(assert (=> b!1477903 (= lt!645504 (seekEntryOrOpen!0 (select (arr!47923 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477903 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49666 0))(
  ( (Unit!49667) )
))
(declare-fun lt!645499 () Unit!49666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49666)

(assert (=> b!1477903 (= lt!645499 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477904 () Bool)

(declare-fun res!1003970 () Bool)

(assert (=> b!1477904 (=> (not res!1003970) (not e!829071))))

(declare-fun e!829079 () Bool)

(assert (=> b!1477904 (= res!1003970 e!829079)))

(declare-fun c!136482 () Bool)

(assert (=> b!1477904 (= c!136482 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477905 () Bool)

(declare-fun e!829074 () Bool)

(assert (=> b!1477905 (= e!829076 e!829074)))

(declare-fun res!1003982 () Bool)

(assert (=> b!1477905 (=> (not res!1003982) (not e!829074))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99288 (_ BitVec 32)) SeekEntryResult!12163)

(assert (=> b!1477905 (= res!1003982 (= lt!645504 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47923 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477906 () Bool)

(assert (=> b!1477906 (= e!829074 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477907 () Bool)

(assert (=> b!1477907 (= e!829079 (= lt!645503 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645501 lt!645500 mask!2687)))))

(declare-fun b!1477908 () Bool)

(declare-fun res!1003976 () Bool)

(assert (=> b!1477908 (=> (not res!1003976) (not e!829073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477908 (= res!1003976 (validKeyInArray!0 (select (arr!47923 a!2862) i!1006)))))

(declare-fun b!1477909 () Bool)

(assert (=> b!1477909 (= e!829079 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645501 lt!645500 mask!2687) (seekEntryOrOpen!0 lt!645501 lt!645500 mask!2687)))))

(declare-fun b!1477910 () Bool)

(declare-fun res!1003977 () Bool)

(assert (=> b!1477910 (=> (not res!1003977) (not e!829073))))

(assert (=> b!1477910 (= res!1003977 (validKeyInArray!0 (select (arr!47923 a!2862) j!93)))))

(declare-fun b!1477911 () Bool)

(assert (=> b!1477911 (= e!829075 e!829072)))

(declare-fun res!1003979 () Bool)

(assert (=> b!1477911 (=> (not res!1003979) (not e!829072))))

(assert (=> b!1477911 (= res!1003979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47923 a!2862) j!93) mask!2687) (select (arr!47923 a!2862) j!93) a!2862 mask!2687) lt!645502))))

(assert (=> b!1477911 (= lt!645502 (Intermediate!12163 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126182 res!1003978) b!1477898))

(assert (= (and b!1477898 res!1003971) b!1477908))

(assert (= (and b!1477908 res!1003976) b!1477910))

(assert (= (and b!1477910 res!1003977) b!1477894))

(assert (= (and b!1477894 res!1003983) b!1477900))

(assert (= (and b!1477900 res!1003984) b!1477899))

(assert (= (and b!1477899 res!1003974) b!1477895))

(assert (= (and b!1477895 res!1003981) b!1477911))

(assert (= (and b!1477911 res!1003979) b!1477896))

(assert (= (and b!1477896 res!1003980) b!1477897))

(assert (= (and b!1477897 res!1003972) b!1477904))

(assert (= (and b!1477904 c!136482) b!1477907))

(assert (= (and b!1477904 (not c!136482)) b!1477909))

(assert (= (and b!1477904 res!1003970) b!1477902))

(assert (= (and b!1477902 res!1003975) b!1477903))

(assert (= (and b!1477903 res!1003969) b!1477901))

(assert (= (and b!1477901 (not res!1003973)) b!1477905))

(assert (= (and b!1477905 res!1003982) b!1477906))

(declare-fun m!1363827 () Bool)

(assert (=> b!1477905 m!1363827))

(assert (=> b!1477905 m!1363827))

(declare-fun m!1363829 () Bool)

(assert (=> b!1477905 m!1363829))

(declare-fun m!1363831 () Bool)

(assert (=> start!126182 m!1363831))

(declare-fun m!1363833 () Bool)

(assert (=> start!126182 m!1363833))

(declare-fun m!1363835 () Bool)

(assert (=> b!1477894 m!1363835))

(declare-fun m!1363837 () Bool)

(assert (=> b!1477900 m!1363837))

(declare-fun m!1363839 () Bool)

(assert (=> b!1477897 m!1363839))

(assert (=> b!1477897 m!1363839))

(declare-fun m!1363841 () Bool)

(assert (=> b!1477897 m!1363841))

(declare-fun m!1363843 () Bool)

(assert (=> b!1477897 m!1363843))

(declare-fun m!1363845 () Bool)

(assert (=> b!1477897 m!1363845))

(assert (=> b!1477910 m!1363827))

(assert (=> b!1477910 m!1363827))

(declare-fun m!1363847 () Bool)

(assert (=> b!1477910 m!1363847))

(assert (=> b!1477896 m!1363827))

(assert (=> b!1477896 m!1363827))

(declare-fun m!1363849 () Bool)

(assert (=> b!1477896 m!1363849))

(declare-fun m!1363851 () Bool)

(assert (=> b!1477903 m!1363851))

(declare-fun m!1363853 () Bool)

(assert (=> b!1477903 m!1363853))

(assert (=> b!1477903 m!1363827))

(declare-fun m!1363855 () Bool)

(assert (=> b!1477903 m!1363855))

(declare-fun m!1363857 () Bool)

(assert (=> b!1477903 m!1363857))

(assert (=> b!1477903 m!1363827))

(assert (=> b!1477911 m!1363827))

(assert (=> b!1477911 m!1363827))

(declare-fun m!1363859 () Bool)

(assert (=> b!1477911 m!1363859))

(assert (=> b!1477911 m!1363859))

(assert (=> b!1477911 m!1363827))

(declare-fun m!1363861 () Bool)

(assert (=> b!1477911 m!1363861))

(declare-fun m!1363863 () Bool)

(assert (=> b!1477907 m!1363863))

(declare-fun m!1363865 () Bool)

(assert (=> b!1477908 m!1363865))

(assert (=> b!1477908 m!1363865))

(declare-fun m!1363867 () Bool)

(assert (=> b!1477908 m!1363867))

(assert (=> b!1477895 m!1363843))

(declare-fun m!1363869 () Bool)

(assert (=> b!1477895 m!1363869))

(declare-fun m!1363871 () Bool)

(assert (=> b!1477909 m!1363871))

(declare-fun m!1363873 () Bool)

(assert (=> b!1477909 m!1363873))

(declare-fun m!1363875 () Bool)

(assert (=> b!1477901 m!1363875))

(assert (=> b!1477901 m!1363843))

(declare-fun m!1363877 () Bool)

(assert (=> b!1477901 m!1363877))

(assert (=> b!1477901 m!1363827))

(push 1)

