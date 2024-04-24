; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123748 () Bool)

(assert start!123748)

(declare-fun b!1433060 () Bool)

(declare-fun e!809154 () Bool)

(declare-fun e!809157 () Bool)

(assert (=> b!1433060 (= e!809154 (not e!809157))))

(declare-fun res!966100 () Bool)

(assert (=> b!1433060 (=> res!966100 e!809157)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97601 0))(
  ( (array!97602 (arr!47104 (Array (_ BitVec 32) (_ BitVec 64))) (size!47655 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97601)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433060 (= res!966100 (or (= (select (arr!47104 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47104 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47104 a!2831) index!585) (select (arr!47104 a!2831) j!81)) (= (select (store (arr!47104 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809155 () Bool)

(assert (=> b!1433060 e!809155))

(declare-fun res!966097 () Bool)

(assert (=> b!1433060 (=> (not res!966097) (not e!809155))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97601 (_ BitVec 32)) Bool)

(assert (=> b!1433060 (= res!966097 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48347 0))(
  ( (Unit!48348) )
))
(declare-fun lt!630776 () Unit!48347)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48347)

(assert (=> b!1433060 (= lt!630776 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433061 () Bool)

(declare-fun res!966090 () Bool)

(assert (=> b!1433061 (=> (not res!966090) (not e!809154))))

(declare-datatypes ((SeekEntryResult!11285 0))(
  ( (MissingZero!11285 (index!47532 (_ BitVec 32))) (Found!11285 (index!47533 (_ BitVec 32))) (Intermediate!11285 (undefined!12097 Bool) (index!47534 (_ BitVec 32)) (x!129343 (_ BitVec 32))) (Undefined!11285) (MissingVacant!11285 (index!47535 (_ BitVec 32))) )
))
(declare-fun lt!630775 () SeekEntryResult!11285)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97601 (_ BitVec 32)) SeekEntryResult!11285)

(assert (=> b!1433061 (= res!966090 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!630775))))

(declare-fun b!1433062 () Bool)

(declare-fun res!966099 () Bool)

(declare-fun e!809156 () Bool)

(assert (=> b!1433062 (=> (not res!966099) (not e!809156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433062 (= res!966099 (validKeyInArray!0 (select (arr!47104 a!2831) j!81)))))

(declare-fun b!1433063 () Bool)

(declare-fun res!966089 () Bool)

(assert (=> b!1433063 (=> (not res!966089) (not e!809154))))

(declare-fun lt!630771 () (_ BitVec 64))

(declare-fun lt!630774 () array!97601)

(declare-fun lt!630772 () SeekEntryResult!11285)

(assert (=> b!1433063 (= res!966089 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630771 lt!630774 mask!2608) lt!630772))))

(declare-fun b!1433064 () Bool)

(declare-fun res!966088 () Bool)

(assert (=> b!1433064 (=> (not res!966088) (not e!809154))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433064 (= res!966088 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433065 () Bool)

(declare-fun res!966093 () Bool)

(assert (=> b!1433065 (=> (not res!966093) (not e!809156))))

(assert (=> b!1433065 (= res!966093 (validKeyInArray!0 (select (arr!47104 a!2831) i!982)))))

(declare-fun res!966096 () Bool)

(assert (=> start!123748 (=> (not res!966096) (not e!809156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123748 (= res!966096 (validMask!0 mask!2608))))

(assert (=> start!123748 e!809156))

(assert (=> start!123748 true))

(declare-fun array_inv!36385 (array!97601) Bool)

(assert (=> start!123748 (array_inv!36385 a!2831)))

(declare-fun b!1433066 () Bool)

(declare-fun e!809159 () Bool)

(assert (=> b!1433066 (= e!809159 e!809154)))

(declare-fun res!966092 () Bool)

(assert (=> b!1433066 (=> (not res!966092) (not e!809154))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433066 (= res!966092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630771 mask!2608) lt!630771 lt!630774 mask!2608) lt!630772))))

(assert (=> b!1433066 (= lt!630772 (Intermediate!11285 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433066 (= lt!630771 (select (store (arr!47104 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433066 (= lt!630774 (array!97602 (store (arr!47104 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47655 a!2831)))))

(declare-fun b!1433067 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97601 (_ BitVec 32)) SeekEntryResult!11285)

(assert (=> b!1433067 (= e!809155 (= (seekEntryOrOpen!0 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) (Found!11285 j!81)))))

(declare-fun b!1433068 () Bool)

(declare-fun res!966091 () Bool)

(assert (=> b!1433068 (=> (not res!966091) (not e!809156))))

(assert (=> b!1433068 (= res!966091 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47655 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47655 a!2831))))))

(declare-fun b!1433069 () Bool)

(declare-fun res!966098 () Bool)

(assert (=> b!1433069 (=> (not res!966098) (not e!809156))))

(assert (=> b!1433069 (= res!966098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433070 () Bool)

(declare-fun res!966087 () Bool)

(assert (=> b!1433070 (=> (not res!966087) (not e!809156))))

(assert (=> b!1433070 (= res!966087 (and (= (size!47655 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47655 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47655 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433071 () Bool)

(assert (=> b!1433071 (= e!809157 true)))

(declare-fun lt!630773 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433071 (= lt!630773 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1433072 () Bool)

(assert (=> b!1433072 (= e!809156 e!809159)))

(declare-fun res!966095 () Bool)

(assert (=> b!1433072 (=> (not res!966095) (not e!809159))))

(assert (=> b!1433072 (= res!966095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608) (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!630775))))

(assert (=> b!1433072 (= lt!630775 (Intermediate!11285 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433073 () Bool)

(declare-fun res!966094 () Bool)

(assert (=> b!1433073 (=> (not res!966094) (not e!809156))))

(declare-datatypes ((List!33601 0))(
  ( (Nil!33598) (Cons!33597 (h!34931 (_ BitVec 64)) (t!48287 List!33601)) )
))
(declare-fun arrayNoDuplicates!0 (array!97601 (_ BitVec 32) List!33601) Bool)

(assert (=> b!1433073 (= res!966094 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33598))))

(assert (= (and start!123748 res!966096) b!1433070))

(assert (= (and b!1433070 res!966087) b!1433065))

(assert (= (and b!1433065 res!966093) b!1433062))

(assert (= (and b!1433062 res!966099) b!1433069))

(assert (= (and b!1433069 res!966098) b!1433073))

(assert (= (and b!1433073 res!966094) b!1433068))

(assert (= (and b!1433068 res!966091) b!1433072))

(assert (= (and b!1433072 res!966095) b!1433066))

(assert (= (and b!1433066 res!966092) b!1433061))

(assert (= (and b!1433061 res!966090) b!1433063))

(assert (= (and b!1433063 res!966089) b!1433064))

(assert (= (and b!1433064 res!966088) b!1433060))

(assert (= (and b!1433060 res!966097) b!1433067))

(assert (= (and b!1433060 (not res!966100)) b!1433071))

(declare-fun m!1322935 () Bool)

(assert (=> start!123748 m!1322935))

(declare-fun m!1322937 () Bool)

(assert (=> start!123748 m!1322937))

(declare-fun m!1322939 () Bool)

(assert (=> b!1433071 m!1322939))

(declare-fun m!1322941 () Bool)

(assert (=> b!1433065 m!1322941))

(assert (=> b!1433065 m!1322941))

(declare-fun m!1322943 () Bool)

(assert (=> b!1433065 m!1322943))

(declare-fun m!1322945 () Bool)

(assert (=> b!1433067 m!1322945))

(assert (=> b!1433067 m!1322945))

(declare-fun m!1322947 () Bool)

(assert (=> b!1433067 m!1322947))

(assert (=> b!1433061 m!1322945))

(assert (=> b!1433061 m!1322945))

(declare-fun m!1322949 () Bool)

(assert (=> b!1433061 m!1322949))

(declare-fun m!1322951 () Bool)

(assert (=> b!1433066 m!1322951))

(assert (=> b!1433066 m!1322951))

(declare-fun m!1322953 () Bool)

(assert (=> b!1433066 m!1322953))

(declare-fun m!1322955 () Bool)

(assert (=> b!1433066 m!1322955))

(declare-fun m!1322957 () Bool)

(assert (=> b!1433066 m!1322957))

(assert (=> b!1433072 m!1322945))

(assert (=> b!1433072 m!1322945))

(declare-fun m!1322959 () Bool)

(assert (=> b!1433072 m!1322959))

(assert (=> b!1433072 m!1322959))

(assert (=> b!1433072 m!1322945))

(declare-fun m!1322961 () Bool)

(assert (=> b!1433072 m!1322961))

(assert (=> b!1433060 m!1322955))

(declare-fun m!1322963 () Bool)

(assert (=> b!1433060 m!1322963))

(declare-fun m!1322965 () Bool)

(assert (=> b!1433060 m!1322965))

(declare-fun m!1322967 () Bool)

(assert (=> b!1433060 m!1322967))

(assert (=> b!1433060 m!1322945))

(declare-fun m!1322969 () Bool)

(assert (=> b!1433060 m!1322969))

(declare-fun m!1322971 () Bool)

(assert (=> b!1433069 m!1322971))

(declare-fun m!1322973 () Bool)

(assert (=> b!1433073 m!1322973))

(declare-fun m!1322975 () Bool)

(assert (=> b!1433063 m!1322975))

(assert (=> b!1433062 m!1322945))

(assert (=> b!1433062 m!1322945))

(declare-fun m!1322977 () Bool)

(assert (=> b!1433062 m!1322977))

(check-sat (not b!1433073) (not start!123748) (not b!1433071) (not b!1433069) (not b!1433063) (not b!1433072) (not b!1433061) (not b!1433066) (not b!1433060) (not b!1433067) (not b!1433062) (not b!1433065))
(check-sat)
