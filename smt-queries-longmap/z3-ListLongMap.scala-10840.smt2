; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126836 () Bool)

(assert start!126836)

(declare-fun b!1490365 () Bool)

(declare-fun res!1013839 () Bool)

(declare-fun e!835089 () Bool)

(assert (=> b!1490365 (=> (not res!1013839) (not e!835089))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99607 0))(
  ( (array!99608 (arr!48076 (Array (_ BitVec 32) (_ BitVec 64))) (size!48628 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99607)

(assert (=> b!1490365 (= res!1013839 (and (= (size!48628 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48628 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48628 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490366 () Bool)

(declare-fun res!1013847 () Bool)

(assert (=> b!1490366 (=> (not res!1013847) (not e!835089))))

(declare-datatypes ((List!34655 0))(
  ( (Nil!34652) (Cons!34651 (h!36034 (_ BitVec 64)) (t!49341 List!34655)) )
))
(declare-fun arrayNoDuplicates!0 (array!99607 (_ BitVec 32) List!34655) Bool)

(assert (=> b!1490366 (= res!1013847 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34652))))

(declare-fun lt!649738 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12341 0))(
  ( (MissingZero!12341 (index!51756 (_ BitVec 32))) (Found!12341 (index!51757 (_ BitVec 32))) (Intermediate!12341 (undefined!13153 Bool) (index!51758 (_ BitVec 32)) (x!133342 (_ BitVec 32))) (Undefined!12341) (MissingVacant!12341 (index!51759 (_ BitVec 32))) )
))
(declare-fun lt!649737 () SeekEntryResult!12341)

(declare-fun e!835087 () Bool)

(declare-fun b!1490367 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649742 () array!99607)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99607 (_ BitVec 32)) SeekEntryResult!12341)

(assert (=> b!1490367 (= e!835087 (= lt!649737 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649738 lt!649742 mask!2687)))))

(declare-fun b!1490368 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!835085 () Bool)

(assert (=> b!1490368 (= e!835085 (or (= (select (arr!48076 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48076 a!2862) intermediateBeforeIndex!19) (select (arr!48076 a!2862) j!93))))))

(declare-fun res!1013841 () Bool)

(assert (=> start!126836 (=> (not res!1013841) (not e!835089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126836 (= res!1013841 (validMask!0 mask!2687))))

(assert (=> start!126836 e!835089))

(assert (=> start!126836 true))

(declare-fun array_inv!37309 (array!99607) Bool)

(assert (=> start!126836 (array_inv!37309 a!2862)))

(declare-fun b!1490369 () Bool)

(declare-fun res!1013838 () Bool)

(assert (=> b!1490369 (=> (not res!1013838) (not e!835089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490369 (= res!1013838 (validKeyInArray!0 (select (arr!48076 a!2862) i!1006)))))

(declare-fun b!1490370 () Bool)

(declare-fun e!835088 () Bool)

(assert (=> b!1490370 (= e!835089 e!835088)))

(declare-fun res!1013842 () Bool)

(assert (=> b!1490370 (=> (not res!1013842) (not e!835088))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490370 (= res!1013842 (= (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490370 (= lt!649742 (array!99608 (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48628 a!2862)))))

(declare-fun b!1490371 () Bool)

(declare-fun res!1013845 () Bool)

(declare-fun e!835091 () Bool)

(assert (=> b!1490371 (=> (not res!1013845) (not e!835091))))

(declare-fun lt!649741 () SeekEntryResult!12341)

(assert (=> b!1490371 (= res!1013845 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48076 a!2862) j!93) a!2862 mask!2687) lt!649741))))

(declare-fun b!1490372 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99607 (_ BitVec 32)) SeekEntryResult!12341)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99607 (_ BitVec 32)) SeekEntryResult!12341)

(assert (=> b!1490372 (= e!835087 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649738 lt!649742 mask!2687) (seekEntryOrOpen!0 lt!649738 lt!649742 mask!2687)))))

(declare-fun b!1490373 () Bool)

(declare-fun e!835086 () Bool)

(assert (=> b!1490373 (= e!835091 e!835086)))

(declare-fun res!1013851 () Bool)

(assert (=> b!1490373 (=> (not res!1013851) (not e!835086))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490373 (= res!1013851 (= lt!649737 (Intermediate!12341 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490373 (= lt!649737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649738 mask!2687) lt!649738 lt!649742 mask!2687))))

(assert (=> b!1490373 (= lt!649738 (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490374 () Bool)

(declare-fun res!1013840 () Bool)

(assert (=> b!1490374 (=> (not res!1013840) (not e!835085))))

(assert (=> b!1490374 (= res!1013840 (= (seekEntryOrOpen!0 (select (arr!48076 a!2862) j!93) a!2862 mask!2687) (Found!12341 j!93)))))

(declare-fun b!1490375 () Bool)

(assert (=> b!1490375 (= e!835088 e!835091)))

(declare-fun res!1013843 () Bool)

(assert (=> b!1490375 (=> (not res!1013843) (not e!835091))))

(assert (=> b!1490375 (= res!1013843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48076 a!2862) j!93) mask!2687) (select (arr!48076 a!2862) j!93) a!2862 mask!2687) lt!649741))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490375 (= lt!649741 (Intermediate!12341 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490376 () Bool)

(declare-fun res!1013848 () Bool)

(assert (=> b!1490376 (=> (not res!1013848) (not e!835086))))

(assert (=> b!1490376 (= res!1013848 e!835087)))

(declare-fun c!137794 () Bool)

(assert (=> b!1490376 (= c!137794 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490377 () Bool)

(declare-fun e!835084 () Bool)

(assert (=> b!1490377 (= e!835086 (not e!835084))))

(declare-fun res!1013849 () Bool)

(assert (=> b!1490377 (=> res!1013849 e!835084)))

(assert (=> b!1490377 (= res!1013849 (or (and (= (select (arr!48076 a!2862) index!646) (select (store (arr!48076 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48076 a!2862) index!646) (select (arr!48076 a!2862) j!93))) (= (select (arr!48076 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490377 e!835085))

(declare-fun res!1013836 () Bool)

(assert (=> b!1490377 (=> (not res!1013836) (not e!835085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99607 (_ BitVec 32)) Bool)

(assert (=> b!1490377 (= res!1013836 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49863 0))(
  ( (Unit!49864) )
))
(declare-fun lt!649739 () Unit!49863)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49863)

(assert (=> b!1490377 (= lt!649739 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490378 () Bool)

(assert (=> b!1490378 (= e!835084 true)))

(declare-fun lt!649740 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490378 (= lt!649740 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490379 () Bool)

(declare-fun res!1013850 () Bool)

(assert (=> b!1490379 (=> (not res!1013850) (not e!835086))))

(assert (=> b!1490379 (= res!1013850 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490380 () Bool)

(declare-fun res!1013837 () Bool)

(assert (=> b!1490380 (=> (not res!1013837) (not e!835089))))

(assert (=> b!1490380 (= res!1013837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490381 () Bool)

(declare-fun res!1013846 () Bool)

(assert (=> b!1490381 (=> (not res!1013846) (not e!835089))))

(assert (=> b!1490381 (= res!1013846 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48628 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48628 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48628 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490382 () Bool)

(declare-fun res!1013844 () Bool)

(assert (=> b!1490382 (=> (not res!1013844) (not e!835089))))

(assert (=> b!1490382 (= res!1013844 (validKeyInArray!0 (select (arr!48076 a!2862) j!93)))))

(assert (= (and start!126836 res!1013841) b!1490365))

(assert (= (and b!1490365 res!1013839) b!1490369))

(assert (= (and b!1490369 res!1013838) b!1490382))

(assert (= (and b!1490382 res!1013844) b!1490380))

(assert (= (and b!1490380 res!1013837) b!1490366))

(assert (= (and b!1490366 res!1013847) b!1490381))

(assert (= (and b!1490381 res!1013846) b!1490370))

(assert (= (and b!1490370 res!1013842) b!1490375))

(assert (= (and b!1490375 res!1013843) b!1490371))

(assert (= (and b!1490371 res!1013845) b!1490373))

(assert (= (and b!1490373 res!1013851) b!1490376))

(assert (= (and b!1490376 c!137794) b!1490367))

(assert (= (and b!1490376 (not c!137794)) b!1490372))

(assert (= (and b!1490376 res!1013848) b!1490379))

(assert (= (and b!1490379 res!1013850) b!1490377))

(assert (= (and b!1490377 res!1013836) b!1490374))

(assert (= (and b!1490374 res!1013840) b!1490368))

(assert (= (and b!1490377 (not res!1013849)) b!1490378))

(declare-fun m!1373979 () Bool)

(assert (=> b!1490373 m!1373979))

(assert (=> b!1490373 m!1373979))

(declare-fun m!1373981 () Bool)

(assert (=> b!1490373 m!1373981))

(declare-fun m!1373983 () Bool)

(assert (=> b!1490373 m!1373983))

(declare-fun m!1373985 () Bool)

(assert (=> b!1490373 m!1373985))

(declare-fun m!1373987 () Bool)

(assert (=> b!1490378 m!1373987))

(declare-fun m!1373989 () Bool)

(assert (=> b!1490367 m!1373989))

(declare-fun m!1373991 () Bool)

(assert (=> b!1490382 m!1373991))

(assert (=> b!1490382 m!1373991))

(declare-fun m!1373993 () Bool)

(assert (=> b!1490382 m!1373993))

(assert (=> b!1490371 m!1373991))

(assert (=> b!1490371 m!1373991))

(declare-fun m!1373995 () Bool)

(assert (=> b!1490371 m!1373995))

(declare-fun m!1373997 () Bool)

(assert (=> b!1490377 m!1373997))

(assert (=> b!1490377 m!1373983))

(declare-fun m!1373999 () Bool)

(assert (=> b!1490377 m!1373999))

(declare-fun m!1374001 () Bool)

(assert (=> b!1490377 m!1374001))

(declare-fun m!1374003 () Bool)

(assert (=> b!1490377 m!1374003))

(assert (=> b!1490377 m!1373991))

(declare-fun m!1374005 () Bool)

(assert (=> start!126836 m!1374005))

(declare-fun m!1374007 () Bool)

(assert (=> start!126836 m!1374007))

(assert (=> b!1490374 m!1373991))

(assert (=> b!1490374 m!1373991))

(declare-fun m!1374009 () Bool)

(assert (=> b!1490374 m!1374009))

(declare-fun m!1374011 () Bool)

(assert (=> b!1490368 m!1374011))

(assert (=> b!1490368 m!1373991))

(declare-fun m!1374013 () Bool)

(assert (=> b!1490369 m!1374013))

(assert (=> b!1490369 m!1374013))

(declare-fun m!1374015 () Bool)

(assert (=> b!1490369 m!1374015))

(declare-fun m!1374017 () Bool)

(assert (=> b!1490380 m!1374017))

(assert (=> b!1490375 m!1373991))

(assert (=> b!1490375 m!1373991))

(declare-fun m!1374019 () Bool)

(assert (=> b!1490375 m!1374019))

(assert (=> b!1490375 m!1374019))

(assert (=> b!1490375 m!1373991))

(declare-fun m!1374021 () Bool)

(assert (=> b!1490375 m!1374021))

(declare-fun m!1374023 () Bool)

(assert (=> b!1490366 m!1374023))

(assert (=> b!1490370 m!1373983))

(declare-fun m!1374025 () Bool)

(assert (=> b!1490370 m!1374025))

(declare-fun m!1374027 () Bool)

(assert (=> b!1490372 m!1374027))

(declare-fun m!1374029 () Bool)

(assert (=> b!1490372 m!1374029))

(check-sat (not start!126836) (not b!1490367) (not b!1490369) (not b!1490378) (not b!1490366) (not b!1490377) (not b!1490375) (not b!1490382) (not b!1490373) (not b!1490372) (not b!1490371) (not b!1490374) (not b!1490380))
(check-sat)
