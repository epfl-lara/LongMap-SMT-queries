; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124686 () Bool)

(assert start!124686)

(declare-fun b!1444949 () Bool)

(declare-fun res!976885 () Bool)

(declare-fun e!814044 () Bool)

(assert (=> b!1444949 (=> (not res!976885) (not e!814044))))

(declare-datatypes ((array!98134 0))(
  ( (array!98135 (arr!47355 (Array (_ BitVec 32) (_ BitVec 64))) (size!47905 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98134)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98134 (_ BitVec 32)) Bool)

(assert (=> b!1444949 (= res!976885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444950 () Bool)

(declare-fun res!976889 () Bool)

(declare-fun e!814045 () Bool)

(assert (=> b!1444950 (=> (not res!976889) (not e!814045))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444950 (= res!976889 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444951 () Bool)

(declare-fun res!976891 () Bool)

(declare-fun e!814043 () Bool)

(assert (=> b!1444951 (=> (not res!976891) (not e!814043))))

(declare-datatypes ((SeekEntryResult!11607 0))(
  ( (MissingZero!11607 (index!48820 (_ BitVec 32))) (Found!11607 (index!48821 (_ BitVec 32))) (Intermediate!11607 (undefined!12419 Bool) (index!48822 (_ BitVec 32)) (x!130512 (_ BitVec 32))) (Undefined!11607) (MissingVacant!11607 (index!48823 (_ BitVec 32))) )
))
(declare-fun lt!634352 () SeekEntryResult!11607)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98134 (_ BitVec 32)) SeekEntryResult!11607)

(assert (=> b!1444951 (= res!976891 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47355 a!2862) j!93) a!2862 mask!2687) lt!634352))))

(declare-fun b!1444952 () Bool)

(declare-fun res!976893 () Bool)

(assert (=> b!1444952 (=> (not res!976893) (not e!814045))))

(declare-fun e!814041 () Bool)

(assert (=> b!1444952 (= res!976893 e!814041)))

(declare-fun c!133545 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444952 (= c!133545 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444954 () Bool)

(declare-fun e!814042 () Bool)

(assert (=> b!1444954 (= e!814044 e!814042)))

(declare-fun res!976888 () Bool)

(assert (=> b!1444954 (=> (not res!976888) (not e!814042))))

(assert (=> b!1444954 (= res!976888 (= (select (store (arr!47355 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634354 () array!98134)

(assert (=> b!1444954 (= lt!634354 (array!98135 (store (arr!47355 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47905 a!2862)))))

(declare-fun b!1444955 () Bool)

(declare-fun res!976886 () Bool)

(assert (=> b!1444955 (=> (not res!976886) (not e!814044))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444955 (= res!976886 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47905 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47905 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47905 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!814040 () Bool)

(declare-fun b!1444956 () Bool)

(assert (=> b!1444956 (= e!814040 (or (= (select (arr!47355 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47355 a!2862) intermediateBeforeIndex!19) (select (arr!47355 a!2862) j!93))))))

(declare-fun b!1444957 () Bool)

(declare-fun res!976884 () Bool)

(assert (=> b!1444957 (=> (not res!976884) (not e!814044))))

(assert (=> b!1444957 (= res!976884 (and (= (size!47905 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47905 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47905 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!634353 () SeekEntryResult!11607)

(declare-fun lt!634356 () (_ BitVec 64))

(declare-fun b!1444958 () Bool)

(assert (=> b!1444958 (= e!814041 (= lt!634353 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634356 lt!634354 mask!2687)))))

(declare-fun b!1444959 () Bool)

(assert (=> b!1444959 (= e!814045 (not true))))

(assert (=> b!1444959 e!814040))

(declare-fun res!976894 () Bool)

(assert (=> b!1444959 (=> (not res!976894) (not e!814040))))

(assert (=> b!1444959 (= res!976894 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48710 0))(
  ( (Unit!48711) )
))
(declare-fun lt!634355 () Unit!48710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48710)

(assert (=> b!1444959 (= lt!634355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444960 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98134 (_ BitVec 32)) SeekEntryResult!11607)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98134 (_ BitVec 32)) SeekEntryResult!11607)

(assert (=> b!1444960 (= e!814041 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634356 lt!634354 mask!2687) (seekEntryOrOpen!0 lt!634356 lt!634354 mask!2687)))))

(declare-fun b!1444961 () Bool)

(assert (=> b!1444961 (= e!814043 e!814045)))

(declare-fun res!976892 () Bool)

(assert (=> b!1444961 (=> (not res!976892) (not e!814045))))

(assert (=> b!1444961 (= res!976892 (= lt!634353 (Intermediate!11607 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444961 (= lt!634353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634356 mask!2687) lt!634356 lt!634354 mask!2687))))

(assert (=> b!1444961 (= lt!634356 (select (store (arr!47355 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444962 () Bool)

(declare-fun res!976887 () Bool)

(assert (=> b!1444962 (=> (not res!976887) (not e!814040))))

(assert (=> b!1444962 (= res!976887 (= (seekEntryOrOpen!0 (select (arr!47355 a!2862) j!93) a!2862 mask!2687) (Found!11607 j!93)))))

(declare-fun b!1444963 () Bool)

(declare-fun res!976882 () Bool)

(assert (=> b!1444963 (=> (not res!976882) (not e!814044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444963 (= res!976882 (validKeyInArray!0 (select (arr!47355 a!2862) j!93)))))

(declare-fun res!976880 () Bool)

(assert (=> start!124686 (=> (not res!976880) (not e!814044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124686 (= res!976880 (validMask!0 mask!2687))))

(assert (=> start!124686 e!814044))

(assert (=> start!124686 true))

(declare-fun array_inv!36383 (array!98134) Bool)

(assert (=> start!124686 (array_inv!36383 a!2862)))

(declare-fun b!1444953 () Bool)

(declare-fun res!976883 () Bool)

(assert (=> b!1444953 (=> (not res!976883) (not e!814044))))

(assert (=> b!1444953 (= res!976883 (validKeyInArray!0 (select (arr!47355 a!2862) i!1006)))))

(declare-fun b!1444964 () Bool)

(assert (=> b!1444964 (= e!814042 e!814043)))

(declare-fun res!976881 () Bool)

(assert (=> b!1444964 (=> (not res!976881) (not e!814043))))

(assert (=> b!1444964 (= res!976881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47355 a!2862) j!93) mask!2687) (select (arr!47355 a!2862) j!93) a!2862 mask!2687) lt!634352))))

(assert (=> b!1444964 (= lt!634352 (Intermediate!11607 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444965 () Bool)

(declare-fun res!976890 () Bool)

(assert (=> b!1444965 (=> (not res!976890) (not e!814044))))

(declare-datatypes ((List!33856 0))(
  ( (Nil!33853) (Cons!33852 (h!35202 (_ BitVec 64)) (t!48550 List!33856)) )
))
(declare-fun arrayNoDuplicates!0 (array!98134 (_ BitVec 32) List!33856) Bool)

(assert (=> b!1444965 (= res!976890 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33853))))

(assert (= (and start!124686 res!976880) b!1444957))

(assert (= (and b!1444957 res!976884) b!1444953))

(assert (= (and b!1444953 res!976883) b!1444963))

(assert (= (and b!1444963 res!976882) b!1444949))

(assert (= (and b!1444949 res!976885) b!1444965))

(assert (= (and b!1444965 res!976890) b!1444955))

(assert (= (and b!1444955 res!976886) b!1444954))

(assert (= (and b!1444954 res!976888) b!1444964))

(assert (= (and b!1444964 res!976881) b!1444951))

(assert (= (and b!1444951 res!976891) b!1444961))

(assert (= (and b!1444961 res!976892) b!1444952))

(assert (= (and b!1444952 c!133545) b!1444958))

(assert (= (and b!1444952 (not c!133545)) b!1444960))

(assert (= (and b!1444952 res!976893) b!1444950))

(assert (= (and b!1444950 res!976889) b!1444959))

(assert (= (and b!1444959 res!976894) b!1444962))

(assert (= (and b!1444962 res!976887) b!1444956))

(declare-fun m!1333943 () Bool)

(assert (=> b!1444964 m!1333943))

(assert (=> b!1444964 m!1333943))

(declare-fun m!1333945 () Bool)

(assert (=> b!1444964 m!1333945))

(assert (=> b!1444964 m!1333945))

(assert (=> b!1444964 m!1333943))

(declare-fun m!1333947 () Bool)

(assert (=> b!1444964 m!1333947))

(declare-fun m!1333949 () Bool)

(assert (=> b!1444956 m!1333949))

(assert (=> b!1444956 m!1333943))

(declare-fun m!1333951 () Bool)

(assert (=> b!1444961 m!1333951))

(assert (=> b!1444961 m!1333951))

(declare-fun m!1333953 () Bool)

(assert (=> b!1444961 m!1333953))

(declare-fun m!1333955 () Bool)

(assert (=> b!1444961 m!1333955))

(declare-fun m!1333957 () Bool)

(assert (=> b!1444961 m!1333957))

(assert (=> b!1444963 m!1333943))

(assert (=> b!1444963 m!1333943))

(declare-fun m!1333959 () Bool)

(assert (=> b!1444963 m!1333959))

(declare-fun m!1333961 () Bool)

(assert (=> b!1444965 m!1333961))

(declare-fun m!1333963 () Bool)

(assert (=> b!1444958 m!1333963))

(assert (=> b!1444951 m!1333943))

(assert (=> b!1444951 m!1333943))

(declare-fun m!1333965 () Bool)

(assert (=> b!1444951 m!1333965))

(declare-fun m!1333967 () Bool)

(assert (=> b!1444959 m!1333967))

(declare-fun m!1333969 () Bool)

(assert (=> b!1444959 m!1333969))

(declare-fun m!1333971 () Bool)

(assert (=> start!124686 m!1333971))

(declare-fun m!1333973 () Bool)

(assert (=> start!124686 m!1333973))

(declare-fun m!1333975 () Bool)

(assert (=> b!1444949 m!1333975))

(assert (=> b!1444954 m!1333955))

(declare-fun m!1333977 () Bool)

(assert (=> b!1444954 m!1333977))

(declare-fun m!1333979 () Bool)

(assert (=> b!1444960 m!1333979))

(declare-fun m!1333981 () Bool)

(assert (=> b!1444960 m!1333981))

(declare-fun m!1333983 () Bool)

(assert (=> b!1444953 m!1333983))

(assert (=> b!1444953 m!1333983))

(declare-fun m!1333985 () Bool)

(assert (=> b!1444953 m!1333985))

(assert (=> b!1444962 m!1333943))

(assert (=> b!1444962 m!1333943))

(declare-fun m!1333987 () Bool)

(assert (=> b!1444962 m!1333987))

(check-sat (not b!1444964) (not b!1444960) (not b!1444949) (not b!1444953) (not b!1444962) (not b!1444963) (not b!1444961) (not b!1444959) (not b!1444951) (not start!124686) (not b!1444965) (not b!1444958))
(check-sat)
