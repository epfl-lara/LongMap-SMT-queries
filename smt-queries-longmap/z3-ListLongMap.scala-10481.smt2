; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123260 () Bool)

(assert start!123260)

(declare-fun b!1429329 () Bool)

(declare-fun e!807088 () Bool)

(declare-fun e!807092 () Bool)

(assert (=> b!1429329 (= e!807088 e!807092)))

(declare-fun res!964011 () Bool)

(assert (=> b!1429329 (=> (not res!964011) (not e!807092))))

(declare-datatypes ((SeekEntryResult!11305 0))(
  ( (MissingZero!11305 (index!47612 (_ BitVec 32))) (Found!11305 (index!47613 (_ BitVec 32))) (Intermediate!11305 (undefined!12117 Bool) (index!47614 (_ BitVec 32)) (x!129240 (_ BitVec 32))) (Undefined!11305) (MissingVacant!11305 (index!47615 (_ BitVec 32))) )
))
(declare-fun lt!629165 () SeekEntryResult!11305)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97374 0))(
  ( (array!97375 (arr!46999 (Array (_ BitVec 32) (_ BitVec 64))) (size!47551 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97374)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97374 (_ BitVec 32)) SeekEntryResult!11305)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429329 (= res!964011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46999 a!2831) j!81) mask!2608) (select (arr!46999 a!2831) j!81) a!2831 mask!2608) lt!629165))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429329 (= lt!629165 (Intermediate!11305 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429330 () Bool)

(declare-fun e!807090 () Bool)

(assert (=> b!1429330 (= e!807092 e!807090)))

(declare-fun res!964009 () Bool)

(assert (=> b!1429330 (=> (not res!964009) (not e!807090))))

(declare-fun lt!629167 () (_ BitVec 64))

(declare-fun lt!629164 () SeekEntryResult!11305)

(declare-fun lt!629168 () array!97374)

(assert (=> b!1429330 (= res!964009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629167 mask!2608) lt!629167 lt!629168 mask!2608) lt!629164))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429330 (= lt!629164 (Intermediate!11305 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429330 (= lt!629167 (select (store (arr!46999 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429330 (= lt!629168 (array!97375 (store (arr!46999 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47551 a!2831)))))

(declare-fun b!1429331 () Bool)

(declare-fun res!964014 () Bool)

(assert (=> b!1429331 (=> (not res!964014) (not e!807088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429331 (= res!964014 (validKeyInArray!0 (select (arr!46999 a!2831) j!81)))))

(declare-fun b!1429332 () Bool)

(declare-fun res!964020 () Bool)

(assert (=> b!1429332 (=> (not res!964020) (not e!807088))))

(assert (=> b!1429332 (= res!964020 (validKeyInArray!0 (select (arr!46999 a!2831) i!982)))))

(declare-fun b!1429333 () Bool)

(declare-fun res!964016 () Bool)

(assert (=> b!1429333 (=> (not res!964016) (not e!807088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97374 (_ BitVec 32)) Bool)

(assert (=> b!1429333 (= res!964016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!964018 () Bool)

(assert (=> start!123260 (=> (not res!964018) (not e!807088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123260 (= res!964018 (validMask!0 mask!2608))))

(assert (=> start!123260 e!807088))

(assert (=> start!123260 true))

(declare-fun array_inv!36232 (array!97374) Bool)

(assert (=> start!123260 (array_inv!36232 a!2831)))

(declare-fun b!1429334 () Bool)

(declare-fun res!964019 () Bool)

(assert (=> b!1429334 (=> (not res!964019) (not e!807088))))

(declare-datatypes ((List!33587 0))(
  ( (Nil!33584) (Cons!33583 (h!34897 (_ BitVec 64)) (t!48273 List!33587)) )
))
(declare-fun arrayNoDuplicates!0 (array!97374 (_ BitVec 32) List!33587) Bool)

(assert (=> b!1429334 (= res!964019 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33584))))

(declare-fun b!1429335 () Bool)

(declare-fun e!807091 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97374 (_ BitVec 32)) SeekEntryResult!11305)

(assert (=> b!1429335 (= e!807091 (= (seekEntryOrOpen!0 (select (arr!46999 a!2831) j!81) a!2831 mask!2608) (Found!11305 j!81)))))

(declare-fun b!1429336 () Bool)

(declare-fun res!964013 () Bool)

(assert (=> b!1429336 (=> (not res!964013) (not e!807090))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429336 (= res!964013 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46999 a!2831) j!81) a!2831 mask!2608) lt!629165))))

(declare-fun b!1429337 () Bool)

(declare-fun res!964017 () Bool)

(assert (=> b!1429337 (=> (not res!964017) (not e!807088))))

(assert (=> b!1429337 (= res!964017 (and (= (size!47551 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47551 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47551 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429338 () Bool)

(declare-fun res!964021 () Bool)

(assert (=> b!1429338 (=> (not res!964021) (not e!807088))))

(assert (=> b!1429338 (= res!964021 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47551 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47551 a!2831))))))

(declare-fun b!1429339 () Bool)

(declare-fun res!964015 () Bool)

(assert (=> b!1429339 (=> (not res!964015) (not e!807090))))

(assert (=> b!1429339 (= res!964015 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429340 () Bool)

(assert (=> b!1429340 (= e!807090 (not true))))

(assert (=> b!1429340 e!807091))

(declare-fun res!964012 () Bool)

(assert (=> b!1429340 (=> (not res!964012) (not e!807091))))

(assert (=> b!1429340 (= res!964012 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48195 0))(
  ( (Unit!48196) )
))
(declare-fun lt!629166 () Unit!48195)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48195)

(assert (=> b!1429340 (= lt!629166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429341 () Bool)

(declare-fun res!964010 () Bool)

(assert (=> b!1429341 (=> (not res!964010) (not e!807090))))

(assert (=> b!1429341 (= res!964010 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629167 lt!629168 mask!2608) lt!629164))))

(assert (= (and start!123260 res!964018) b!1429337))

(assert (= (and b!1429337 res!964017) b!1429332))

(assert (= (and b!1429332 res!964020) b!1429331))

(assert (= (and b!1429331 res!964014) b!1429333))

(assert (= (and b!1429333 res!964016) b!1429334))

(assert (= (and b!1429334 res!964019) b!1429338))

(assert (= (and b!1429338 res!964021) b!1429329))

(assert (= (and b!1429329 res!964011) b!1429330))

(assert (= (and b!1429330 res!964009) b!1429336))

(assert (= (and b!1429336 res!964013) b!1429341))

(assert (= (and b!1429341 res!964010) b!1429339))

(assert (= (and b!1429339 res!964015) b!1429340))

(assert (= (and b!1429340 res!964012) b!1429335))

(declare-fun m!1318959 () Bool)

(assert (=> b!1429334 m!1318959))

(declare-fun m!1318961 () Bool)

(assert (=> b!1429335 m!1318961))

(assert (=> b!1429335 m!1318961))

(declare-fun m!1318963 () Bool)

(assert (=> b!1429335 m!1318963))

(declare-fun m!1318965 () Bool)

(assert (=> b!1429340 m!1318965))

(declare-fun m!1318967 () Bool)

(assert (=> b!1429340 m!1318967))

(declare-fun m!1318969 () Bool)

(assert (=> b!1429332 m!1318969))

(assert (=> b!1429332 m!1318969))

(declare-fun m!1318971 () Bool)

(assert (=> b!1429332 m!1318971))

(assert (=> b!1429331 m!1318961))

(assert (=> b!1429331 m!1318961))

(declare-fun m!1318973 () Bool)

(assert (=> b!1429331 m!1318973))

(assert (=> b!1429336 m!1318961))

(assert (=> b!1429336 m!1318961))

(declare-fun m!1318975 () Bool)

(assert (=> b!1429336 m!1318975))

(assert (=> b!1429329 m!1318961))

(assert (=> b!1429329 m!1318961))

(declare-fun m!1318977 () Bool)

(assert (=> b!1429329 m!1318977))

(assert (=> b!1429329 m!1318977))

(assert (=> b!1429329 m!1318961))

(declare-fun m!1318979 () Bool)

(assert (=> b!1429329 m!1318979))

(declare-fun m!1318981 () Bool)

(assert (=> b!1429330 m!1318981))

(assert (=> b!1429330 m!1318981))

(declare-fun m!1318983 () Bool)

(assert (=> b!1429330 m!1318983))

(declare-fun m!1318985 () Bool)

(assert (=> b!1429330 m!1318985))

(declare-fun m!1318987 () Bool)

(assert (=> b!1429330 m!1318987))

(declare-fun m!1318989 () Bool)

(assert (=> start!123260 m!1318989))

(declare-fun m!1318991 () Bool)

(assert (=> start!123260 m!1318991))

(declare-fun m!1318993 () Bool)

(assert (=> b!1429341 m!1318993))

(declare-fun m!1318995 () Bool)

(assert (=> b!1429333 m!1318995))

(check-sat (not b!1429332) (not b!1429340) (not b!1429336) (not b!1429334) (not b!1429329) (not start!123260) (not b!1429330) (not b!1429335) (not b!1429331) (not b!1429333) (not b!1429341))
(check-sat)
