; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125198 () Bool)

(assert start!125198)

(declare-fun b!1460186 () Bool)

(declare-fun e!821076 () Bool)

(declare-fun e!821074 () Bool)

(assert (=> b!1460186 (= e!821076 e!821074)))

(declare-fun res!989990 () Bool)

(assert (=> b!1460186 (=> res!989990 e!821074)))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1460186 (= res!989990 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!11863 0))(
  ( (MissingZero!11863 (index!49844 (_ BitVec 32))) (Found!11863 (index!49845 (_ BitVec 32))) (Intermediate!11863 (undefined!12675 Bool) (index!49846 (_ BitVec 32)) (x!131448 (_ BitVec 32))) (Undefined!11863) (MissingVacant!11863 (index!49847 (_ BitVec 32))) )
))
(declare-fun lt!639752 () SeekEntryResult!11863)

(declare-fun lt!639749 () SeekEntryResult!11863)

(assert (=> b!1460186 (= lt!639752 lt!639749)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((Unit!49222 0))(
  ( (Unit!49223) )
))
(declare-fun lt!639746 () Unit!49222)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!639747 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98646 0))(
  ( (array!98647 (arr!47611 (Array (_ BitVec 32) (_ BitVec 64))) (size!48161 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98646)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49222)

(assert (=> b!1460186 (= lt!639746 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639747 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1460187 () Bool)

(declare-fun res!990007 () Bool)

(assert (=> b!1460187 (=> res!990007 e!821076)))

(assert (=> b!1460187 (= res!990007 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1460188 () Bool)

(declare-fun res!989995 () Bool)

(declare-fun e!821071 () Bool)

(assert (=> b!1460188 (=> (not res!989995) (not e!821071))))

(assert (=> b!1460188 (= res!989995 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460189 () Bool)

(declare-fun e!821072 () Bool)

(assert (=> b!1460189 (= e!821072 e!821076)))

(declare-fun res!990003 () Bool)

(assert (=> b!1460189 (=> res!990003 e!821076)))

(assert (=> b!1460189 (= res!990003 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639747 #b00000000000000000000000000000000) (bvsge lt!639747 (size!48161 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460189 (= lt!639747 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639748 () array!98646)

(declare-fun lt!639745 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98646 (_ BitVec 32)) SeekEntryResult!11863)

(assert (=> b!1460189 (= lt!639749 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639745 lt!639748 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98646 (_ BitVec 32)) SeekEntryResult!11863)

(assert (=> b!1460189 (= lt!639749 (seekEntryOrOpen!0 lt!639745 lt!639748 mask!2687))))

(declare-fun b!1460191 () Bool)

(declare-fun res!989989 () Bool)

(declare-fun e!821070 () Bool)

(assert (=> b!1460191 (=> (not res!989989) (not e!821070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98646 (_ BitVec 32)) Bool)

(assert (=> b!1460191 (= res!989989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460192 () Bool)

(declare-fun e!821077 () Bool)

(assert (=> b!1460192 (= e!821070 e!821077)))

(declare-fun res!989999 () Bool)

(assert (=> b!1460192 (=> (not res!989999) (not e!821077))))

(assert (=> b!1460192 (= res!989999 (= (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460192 (= lt!639748 (array!98647 (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48161 a!2862)))))

(declare-fun b!1460193 () Bool)

(declare-fun e!821073 () Bool)

(assert (=> b!1460193 (= e!821073 e!821071)))

(declare-fun res!990005 () Bool)

(assert (=> b!1460193 (=> (not res!990005) (not e!821071))))

(declare-fun lt!639750 () SeekEntryResult!11863)

(assert (=> b!1460193 (= res!990005 (= lt!639750 (Intermediate!11863 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98646 (_ BitVec 32)) SeekEntryResult!11863)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460193 (= lt!639750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639745 mask!2687) lt!639745 lt!639748 mask!2687))))

(assert (=> b!1460193 (= lt!639745 (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460194 () Bool)

(declare-fun res!990006 () Bool)

(assert (=> b!1460194 (=> (not res!990006) (not e!821071))))

(declare-fun e!821078 () Bool)

(assert (=> b!1460194 (= res!990006 e!821078)))

(declare-fun c!134609 () Bool)

(assert (=> b!1460194 (= c!134609 (bvsle x!665 intermediateAfterX!19))))

(declare-fun e!821069 () Bool)

(declare-fun b!1460195 () Bool)

(assert (=> b!1460195 (= e!821069 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639747 intermediateAfterIndex!19 lt!639745 lt!639748 mask!2687) lt!639749)))))

(declare-fun b!1460196 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460196 (= e!821074 (validKeyInArray!0 lt!639745))))

(declare-fun b!1460197 () Bool)

(declare-fun res!990002 () Bool)

(assert (=> b!1460197 (=> res!990002 e!821076)))

(assert (=> b!1460197 (= res!990002 e!821069)))

(declare-fun c!134610 () Bool)

(assert (=> b!1460197 (= c!134610 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1460198 () Bool)

(declare-fun res!989994 () Bool)

(assert (=> b!1460198 (=> (not res!989994) (not e!821070))))

(declare-datatypes ((List!34112 0))(
  ( (Nil!34109) (Cons!34108 (h!35458 (_ BitVec 64)) (t!48806 List!34112)) )
))
(declare-fun arrayNoDuplicates!0 (array!98646 (_ BitVec 32) List!34112) Bool)

(assert (=> b!1460198 (= res!989994 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34109))))

(declare-fun b!1460199 () Bool)

(declare-fun res!989998 () Bool)

(assert (=> b!1460199 (=> res!989998 e!821076)))

(declare-fun lt!639751 () SeekEntryResult!11863)

(assert (=> b!1460199 (= res!989998 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639747 (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!639751)))))

(declare-fun b!1460200 () Bool)

(assert (=> b!1460200 (= e!821078 (= lt!639750 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639745 lt!639748 mask!2687)))))

(declare-fun b!1460201 () Bool)

(declare-fun res!990001 () Bool)

(assert (=> b!1460201 (=> (not res!990001) (not e!821070))))

(assert (=> b!1460201 (= res!990001 (validKeyInArray!0 (select (arr!47611 a!2862) j!93)))))

(declare-fun b!1460202 () Bool)

(assert (=> b!1460202 (= e!821069 (not (= lt!639750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639747 lt!639745 lt!639748 mask!2687))))))

(declare-fun b!1460203 () Bool)

(declare-fun res!989992 () Bool)

(assert (=> b!1460203 (=> (not res!989992) (not e!821070))))

(assert (=> b!1460203 (= res!989992 (validKeyInArray!0 (select (arr!47611 a!2862) i!1006)))))

(declare-fun b!1460204 () Bool)

(declare-fun res!989996 () Bool)

(assert (=> b!1460204 (=> (not res!989996) (not e!821073))))

(assert (=> b!1460204 (= res!989996 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!639751))))

(declare-fun b!1460190 () Bool)

(declare-fun res!989997 () Bool)

(assert (=> b!1460190 (=> (not res!989997) (not e!821070))))

(assert (=> b!1460190 (= res!989997 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48161 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48161 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48161 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!989993 () Bool)

(assert (=> start!125198 (=> (not res!989993) (not e!821070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125198 (= res!989993 (validMask!0 mask!2687))))

(assert (=> start!125198 e!821070))

(assert (=> start!125198 true))

(declare-fun array_inv!36639 (array!98646) Bool)

(assert (=> start!125198 (array_inv!36639 a!2862)))

(declare-fun b!1460205 () Bool)

(assert (=> b!1460205 (= e!821071 (not e!821072))))

(declare-fun res!990004 () Bool)

(assert (=> b!1460205 (=> res!990004 e!821072)))

(assert (=> b!1460205 (= res!990004 (or (and (= (select (arr!47611 a!2862) index!646) (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47611 a!2862) index!646) (select (arr!47611 a!2862) j!93))) (= (select (arr!47611 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1460205 (and (= lt!639752 (Found!11863 j!93)) (or (= (select (arr!47611 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47611 a!2862) intermediateBeforeIndex!19) (select (arr!47611 a!2862) j!93))) (let ((bdg!53565 (select (store (arr!47611 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47611 a!2862) index!646) bdg!53565) (= (select (arr!47611 a!2862) index!646) (select (arr!47611 a!2862) j!93))) (= (select (arr!47611 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53565 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1460205 (= lt!639752 (seekEntryOrOpen!0 (select (arr!47611 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1460205 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639753 () Unit!49222)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49222)

(assert (=> b!1460205 (= lt!639753 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460206 () Bool)

(assert (=> b!1460206 (= e!821077 e!821073)))

(declare-fun res!989991 () Bool)

(assert (=> b!1460206 (=> (not res!989991) (not e!821073))))

(assert (=> b!1460206 (= res!989991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47611 a!2862) j!93) mask!2687) (select (arr!47611 a!2862) j!93) a!2862 mask!2687) lt!639751))))

(assert (=> b!1460206 (= lt!639751 (Intermediate!11863 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460207 () Bool)

(declare-fun res!990000 () Bool)

(assert (=> b!1460207 (=> (not res!990000) (not e!821070))))

(assert (=> b!1460207 (= res!990000 (and (= (size!48161 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48161 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48161 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460208 () Bool)

(assert (=> b!1460208 (= e!821078 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639745 lt!639748 mask!2687) (seekEntryOrOpen!0 lt!639745 lt!639748 mask!2687)))))

(assert (= (and start!125198 res!989993) b!1460207))

(assert (= (and b!1460207 res!990000) b!1460203))

(assert (= (and b!1460203 res!989992) b!1460201))

(assert (= (and b!1460201 res!990001) b!1460191))

(assert (= (and b!1460191 res!989989) b!1460198))

(assert (= (and b!1460198 res!989994) b!1460190))

(assert (= (and b!1460190 res!989997) b!1460192))

(assert (= (and b!1460192 res!989999) b!1460206))

(assert (= (and b!1460206 res!989991) b!1460204))

(assert (= (and b!1460204 res!989996) b!1460193))

(assert (= (and b!1460193 res!990005) b!1460194))

(assert (= (and b!1460194 c!134609) b!1460200))

(assert (= (and b!1460194 (not c!134609)) b!1460208))

(assert (= (and b!1460194 res!990006) b!1460188))

(assert (= (and b!1460188 res!989995) b!1460205))

(assert (= (and b!1460205 (not res!990004)) b!1460189))

(assert (= (and b!1460189 (not res!990003)) b!1460199))

(assert (= (and b!1460199 (not res!989998)) b!1460197))

(assert (= (and b!1460197 c!134610) b!1460202))

(assert (= (and b!1460197 (not c!134610)) b!1460195))

(assert (= (and b!1460197 (not res!990002)) b!1460187))

(assert (= (and b!1460187 (not res!990007)) b!1460186))

(assert (= (and b!1460186 (not res!989990)) b!1460196))

(declare-fun m!1347875 () Bool)

(assert (=> b!1460192 m!1347875))

(declare-fun m!1347877 () Bool)

(assert (=> b!1460192 m!1347877))

(declare-fun m!1347879 () Bool)

(assert (=> b!1460198 m!1347879))

(declare-fun m!1347881 () Bool)

(assert (=> b!1460206 m!1347881))

(assert (=> b!1460206 m!1347881))

(declare-fun m!1347883 () Bool)

(assert (=> b!1460206 m!1347883))

(assert (=> b!1460206 m!1347883))

(assert (=> b!1460206 m!1347881))

(declare-fun m!1347885 () Bool)

(assert (=> b!1460206 m!1347885))

(declare-fun m!1347887 () Bool)

(assert (=> b!1460186 m!1347887))

(declare-fun m!1347889 () Bool)

(assert (=> b!1460191 m!1347889))

(declare-fun m!1347891 () Bool)

(assert (=> b!1460200 m!1347891))

(declare-fun m!1347893 () Bool)

(assert (=> b!1460189 m!1347893))

(declare-fun m!1347895 () Bool)

(assert (=> b!1460189 m!1347895))

(declare-fun m!1347897 () Bool)

(assert (=> b!1460189 m!1347897))

(declare-fun m!1347899 () Bool)

(assert (=> start!125198 m!1347899))

(declare-fun m!1347901 () Bool)

(assert (=> start!125198 m!1347901))

(assert (=> b!1460201 m!1347881))

(assert (=> b!1460201 m!1347881))

(declare-fun m!1347903 () Bool)

(assert (=> b!1460201 m!1347903))

(assert (=> b!1460199 m!1347881))

(assert (=> b!1460199 m!1347881))

(declare-fun m!1347905 () Bool)

(assert (=> b!1460199 m!1347905))

(declare-fun m!1347907 () Bool)

(assert (=> b!1460195 m!1347907))

(assert (=> b!1460208 m!1347895))

(assert (=> b!1460208 m!1347897))

(declare-fun m!1347909 () Bool)

(assert (=> b!1460203 m!1347909))

(assert (=> b!1460203 m!1347909))

(declare-fun m!1347911 () Bool)

(assert (=> b!1460203 m!1347911))

(declare-fun m!1347913 () Bool)

(assert (=> b!1460202 m!1347913))

(declare-fun m!1347915 () Bool)

(assert (=> b!1460205 m!1347915))

(assert (=> b!1460205 m!1347875))

(declare-fun m!1347917 () Bool)

(assert (=> b!1460205 m!1347917))

(declare-fun m!1347919 () Bool)

(assert (=> b!1460205 m!1347919))

(declare-fun m!1347921 () Bool)

(assert (=> b!1460205 m!1347921))

(assert (=> b!1460205 m!1347881))

(declare-fun m!1347923 () Bool)

(assert (=> b!1460205 m!1347923))

(declare-fun m!1347925 () Bool)

(assert (=> b!1460205 m!1347925))

(assert (=> b!1460205 m!1347881))

(declare-fun m!1347927 () Bool)

(assert (=> b!1460196 m!1347927))

(declare-fun m!1347929 () Bool)

(assert (=> b!1460193 m!1347929))

(assert (=> b!1460193 m!1347929))

(declare-fun m!1347931 () Bool)

(assert (=> b!1460193 m!1347931))

(assert (=> b!1460193 m!1347875))

(declare-fun m!1347933 () Bool)

(assert (=> b!1460193 m!1347933))

(assert (=> b!1460204 m!1347881))

(assert (=> b!1460204 m!1347881))

(declare-fun m!1347935 () Bool)

(assert (=> b!1460204 m!1347935))

(push 1)

(assert (not b!1460200))

