; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126196 () Bool)

(assert start!126196)

(declare-fun b!1478887 () Bool)

(declare-fun e!829552 () Bool)

(declare-fun e!829553 () Bool)

(assert (=> b!1478887 (= e!829552 e!829553)))

(declare-fun res!1004956 () Bool)

(assert (=> b!1478887 (=> (not res!1004956) (not e!829553))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99280 0))(
  ( (array!99281 (arr!47920 (Array (_ BitVec 32) (_ BitVec 64))) (size!48472 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99280)

(assert (=> b!1478887 (= res!1004956 (= (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645663 () array!99280)

(assert (=> b!1478887 (= lt!645663 (array!99281 (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48472 a!2862)))))

(declare-fun b!1478888 () Bool)

(declare-fun res!1004948 () Bool)

(assert (=> b!1478888 (=> (not res!1004948) (not e!829552))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1478888 (= res!1004948 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48472 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48472 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48472 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478889 () Bool)

(declare-fun res!1004961 () Bool)

(declare-fun e!829550 () Bool)

(assert (=> b!1478889 (=> (not res!1004961) (not e!829550))))

(assert (=> b!1478889 (= res!1004961 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478890 () Bool)

(declare-fun res!1004958 () Bool)

(assert (=> b!1478890 (=> (not res!1004958) (not e!829552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478890 (= res!1004958 (validKeyInArray!0 (select (arr!47920 a!2862) i!1006)))))

(declare-fun b!1478891 () Bool)

(declare-fun res!1004962 () Bool)

(assert (=> b!1478891 (=> (not res!1004962) (not e!829552))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1478891 (= res!1004962 (and (= (size!48472 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48472 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48472 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478893 () Bool)

(declare-fun res!1004949 () Bool)

(declare-fun e!829555 () Bool)

(assert (=> b!1478893 (=> (not res!1004949) (not e!829555))))

(declare-datatypes ((SeekEntryResult!12185 0))(
  ( (MissingZero!12185 (index!51132 (_ BitVec 32))) (Found!12185 (index!51133 (_ BitVec 32))) (Intermediate!12185 (undefined!12997 Bool) (index!51134 (_ BitVec 32)) (x!132715 (_ BitVec 32))) (Undefined!12185) (MissingVacant!12185 (index!51135 (_ BitVec 32))) )
))
(declare-fun lt!645664 () SeekEntryResult!12185)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99280 (_ BitVec 32)) SeekEntryResult!12185)

(assert (=> b!1478893 (= res!1004949 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47920 a!2862) j!93) a!2862 mask!2687) lt!645664))))

(declare-fun b!1478894 () Bool)

(declare-fun res!1004950 () Bool)

(assert (=> b!1478894 (=> (not res!1004950) (not e!829552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99280 (_ BitVec 32)) Bool)

(assert (=> b!1478894 (= res!1004950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478895 () Bool)

(declare-fun e!829556 () Bool)

(declare-fun e!829551 () Bool)

(assert (=> b!1478895 (= e!829556 e!829551)))

(declare-fun res!1004955 () Bool)

(assert (=> b!1478895 (=> res!1004955 e!829551)))

(assert (=> b!1478895 (= res!1004955 (or (and (= (select (arr!47920 a!2862) index!646) (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47920 a!2862) index!646) (select (arr!47920 a!2862) j!93))) (not (= (select (arr!47920 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478896 () Bool)

(declare-fun e!829549 () Bool)

(assert (=> b!1478896 (= e!829549 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478897 () Bool)

(assert (=> b!1478897 (= e!829555 e!829550)))

(declare-fun res!1004959 () Bool)

(assert (=> b!1478897 (=> (not res!1004959) (not e!829550))))

(declare-fun lt!645666 () SeekEntryResult!12185)

(assert (=> b!1478897 (= res!1004959 (= lt!645666 (Intermediate!12185 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645662 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478897 (= lt!645666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645662 mask!2687) lt!645662 lt!645663 mask!2687))))

(assert (=> b!1478897 (= lt!645662 (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478898 () Bool)

(declare-fun res!1004951 () Bool)

(assert (=> b!1478898 (=> (not res!1004951) (not e!829552))))

(assert (=> b!1478898 (= res!1004951 (validKeyInArray!0 (select (arr!47920 a!2862) j!93)))))

(declare-fun res!1004957 () Bool)

(assert (=> start!126196 (=> (not res!1004957) (not e!829552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126196 (= res!1004957 (validMask!0 mask!2687))))

(assert (=> start!126196 e!829552))

(assert (=> start!126196 true))

(declare-fun array_inv!37153 (array!99280) Bool)

(assert (=> start!126196 (array_inv!37153 a!2862)))

(declare-fun b!1478892 () Bool)

(declare-fun res!1004947 () Bool)

(assert (=> b!1478892 (=> (not res!1004947) (not e!829552))))

(declare-datatypes ((List!34499 0))(
  ( (Nil!34496) (Cons!34495 (h!35863 (_ BitVec 64)) (t!49185 List!34499)) )
))
(declare-fun arrayNoDuplicates!0 (array!99280 (_ BitVec 32) List!34499) Bool)

(assert (=> b!1478892 (= res!1004947 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34496))))

(declare-fun b!1478899 () Bool)

(assert (=> b!1478899 (= e!829551 e!829549)))

(declare-fun res!1004954 () Bool)

(assert (=> b!1478899 (=> (not res!1004954) (not e!829549))))

(declare-fun lt!645661 () SeekEntryResult!12185)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99280 (_ BitVec 32)) SeekEntryResult!12185)

(assert (=> b!1478899 (= res!1004954 (= lt!645661 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47920 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478900 () Bool)

(declare-fun res!1004952 () Bool)

(assert (=> b!1478900 (=> (not res!1004952) (not e!829550))))

(declare-fun e!829554 () Bool)

(assert (=> b!1478900 (= res!1004952 e!829554)))

(declare-fun c!136492 () Bool)

(assert (=> b!1478900 (= c!136492 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478901 () Bool)

(assert (=> b!1478901 (= e!829554 (= lt!645666 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645662 lt!645663 mask!2687)))))

(declare-fun b!1478902 () Bool)

(assert (=> b!1478902 (= e!829553 e!829555)))

(declare-fun res!1004960 () Bool)

(assert (=> b!1478902 (=> (not res!1004960) (not e!829555))))

(assert (=> b!1478902 (= res!1004960 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47920 a!2862) j!93) mask!2687) (select (arr!47920 a!2862) j!93) a!2862 mask!2687) lt!645664))))

(assert (=> b!1478902 (= lt!645664 (Intermediate!12185 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478903 () Bool)

(assert (=> b!1478903 (= e!829550 (not true))))

(assert (=> b!1478903 e!829556))

(declare-fun res!1004953 () Bool)

(assert (=> b!1478903 (=> (not res!1004953) (not e!829556))))

(assert (=> b!1478903 (= res!1004953 (and (= lt!645661 (Found!12185 j!93)) (or (= (select (arr!47920 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47920 a!2862) intermediateBeforeIndex!19) (select (arr!47920 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99280 (_ BitVec 32)) SeekEntryResult!12185)

(assert (=> b!1478903 (= lt!645661 (seekEntryOrOpen!0 (select (arr!47920 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478903 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49551 0))(
  ( (Unit!49552) )
))
(declare-fun lt!645665 () Unit!49551)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49551)

(assert (=> b!1478903 (= lt!645665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478904 () Bool)

(assert (=> b!1478904 (= e!829554 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645662 lt!645663 mask!2687) (seekEntryOrOpen!0 lt!645662 lt!645663 mask!2687)))))

(assert (= (and start!126196 res!1004957) b!1478891))

(assert (= (and b!1478891 res!1004962) b!1478890))

(assert (= (and b!1478890 res!1004958) b!1478898))

(assert (= (and b!1478898 res!1004951) b!1478894))

(assert (= (and b!1478894 res!1004950) b!1478892))

(assert (= (and b!1478892 res!1004947) b!1478888))

(assert (= (and b!1478888 res!1004948) b!1478887))

(assert (= (and b!1478887 res!1004956) b!1478902))

(assert (= (and b!1478902 res!1004960) b!1478893))

(assert (= (and b!1478893 res!1004949) b!1478897))

(assert (= (and b!1478897 res!1004959) b!1478900))

(assert (= (and b!1478900 c!136492) b!1478901))

(assert (= (and b!1478900 (not c!136492)) b!1478904))

(assert (= (and b!1478900 res!1004952) b!1478889))

(assert (= (and b!1478889 res!1004961) b!1478903))

(assert (= (and b!1478903 res!1004953) b!1478895))

(assert (= (and b!1478895 (not res!1004955)) b!1478899))

(assert (= (and b!1478899 res!1004954) b!1478896))

(declare-fun m!1364295 () Bool)

(assert (=> b!1478898 m!1364295))

(assert (=> b!1478898 m!1364295))

(declare-fun m!1364297 () Bool)

(assert (=> b!1478898 m!1364297))

(declare-fun m!1364299 () Bool)

(assert (=> b!1478892 m!1364299))

(declare-fun m!1364301 () Bool)

(assert (=> b!1478890 m!1364301))

(assert (=> b!1478890 m!1364301))

(declare-fun m!1364303 () Bool)

(assert (=> b!1478890 m!1364303))

(declare-fun m!1364305 () Bool)

(assert (=> b!1478894 m!1364305))

(assert (=> b!1478902 m!1364295))

(assert (=> b!1478902 m!1364295))

(declare-fun m!1364307 () Bool)

(assert (=> b!1478902 m!1364307))

(assert (=> b!1478902 m!1364307))

(assert (=> b!1478902 m!1364295))

(declare-fun m!1364309 () Bool)

(assert (=> b!1478902 m!1364309))

(assert (=> b!1478899 m!1364295))

(assert (=> b!1478899 m!1364295))

(declare-fun m!1364311 () Bool)

(assert (=> b!1478899 m!1364311))

(declare-fun m!1364313 () Bool)

(assert (=> b!1478887 m!1364313))

(declare-fun m!1364315 () Bool)

(assert (=> b!1478887 m!1364315))

(declare-fun m!1364317 () Bool)

(assert (=> start!126196 m!1364317))

(declare-fun m!1364319 () Bool)

(assert (=> start!126196 m!1364319))

(declare-fun m!1364321 () Bool)

(assert (=> b!1478904 m!1364321))

(declare-fun m!1364323 () Bool)

(assert (=> b!1478904 m!1364323))

(assert (=> b!1478893 m!1364295))

(assert (=> b!1478893 m!1364295))

(declare-fun m!1364325 () Bool)

(assert (=> b!1478893 m!1364325))

(declare-fun m!1364327 () Bool)

(assert (=> b!1478903 m!1364327))

(declare-fun m!1364329 () Bool)

(assert (=> b!1478903 m!1364329))

(assert (=> b!1478903 m!1364295))

(declare-fun m!1364331 () Bool)

(assert (=> b!1478903 m!1364331))

(declare-fun m!1364333 () Bool)

(assert (=> b!1478903 m!1364333))

(assert (=> b!1478903 m!1364295))

(declare-fun m!1364335 () Bool)

(assert (=> b!1478895 m!1364335))

(assert (=> b!1478895 m!1364313))

(declare-fun m!1364337 () Bool)

(assert (=> b!1478895 m!1364337))

(assert (=> b!1478895 m!1364295))

(declare-fun m!1364339 () Bool)

(assert (=> b!1478897 m!1364339))

(assert (=> b!1478897 m!1364339))

(declare-fun m!1364341 () Bool)

(assert (=> b!1478897 m!1364341))

(assert (=> b!1478897 m!1364313))

(declare-fun m!1364343 () Bool)

(assert (=> b!1478897 m!1364343))

(declare-fun m!1364345 () Bool)

(assert (=> b!1478901 m!1364345))

(check-sat (not b!1478893) (not b!1478902) (not b!1478903) (not b!1478894) (not b!1478892) (not b!1478890) (not b!1478897) (not b!1478901) (not b!1478898) (not b!1478904) (not b!1478899) (not start!126196))
(check-sat)
