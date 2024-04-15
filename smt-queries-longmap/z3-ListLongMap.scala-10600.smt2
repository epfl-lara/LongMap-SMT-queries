; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124708 () Bool)

(assert start!124708)

(declare-fun b!1446080 () Bool)

(declare-fun e!814470 () Bool)

(declare-fun e!814472 () Bool)

(assert (=> b!1446080 (= e!814470 e!814472)))

(declare-fun res!977975 () Bool)

(assert (=> b!1446080 (=> (not res!977975) (not e!814472))))

(declare-datatypes ((SeekEntryResult!11633 0))(
  ( (MissingZero!11633 (index!48924 (_ BitVec 32))) (Found!11633 (index!48925 (_ BitVec 32))) (Intermediate!11633 (undefined!12445 Bool) (index!48926 (_ BitVec 32)) (x!130605 (_ BitVec 32))) (Undefined!11633) (MissingVacant!11633 (index!48927 (_ BitVec 32))) )
))
(declare-fun lt!634509 () SeekEntryResult!11633)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446080 (= res!977975 (= lt!634509 (Intermediate!11633 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634511 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98134 0))(
  ( (array!98135 (arr!47356 (Array (_ BitVec 32) (_ BitVec 64))) (size!47908 (_ BitVec 32))) )
))
(declare-fun lt!634508 () array!98134)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98134 (_ BitVec 32)) SeekEntryResult!11633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446080 (= lt!634509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634511 mask!2687) lt!634511 lt!634508 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98134)

(assert (=> b!1446080 (= lt!634511 (select (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!814474 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1446081 () Bool)

(assert (=> b!1446081 (= e!814474 (or (= (select (arr!47356 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47356 a!2862) intermediateBeforeIndex!19) (select (arr!47356 a!2862) j!93))))))

(declare-fun b!1446082 () Bool)

(declare-fun res!977983 () Bool)

(declare-fun e!814475 () Bool)

(assert (=> b!1446082 (=> (not res!977983) (not e!814475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98134 (_ BitVec 32)) Bool)

(assert (=> b!1446082 (= res!977983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446083 () Bool)

(declare-fun res!977985 () Bool)

(assert (=> b!1446083 (=> (not res!977985) (not e!814472))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446083 (= res!977985 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446084 () Bool)

(declare-fun res!977982 () Bool)

(assert (=> b!1446084 (=> (not res!977982) (not e!814475))))

(assert (=> b!1446084 (= res!977982 (and (= (size!47908 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47908 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47908 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446085 () Bool)

(declare-fun res!977972 () Bool)

(assert (=> b!1446085 (=> (not res!977972) (not e!814474))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98134 (_ BitVec 32)) SeekEntryResult!11633)

(assert (=> b!1446085 (= res!977972 (= (seekEntryOrOpen!0 (select (arr!47356 a!2862) j!93) a!2862 mask!2687) (Found!11633 j!93)))))

(declare-fun b!1446086 () Bool)

(declare-fun res!977986 () Bool)

(assert (=> b!1446086 (=> (not res!977986) (not e!814475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446086 (= res!977986 (validKeyInArray!0 (select (arr!47356 a!2862) j!93)))))

(declare-fun b!1446087 () Bool)

(declare-fun res!977976 () Bool)

(assert (=> b!1446087 (=> (not res!977976) (not e!814475))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1446087 (= res!977976 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47908 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47908 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47908 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446088 () Bool)

(declare-fun e!814476 () Bool)

(assert (=> b!1446088 (= e!814476 e!814470)))

(declare-fun res!977984 () Bool)

(assert (=> b!1446088 (=> (not res!977984) (not e!814470))))

(declare-fun lt!634512 () SeekEntryResult!11633)

(assert (=> b!1446088 (= res!977984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47356 a!2862) j!93) mask!2687) (select (arr!47356 a!2862) j!93) a!2862 mask!2687) lt!634512))))

(assert (=> b!1446088 (= lt!634512 (Intermediate!11633 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446089 () Bool)

(assert (=> b!1446089 (= e!814472 (not true))))

(assert (=> b!1446089 e!814474))

(declare-fun res!977979 () Bool)

(assert (=> b!1446089 (=> (not res!977979) (not e!814474))))

(assert (=> b!1446089 (= res!977979 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48603 0))(
  ( (Unit!48604) )
))
(declare-fun lt!634510 () Unit!48603)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48603)

(assert (=> b!1446089 (= lt!634510 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446090 () Bool)

(declare-fun res!977980 () Bool)

(assert (=> b!1446090 (=> (not res!977980) (not e!814472))))

(declare-fun e!814473 () Bool)

(assert (=> b!1446090 (= res!977980 e!814473)))

(declare-fun c!133567 () Bool)

(assert (=> b!1446090 (= c!133567 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446091 () Bool)

(assert (=> b!1446091 (= e!814473 (= lt!634509 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634511 lt!634508 mask!2687)))))

(declare-fun b!1446092 () Bool)

(declare-fun res!977981 () Bool)

(assert (=> b!1446092 (=> (not res!977981) (not e!814475))))

(declare-datatypes ((List!33935 0))(
  ( (Nil!33932) (Cons!33931 (h!35281 (_ BitVec 64)) (t!48621 List!33935)) )
))
(declare-fun arrayNoDuplicates!0 (array!98134 (_ BitVec 32) List!33935) Bool)

(assert (=> b!1446092 (= res!977981 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33932))))

(declare-fun b!1446093 () Bool)

(assert (=> b!1446093 (= e!814475 e!814476)))

(declare-fun res!977974 () Bool)

(assert (=> b!1446093 (=> (not res!977974) (not e!814476))))

(assert (=> b!1446093 (= res!977974 (= (select (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446093 (= lt!634508 (array!98135 (store (arr!47356 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47908 a!2862)))))

(declare-fun b!1446094 () Bool)

(declare-fun res!977978 () Bool)

(assert (=> b!1446094 (=> (not res!977978) (not e!814475))))

(assert (=> b!1446094 (= res!977978 (validKeyInArray!0 (select (arr!47356 a!2862) i!1006)))))

(declare-fun res!977977 () Bool)

(assert (=> start!124708 (=> (not res!977977) (not e!814475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124708 (= res!977977 (validMask!0 mask!2687))))

(assert (=> start!124708 e!814475))

(assert (=> start!124708 true))

(declare-fun array_inv!36589 (array!98134) Bool)

(assert (=> start!124708 (array_inv!36589 a!2862)))

(declare-fun b!1446095 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98134 (_ BitVec 32)) SeekEntryResult!11633)

(assert (=> b!1446095 (= e!814473 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634511 lt!634508 mask!2687) (seekEntryOrOpen!0 lt!634511 lt!634508 mask!2687)))))

(declare-fun b!1446096 () Bool)

(declare-fun res!977973 () Bool)

(assert (=> b!1446096 (=> (not res!977973) (not e!814470))))

(assert (=> b!1446096 (= res!977973 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47356 a!2862) j!93) a!2862 mask!2687) lt!634512))))

(assert (= (and start!124708 res!977977) b!1446084))

(assert (= (and b!1446084 res!977982) b!1446094))

(assert (= (and b!1446094 res!977978) b!1446086))

(assert (= (and b!1446086 res!977986) b!1446082))

(assert (= (and b!1446082 res!977983) b!1446092))

(assert (= (and b!1446092 res!977981) b!1446087))

(assert (= (and b!1446087 res!977976) b!1446093))

(assert (= (and b!1446093 res!977974) b!1446088))

(assert (= (and b!1446088 res!977984) b!1446096))

(assert (= (and b!1446096 res!977973) b!1446080))

(assert (= (and b!1446080 res!977975) b!1446090))

(assert (= (and b!1446090 c!133567) b!1446091))

(assert (= (and b!1446090 (not c!133567)) b!1446095))

(assert (= (and b!1446090 res!977980) b!1446083))

(assert (= (and b!1446083 res!977985) b!1446089))

(assert (= (and b!1446089 res!977979) b!1446085))

(assert (= (and b!1446085 res!977972) b!1446081))

(declare-fun m!1334487 () Bool)

(assert (=> b!1446094 m!1334487))

(assert (=> b!1446094 m!1334487))

(declare-fun m!1334489 () Bool)

(assert (=> b!1446094 m!1334489))

(declare-fun m!1334491 () Bool)

(assert (=> b!1446091 m!1334491))

(declare-fun m!1334493 () Bool)

(assert (=> start!124708 m!1334493))

(declare-fun m!1334495 () Bool)

(assert (=> start!124708 m!1334495))

(declare-fun m!1334497 () Bool)

(assert (=> b!1446093 m!1334497))

(declare-fun m!1334499 () Bool)

(assert (=> b!1446093 m!1334499))

(declare-fun m!1334501 () Bool)

(assert (=> b!1446092 m!1334501))

(declare-fun m!1334503 () Bool)

(assert (=> b!1446089 m!1334503))

(declare-fun m!1334505 () Bool)

(assert (=> b!1446089 m!1334505))

(declare-fun m!1334507 () Bool)

(assert (=> b!1446081 m!1334507))

(declare-fun m!1334509 () Bool)

(assert (=> b!1446081 m!1334509))

(assert (=> b!1446086 m!1334509))

(assert (=> b!1446086 m!1334509))

(declare-fun m!1334511 () Bool)

(assert (=> b!1446086 m!1334511))

(declare-fun m!1334513 () Bool)

(assert (=> b!1446082 m!1334513))

(declare-fun m!1334515 () Bool)

(assert (=> b!1446095 m!1334515))

(declare-fun m!1334517 () Bool)

(assert (=> b!1446095 m!1334517))

(assert (=> b!1446085 m!1334509))

(assert (=> b!1446085 m!1334509))

(declare-fun m!1334519 () Bool)

(assert (=> b!1446085 m!1334519))

(declare-fun m!1334521 () Bool)

(assert (=> b!1446080 m!1334521))

(assert (=> b!1446080 m!1334521))

(declare-fun m!1334523 () Bool)

(assert (=> b!1446080 m!1334523))

(assert (=> b!1446080 m!1334497))

(declare-fun m!1334525 () Bool)

(assert (=> b!1446080 m!1334525))

(assert (=> b!1446096 m!1334509))

(assert (=> b!1446096 m!1334509))

(declare-fun m!1334527 () Bool)

(assert (=> b!1446096 m!1334527))

(assert (=> b!1446088 m!1334509))

(assert (=> b!1446088 m!1334509))

(declare-fun m!1334529 () Bool)

(assert (=> b!1446088 m!1334529))

(assert (=> b!1446088 m!1334529))

(assert (=> b!1446088 m!1334509))

(declare-fun m!1334531 () Bool)

(assert (=> b!1446088 m!1334531))

(check-sat (not b!1446085) (not b!1446094) (not b!1446096) (not start!124708) (not b!1446095) (not b!1446089) (not b!1446091) (not b!1446092) (not b!1446082) (not b!1446086) (not b!1446080) (not b!1446088))
(check-sat)
