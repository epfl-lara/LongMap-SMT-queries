; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125542 () Bool)

(assert start!125542)

(declare-fun b!1468831 () Bool)

(declare-fun e!824714 () Bool)

(assert (=> b!1468831 (= e!824714 false)))

(declare-datatypes ((SeekEntryResult!12023 0))(
  ( (MissingZero!12023 (index!50484 (_ BitVec 32))) (Found!12023 (index!50485 (_ BitVec 32))) (Intermediate!12023 (undefined!12835 Bool) (index!50486 (_ BitVec 32)) (x!132072 (_ BitVec 32))) (Undefined!12023) (MissingVacant!12023 (index!50487 (_ BitVec 32))) )
))
(declare-fun lt!642377 () SeekEntryResult!12023)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98990 0))(
  ( (array!98991 (arr!47783 (Array (_ BitVec 32) (_ BitVec 64))) (size!48333 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98990)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98990 (_ BitVec 32)) SeekEntryResult!12023)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468831 (= lt!642377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47783 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47783 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98991 (store (arr!47783 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48333 a!2862)) mask!2687))))

(declare-fun b!1468832 () Bool)

(declare-fun res!997374 () Bool)

(declare-fun e!824712 () Bool)

(assert (=> b!1468832 (=> (not res!997374) (not e!824712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468832 (= res!997374 (validKeyInArray!0 (select (arr!47783 a!2862) i!1006)))))

(declare-fun res!997378 () Bool)

(assert (=> start!125542 (=> (not res!997378) (not e!824712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125542 (= res!997378 (validMask!0 mask!2687))))

(assert (=> start!125542 e!824712))

(assert (=> start!125542 true))

(declare-fun array_inv!36811 (array!98990) Bool)

(assert (=> start!125542 (array_inv!36811 a!2862)))

(declare-fun b!1468833 () Bool)

(declare-fun res!997371 () Bool)

(assert (=> b!1468833 (=> (not res!997371) (not e!824714))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!642378 () SeekEntryResult!12023)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468833 (= res!997371 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47783 a!2862) j!93) a!2862 mask!2687) lt!642378))))

(declare-fun b!1468834 () Bool)

(declare-fun res!997370 () Bool)

(assert (=> b!1468834 (=> (not res!997370) (not e!824712))))

(declare-datatypes ((List!34284 0))(
  ( (Nil!34281) (Cons!34280 (h!35630 (_ BitVec 64)) (t!48978 List!34284)) )
))
(declare-fun arrayNoDuplicates!0 (array!98990 (_ BitVec 32) List!34284) Bool)

(assert (=> b!1468834 (= res!997370 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34281))))

(declare-fun b!1468835 () Bool)

(declare-fun res!997372 () Bool)

(assert (=> b!1468835 (=> (not res!997372) (not e!824712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98990 (_ BitVec 32)) Bool)

(assert (=> b!1468835 (= res!997372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468836 () Bool)

(declare-fun res!997375 () Bool)

(assert (=> b!1468836 (=> (not res!997375) (not e!824712))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468836 (= res!997375 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48333 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48333 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48333 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47783 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468837 () Bool)

(assert (=> b!1468837 (= e!824712 e!824714)))

(declare-fun res!997376 () Bool)

(assert (=> b!1468837 (=> (not res!997376) (not e!824714))))

(assert (=> b!1468837 (= res!997376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47783 a!2862) j!93) mask!2687) (select (arr!47783 a!2862) j!93) a!2862 mask!2687) lt!642378))))

(assert (=> b!1468837 (= lt!642378 (Intermediate!12023 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468838 () Bool)

(declare-fun res!997377 () Bool)

(assert (=> b!1468838 (=> (not res!997377) (not e!824712))))

(assert (=> b!1468838 (= res!997377 (validKeyInArray!0 (select (arr!47783 a!2862) j!93)))))

(declare-fun b!1468839 () Bool)

(declare-fun res!997373 () Bool)

(assert (=> b!1468839 (=> (not res!997373) (not e!824712))))

(assert (=> b!1468839 (= res!997373 (and (= (size!48333 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48333 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48333 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125542 res!997378) b!1468839))

(assert (= (and b!1468839 res!997373) b!1468832))

(assert (= (and b!1468832 res!997374) b!1468838))

(assert (= (and b!1468838 res!997377) b!1468835))

(assert (= (and b!1468835 res!997372) b!1468834))

(assert (= (and b!1468834 res!997370) b!1468836))

(assert (= (and b!1468836 res!997375) b!1468837))

(assert (= (and b!1468837 res!997376) b!1468833))

(assert (= (and b!1468833 res!997371) b!1468831))

(declare-fun m!1355965 () Bool)

(assert (=> b!1468832 m!1355965))

(assert (=> b!1468832 m!1355965))

(declare-fun m!1355967 () Bool)

(assert (=> b!1468832 m!1355967))

(declare-fun m!1355969 () Bool)

(assert (=> b!1468837 m!1355969))

(assert (=> b!1468837 m!1355969))

(declare-fun m!1355971 () Bool)

(assert (=> b!1468837 m!1355971))

(assert (=> b!1468837 m!1355971))

(assert (=> b!1468837 m!1355969))

(declare-fun m!1355973 () Bool)

(assert (=> b!1468837 m!1355973))

(assert (=> b!1468833 m!1355969))

(assert (=> b!1468833 m!1355969))

(declare-fun m!1355975 () Bool)

(assert (=> b!1468833 m!1355975))

(declare-fun m!1355977 () Bool)

(assert (=> start!125542 m!1355977))

(declare-fun m!1355979 () Bool)

(assert (=> start!125542 m!1355979))

(assert (=> b!1468838 m!1355969))

(assert (=> b!1468838 m!1355969))

(declare-fun m!1355981 () Bool)

(assert (=> b!1468838 m!1355981))

(declare-fun m!1355983 () Bool)

(assert (=> b!1468835 m!1355983))

(declare-fun m!1355985 () Bool)

(assert (=> b!1468836 m!1355985))

(declare-fun m!1355987 () Bool)

(assert (=> b!1468836 m!1355987))

(assert (=> b!1468831 m!1355985))

(declare-fun m!1355989 () Bool)

(assert (=> b!1468831 m!1355989))

(assert (=> b!1468831 m!1355989))

(declare-fun m!1355991 () Bool)

(assert (=> b!1468831 m!1355991))

(assert (=> b!1468831 m!1355991))

(assert (=> b!1468831 m!1355989))

(declare-fun m!1355993 () Bool)

(assert (=> b!1468831 m!1355993))

(declare-fun m!1355995 () Bool)

(assert (=> b!1468834 m!1355995))

(push 1)

