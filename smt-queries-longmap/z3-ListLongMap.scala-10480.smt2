; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123260 () Bool)

(assert start!123260)

(declare-fun b!1429332 () Bool)

(declare-fun res!963963 () Bool)

(declare-fun e!807100 () Bool)

(assert (=> b!1429332 (=> (not res!963963) (not e!807100))))

(declare-datatypes ((array!97421 0))(
  ( (array!97422 (arr!47022 (Array (_ BitVec 32) (_ BitVec 64))) (size!47572 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97421)

(declare-datatypes ((List!33532 0))(
  ( (Nil!33529) (Cons!33528 (h!34842 (_ BitVec 64)) (t!48226 List!33532)) )
))
(declare-fun arrayNoDuplicates!0 (array!97421 (_ BitVec 32) List!33532) Bool)

(assert (=> b!1429332 (= res!963963 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33529))))

(declare-fun b!1429333 () Bool)

(declare-fun e!807098 () Bool)

(declare-fun e!807097 () Bool)

(assert (=> b!1429333 (= e!807098 e!807097)))

(declare-fun res!963969 () Bool)

(assert (=> b!1429333 (=> (not res!963969) (not e!807097))))

(declare-fun lt!629326 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11301 0))(
  ( (MissingZero!11301 (index!47596 (_ BitVec 32))) (Found!11301 (index!47597 (_ BitVec 32))) (Intermediate!11301 (undefined!12113 Bool) (index!47598 (_ BitVec 32)) (x!129231 (_ BitVec 32))) (Undefined!11301) (MissingVacant!11301 (index!47599 (_ BitVec 32))) )
))
(declare-fun lt!629328 () SeekEntryResult!11301)

(declare-fun lt!629324 () array!97421)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97421 (_ BitVec 32)) SeekEntryResult!11301)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429333 (= res!963969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629326 mask!2608) lt!629326 lt!629324 mask!2608) lt!629328))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429333 (= lt!629328 (Intermediate!11301 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1429333 (= lt!629326 (select (store (arr!47022 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429333 (= lt!629324 (array!97422 (store (arr!47022 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47572 a!2831)))))

(declare-fun res!963962 () Bool)

(assert (=> start!123260 (=> (not res!963962) (not e!807100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123260 (= res!963962 (validMask!0 mask!2608))))

(assert (=> start!123260 e!807100))

(assert (=> start!123260 true))

(declare-fun array_inv!36050 (array!97421) Bool)

(assert (=> start!123260 (array_inv!36050 a!2831)))

(declare-fun b!1429334 () Bool)

(declare-fun res!963970 () Bool)

(assert (=> b!1429334 (=> (not res!963970) (not e!807097))))

(declare-fun lt!629325 () SeekEntryResult!11301)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429334 (= res!963970 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47022 a!2831) j!81) a!2831 mask!2608) lt!629325))))

(declare-fun b!1429335 () Bool)

(declare-fun res!963965 () Bool)

(assert (=> b!1429335 (=> (not res!963965) (not e!807100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97421 (_ BitVec 32)) Bool)

(assert (=> b!1429335 (= res!963965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429336 () Bool)

(assert (=> b!1429336 (= e!807097 (not true))))

(declare-fun e!807099 () Bool)

(assert (=> b!1429336 e!807099))

(declare-fun res!963966 () Bool)

(assert (=> b!1429336 (=> (not res!963966) (not e!807099))))

(assert (=> b!1429336 (= res!963966 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48348 0))(
  ( (Unit!48349) )
))
(declare-fun lt!629327 () Unit!48348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48348)

(assert (=> b!1429336 (= lt!629327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429337 () Bool)

(declare-fun res!963972 () Bool)

(assert (=> b!1429337 (=> (not res!963972) (not e!807097))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1429337 (= res!963972 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429338 () Bool)

(assert (=> b!1429338 (= e!807100 e!807098)))

(declare-fun res!963968 () Bool)

(assert (=> b!1429338 (=> (not res!963968) (not e!807098))))

(assert (=> b!1429338 (= res!963968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47022 a!2831) j!81) mask!2608) (select (arr!47022 a!2831) j!81) a!2831 mask!2608) lt!629325))))

(assert (=> b!1429338 (= lt!629325 (Intermediate!11301 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429339 () Bool)

(declare-fun res!963971 () Bool)

(assert (=> b!1429339 (=> (not res!963971) (not e!807100))))

(assert (=> b!1429339 (= res!963971 (and (= (size!47572 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47572 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47572 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429340 () Bool)

(declare-fun res!963967 () Bool)

(assert (=> b!1429340 (=> (not res!963967) (not e!807100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429340 (= res!963967 (validKeyInArray!0 (select (arr!47022 a!2831) j!81)))))

(declare-fun b!1429341 () Bool)

(declare-fun res!963961 () Bool)

(assert (=> b!1429341 (=> (not res!963961) (not e!807100))))

(assert (=> b!1429341 (= res!963961 (validKeyInArray!0 (select (arr!47022 a!2831) i!982)))))

(declare-fun b!1429342 () Bool)

(declare-fun res!963964 () Bool)

(assert (=> b!1429342 (=> (not res!963964) (not e!807097))))

(assert (=> b!1429342 (= res!963964 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629326 lt!629324 mask!2608) lt!629328))))

(declare-fun b!1429343 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97421 (_ BitVec 32)) SeekEntryResult!11301)

(assert (=> b!1429343 (= e!807099 (= (seekEntryOrOpen!0 (select (arr!47022 a!2831) j!81) a!2831 mask!2608) (Found!11301 j!81)))))

(declare-fun b!1429344 () Bool)

(declare-fun res!963973 () Bool)

(assert (=> b!1429344 (=> (not res!963973) (not e!807100))))

(assert (=> b!1429344 (= res!963973 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47572 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47572 a!2831))))))

(assert (= (and start!123260 res!963962) b!1429339))

(assert (= (and b!1429339 res!963971) b!1429341))

(assert (= (and b!1429341 res!963961) b!1429340))

(assert (= (and b!1429340 res!963967) b!1429335))

(assert (= (and b!1429335 res!963965) b!1429332))

(assert (= (and b!1429332 res!963963) b!1429344))

(assert (= (and b!1429344 res!963973) b!1429338))

(assert (= (and b!1429338 res!963968) b!1429333))

(assert (= (and b!1429333 res!963969) b!1429334))

(assert (= (and b!1429334 res!963970) b!1429342))

(assert (= (and b!1429342 res!963964) b!1429337))

(assert (= (and b!1429337 res!963972) b!1429336))

(assert (= (and b!1429336 res!963966) b!1429343))

(declare-fun m!1319435 () Bool)

(assert (=> b!1429334 m!1319435))

(assert (=> b!1429334 m!1319435))

(declare-fun m!1319437 () Bool)

(assert (=> b!1429334 m!1319437))

(declare-fun m!1319439 () Bool)

(assert (=> b!1429336 m!1319439))

(declare-fun m!1319441 () Bool)

(assert (=> b!1429336 m!1319441))

(assert (=> b!1429338 m!1319435))

(assert (=> b!1429338 m!1319435))

(declare-fun m!1319443 () Bool)

(assert (=> b!1429338 m!1319443))

(assert (=> b!1429338 m!1319443))

(assert (=> b!1429338 m!1319435))

(declare-fun m!1319445 () Bool)

(assert (=> b!1429338 m!1319445))

(declare-fun m!1319447 () Bool)

(assert (=> b!1429333 m!1319447))

(assert (=> b!1429333 m!1319447))

(declare-fun m!1319449 () Bool)

(assert (=> b!1429333 m!1319449))

(declare-fun m!1319451 () Bool)

(assert (=> b!1429333 m!1319451))

(declare-fun m!1319453 () Bool)

(assert (=> b!1429333 m!1319453))

(declare-fun m!1319455 () Bool)

(assert (=> b!1429342 m!1319455))

(assert (=> b!1429340 m!1319435))

(assert (=> b!1429340 m!1319435))

(declare-fun m!1319457 () Bool)

(assert (=> b!1429340 m!1319457))

(declare-fun m!1319459 () Bool)

(assert (=> start!123260 m!1319459))

(declare-fun m!1319461 () Bool)

(assert (=> start!123260 m!1319461))

(assert (=> b!1429343 m!1319435))

(assert (=> b!1429343 m!1319435))

(declare-fun m!1319463 () Bool)

(assert (=> b!1429343 m!1319463))

(declare-fun m!1319465 () Bool)

(assert (=> b!1429332 m!1319465))

(declare-fun m!1319467 () Bool)

(assert (=> b!1429341 m!1319467))

(assert (=> b!1429341 m!1319467))

(declare-fun m!1319469 () Bool)

(assert (=> b!1429341 m!1319469))

(declare-fun m!1319471 () Bool)

(assert (=> b!1429335 m!1319471))

(check-sat (not b!1429333) (not b!1429341) (not b!1429332) (not b!1429338) (not b!1429343) (not b!1429342) (not b!1429336) (not start!123260) (not b!1429334) (not b!1429335) (not b!1429340))
(check-sat)
