; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123002 () Bool)

(assert start!123002)

(declare-fun b!1424328 () Bool)

(declare-fun res!958884 () Bool)

(declare-fun e!805259 () Bool)

(assert (=> b!1424328 (=> (not res!958884) (not e!805259))))

(declare-datatypes ((array!97238 0))(
  ( (array!97239 (arr!46933 (Array (_ BitVec 32) (_ BitVec 64))) (size!47484 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97238)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424328 (= res!958884 (validKeyInArray!0 (select (arr!46933 a!2831) j!81)))))

(declare-fun b!1424329 () Bool)

(declare-fun res!958877 () Bool)

(assert (=> b!1424329 (=> (not res!958877) (not e!805259))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424329 (= res!958877 (validKeyInArray!0 (select (arr!46933 a!2831) i!982)))))

(declare-fun b!1424330 () Bool)

(declare-fun res!958879 () Bool)

(assert (=> b!1424330 (=> (not res!958879) (not e!805259))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424330 (= res!958879 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47484 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47484 a!2831))))))

(declare-fun b!1424331 () Bool)

(declare-fun res!958886 () Bool)

(assert (=> b!1424331 (=> (not res!958886) (not e!805259))))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1424331 (= res!958886 (and (= (size!47484 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47484 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47484 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424332 () Bool)

(declare-fun e!805260 () Bool)

(assert (=> b!1424332 (= e!805260 true)))

(declare-fun lt!627398 () array!97238)

(declare-fun lt!627399 () (_ BitVec 64))

(declare-fun lt!627401 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11120 0))(
  ( (MissingZero!11120 (index!46872 (_ BitVec 32))) (Found!11120 (index!46873 (_ BitVec 32))) (Intermediate!11120 (undefined!11932 Bool) (index!46874 (_ BitVec 32)) (x!128675 (_ BitVec 32))) (Undefined!11120) (MissingVacant!11120 (index!46875 (_ BitVec 32))) )
))
(declare-fun lt!627403 () SeekEntryResult!11120)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97238 (_ BitVec 32)) SeekEntryResult!11120)

(assert (=> b!1424332 (= lt!627403 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627401 lt!627399 lt!627398 mask!2608))))

(declare-fun b!1424333 () Bool)

(declare-fun e!805265 () Bool)

(declare-fun e!805262 () Bool)

(assert (=> b!1424333 (= e!805265 e!805262)))

(declare-fun res!958882 () Bool)

(assert (=> b!1424333 (=> (not res!958882) (not e!805262))))

(declare-fun lt!627404 () SeekEntryResult!11120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424333 (= res!958882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627399 mask!2608) lt!627399 lt!627398 mask!2608) lt!627404))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424333 (= lt!627404 (Intermediate!11120 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424333 (= lt!627399 (select (store (arr!46933 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424333 (= lt!627398 (array!97239 (store (arr!46933 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47484 a!2831)))))

(declare-fun b!1424334 () Bool)

(declare-fun res!958888 () Bool)

(assert (=> b!1424334 (=> (not res!958888) (not e!805259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97238 (_ BitVec 32)) Bool)

(assert (=> b!1424334 (= res!958888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424335 () Bool)

(declare-fun e!805263 () Bool)

(assert (=> b!1424335 (= e!805263 e!805260)))

(declare-fun res!958889 () Bool)

(assert (=> b!1424335 (=> res!958889 e!805260)))

(assert (=> b!1424335 (= res!958889 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627401 #b00000000000000000000000000000000) (bvsge lt!627401 (size!47484 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424335 (= lt!627401 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1424336 () Bool)

(declare-fun res!958878 () Bool)

(assert (=> b!1424336 (=> (not res!958878) (not e!805262))))

(declare-fun lt!627400 () SeekEntryResult!11120)

(assert (=> b!1424336 (= res!958878 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46933 a!2831) j!81) a!2831 mask!2608) lt!627400))))

(declare-fun e!805264 () Bool)

(declare-fun b!1424337 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97238 (_ BitVec 32)) SeekEntryResult!11120)

(assert (=> b!1424337 (= e!805264 (= (seekEntryOrOpen!0 (select (arr!46933 a!2831) j!81) a!2831 mask!2608) (Found!11120 j!81)))))

(declare-fun res!958887 () Bool)

(assert (=> start!123002 (=> (not res!958887) (not e!805259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123002 (= res!958887 (validMask!0 mask!2608))))

(assert (=> start!123002 e!805259))

(assert (=> start!123002 true))

(declare-fun array_inv!36214 (array!97238) Bool)

(assert (=> start!123002 (array_inv!36214 a!2831)))

(declare-fun b!1424338 () Bool)

(declare-fun res!958885 () Bool)

(assert (=> b!1424338 (=> (not res!958885) (not e!805262))))

(assert (=> b!1424338 (= res!958885 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627399 lt!627398 mask!2608) lt!627404))))

(declare-fun b!1424339 () Bool)

(declare-fun res!958880 () Bool)

(assert (=> b!1424339 (=> res!958880 e!805260)))

(assert (=> b!1424339 (= res!958880 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627401 (select (arr!46933 a!2831) j!81) a!2831 mask!2608) lt!627400)))))

(declare-fun b!1424340 () Bool)

(assert (=> b!1424340 (= e!805259 e!805265)))

(declare-fun res!958890 () Bool)

(assert (=> b!1424340 (=> (not res!958890) (not e!805265))))

(assert (=> b!1424340 (= res!958890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46933 a!2831) j!81) mask!2608) (select (arr!46933 a!2831) j!81) a!2831 mask!2608) lt!627400))))

(assert (=> b!1424340 (= lt!627400 (Intermediate!11120 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424341 () Bool)

(declare-fun res!958876 () Bool)

(assert (=> b!1424341 (=> (not res!958876) (not e!805262))))

(assert (=> b!1424341 (= res!958876 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424342 () Bool)

(assert (=> b!1424342 (= e!805262 (not e!805263))))

(declare-fun res!958883 () Bool)

(assert (=> b!1424342 (=> res!958883 e!805263)))

(assert (=> b!1424342 (= res!958883 (or (= (select (arr!46933 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46933 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46933 a!2831) index!585) (select (arr!46933 a!2831) j!81)) (= (select (store (arr!46933 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424342 e!805264))

(declare-fun res!958891 () Bool)

(assert (=> b!1424342 (=> (not res!958891) (not e!805264))))

(assert (=> b!1424342 (= res!958891 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48107 0))(
  ( (Unit!48108) )
))
(declare-fun lt!627402 () Unit!48107)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48107)

(assert (=> b!1424342 (= lt!627402 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424343 () Bool)

(declare-fun res!958881 () Bool)

(assert (=> b!1424343 (=> (not res!958881) (not e!805259))))

(declare-datatypes ((List!33430 0))(
  ( (Nil!33427) (Cons!33426 (h!34739 (_ BitVec 64)) (t!48116 List!33430)) )
))
(declare-fun arrayNoDuplicates!0 (array!97238 (_ BitVec 32) List!33430) Bool)

(assert (=> b!1424343 (= res!958881 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33427))))

(assert (= (and start!123002 res!958887) b!1424331))

(assert (= (and b!1424331 res!958886) b!1424329))

(assert (= (and b!1424329 res!958877) b!1424328))

(assert (= (and b!1424328 res!958884) b!1424334))

(assert (= (and b!1424334 res!958888) b!1424343))

(assert (= (and b!1424343 res!958881) b!1424330))

(assert (= (and b!1424330 res!958879) b!1424340))

(assert (= (and b!1424340 res!958890) b!1424333))

(assert (= (and b!1424333 res!958882) b!1424336))

(assert (= (and b!1424336 res!958878) b!1424338))

(assert (= (and b!1424338 res!958885) b!1424341))

(assert (= (and b!1424341 res!958876) b!1424342))

(assert (= (and b!1424342 res!958891) b!1424337))

(assert (= (and b!1424342 (not res!958883)) b!1424335))

(assert (= (and b!1424335 (not res!958889)) b!1424339))

(assert (= (and b!1424339 (not res!958880)) b!1424332))

(declare-fun m!1314993 () Bool)

(assert (=> b!1424329 m!1314993))

(assert (=> b!1424329 m!1314993))

(declare-fun m!1314995 () Bool)

(assert (=> b!1424329 m!1314995))

(declare-fun m!1314997 () Bool)

(assert (=> b!1424343 m!1314997))

(declare-fun m!1314999 () Bool)

(assert (=> b!1424342 m!1314999))

(declare-fun m!1315001 () Bool)

(assert (=> b!1424342 m!1315001))

(declare-fun m!1315003 () Bool)

(assert (=> b!1424342 m!1315003))

(declare-fun m!1315005 () Bool)

(assert (=> b!1424342 m!1315005))

(declare-fun m!1315007 () Bool)

(assert (=> b!1424342 m!1315007))

(declare-fun m!1315009 () Bool)

(assert (=> b!1424342 m!1315009))

(declare-fun m!1315011 () Bool)

(assert (=> b!1424338 m!1315011))

(declare-fun m!1315013 () Bool)

(assert (=> b!1424333 m!1315013))

(assert (=> b!1424333 m!1315013))

(declare-fun m!1315015 () Bool)

(assert (=> b!1424333 m!1315015))

(assert (=> b!1424333 m!1314999))

(declare-fun m!1315017 () Bool)

(assert (=> b!1424333 m!1315017))

(assert (=> b!1424337 m!1315007))

(assert (=> b!1424337 m!1315007))

(declare-fun m!1315019 () Bool)

(assert (=> b!1424337 m!1315019))

(assert (=> b!1424336 m!1315007))

(assert (=> b!1424336 m!1315007))

(declare-fun m!1315021 () Bool)

(assert (=> b!1424336 m!1315021))

(declare-fun m!1315023 () Bool)

(assert (=> start!123002 m!1315023))

(declare-fun m!1315025 () Bool)

(assert (=> start!123002 m!1315025))

(declare-fun m!1315027 () Bool)

(assert (=> b!1424334 m!1315027))

(assert (=> b!1424340 m!1315007))

(assert (=> b!1424340 m!1315007))

(declare-fun m!1315029 () Bool)

(assert (=> b!1424340 m!1315029))

(assert (=> b!1424340 m!1315029))

(assert (=> b!1424340 m!1315007))

(declare-fun m!1315031 () Bool)

(assert (=> b!1424340 m!1315031))

(assert (=> b!1424339 m!1315007))

(assert (=> b!1424339 m!1315007))

(declare-fun m!1315033 () Bool)

(assert (=> b!1424339 m!1315033))

(declare-fun m!1315035 () Bool)

(assert (=> b!1424332 m!1315035))

(declare-fun m!1315037 () Bool)

(assert (=> b!1424335 m!1315037))

(assert (=> b!1424328 m!1315007))

(assert (=> b!1424328 m!1315007))

(declare-fun m!1315039 () Bool)

(assert (=> b!1424328 m!1315039))

(check-sat (not b!1424342) (not b!1424336) (not b!1424343) (not start!123002) (not b!1424338) (not b!1424335) (not b!1424328) (not b!1424340) (not b!1424329) (not b!1424337) (not b!1424334) (not b!1424339) (not b!1424333) (not b!1424332))
(check-sat)
