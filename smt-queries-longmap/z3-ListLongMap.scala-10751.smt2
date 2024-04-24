; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126042 () Bool)

(assert start!126042)

(declare-fun b!1473360 () Bool)

(declare-fun e!827090 () Bool)

(assert (=> b!1473360 (= e!827090 (not true))))

(declare-fun e!827088 () Bool)

(assert (=> b!1473360 e!827088))

(declare-fun res!1000026 () Bool)

(assert (=> b!1473360 (=> (not res!1000026) (not e!827088))))

(declare-datatypes ((array!99214 0))(
  ( (array!99215 (arr!47887 (Array (_ BitVec 32) (_ BitVec 64))) (size!48438 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99214)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99214 (_ BitVec 32)) Bool)

(assert (=> b!1473360 (= res!1000026 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49421 0))(
  ( (Unit!49422) )
))
(declare-fun lt!643977 () Unit!49421)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49421)

(assert (=> b!1473360 (= lt!643977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473361 () Bool)

(declare-fun e!827091 () Bool)

(declare-fun e!827092 () Bool)

(assert (=> b!1473361 (= e!827091 e!827092)))

(declare-fun res!1000023 () Bool)

(assert (=> b!1473361 (=> (not res!1000023) (not e!827092))))

(declare-datatypes ((SeekEntryResult!12024 0))(
  ( (MissingZero!12024 (index!50488 (_ BitVec 32))) (Found!12024 (index!50489 (_ BitVec 32))) (Intermediate!12024 (undefined!12836 Bool) (index!50490 (_ BitVec 32)) (x!132260 (_ BitVec 32))) (Undefined!12024) (MissingVacant!12024 (index!50491 (_ BitVec 32))) )
))
(declare-fun lt!643979 () SeekEntryResult!12024)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12024)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473361 (= res!1000023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687) (select (arr!47887 a!2862) j!93) a!2862 mask!2687) lt!643979))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473361 (= lt!643979 (Intermediate!12024 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643981 () array!99214)

(declare-fun lt!643978 () SeekEntryResult!12024)

(declare-fun b!1473362 () Bool)

(declare-fun e!827093 () Bool)

(declare-fun lt!643980 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1473362 (= e!827093 (= lt!643978 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643980 lt!643981 mask!2687)))))

(declare-fun b!1473363 () Bool)

(declare-fun res!1000027 () Bool)

(assert (=> b!1473363 (=> (not res!1000027) (not e!827090))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473363 (= res!1000027 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1000021 () Bool)

(declare-fun e!827089 () Bool)

(assert (=> start!126042 (=> (not res!1000021) (not e!827089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126042 (= res!1000021 (validMask!0 mask!2687))))

(assert (=> start!126042 e!827089))

(assert (=> start!126042 true))

(declare-fun array_inv!37168 (array!99214) Bool)

(assert (=> start!126042 (array_inv!37168 a!2862)))

(declare-fun b!1473364 () Bool)

(declare-fun res!1000028 () Bool)

(assert (=> b!1473364 (=> (not res!1000028) (not e!827089))))

(assert (=> b!1473364 (= res!1000028 (and (= (size!48438 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48438 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48438 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473365 () Bool)

(declare-fun res!1000020 () Bool)

(assert (=> b!1473365 (=> (not res!1000020) (not e!827090))))

(assert (=> b!1473365 (= res!1000020 e!827093)))

(declare-fun c!136195 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473365 (= c!136195 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473366 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12024)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12024)

(assert (=> b!1473366 (= e!827093 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643980 lt!643981 mask!2687) (seekEntryOrOpen!0 lt!643980 lt!643981 mask!2687)))))

(declare-fun b!1473367 () Bool)

(declare-fun res!1000024 () Bool)

(assert (=> b!1473367 (=> (not res!1000024) (not e!827089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473367 (= res!1000024 (validKeyInArray!0 (select (arr!47887 a!2862) i!1006)))))

(declare-fun b!1473368 () Bool)

(assert (=> b!1473368 (= e!827089 e!827091)))

(declare-fun res!1000019 () Bool)

(assert (=> b!1473368 (=> (not res!1000019) (not e!827091))))

(assert (=> b!1473368 (= res!1000019 (= (select (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473368 (= lt!643981 (array!99215 (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48438 a!2862)))))

(declare-fun b!1473369 () Bool)

(declare-fun res!1000025 () Bool)

(assert (=> b!1473369 (=> (not res!1000025) (not e!827089))))

(assert (=> b!1473369 (= res!1000025 (validKeyInArray!0 (select (arr!47887 a!2862) j!93)))))

(declare-fun b!1473370 () Bool)

(declare-fun res!1000030 () Bool)

(assert (=> b!1473370 (=> (not res!1000030) (not e!827092))))

(assert (=> b!1473370 (= res!1000030 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47887 a!2862) j!93) a!2862 mask!2687) lt!643979))))

(declare-fun b!1473371 () Bool)

(assert (=> b!1473371 (= e!827092 e!827090)))

(declare-fun res!1000029 () Bool)

(assert (=> b!1473371 (=> (not res!1000029) (not e!827090))))

(assert (=> b!1473371 (= res!1000029 (= lt!643978 (Intermediate!12024 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473371 (= lt!643978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643980 mask!2687) lt!643980 lt!643981 mask!2687))))

(assert (=> b!1473371 (= lt!643980 (select (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473372 () Bool)

(declare-fun res!1000022 () Bool)

(assert (=> b!1473372 (=> (not res!1000022) (not e!827088))))

(assert (=> b!1473372 (= res!1000022 (= (seekEntryOrOpen!0 (select (arr!47887 a!2862) j!93) a!2862 mask!2687) (Found!12024 j!93)))))

(declare-fun b!1473373 () Bool)

(declare-fun res!1000031 () Bool)

(assert (=> b!1473373 (=> (not res!1000031) (not e!827089))))

(declare-datatypes ((List!34375 0))(
  ( (Nil!34372) (Cons!34371 (h!35741 (_ BitVec 64)) (t!49061 List!34375)) )
))
(declare-fun arrayNoDuplicates!0 (array!99214 (_ BitVec 32) List!34375) Bool)

(assert (=> b!1473373 (= res!1000031 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34372))))

(declare-fun b!1473374 () Bool)

(declare-fun res!1000017 () Bool)

(assert (=> b!1473374 (=> (not res!1000017) (not e!827089))))

(assert (=> b!1473374 (= res!1000017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473375 () Bool)

(declare-fun res!1000018 () Bool)

(assert (=> b!1473375 (=> (not res!1000018) (not e!827089))))

(assert (=> b!1473375 (= res!1000018 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48438 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48438 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48438 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473376 () Bool)

(assert (=> b!1473376 (= e!827088 (or (= (select (arr!47887 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47887 a!2862) intermediateBeforeIndex!19) (select (arr!47887 a!2862) j!93))))))

(assert (= (and start!126042 res!1000021) b!1473364))

(assert (= (and b!1473364 res!1000028) b!1473367))

(assert (= (and b!1473367 res!1000024) b!1473369))

(assert (= (and b!1473369 res!1000025) b!1473374))

(assert (= (and b!1473374 res!1000017) b!1473373))

(assert (= (and b!1473373 res!1000031) b!1473375))

(assert (= (and b!1473375 res!1000018) b!1473368))

(assert (= (and b!1473368 res!1000019) b!1473361))

(assert (= (and b!1473361 res!1000023) b!1473370))

(assert (= (and b!1473370 res!1000030) b!1473371))

(assert (= (and b!1473371 res!1000029) b!1473365))

(assert (= (and b!1473365 c!136195) b!1473362))

(assert (= (and b!1473365 (not c!136195)) b!1473366))

(assert (= (and b!1473365 res!1000020) b!1473363))

(assert (= (and b!1473363 res!1000027) b!1473360))

(assert (= (and b!1473360 res!1000026) b!1473372))

(assert (= (and b!1473372 res!1000022) b!1473376))

(declare-fun m!1360129 () Bool)

(assert (=> b!1473362 m!1360129))

(declare-fun m!1360131 () Bool)

(assert (=> b!1473370 m!1360131))

(assert (=> b!1473370 m!1360131))

(declare-fun m!1360133 () Bool)

(assert (=> b!1473370 m!1360133))

(declare-fun m!1360135 () Bool)

(assert (=> b!1473374 m!1360135))

(declare-fun m!1360137 () Bool)

(assert (=> b!1473371 m!1360137))

(assert (=> b!1473371 m!1360137))

(declare-fun m!1360139 () Bool)

(assert (=> b!1473371 m!1360139))

(declare-fun m!1360141 () Bool)

(assert (=> b!1473371 m!1360141))

(declare-fun m!1360143 () Bool)

(assert (=> b!1473371 m!1360143))

(declare-fun m!1360145 () Bool)

(assert (=> b!1473366 m!1360145))

(declare-fun m!1360147 () Bool)

(assert (=> b!1473366 m!1360147))

(assert (=> b!1473361 m!1360131))

(assert (=> b!1473361 m!1360131))

(declare-fun m!1360149 () Bool)

(assert (=> b!1473361 m!1360149))

(assert (=> b!1473361 m!1360149))

(assert (=> b!1473361 m!1360131))

(declare-fun m!1360151 () Bool)

(assert (=> b!1473361 m!1360151))

(assert (=> b!1473369 m!1360131))

(assert (=> b!1473369 m!1360131))

(declare-fun m!1360153 () Bool)

(assert (=> b!1473369 m!1360153))

(declare-fun m!1360155 () Bool)

(assert (=> start!126042 m!1360155))

(declare-fun m!1360157 () Bool)

(assert (=> start!126042 m!1360157))

(assert (=> b!1473368 m!1360141))

(declare-fun m!1360159 () Bool)

(assert (=> b!1473368 m!1360159))

(declare-fun m!1360161 () Bool)

(assert (=> b!1473376 m!1360161))

(assert (=> b!1473376 m!1360131))

(declare-fun m!1360163 () Bool)

(assert (=> b!1473373 m!1360163))

(declare-fun m!1360165 () Bool)

(assert (=> b!1473360 m!1360165))

(declare-fun m!1360167 () Bool)

(assert (=> b!1473360 m!1360167))

(assert (=> b!1473372 m!1360131))

(assert (=> b!1473372 m!1360131))

(declare-fun m!1360169 () Bool)

(assert (=> b!1473372 m!1360169))

(declare-fun m!1360171 () Bool)

(assert (=> b!1473367 m!1360171))

(assert (=> b!1473367 m!1360171))

(declare-fun m!1360173 () Bool)

(assert (=> b!1473367 m!1360173))

(check-sat (not b!1473370) (not b!1473367) (not b!1473369) (not b!1473362) (not b!1473366) (not b!1473373) (not b!1473361) (not start!126042) (not b!1473371) (not b!1473374) (not b!1473360) (not b!1473372))
(check-sat)
