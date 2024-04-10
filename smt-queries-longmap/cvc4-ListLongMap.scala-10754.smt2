; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125786 () Bool)

(assert start!125786)

(declare-fun b!1472213 () Bool)

(declare-fun res!999911 () Bool)

(declare-fun e!826257 () Bool)

(assert (=> b!1472213 (=> (not res!999911) (not e!826257))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99120 0))(
  ( (array!99121 (arr!47845 (Array (_ BitVec 32) (_ BitVec 64))) (size!48395 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99120)

(assert (=> b!1472213 (= res!999911 (and (= (size!48395 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48395 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48395 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472214 () Bool)

(declare-fun res!999906 () Bool)

(declare-fun e!826256 () Bool)

(assert (=> b!1472214 (=> (not res!999906) (not e!826256))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12085 0))(
  ( (MissingZero!12085 (index!50732 (_ BitVec 32))) (Found!12085 (index!50733 (_ BitVec 32))) (Intermediate!12085 (undefined!12897 Bool) (index!50734 (_ BitVec 32)) (x!132312 (_ BitVec 32))) (Undefined!12085) (MissingVacant!12085 (index!50735 (_ BitVec 32))) )
))
(declare-fun lt!643506 () SeekEntryResult!12085)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99120 (_ BitVec 32)) SeekEntryResult!12085)

(assert (=> b!1472214 (= res!999906 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47845 a!2862) j!93) a!2862 mask!2687) lt!643506))))

(declare-fun b!1472215 () Bool)

(declare-fun res!999905 () Bool)

(assert (=> b!1472215 (=> (not res!999905) (not e!826257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472215 (= res!999905 (validKeyInArray!0 (select (arr!47845 a!2862) i!1006)))))

(declare-fun res!999909 () Bool)

(assert (=> start!125786 (=> (not res!999909) (not e!826257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125786 (= res!999909 (validMask!0 mask!2687))))

(assert (=> start!125786 e!826257))

(assert (=> start!125786 true))

(declare-fun array_inv!36873 (array!99120) Bool)

(assert (=> start!125786 (array_inv!36873 a!2862)))

(declare-fun b!1472216 () Bool)

(declare-fun res!999902 () Bool)

(assert (=> b!1472216 (=> (not res!999902) (not e!826257))))

(assert (=> b!1472216 (= res!999902 (validKeyInArray!0 (select (arr!47845 a!2862) j!93)))))

(declare-fun b!1472217 () Bool)

(declare-fun res!999913 () Bool)

(assert (=> b!1472217 (=> (not res!999913) (not e!826257))))

(declare-datatypes ((List!34346 0))(
  ( (Nil!34343) (Cons!34342 (h!35698 (_ BitVec 64)) (t!49040 List!34346)) )
))
(declare-fun arrayNoDuplicates!0 (array!99120 (_ BitVec 32) List!34346) Bool)

(assert (=> b!1472217 (= res!999913 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34343))))

(declare-fun e!826260 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1472218 () Bool)

(assert (=> b!1472218 (= e!826260 (or (= (select (arr!47845 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47845 a!2862) intermediateBeforeIndex!19) (select (arr!47845 a!2862) j!93))))))

(declare-fun b!1472219 () Bool)

(declare-fun res!999910 () Bool)

(assert (=> b!1472219 (=> (not res!999910) (not e!826257))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472219 (= res!999910 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48395 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48395 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48395 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472220 () Bool)

(declare-fun res!999907 () Bool)

(assert (=> b!1472220 (=> (not res!999907) (not e!826257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99120 (_ BitVec 32)) Bool)

(assert (=> b!1472220 (= res!999907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!643508 () array!99120)

(declare-fun lt!643505 () (_ BitVec 64))

(declare-fun lt!643509 () SeekEntryResult!12085)

(declare-fun e!826261 () Bool)

(declare-fun b!1472221 () Bool)

(assert (=> b!1472221 (= e!826261 (= lt!643509 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643505 lt!643508 mask!2687)))))

(declare-fun b!1472222 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99120 (_ BitVec 32)) SeekEntryResult!12085)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99120 (_ BitVec 32)) SeekEntryResult!12085)

(assert (=> b!1472222 (= e!826261 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643505 lt!643508 mask!2687) (seekEntryOrOpen!0 lt!643505 lt!643508 mask!2687)))))

(declare-fun b!1472223 () Bool)

(declare-fun res!999916 () Bool)

(declare-fun e!826259 () Bool)

(assert (=> b!1472223 (=> (not res!999916) (not e!826259))))

(assert (=> b!1472223 (= res!999916 e!826261)))

(declare-fun c!135669 () Bool)

(assert (=> b!1472223 (= c!135669 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472224 () Bool)

(declare-fun e!826258 () Bool)

(assert (=> b!1472224 (= e!826257 e!826258)))

(declare-fun res!999915 () Bool)

(assert (=> b!1472224 (=> (not res!999915) (not e!826258))))

(assert (=> b!1472224 (= res!999915 (= (select (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472224 (= lt!643508 (array!99121 (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48395 a!2862)))))

(declare-fun b!1472225 () Bool)

(assert (=> b!1472225 (= e!826258 e!826256)))

(declare-fun res!999903 () Bool)

(assert (=> b!1472225 (=> (not res!999903) (not e!826256))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472225 (= res!999903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47845 a!2862) j!93) mask!2687) (select (arr!47845 a!2862) j!93) a!2862 mask!2687) lt!643506))))

(assert (=> b!1472225 (= lt!643506 (Intermediate!12085 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472226 () Bool)

(declare-fun res!999904 () Bool)

(assert (=> b!1472226 (=> (not res!999904) (not e!826260))))

(assert (=> b!1472226 (= res!999904 (= (seekEntryOrOpen!0 (select (arr!47845 a!2862) j!93) a!2862 mask!2687) (Found!12085 j!93)))))

(declare-fun b!1472227 () Bool)

(assert (=> b!1472227 (= e!826259 (not true))))

(assert (=> b!1472227 e!826260))

(declare-fun res!999912 () Bool)

(assert (=> b!1472227 (=> (not res!999912) (not e!826260))))

(assert (=> b!1472227 (= res!999912 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49510 0))(
  ( (Unit!49511) )
))
(declare-fun lt!643507 () Unit!49510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49510)

(assert (=> b!1472227 (= lt!643507 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472228 () Bool)

(assert (=> b!1472228 (= e!826256 e!826259)))

(declare-fun res!999914 () Bool)

(assert (=> b!1472228 (=> (not res!999914) (not e!826259))))

(assert (=> b!1472228 (= res!999914 (= lt!643509 (Intermediate!12085 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472228 (= lt!643509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643505 mask!2687) lt!643505 lt!643508 mask!2687))))

(assert (=> b!1472228 (= lt!643505 (select (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472229 () Bool)

(declare-fun res!999908 () Bool)

(assert (=> b!1472229 (=> (not res!999908) (not e!826259))))

(assert (=> b!1472229 (= res!999908 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125786 res!999909) b!1472213))

(assert (= (and b!1472213 res!999911) b!1472215))

(assert (= (and b!1472215 res!999905) b!1472216))

(assert (= (and b!1472216 res!999902) b!1472220))

(assert (= (and b!1472220 res!999907) b!1472217))

(assert (= (and b!1472217 res!999913) b!1472219))

(assert (= (and b!1472219 res!999910) b!1472224))

(assert (= (and b!1472224 res!999915) b!1472225))

(assert (= (and b!1472225 res!999903) b!1472214))

(assert (= (and b!1472214 res!999906) b!1472228))

(assert (= (and b!1472228 res!999914) b!1472223))

(assert (= (and b!1472223 c!135669) b!1472221))

(assert (= (and b!1472223 (not c!135669)) b!1472222))

(assert (= (and b!1472223 res!999916) b!1472229))

(assert (= (and b!1472229 res!999908) b!1472227))

(assert (= (and b!1472227 res!999912) b!1472226))

(assert (= (and b!1472226 res!999904) b!1472218))

(declare-fun m!1358949 () Bool)

(assert (=> b!1472220 m!1358949))

(declare-fun m!1358951 () Bool)

(assert (=> b!1472222 m!1358951))

(declare-fun m!1358953 () Bool)

(assert (=> b!1472222 m!1358953))

(declare-fun m!1358955 () Bool)

(assert (=> b!1472214 m!1358955))

(assert (=> b!1472214 m!1358955))

(declare-fun m!1358957 () Bool)

(assert (=> b!1472214 m!1358957))

(declare-fun m!1358959 () Bool)

(assert (=> b!1472228 m!1358959))

(assert (=> b!1472228 m!1358959))

(declare-fun m!1358961 () Bool)

(assert (=> b!1472228 m!1358961))

(declare-fun m!1358963 () Bool)

(assert (=> b!1472228 m!1358963))

(declare-fun m!1358965 () Bool)

(assert (=> b!1472228 m!1358965))

(declare-fun m!1358967 () Bool)

(assert (=> b!1472221 m!1358967))

(assert (=> b!1472226 m!1358955))

(assert (=> b!1472226 m!1358955))

(declare-fun m!1358969 () Bool)

(assert (=> b!1472226 m!1358969))

(declare-fun m!1358971 () Bool)

(assert (=> b!1472227 m!1358971))

(declare-fun m!1358973 () Bool)

(assert (=> b!1472227 m!1358973))

(assert (=> b!1472225 m!1358955))

(assert (=> b!1472225 m!1358955))

(declare-fun m!1358975 () Bool)

(assert (=> b!1472225 m!1358975))

(assert (=> b!1472225 m!1358975))

(assert (=> b!1472225 m!1358955))

(declare-fun m!1358977 () Bool)

(assert (=> b!1472225 m!1358977))

(assert (=> b!1472224 m!1358963))

(declare-fun m!1358979 () Bool)

(assert (=> b!1472224 m!1358979))

(declare-fun m!1358981 () Bool)

(assert (=> b!1472215 m!1358981))

(assert (=> b!1472215 m!1358981))

(declare-fun m!1358983 () Bool)

(assert (=> b!1472215 m!1358983))

(declare-fun m!1358985 () Bool)

(assert (=> b!1472218 m!1358985))

(assert (=> b!1472218 m!1358955))

(assert (=> b!1472216 m!1358955))

(assert (=> b!1472216 m!1358955))

(declare-fun m!1358987 () Bool)

(assert (=> b!1472216 m!1358987))

(declare-fun m!1358989 () Bool)

(assert (=> b!1472217 m!1358989))

(declare-fun m!1358991 () Bool)

(assert (=> start!125786 m!1358991))

(declare-fun m!1358993 () Bool)

(assert (=> start!125786 m!1358993))

(push 1)

