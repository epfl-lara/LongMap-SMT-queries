; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126446 () Bool)

(assert start!126446)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1483045 () Bool)

(declare-fun lt!647119 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12245 0))(
  ( (MissingZero!12245 (index!51372 (_ BitVec 32))) (Found!12245 (index!51373 (_ BitVec 32))) (Intermediate!12245 (undefined!13057 Bool) (index!51374 (_ BitVec 32)) (x!132954 (_ BitVec 32))) (Undefined!12245) (MissingVacant!12245 (index!51375 (_ BitVec 32))) )
))
(declare-fun lt!647114 () SeekEntryResult!12245)

(declare-datatypes ((array!99406 0))(
  ( (array!99407 (arr!47980 (Array (_ BitVec 32) (_ BitVec 64))) (size!48532 (_ BitVec 32))) )
))
(declare-fun lt!647120 () array!99406)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!831562 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99406 (_ BitVec 32)) SeekEntryResult!12245)

(assert (=> b!1483045 (= e!831562 (= lt!647114 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647119 lt!647120 mask!2687)))))

(declare-fun b!1483046 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99406 (_ BitVec 32)) SeekEntryResult!12245)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99406 (_ BitVec 32)) SeekEntryResult!12245)

(assert (=> b!1483046 (= e!831562 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647119 lt!647120 mask!2687) (seekEntryOrOpen!0 lt!647119 lt!647120 mask!2687)))))

(declare-fun b!1483047 () Bool)

(declare-fun res!1008148 () Bool)

(declare-fun e!831564 () Bool)

(assert (=> b!1483047 (=> (not res!1008148) (not e!831564))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483047 (= res!1008148 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483048 () Bool)

(declare-fun res!1008156 () Bool)

(declare-fun e!831565 () Bool)

(assert (=> b!1483048 (=> (not res!1008156) (not e!831565))))

(declare-fun lt!647115 () SeekEntryResult!12245)

(declare-fun a!2862 () array!99406)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483048 (= res!1008156 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47980 a!2862) j!93) a!2862 mask!2687) lt!647115))))

(declare-fun b!1483049 () Bool)

(declare-fun res!1008152 () Bool)

(declare-fun e!831560 () Bool)

(assert (=> b!1483049 (=> (not res!1008152) (not e!831560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483049 (= res!1008152 (validKeyInArray!0 (select (arr!47980 a!2862) j!93)))))

(declare-fun b!1483050 () Bool)

(declare-fun e!831566 () Bool)

(assert (=> b!1483050 (= e!831564 (not e!831566))))

(declare-fun res!1008150 () Bool)

(assert (=> b!1483050 (=> res!1008150 e!831566)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483050 (= res!1008150 (or (and (= (select (arr!47980 a!2862) index!646) (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47980 a!2862) index!646) (select (arr!47980 a!2862) j!93))) (= (select (arr!47980 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!831563 () Bool)

(assert (=> b!1483050 e!831563))

(declare-fun res!1008154 () Bool)

(assert (=> b!1483050 (=> (not res!1008154) (not e!831563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99406 (_ BitVec 32)) Bool)

(assert (=> b!1483050 (= res!1008154 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49671 0))(
  ( (Unit!49672) )
))
(declare-fun lt!647117 () Unit!49671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49671)

(assert (=> b!1483050 (= lt!647117 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483051 () Bool)

(declare-fun e!831561 () Bool)

(assert (=> b!1483051 (= e!831561 e!831565)))

(declare-fun res!1008159 () Bool)

(assert (=> b!1483051 (=> (not res!1008159) (not e!831565))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483051 (= res!1008159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47980 a!2862) j!93) mask!2687) (select (arr!47980 a!2862) j!93) a!2862 mask!2687) lt!647115))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483051 (= lt!647115 (Intermediate!12245 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483052 () Bool)

(declare-fun res!1008149 () Bool)

(assert (=> b!1483052 (=> (not res!1008149) (not e!831560))))

(assert (=> b!1483052 (= res!1008149 (and (= (size!48532 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48532 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48532 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483053 () Bool)

(declare-fun e!831569 () Bool)

(assert (=> b!1483053 (= e!831569 (= (seekEntryOrOpen!0 lt!647119 lt!647120 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647119 lt!647120 mask!2687)))))

(declare-fun res!1008146 () Bool)

(assert (=> start!126446 (=> (not res!1008146) (not e!831560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126446 (= res!1008146 (validMask!0 mask!2687))))

(assert (=> start!126446 e!831560))

(assert (=> start!126446 true))

(declare-fun array_inv!37213 (array!99406) Bool)

(assert (=> start!126446 (array_inv!37213 a!2862)))

(declare-fun b!1483054 () Bool)

(assert (=> b!1483054 (= e!831560 e!831561)))

(declare-fun res!1008162 () Bool)

(assert (=> b!1483054 (=> (not res!1008162) (not e!831561))))

(assert (=> b!1483054 (= res!1008162 (= (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483054 (= lt!647120 (array!99407 (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48532 a!2862)))))

(declare-fun b!1483055 () Bool)

(declare-fun res!1008155 () Bool)

(assert (=> b!1483055 (=> (not res!1008155) (not e!831563))))

(assert (=> b!1483055 (= res!1008155 (= (seekEntryOrOpen!0 (select (arr!47980 a!2862) j!93) a!2862 mask!2687) (Found!12245 j!93)))))

(declare-fun b!1483056 () Bool)

(declare-fun res!1008158 () Bool)

(assert (=> b!1483056 (=> (not res!1008158) (not e!831563))))

(assert (=> b!1483056 (= res!1008158 (or (= (select (arr!47980 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47980 a!2862) intermediateBeforeIndex!19) (select (arr!47980 a!2862) j!93))))))

(declare-fun b!1483057 () Bool)

(declare-fun res!1008157 () Bool)

(assert (=> b!1483057 (=> (not res!1008157) (not e!831560))))

(assert (=> b!1483057 (= res!1008157 (validKeyInArray!0 (select (arr!47980 a!2862) i!1006)))))

(declare-fun b!1483058 () Bool)

(declare-fun res!1008153 () Bool)

(assert (=> b!1483058 (=> (not res!1008153) (not e!831560))))

(assert (=> b!1483058 (= res!1008153 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48532 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48532 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48532 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483059 () Bool)

(declare-fun res!1008145 () Bool)

(assert (=> b!1483059 (=> (not res!1008145) (not e!831564))))

(assert (=> b!1483059 (= res!1008145 e!831562)))

(declare-fun c!136975 () Bool)

(assert (=> b!1483059 (= c!136975 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483060 () Bool)

(declare-fun e!831567 () Bool)

(assert (=> b!1483060 (= e!831563 e!831567)))

(declare-fun res!1008163 () Bool)

(assert (=> b!1483060 (=> res!1008163 e!831567)))

(declare-fun lt!647116 () (_ BitVec 64))

(assert (=> b!1483060 (= res!1008163 (or (and (= (select (arr!47980 a!2862) index!646) lt!647116) (= (select (arr!47980 a!2862) index!646) (select (arr!47980 a!2862) j!93))) (= (select (arr!47980 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483060 (= lt!647116 (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483061 () Bool)

(assert (=> b!1483061 (= e!831566 true)))

(declare-fun lt!647118 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483061 (= lt!647118 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483062 () Bool)

(assert (=> b!1483062 (= e!831565 e!831564)))

(declare-fun res!1008151 () Bool)

(assert (=> b!1483062 (=> (not res!1008151) (not e!831564))))

(assert (=> b!1483062 (= res!1008151 (= lt!647114 (Intermediate!12245 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483062 (= lt!647114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647119 mask!2687) lt!647119 lt!647120 mask!2687))))

(assert (=> b!1483062 (= lt!647119 (select (store (arr!47980 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483063 () Bool)

(assert (=> b!1483063 (= e!831567 e!831569)))

(declare-fun res!1008147 () Bool)

(assert (=> b!1483063 (=> (not res!1008147) (not e!831569))))

(assert (=> b!1483063 (= res!1008147 (and (= index!646 intermediateAfterIndex!19) (= lt!647116 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483064 () Bool)

(declare-fun res!1008161 () Bool)

(assert (=> b!1483064 (=> (not res!1008161) (not e!831560))))

(declare-datatypes ((List!34559 0))(
  ( (Nil!34556) (Cons!34555 (h!35929 (_ BitVec 64)) (t!49245 List!34559)) )
))
(declare-fun arrayNoDuplicates!0 (array!99406 (_ BitVec 32) List!34559) Bool)

(assert (=> b!1483064 (= res!1008161 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34556))))

(declare-fun b!1483065 () Bool)

(declare-fun res!1008160 () Bool)

(assert (=> b!1483065 (=> (not res!1008160) (not e!831560))))

(assert (=> b!1483065 (= res!1008160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126446 res!1008146) b!1483052))

(assert (= (and b!1483052 res!1008149) b!1483057))

(assert (= (and b!1483057 res!1008157) b!1483049))

(assert (= (and b!1483049 res!1008152) b!1483065))

(assert (= (and b!1483065 res!1008160) b!1483064))

(assert (= (and b!1483064 res!1008161) b!1483058))

(assert (= (and b!1483058 res!1008153) b!1483054))

(assert (= (and b!1483054 res!1008162) b!1483051))

(assert (= (and b!1483051 res!1008159) b!1483048))

(assert (= (and b!1483048 res!1008156) b!1483062))

(assert (= (and b!1483062 res!1008151) b!1483059))

(assert (= (and b!1483059 c!136975) b!1483045))

(assert (= (and b!1483059 (not c!136975)) b!1483046))

(assert (= (and b!1483059 res!1008145) b!1483047))

(assert (= (and b!1483047 res!1008148) b!1483050))

(assert (= (and b!1483050 res!1008154) b!1483055))

(assert (= (and b!1483055 res!1008155) b!1483056))

(assert (= (and b!1483056 res!1008158) b!1483060))

(assert (= (and b!1483060 (not res!1008163)) b!1483063))

(assert (= (and b!1483063 res!1008147) b!1483053))

(assert (= (and b!1483050 (not res!1008150)) b!1483061))

(declare-fun m!1367997 () Bool)

(assert (=> b!1483046 m!1367997))

(declare-fun m!1367999 () Bool)

(assert (=> b!1483046 m!1367999))

(declare-fun m!1368001 () Bool)

(assert (=> b!1483048 m!1368001))

(assert (=> b!1483048 m!1368001))

(declare-fun m!1368003 () Bool)

(assert (=> b!1483048 m!1368003))

(declare-fun m!1368005 () Bool)

(assert (=> b!1483065 m!1368005))

(declare-fun m!1368007 () Bool)

(assert (=> b!1483054 m!1368007))

(declare-fun m!1368009 () Bool)

(assert (=> b!1483054 m!1368009))

(declare-fun m!1368011 () Bool)

(assert (=> b!1483057 m!1368011))

(assert (=> b!1483057 m!1368011))

(declare-fun m!1368013 () Bool)

(assert (=> b!1483057 m!1368013))

(assert (=> b!1483053 m!1367999))

(assert (=> b!1483053 m!1367997))

(declare-fun m!1368015 () Bool)

(assert (=> b!1483050 m!1368015))

(assert (=> b!1483050 m!1368007))

(declare-fun m!1368017 () Bool)

(assert (=> b!1483050 m!1368017))

(declare-fun m!1368019 () Bool)

(assert (=> b!1483050 m!1368019))

(declare-fun m!1368021 () Bool)

(assert (=> b!1483050 m!1368021))

(assert (=> b!1483050 m!1368001))

(assert (=> b!1483049 m!1368001))

(assert (=> b!1483049 m!1368001))

(declare-fun m!1368023 () Bool)

(assert (=> b!1483049 m!1368023))

(declare-fun m!1368025 () Bool)

(assert (=> b!1483062 m!1368025))

(assert (=> b!1483062 m!1368025))

(declare-fun m!1368027 () Bool)

(assert (=> b!1483062 m!1368027))

(assert (=> b!1483062 m!1368007))

(declare-fun m!1368029 () Bool)

(assert (=> b!1483062 m!1368029))

(assert (=> b!1483051 m!1368001))

(assert (=> b!1483051 m!1368001))

(declare-fun m!1368031 () Bool)

(assert (=> b!1483051 m!1368031))

(assert (=> b!1483051 m!1368031))

(assert (=> b!1483051 m!1368001))

(declare-fun m!1368033 () Bool)

(assert (=> b!1483051 m!1368033))

(declare-fun m!1368035 () Bool)

(assert (=> b!1483061 m!1368035))

(declare-fun m!1368037 () Bool)

(assert (=> start!126446 m!1368037))

(declare-fun m!1368039 () Bool)

(assert (=> start!126446 m!1368039))

(declare-fun m!1368041 () Bool)

(assert (=> b!1483056 m!1368041))

(assert (=> b!1483056 m!1368001))

(assert (=> b!1483060 m!1368019))

(assert (=> b!1483060 m!1368001))

(assert (=> b!1483060 m!1368007))

(assert (=> b!1483060 m!1368017))

(assert (=> b!1483055 m!1368001))

(assert (=> b!1483055 m!1368001))

(declare-fun m!1368043 () Bool)

(assert (=> b!1483055 m!1368043))

(declare-fun m!1368045 () Bool)

(assert (=> b!1483064 m!1368045))

(declare-fun m!1368047 () Bool)

(assert (=> b!1483045 m!1368047))

(check-sat (not b!1483050) (not b!1483049) (not b!1483061) (not b!1483057) (not b!1483046) (not b!1483048) (not start!126446) (not b!1483051) (not b!1483045) (not b!1483055) (not b!1483065) (not b!1483053) (not b!1483062) (not b!1483064))
(check-sat)
