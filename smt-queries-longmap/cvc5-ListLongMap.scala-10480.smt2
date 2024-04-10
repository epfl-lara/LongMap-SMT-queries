; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123258 () Bool)

(assert start!123258)

(declare-fun b!1429293 () Bool)

(declare-fun res!963934 () Bool)

(declare-fun e!807086 () Bool)

(assert (=> b!1429293 (=> (not res!963934) (not e!807086))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429293 (= res!963934 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429294 () Bool)

(declare-fun res!963923 () Bool)

(assert (=> b!1429294 (=> (not res!963923) (not e!807086))))

(declare-datatypes ((SeekEntryResult!11300 0))(
  ( (MissingZero!11300 (index!47592 (_ BitVec 32))) (Found!11300 (index!47593 (_ BitVec 32))) (Intermediate!11300 (undefined!12112 Bool) (index!47594 (_ BitVec 32)) (x!129230 (_ BitVec 32))) (Undefined!11300) (MissingVacant!11300 (index!47595 (_ BitVec 32))) )
))
(declare-fun lt!629313 () SeekEntryResult!11300)

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97419 0))(
  ( (array!97420 (arr!47021 (Array (_ BitVec 32) (_ BitVec 64))) (size!47571 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97419)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97419 (_ BitVec 32)) SeekEntryResult!11300)

(assert (=> b!1429294 (= res!963923 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47021 a!2831) j!81) a!2831 mask!2608) lt!629313))))

(declare-fun b!1429295 () Bool)

(declare-fun res!963927 () Bool)

(declare-fun e!807083 () Bool)

(assert (=> b!1429295 (=> (not res!963927) (not e!807083))))

(assert (=> b!1429295 (= res!963927 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47571 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47571 a!2831))))))

(declare-fun b!1429296 () Bool)

(declare-fun res!963929 () Bool)

(assert (=> b!1429296 (=> (not res!963929) (not e!807083))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429296 (= res!963929 (validKeyInArray!0 (select (arr!47021 a!2831) i!982)))))

(declare-fun b!1429297 () Bool)

(assert (=> b!1429297 (= e!807086 (not true))))

(declare-fun e!807085 () Bool)

(assert (=> b!1429297 e!807085))

(declare-fun res!963922 () Bool)

(assert (=> b!1429297 (=> (not res!963922) (not e!807085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97419 (_ BitVec 32)) Bool)

(assert (=> b!1429297 (= res!963922 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48346 0))(
  ( (Unit!48347) )
))
(declare-fun lt!629310 () Unit!48346)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48346)

(assert (=> b!1429297 (= lt!629310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429298 () Bool)

(declare-fun res!963930 () Bool)

(assert (=> b!1429298 (=> (not res!963930) (not e!807086))))

(declare-fun lt!629311 () (_ BitVec 64))

(declare-fun lt!629312 () array!97419)

(declare-fun lt!629309 () SeekEntryResult!11300)

(assert (=> b!1429298 (= res!963930 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629311 lt!629312 mask!2608) lt!629309))))

(declare-fun res!963928 () Bool)

(assert (=> start!123258 (=> (not res!963928) (not e!807083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123258 (= res!963928 (validMask!0 mask!2608))))

(assert (=> start!123258 e!807083))

(assert (=> start!123258 true))

(declare-fun array_inv!36049 (array!97419) Bool)

(assert (=> start!123258 (array_inv!36049 a!2831)))

(declare-fun b!1429299 () Bool)

(declare-fun e!807084 () Bool)

(assert (=> b!1429299 (= e!807084 e!807086)))

(declare-fun res!963925 () Bool)

(assert (=> b!1429299 (=> (not res!963925) (not e!807086))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429299 (= res!963925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629311 mask!2608) lt!629311 lt!629312 mask!2608) lt!629309))))

(assert (=> b!1429299 (= lt!629309 (Intermediate!11300 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429299 (= lt!629311 (select (store (arr!47021 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429299 (= lt!629312 (array!97420 (store (arr!47021 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47571 a!2831)))))

(declare-fun b!1429300 () Bool)

(declare-fun res!963933 () Bool)

(assert (=> b!1429300 (=> (not res!963933) (not e!807083))))

(declare-datatypes ((List!33531 0))(
  ( (Nil!33528) (Cons!33527 (h!34841 (_ BitVec 64)) (t!48225 List!33531)) )
))
(declare-fun arrayNoDuplicates!0 (array!97419 (_ BitVec 32) List!33531) Bool)

(assert (=> b!1429300 (= res!963933 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33528))))

(declare-fun b!1429301 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97419 (_ BitVec 32)) SeekEntryResult!11300)

(assert (=> b!1429301 (= e!807085 (= (seekEntryOrOpen!0 (select (arr!47021 a!2831) j!81) a!2831 mask!2608) (Found!11300 j!81)))))

(declare-fun b!1429302 () Bool)

(assert (=> b!1429302 (= e!807083 e!807084)))

(declare-fun res!963932 () Bool)

(assert (=> b!1429302 (=> (not res!963932) (not e!807084))))

(assert (=> b!1429302 (= res!963932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47021 a!2831) j!81) mask!2608) (select (arr!47021 a!2831) j!81) a!2831 mask!2608) lt!629313))))

(assert (=> b!1429302 (= lt!629313 (Intermediate!11300 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429303 () Bool)

(declare-fun res!963924 () Bool)

(assert (=> b!1429303 (=> (not res!963924) (not e!807083))))

(assert (=> b!1429303 (= res!963924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429304 () Bool)

(declare-fun res!963931 () Bool)

(assert (=> b!1429304 (=> (not res!963931) (not e!807083))))

(assert (=> b!1429304 (= res!963931 (and (= (size!47571 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47571 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47571 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429305 () Bool)

(declare-fun res!963926 () Bool)

(assert (=> b!1429305 (=> (not res!963926) (not e!807083))))

(assert (=> b!1429305 (= res!963926 (validKeyInArray!0 (select (arr!47021 a!2831) j!81)))))

(assert (= (and start!123258 res!963928) b!1429304))

(assert (= (and b!1429304 res!963931) b!1429296))

(assert (= (and b!1429296 res!963929) b!1429305))

(assert (= (and b!1429305 res!963926) b!1429303))

(assert (= (and b!1429303 res!963924) b!1429300))

(assert (= (and b!1429300 res!963933) b!1429295))

(assert (= (and b!1429295 res!963927) b!1429302))

(assert (= (and b!1429302 res!963932) b!1429299))

(assert (= (and b!1429299 res!963925) b!1429294))

(assert (= (and b!1429294 res!963923) b!1429298))

(assert (= (and b!1429298 res!963930) b!1429293))

(assert (= (and b!1429293 res!963934) b!1429297))

(assert (= (and b!1429297 res!963922) b!1429301))

(declare-fun m!1319397 () Bool)

(assert (=> b!1429298 m!1319397))

(declare-fun m!1319399 () Bool)

(assert (=> b!1429302 m!1319399))

(assert (=> b!1429302 m!1319399))

(declare-fun m!1319401 () Bool)

(assert (=> b!1429302 m!1319401))

(assert (=> b!1429302 m!1319401))

(assert (=> b!1429302 m!1319399))

(declare-fun m!1319403 () Bool)

(assert (=> b!1429302 m!1319403))

(declare-fun m!1319405 () Bool)

(assert (=> b!1429303 m!1319405))

(assert (=> b!1429301 m!1319399))

(assert (=> b!1429301 m!1319399))

(declare-fun m!1319407 () Bool)

(assert (=> b!1429301 m!1319407))

(declare-fun m!1319409 () Bool)

(assert (=> b!1429297 m!1319409))

(declare-fun m!1319411 () Bool)

(assert (=> b!1429297 m!1319411))

(declare-fun m!1319413 () Bool)

(assert (=> b!1429296 m!1319413))

(assert (=> b!1429296 m!1319413))

(declare-fun m!1319415 () Bool)

(assert (=> b!1429296 m!1319415))

(declare-fun m!1319417 () Bool)

(assert (=> b!1429300 m!1319417))

(declare-fun m!1319419 () Bool)

(assert (=> b!1429299 m!1319419))

(assert (=> b!1429299 m!1319419))

(declare-fun m!1319421 () Bool)

(assert (=> b!1429299 m!1319421))

(declare-fun m!1319423 () Bool)

(assert (=> b!1429299 m!1319423))

(declare-fun m!1319425 () Bool)

(assert (=> b!1429299 m!1319425))

(assert (=> b!1429305 m!1319399))

(assert (=> b!1429305 m!1319399))

(declare-fun m!1319427 () Bool)

(assert (=> b!1429305 m!1319427))

(assert (=> b!1429294 m!1319399))

(assert (=> b!1429294 m!1319399))

(declare-fun m!1319429 () Bool)

(assert (=> b!1429294 m!1319429))

(declare-fun m!1319431 () Bool)

(assert (=> start!123258 m!1319431))

(declare-fun m!1319433 () Bool)

(assert (=> start!123258 m!1319433))

(push 1)

