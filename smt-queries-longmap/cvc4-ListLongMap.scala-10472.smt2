; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123160 () Bool)

(assert start!123160)

(declare-fun b!1428126 () Bool)

(declare-fun e!806563 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97372 0))(
  ( (array!97373 (arr!46999 (Array (_ BitVec 32) (_ BitVec 64))) (size!47549 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97372)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11278 0))(
  ( (MissingZero!11278 (index!47504 (_ BitVec 32))) (Found!11278 (index!47505 (_ BitVec 32))) (Intermediate!11278 (undefined!12090 Bool) (index!47506 (_ BitVec 32)) (x!129138 (_ BitVec 32))) (Undefined!11278) (MissingVacant!11278 (index!47507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97372 (_ BitVec 32)) SeekEntryResult!11278)

(assert (=> b!1428126 (= e!806563 (= (seekEntryOrOpen!0 (select (arr!46999 a!2831) j!81) a!2831 mask!2608) (Found!11278 j!81)))))

(declare-fun b!1428128 () Bool)

(declare-fun e!806564 () Bool)

(declare-fun e!806565 () Bool)

(assert (=> b!1428128 (= e!806564 e!806565)))

(declare-fun res!962962 () Bool)

(assert (=> b!1428128 (=> (not res!962962) (not e!806565))))

(declare-fun lt!628851 () SeekEntryResult!11278)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97372 (_ BitVec 32)) SeekEntryResult!11278)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428128 (= res!962962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46999 a!2831) j!81) mask!2608) (select (arr!46999 a!2831) j!81) a!2831 mask!2608) lt!628851))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428128 (= lt!628851 (Intermediate!11278 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428129 () Bool)

(declare-fun res!962960 () Bool)

(assert (=> b!1428129 (=> (not res!962960) (not e!806564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97372 (_ BitVec 32)) Bool)

(assert (=> b!1428129 (= res!962960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428130 () Bool)

(declare-fun res!962959 () Bool)

(assert (=> b!1428130 (=> (not res!962959) (not e!806564))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428130 (= res!962959 (validKeyInArray!0 (select (arr!46999 a!2831) i!982)))))

(declare-fun b!1428131 () Bool)

(declare-fun res!962956 () Bool)

(declare-fun e!806567 () Bool)

(assert (=> b!1428131 (=> (not res!962956) (not e!806567))))

(declare-fun lt!628850 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628849 () array!97372)

(declare-fun lt!628847 () SeekEntryResult!11278)

(assert (=> b!1428131 (= res!962956 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628850 lt!628849 mask!2608) lt!628847))))

(declare-fun b!1428132 () Bool)

(assert (=> b!1428132 (= e!806565 e!806567)))

(declare-fun res!962968 () Bool)

(assert (=> b!1428132 (=> (not res!962968) (not e!806567))))

(assert (=> b!1428132 (= res!962968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628850 mask!2608) lt!628850 lt!628849 mask!2608) lt!628847))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428132 (= lt!628847 (Intermediate!11278 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428132 (= lt!628850 (select (store (arr!46999 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428132 (= lt!628849 (array!97373 (store (arr!46999 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47549 a!2831)))))

(declare-fun b!1428133 () Bool)

(declare-fun res!962965 () Bool)

(assert (=> b!1428133 (=> (not res!962965) (not e!806564))))

(assert (=> b!1428133 (= res!962965 (validKeyInArray!0 (select (arr!46999 a!2831) j!81)))))

(declare-fun b!1428134 () Bool)

(declare-fun res!962964 () Bool)

(assert (=> b!1428134 (=> (not res!962964) (not e!806564))))

(assert (=> b!1428134 (= res!962964 (and (= (size!47549 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47549 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47549 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!962961 () Bool)

(assert (=> start!123160 (=> (not res!962961) (not e!806564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123160 (= res!962961 (validMask!0 mask!2608))))

(assert (=> start!123160 e!806564))

(assert (=> start!123160 true))

(declare-fun array_inv!36027 (array!97372) Bool)

(assert (=> start!123160 (array_inv!36027 a!2831)))

(declare-fun b!1428127 () Bool)

(assert (=> b!1428127 (= e!806567 (not true))))

(assert (=> b!1428127 e!806563))

(declare-fun res!962957 () Bool)

(assert (=> b!1428127 (=> (not res!962957) (not e!806563))))

(assert (=> b!1428127 (= res!962957 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48302 0))(
  ( (Unit!48303) )
))
(declare-fun lt!628848 () Unit!48302)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48302)

(assert (=> b!1428127 (= lt!628848 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428135 () Bool)

(declare-fun res!962967 () Bool)

(assert (=> b!1428135 (=> (not res!962967) (not e!806564))))

(assert (=> b!1428135 (= res!962967 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47549 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47549 a!2831))))))

(declare-fun b!1428136 () Bool)

(declare-fun res!962958 () Bool)

(assert (=> b!1428136 (=> (not res!962958) (not e!806567))))

(assert (=> b!1428136 (= res!962958 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46999 a!2831) j!81) a!2831 mask!2608) lt!628851))))

(declare-fun b!1428137 () Bool)

(declare-fun res!962966 () Bool)

(assert (=> b!1428137 (=> (not res!962966) (not e!806567))))

(assert (=> b!1428137 (= res!962966 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428138 () Bool)

(declare-fun res!962963 () Bool)

(assert (=> b!1428138 (=> (not res!962963) (not e!806564))))

(declare-datatypes ((List!33509 0))(
  ( (Nil!33506) (Cons!33505 (h!34816 (_ BitVec 64)) (t!48203 List!33509)) )
))
(declare-fun arrayNoDuplicates!0 (array!97372 (_ BitVec 32) List!33509) Bool)

(assert (=> b!1428138 (= res!962963 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33506))))

(assert (= (and start!123160 res!962961) b!1428134))

(assert (= (and b!1428134 res!962964) b!1428130))

(assert (= (and b!1428130 res!962959) b!1428133))

(assert (= (and b!1428133 res!962965) b!1428129))

(assert (= (and b!1428129 res!962960) b!1428138))

(assert (= (and b!1428138 res!962963) b!1428135))

(assert (= (and b!1428135 res!962967) b!1428128))

(assert (= (and b!1428128 res!962962) b!1428132))

(assert (= (and b!1428132 res!962968) b!1428136))

(assert (= (and b!1428136 res!962958) b!1428131))

(assert (= (and b!1428131 res!962956) b!1428137))

(assert (= (and b!1428137 res!962966) b!1428127))

(assert (= (and b!1428127 res!962957) b!1428126))

(declare-fun m!1318369 () Bool)

(assert (=> b!1428130 m!1318369))

(assert (=> b!1428130 m!1318369))

(declare-fun m!1318371 () Bool)

(assert (=> b!1428130 m!1318371))

(declare-fun m!1318373 () Bool)

(assert (=> b!1428127 m!1318373))

(declare-fun m!1318375 () Bool)

(assert (=> b!1428127 m!1318375))

(declare-fun m!1318377 () Bool)

(assert (=> b!1428128 m!1318377))

(assert (=> b!1428128 m!1318377))

(declare-fun m!1318379 () Bool)

(assert (=> b!1428128 m!1318379))

(assert (=> b!1428128 m!1318379))

(assert (=> b!1428128 m!1318377))

(declare-fun m!1318381 () Bool)

(assert (=> b!1428128 m!1318381))

(assert (=> b!1428126 m!1318377))

(assert (=> b!1428126 m!1318377))

(declare-fun m!1318383 () Bool)

(assert (=> b!1428126 m!1318383))

(declare-fun m!1318385 () Bool)

(assert (=> b!1428129 m!1318385))

(assert (=> b!1428136 m!1318377))

(assert (=> b!1428136 m!1318377))

(declare-fun m!1318387 () Bool)

(assert (=> b!1428136 m!1318387))

(declare-fun m!1318389 () Bool)

(assert (=> b!1428131 m!1318389))

(assert (=> b!1428133 m!1318377))

(assert (=> b!1428133 m!1318377))

(declare-fun m!1318391 () Bool)

(assert (=> b!1428133 m!1318391))

(declare-fun m!1318393 () Bool)

(assert (=> start!123160 m!1318393))

(declare-fun m!1318395 () Bool)

(assert (=> start!123160 m!1318395))

(declare-fun m!1318397 () Bool)

(assert (=> b!1428138 m!1318397))

(declare-fun m!1318399 () Bool)

(assert (=> b!1428132 m!1318399))

(assert (=> b!1428132 m!1318399))

(declare-fun m!1318401 () Bool)

(assert (=> b!1428132 m!1318401))

(declare-fun m!1318403 () Bool)

(assert (=> b!1428132 m!1318403))

(declare-fun m!1318405 () Bool)

(assert (=> b!1428132 m!1318405))

(push 1)

