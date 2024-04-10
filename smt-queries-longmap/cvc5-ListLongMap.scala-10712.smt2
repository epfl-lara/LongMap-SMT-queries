; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125410 () Bool)

(assert start!125410)

(declare-datatypes ((SeekEntryResult!11969 0))(
  ( (MissingZero!11969 (index!50268 (_ BitVec 32))) (Found!11969 (index!50269 (_ BitVec 32))) (Intermediate!11969 (undefined!12781 Bool) (index!50270 (_ BitVec 32)) (x!131842 (_ BitVec 32))) (Undefined!11969) (MissingVacant!11969 (index!50271 (_ BitVec 32))) )
))
(declare-fun lt!641960 () SeekEntryResult!11969)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98858 0))(
  ( (array!98859 (arr!47717 (Array (_ BitVec 32) (_ BitVec 64))) (size!48267 (_ BitVec 32))) )
))
(declare-fun lt!641957 () array!98858)

(declare-fun e!824085 () Bool)

(declare-fun b!1467003 () Bool)

(declare-fun lt!641958 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!641964 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98858 (_ BitVec 32)) SeekEntryResult!11969)

(assert (=> b!1467003 (= e!824085 (not (= lt!641960 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641964 lt!641958 lt!641957 mask!2687))))))

(declare-fun b!1467004 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98858 (_ BitVec 32)) SeekEntryResult!11969)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98858 (_ BitVec 32)) SeekEntryResult!11969)

(assert (=> b!1467004 (= e!824085 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641964 intermediateAfterIndex!19 lt!641958 lt!641957 mask!2687) (seekEntryOrOpen!0 lt!641958 lt!641957 mask!2687))))))

(declare-fun b!1467005 () Bool)

(declare-fun e!824091 () Bool)

(declare-fun e!824087 () Bool)

(assert (=> b!1467005 (= e!824091 e!824087)))

(declare-fun res!995615 () Bool)

(assert (=> b!1467005 (=> (not res!995615) (not e!824087))))

(declare-fun lt!641963 () SeekEntryResult!11969)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun a!2862 () array!98858)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467005 (= res!995615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47717 a!2862) j!93) mask!2687) (select (arr!47717 a!2862) j!93) a!2862 mask!2687) lt!641963))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467005 (= lt!641963 (Intermediate!11969 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467006 () Bool)

(declare-fun e!824092 () Bool)

(declare-fun e!824093 () Bool)

(assert (=> b!1467006 (= e!824092 (not e!824093))))

(declare-fun res!995612 () Bool)

(assert (=> b!1467006 (=> res!995612 e!824093)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467006 (= res!995612 (or (and (= (select (arr!47717 a!2862) index!646) (select (store (arr!47717 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47717 a!2862) index!646) (select (arr!47717 a!2862) j!93))) (= (select (arr!47717 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641962 () SeekEntryResult!11969)

(assert (=> b!1467006 (and (= lt!641962 (Found!11969 j!93)) (or (= (select (arr!47717 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47717 a!2862) intermediateBeforeIndex!19) (select (arr!47717 a!2862) j!93))))))

(assert (=> b!1467006 (= lt!641962 (seekEntryOrOpen!0 (select (arr!47717 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98858 (_ BitVec 32)) Bool)

(assert (=> b!1467006 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49434 0))(
  ( (Unit!49435) )
))
(declare-fun lt!641959 () Unit!49434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49434)

(assert (=> b!1467006 (= lt!641959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467007 () Bool)

(declare-fun res!995620 () Bool)

(declare-fun e!824089 () Bool)

(assert (=> b!1467007 (=> (not res!995620) (not e!824089))))

(assert (=> b!1467007 (= res!995620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467008 () Bool)

(declare-fun res!995611 () Bool)

(assert (=> b!1467008 (=> (not res!995611) (not e!824092))))

(declare-fun e!824090 () Bool)

(assert (=> b!1467008 (= res!995611 e!824090)))

(declare-fun c!135209 () Bool)

(assert (=> b!1467008 (= c!135209 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467009 () Bool)

(assert (=> b!1467009 (= e!824087 e!824092)))

(declare-fun res!995619 () Bool)

(assert (=> b!1467009 (=> (not res!995619) (not e!824092))))

(assert (=> b!1467009 (= res!995619 (= lt!641960 (Intermediate!11969 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1467009 (= lt!641960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641958 mask!2687) lt!641958 lt!641957 mask!2687))))

(assert (=> b!1467009 (= lt!641958 (select (store (arr!47717 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467010 () Bool)

(declare-fun e!824088 () Bool)

(assert (=> b!1467010 (= e!824088 true)))

(assert (=> b!1467010 (= lt!641962 (seekEntryOrOpen!0 lt!641958 lt!641957 mask!2687))))

(declare-fun lt!641961 () Unit!49434)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49434)

(assert (=> b!1467010 (= lt!641961 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641964 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467011 () Bool)

(declare-fun res!995609 () Bool)

(assert (=> b!1467011 (=> (not res!995609) (not e!824089))))

(assert (=> b!1467011 (= res!995609 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48267 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48267 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48267 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!995618 () Bool)

(assert (=> start!125410 (=> (not res!995618) (not e!824089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125410 (= res!995618 (validMask!0 mask!2687))))

(assert (=> start!125410 e!824089))

(assert (=> start!125410 true))

(declare-fun array_inv!36745 (array!98858) Bool)

(assert (=> start!125410 (array_inv!36745 a!2862)))

(declare-fun b!1467012 () Bool)

(declare-fun res!995616 () Bool)

(assert (=> b!1467012 (=> (not res!995616) (not e!824089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467012 (= res!995616 (validKeyInArray!0 (select (arr!47717 a!2862) i!1006)))))

(declare-fun b!1467013 () Bool)

(assert (=> b!1467013 (= e!824093 e!824088)))

(declare-fun res!995617 () Bool)

(assert (=> b!1467013 (=> res!995617 e!824088)))

(assert (=> b!1467013 (= res!995617 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641964 #b00000000000000000000000000000000) (bvsge lt!641964 (size!48267 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467013 (= lt!641964 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1467014 () Bool)

(declare-fun res!995606 () Bool)

(assert (=> b!1467014 (=> (not res!995606) (not e!824089))))

(assert (=> b!1467014 (= res!995606 (validKeyInArray!0 (select (arr!47717 a!2862) j!93)))))

(declare-fun b!1467015 () Bool)

(declare-fun res!995610 () Bool)

(assert (=> b!1467015 (=> (not res!995610) (not e!824089))))

(assert (=> b!1467015 (= res!995610 (and (= (size!48267 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48267 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48267 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467016 () Bool)

(assert (=> b!1467016 (= e!824089 e!824091)))

(declare-fun res!995621 () Bool)

(assert (=> b!1467016 (=> (not res!995621) (not e!824091))))

(assert (=> b!1467016 (= res!995621 (= (select (store (arr!47717 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467016 (= lt!641957 (array!98859 (store (arr!47717 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48267 a!2862)))))

(declare-fun b!1467017 () Bool)

(declare-fun res!995622 () Bool)

(assert (=> b!1467017 (=> res!995622 e!824088)))

(assert (=> b!1467017 (= res!995622 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467018 () Bool)

(declare-fun res!995614 () Bool)

(assert (=> b!1467018 (=> (not res!995614) (not e!824089))))

(declare-datatypes ((List!34218 0))(
  ( (Nil!34215) (Cons!34214 (h!35564 (_ BitVec 64)) (t!48912 List!34218)) )
))
(declare-fun arrayNoDuplicates!0 (array!98858 (_ BitVec 32) List!34218) Bool)

(assert (=> b!1467018 (= res!995614 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34215))))

(declare-fun b!1467019 () Bool)

(declare-fun res!995607 () Bool)

(assert (=> b!1467019 (=> res!995607 e!824088)))

(assert (=> b!1467019 (= res!995607 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641964 (select (arr!47717 a!2862) j!93) a!2862 mask!2687) lt!641963)))))

(declare-fun b!1467020 () Bool)

(assert (=> b!1467020 (= e!824090 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641958 lt!641957 mask!2687) (seekEntryOrOpen!0 lt!641958 lt!641957 mask!2687)))))

(declare-fun b!1467021 () Bool)

(assert (=> b!1467021 (= e!824090 (= lt!641960 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641958 lt!641957 mask!2687)))))

(declare-fun b!1467022 () Bool)

(declare-fun res!995608 () Bool)

(assert (=> b!1467022 (=> res!995608 e!824088)))

(assert (=> b!1467022 (= res!995608 e!824085)))

(declare-fun c!135210 () Bool)

(assert (=> b!1467022 (= c!135210 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467023 () Bool)

(declare-fun res!995623 () Bool)

(assert (=> b!1467023 (=> (not res!995623) (not e!824092))))

(assert (=> b!1467023 (= res!995623 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467024 () Bool)

(declare-fun res!995613 () Bool)

(assert (=> b!1467024 (=> (not res!995613) (not e!824087))))

(assert (=> b!1467024 (= res!995613 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47717 a!2862) j!93) a!2862 mask!2687) lt!641963))))

(assert (= (and start!125410 res!995618) b!1467015))

(assert (= (and b!1467015 res!995610) b!1467012))

(assert (= (and b!1467012 res!995616) b!1467014))

(assert (= (and b!1467014 res!995606) b!1467007))

(assert (= (and b!1467007 res!995620) b!1467018))

(assert (= (and b!1467018 res!995614) b!1467011))

(assert (= (and b!1467011 res!995609) b!1467016))

(assert (= (and b!1467016 res!995621) b!1467005))

(assert (= (and b!1467005 res!995615) b!1467024))

(assert (= (and b!1467024 res!995613) b!1467009))

(assert (= (and b!1467009 res!995619) b!1467008))

(assert (= (and b!1467008 c!135209) b!1467021))

(assert (= (and b!1467008 (not c!135209)) b!1467020))

(assert (= (and b!1467008 res!995611) b!1467023))

(assert (= (and b!1467023 res!995623) b!1467006))

(assert (= (and b!1467006 (not res!995612)) b!1467013))

(assert (= (and b!1467013 (not res!995617)) b!1467019))

(assert (= (and b!1467019 (not res!995607)) b!1467022))

(assert (= (and b!1467022 c!135210) b!1467003))

(assert (= (and b!1467022 (not c!135210)) b!1467004))

(assert (= (and b!1467022 (not res!995608)) b!1467017))

(assert (= (and b!1467017 (not res!995622)) b!1467010))

(declare-fun m!1353943 () Bool)

(assert (=> b!1467021 m!1353943))

(declare-fun m!1353945 () Bool)

(assert (=> b!1467016 m!1353945))

(declare-fun m!1353947 () Bool)

(assert (=> b!1467016 m!1353947))

(declare-fun m!1353949 () Bool)

(assert (=> b!1467005 m!1353949))

(assert (=> b!1467005 m!1353949))

(declare-fun m!1353951 () Bool)

(assert (=> b!1467005 m!1353951))

(assert (=> b!1467005 m!1353951))

(assert (=> b!1467005 m!1353949))

(declare-fun m!1353953 () Bool)

(assert (=> b!1467005 m!1353953))

(declare-fun m!1353955 () Bool)

(assert (=> b!1467010 m!1353955))

(declare-fun m!1353957 () Bool)

(assert (=> b!1467010 m!1353957))

(declare-fun m!1353959 () Bool)

(assert (=> b!1467020 m!1353959))

(assert (=> b!1467020 m!1353955))

(declare-fun m!1353961 () Bool)

(assert (=> b!1467006 m!1353961))

(assert (=> b!1467006 m!1353945))

(declare-fun m!1353963 () Bool)

(assert (=> b!1467006 m!1353963))

(declare-fun m!1353965 () Bool)

(assert (=> b!1467006 m!1353965))

(declare-fun m!1353967 () Bool)

(assert (=> b!1467006 m!1353967))

(assert (=> b!1467006 m!1353949))

(declare-fun m!1353969 () Bool)

(assert (=> b!1467006 m!1353969))

(declare-fun m!1353971 () Bool)

(assert (=> b!1467006 m!1353971))

(assert (=> b!1467006 m!1353949))

(declare-fun m!1353973 () Bool)

(assert (=> b!1467013 m!1353973))

(declare-fun m!1353975 () Bool)

(assert (=> b!1467018 m!1353975))

(assert (=> b!1467014 m!1353949))

(assert (=> b!1467014 m!1353949))

(declare-fun m!1353977 () Bool)

(assert (=> b!1467014 m!1353977))

(assert (=> b!1467024 m!1353949))

(assert (=> b!1467024 m!1353949))

(declare-fun m!1353979 () Bool)

(assert (=> b!1467024 m!1353979))

(declare-fun m!1353981 () Bool)

(assert (=> b!1467009 m!1353981))

(assert (=> b!1467009 m!1353981))

(declare-fun m!1353983 () Bool)

(assert (=> b!1467009 m!1353983))

(assert (=> b!1467009 m!1353945))

(declare-fun m!1353985 () Bool)

(assert (=> b!1467009 m!1353985))

(declare-fun m!1353987 () Bool)

(assert (=> b!1467003 m!1353987))

(declare-fun m!1353989 () Bool)

(assert (=> b!1467012 m!1353989))

(assert (=> b!1467012 m!1353989))

(declare-fun m!1353991 () Bool)

(assert (=> b!1467012 m!1353991))

(declare-fun m!1353993 () Bool)

(assert (=> start!125410 m!1353993))

(declare-fun m!1353995 () Bool)

(assert (=> start!125410 m!1353995))

(declare-fun m!1353997 () Bool)

(assert (=> b!1467007 m!1353997))

(declare-fun m!1353999 () Bool)

(assert (=> b!1467004 m!1353999))

(assert (=> b!1467004 m!1353955))

(assert (=> b!1467019 m!1353949))

(assert (=> b!1467019 m!1353949))

(declare-fun m!1354001 () Bool)

(assert (=> b!1467019 m!1354001))

(push 1)

