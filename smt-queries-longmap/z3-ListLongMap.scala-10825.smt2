; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126666 () Bool)

(assert start!126666)

(declare-fun b!1487071 () Bool)

(declare-fun res!1011371 () Bool)

(declare-fun e!833575 () Bool)

(assert (=> b!1487071 (=> (not res!1011371) (not e!833575))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99565 0))(
  ( (array!99566 (arr!48057 (Array (_ BitVec 32) (_ BitVec 64))) (size!48607 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99565)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487071 (= res!1011371 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48607 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48607 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48607 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487072 () Bool)

(declare-fun res!1011369 () Bool)

(declare-fun e!833582 () Bool)

(assert (=> b!1487072 (=> (not res!1011369) (not e!833582))))

(declare-fun e!833573 () Bool)

(assert (=> b!1487072 (= res!1011369 e!833573)))

(declare-fun c!137379 () Bool)

(assert (=> b!1487072 (= c!137379 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487073 () Bool)

(declare-fun res!1011375 () Bool)

(assert (=> b!1487073 (=> (not res!1011375) (not e!833575))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99565 (_ BitVec 32)) Bool)

(assert (=> b!1487073 (= res!1011375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!648679 () (_ BitVec 64))

(declare-fun lt!648684 () array!99565)

(declare-fun b!1487074 () Bool)

(declare-datatypes ((SeekEntryResult!12297 0))(
  ( (MissingZero!12297 (index!51580 (_ BitVec 32))) (Found!12297 (index!51581 (_ BitVec 32))) (Intermediate!12297 (undefined!13109 Bool) (index!51582 (_ BitVec 32)) (x!133161 (_ BitVec 32))) (Undefined!12297) (MissingVacant!12297 (index!51583 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99565 (_ BitVec 32)) SeekEntryResult!12297)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99565 (_ BitVec 32)) SeekEntryResult!12297)

(assert (=> b!1487074 (= e!833573 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648679 lt!648684 mask!2687) (seekEntryOrOpen!0 lt!648679 lt!648684 mask!2687)))))

(declare-fun b!1487075 () Bool)

(declare-fun e!833579 () Bool)

(assert (=> b!1487075 (= e!833575 e!833579)))

(declare-fun res!1011364 () Bool)

(assert (=> b!1487075 (=> (not res!1011364) (not e!833579))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1487075 (= res!1011364 (= (select (store (arr!48057 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487075 (= lt!648684 (array!99566 (store (arr!48057 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48607 a!2862)))))

(declare-fun b!1487076 () Bool)

(declare-fun res!1011365 () Bool)

(declare-fun e!833574 () Bool)

(assert (=> b!1487076 (=> (not res!1011365) (not e!833574))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1487076 (= res!1011365 (or (= (select (arr!48057 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48057 a!2862) intermediateBeforeIndex!19) (select (arr!48057 a!2862) j!93))))))

(declare-fun b!1487077 () Bool)

(declare-fun e!833577 () Bool)

(assert (=> b!1487077 (= e!833574 e!833577)))

(declare-fun res!1011367 () Bool)

(assert (=> b!1487077 (=> res!1011367 e!833577)))

(declare-fun lt!648682 () (_ BitVec 64))

(assert (=> b!1487077 (= res!1011367 (or (and (= (select (arr!48057 a!2862) index!646) lt!648682) (= (select (arr!48057 a!2862) index!646) (select (arr!48057 a!2862) j!93))) (= (select (arr!48057 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487077 (= lt!648682 (select (store (arr!48057 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487078 () Bool)

(declare-fun res!1011372 () Bool)

(declare-fun e!833580 () Bool)

(assert (=> b!1487078 (=> (not res!1011372) (not e!833580))))

(declare-fun lt!648683 () SeekEntryResult!12297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99565 (_ BitVec 32)) SeekEntryResult!12297)

(assert (=> b!1487078 (= res!1011372 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48057 a!2862) j!93) a!2862 mask!2687) lt!648683))))

(declare-fun res!1011376 () Bool)

(assert (=> start!126666 (=> (not res!1011376) (not e!833575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126666 (= res!1011376 (validMask!0 mask!2687))))

(assert (=> start!126666 e!833575))

(assert (=> start!126666 true))

(declare-fun array_inv!37085 (array!99565) Bool)

(assert (=> start!126666 (array_inv!37085 a!2862)))

(declare-fun b!1487079 () Bool)

(declare-fun res!1011373 () Bool)

(assert (=> b!1487079 (=> (not res!1011373) (not e!833575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487079 (= res!1011373 (validKeyInArray!0 (select (arr!48057 a!2862) j!93)))))

(declare-fun b!1487080 () Bool)

(declare-fun res!1011370 () Bool)

(assert (=> b!1487080 (=> (not res!1011370) (not e!833574))))

(assert (=> b!1487080 (= res!1011370 (= (seekEntryOrOpen!0 (select (arr!48057 a!2862) j!93) a!2862 mask!2687) (Found!12297 j!93)))))

(declare-fun b!1487081 () Bool)

(declare-fun res!1011378 () Bool)

(assert (=> b!1487081 (=> (not res!1011378) (not e!833575))))

(declare-datatypes ((List!34558 0))(
  ( (Nil!34555) (Cons!34554 (h!35931 (_ BitVec 64)) (t!49252 List!34558)) )
))
(declare-fun arrayNoDuplicates!0 (array!99565 (_ BitVec 32) List!34558) Bool)

(assert (=> b!1487081 (= res!1011378 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34555))))

(declare-fun b!1487082 () Bool)

(declare-fun res!1011361 () Bool)

(assert (=> b!1487082 (=> (not res!1011361) (not e!833575))))

(assert (=> b!1487082 (= res!1011361 (validKeyInArray!0 (select (arr!48057 a!2862) i!1006)))))

(declare-fun b!1487083 () Bool)

(declare-fun e!833578 () Bool)

(assert (=> b!1487083 (= e!833578 true)))

(declare-fun lt!648680 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487083 (= lt!648680 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1487084 () Bool)

(declare-fun res!1011363 () Bool)

(assert (=> b!1487084 (=> (not res!1011363) (not e!833575))))

(assert (=> b!1487084 (= res!1011363 (and (= (size!48607 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48607 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48607 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487085 () Bool)

(assert (=> b!1487085 (= e!833580 e!833582)))

(declare-fun res!1011374 () Bool)

(assert (=> b!1487085 (=> (not res!1011374) (not e!833582))))

(declare-fun lt!648678 () SeekEntryResult!12297)

(assert (=> b!1487085 (= res!1011374 (= lt!648678 (Intermediate!12297 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487085 (= lt!648678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648679 mask!2687) lt!648679 lt!648684 mask!2687))))

(assert (=> b!1487085 (= lt!648679 (select (store (arr!48057 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487086 () Bool)

(assert (=> b!1487086 (= e!833579 e!833580)))

(declare-fun res!1011377 () Bool)

(assert (=> b!1487086 (=> (not res!1011377) (not e!833580))))

(assert (=> b!1487086 (= res!1011377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48057 a!2862) j!93) mask!2687) (select (arr!48057 a!2862) j!93) a!2862 mask!2687) lt!648683))))

(assert (=> b!1487086 (= lt!648683 (Intermediate!12297 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487087 () Bool)

(assert (=> b!1487087 (= e!833573 (= lt!648678 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648679 lt!648684 mask!2687)))))

(declare-fun b!1487088 () Bool)

(assert (=> b!1487088 (= e!833582 (not e!833578))))

(declare-fun res!1011368 () Bool)

(assert (=> b!1487088 (=> res!1011368 e!833578)))

(assert (=> b!1487088 (= res!1011368 (or (and (= (select (arr!48057 a!2862) index!646) (select (store (arr!48057 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48057 a!2862) index!646) (select (arr!48057 a!2862) j!93))) (= (select (arr!48057 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487088 e!833574))

(declare-fun res!1011366 () Bool)

(assert (=> b!1487088 (=> (not res!1011366) (not e!833574))))

(assert (=> b!1487088 (= res!1011366 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49934 0))(
  ( (Unit!49935) )
))
(declare-fun lt!648681 () Unit!49934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49934)

(assert (=> b!1487088 (= lt!648681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487089 () Bool)

(declare-fun e!833576 () Bool)

(assert (=> b!1487089 (= e!833576 (= (seekEntryOrOpen!0 lt!648679 lt!648684 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648679 lt!648684 mask!2687)))))

(declare-fun b!1487090 () Bool)

(assert (=> b!1487090 (= e!833577 e!833576)))

(declare-fun res!1011379 () Bool)

(assert (=> b!1487090 (=> (not res!1011379) (not e!833576))))

(assert (=> b!1487090 (= res!1011379 (and (= index!646 intermediateAfterIndex!19) (= lt!648682 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487091 () Bool)

(declare-fun res!1011362 () Bool)

(assert (=> b!1487091 (=> (not res!1011362) (not e!833582))))

(assert (=> b!1487091 (= res!1011362 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126666 res!1011376) b!1487084))

(assert (= (and b!1487084 res!1011363) b!1487082))

(assert (= (and b!1487082 res!1011361) b!1487079))

(assert (= (and b!1487079 res!1011373) b!1487073))

(assert (= (and b!1487073 res!1011375) b!1487081))

(assert (= (and b!1487081 res!1011378) b!1487071))

(assert (= (and b!1487071 res!1011371) b!1487075))

(assert (= (and b!1487075 res!1011364) b!1487086))

(assert (= (and b!1487086 res!1011377) b!1487078))

(assert (= (and b!1487078 res!1011372) b!1487085))

(assert (= (and b!1487085 res!1011374) b!1487072))

(assert (= (and b!1487072 c!137379) b!1487087))

(assert (= (and b!1487072 (not c!137379)) b!1487074))

(assert (= (and b!1487072 res!1011369) b!1487091))

(assert (= (and b!1487091 res!1011362) b!1487088))

(assert (= (and b!1487088 res!1011366) b!1487080))

(assert (= (and b!1487080 res!1011370) b!1487076))

(assert (= (and b!1487076 res!1011365) b!1487077))

(assert (= (and b!1487077 (not res!1011367)) b!1487090))

(assert (= (and b!1487090 res!1011379) b!1487089))

(assert (= (and b!1487088 (not res!1011368)) b!1487083))

(declare-fun m!1371839 () Bool)

(assert (=> b!1487086 m!1371839))

(assert (=> b!1487086 m!1371839))

(declare-fun m!1371841 () Bool)

(assert (=> b!1487086 m!1371841))

(assert (=> b!1487086 m!1371841))

(assert (=> b!1487086 m!1371839))

(declare-fun m!1371843 () Bool)

(assert (=> b!1487086 m!1371843))

(declare-fun m!1371845 () Bool)

(assert (=> b!1487073 m!1371845))

(assert (=> b!1487078 m!1371839))

(assert (=> b!1487078 m!1371839))

(declare-fun m!1371847 () Bool)

(assert (=> b!1487078 m!1371847))

(declare-fun m!1371849 () Bool)

(assert (=> b!1487083 m!1371849))

(declare-fun m!1371851 () Bool)

(assert (=> b!1487074 m!1371851))

(declare-fun m!1371853 () Bool)

(assert (=> b!1487074 m!1371853))

(declare-fun m!1371855 () Bool)

(assert (=> b!1487085 m!1371855))

(assert (=> b!1487085 m!1371855))

(declare-fun m!1371857 () Bool)

(assert (=> b!1487085 m!1371857))

(declare-fun m!1371859 () Bool)

(assert (=> b!1487085 m!1371859))

(declare-fun m!1371861 () Bool)

(assert (=> b!1487085 m!1371861))

(declare-fun m!1371863 () Bool)

(assert (=> b!1487081 m!1371863))

(declare-fun m!1371865 () Bool)

(assert (=> b!1487076 m!1371865))

(assert (=> b!1487076 m!1371839))

(assert (=> b!1487089 m!1371853))

(assert (=> b!1487089 m!1371851))

(declare-fun m!1371867 () Bool)

(assert (=> b!1487077 m!1371867))

(assert (=> b!1487077 m!1371839))

(assert (=> b!1487077 m!1371859))

(declare-fun m!1371869 () Bool)

(assert (=> b!1487077 m!1371869))

(assert (=> b!1487075 m!1371859))

(declare-fun m!1371871 () Bool)

(assert (=> b!1487075 m!1371871))

(declare-fun m!1371873 () Bool)

(assert (=> start!126666 m!1371873))

(declare-fun m!1371875 () Bool)

(assert (=> start!126666 m!1371875))

(declare-fun m!1371877 () Bool)

(assert (=> b!1487088 m!1371877))

(assert (=> b!1487088 m!1371859))

(assert (=> b!1487088 m!1371869))

(assert (=> b!1487088 m!1371867))

(declare-fun m!1371879 () Bool)

(assert (=> b!1487088 m!1371879))

(assert (=> b!1487088 m!1371839))

(assert (=> b!1487080 m!1371839))

(assert (=> b!1487080 m!1371839))

(declare-fun m!1371881 () Bool)

(assert (=> b!1487080 m!1371881))

(assert (=> b!1487079 m!1371839))

(assert (=> b!1487079 m!1371839))

(declare-fun m!1371883 () Bool)

(assert (=> b!1487079 m!1371883))

(declare-fun m!1371885 () Bool)

(assert (=> b!1487087 m!1371885))

(declare-fun m!1371887 () Bool)

(assert (=> b!1487082 m!1371887))

(assert (=> b!1487082 m!1371887))

(declare-fun m!1371889 () Bool)

(assert (=> b!1487082 m!1371889))

(check-sat (not b!1487087) (not b!1487079) (not b!1487082) (not b!1487088) (not b!1487081) (not b!1487083) (not b!1487085) (not b!1487074) (not b!1487089) (not b!1487078) (not b!1487080) (not b!1487086) (not start!126666) (not b!1487073))
(check-sat)
