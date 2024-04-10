; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123550 () Bool)

(assert start!123550)

(declare-fun b!1432403 () Bool)

(declare-fun res!966275 () Bool)

(declare-fun e!808589 () Bool)

(assert (=> b!1432403 (=> (not res!966275) (not e!808589))))

(declare-datatypes ((array!97522 0))(
  ( (array!97523 (arr!47068 (Array (_ BitVec 32) (_ BitVec 64))) (size!47618 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97522)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432403 (= res!966275 (validKeyInArray!0 (select (arr!47068 a!2831) j!81)))))

(declare-fun b!1432404 () Bool)

(declare-fun res!966276 () Bool)

(assert (=> b!1432404 (=> (not res!966276) (not e!808589))))

(declare-datatypes ((List!33578 0))(
  ( (Nil!33575) (Cons!33574 (h!34897 (_ BitVec 64)) (t!48272 List!33578)) )
))
(declare-fun arrayNoDuplicates!0 (array!97522 (_ BitVec 32) List!33578) Bool)

(assert (=> b!1432404 (= res!966276 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33575))))

(declare-fun b!1432405 () Bool)

(declare-fun res!966273 () Bool)

(assert (=> b!1432405 (=> (not res!966273) (not e!808589))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97522 (_ BitVec 32)) Bool)

(assert (=> b!1432405 (= res!966273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432407 () Bool)

(declare-fun res!966271 () Bool)

(assert (=> b!1432407 (=> (not res!966271) (not e!808589))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432407 (= res!966271 (validKeyInArray!0 (select (arr!47068 a!2831) i!982)))))

(declare-fun e!808586 () Bool)

(declare-fun b!1432408 () Bool)

(declare-datatypes ((SeekEntryResult!11347 0))(
  ( (MissingZero!11347 (index!47780 (_ BitVec 32))) (Found!11347 (index!47781 (_ BitVec 32))) (Intermediate!11347 (undefined!12159 Bool) (index!47782 (_ BitVec 32)) (x!129421 (_ BitVec 32))) (Undefined!11347) (MissingVacant!11347 (index!47783 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97522 (_ BitVec 32)) SeekEntryResult!11347)

(assert (=> b!1432408 (= e!808586 (= (seekEntryOrOpen!0 (select (arr!47068 a!2831) j!81) a!2831 mask!2608) (Found!11347 j!81)))))

(declare-fun b!1432409 () Bool)

(declare-fun res!966269 () Bool)

(declare-fun e!808584 () Bool)

(assert (=> b!1432409 (=> (not res!966269) (not e!808584))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432409 (= res!966269 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432410 () Bool)

(declare-fun res!966279 () Bool)

(assert (=> b!1432410 (=> (not res!966279) (not e!808589))))

(assert (=> b!1432410 (= res!966279 (and (= (size!47618 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47618 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47618 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432406 () Bool)

(declare-fun res!966278 () Bool)

(assert (=> b!1432406 (=> (not res!966278) (not e!808584))))

(declare-fun lt!630581 () SeekEntryResult!11347)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!630580 () (_ BitVec 64))

(declare-fun lt!630582 () array!97522)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97522 (_ BitVec 32)) SeekEntryResult!11347)

(assert (=> b!1432406 (= res!966278 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630580 lt!630582 mask!2608) lt!630581))))

(declare-fun res!966268 () Bool)

(assert (=> start!123550 (=> (not res!966268) (not e!808589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123550 (= res!966268 (validMask!0 mask!2608))))

(assert (=> start!123550 e!808589))

(assert (=> start!123550 true))

(declare-fun array_inv!36096 (array!97522) Bool)

(assert (=> start!123550 (array_inv!36096 a!2831)))

(declare-fun b!1432411 () Bool)

(declare-fun e!808587 () Bool)

(assert (=> b!1432411 (= e!808584 (not e!808587))))

(declare-fun res!966272 () Bool)

(assert (=> b!1432411 (=> res!966272 e!808587)))

(assert (=> b!1432411 (= res!966272 (or (= (select (arr!47068 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47068 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47068 a!2831) index!585) (select (arr!47068 a!2831) j!81)) (= (select (store (arr!47068 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432411 e!808586))

(declare-fun res!966267 () Bool)

(assert (=> b!1432411 (=> (not res!966267) (not e!808586))))

(assert (=> b!1432411 (= res!966267 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48440 0))(
  ( (Unit!48441) )
))
(declare-fun lt!630579 () Unit!48440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48440)

(assert (=> b!1432411 (= lt!630579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432412 () Bool)

(declare-fun e!808585 () Bool)

(assert (=> b!1432412 (= e!808589 e!808585)))

(declare-fun res!966270 () Bool)

(assert (=> b!1432412 (=> (not res!966270) (not e!808585))))

(declare-fun lt!630577 () SeekEntryResult!11347)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432412 (= res!966270 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47068 a!2831) j!81) mask!2608) (select (arr!47068 a!2831) j!81) a!2831 mask!2608) lt!630577))))

(assert (=> b!1432412 (= lt!630577 (Intermediate!11347 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432413 () Bool)

(assert (=> b!1432413 (= e!808587 true)))

(declare-fun lt!630578 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432413 (= lt!630578 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432414 () Bool)

(declare-fun res!966277 () Bool)

(assert (=> b!1432414 (=> (not res!966277) (not e!808584))))

(assert (=> b!1432414 (= res!966277 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47068 a!2831) j!81) a!2831 mask!2608) lt!630577))))

(declare-fun b!1432415 () Bool)

(declare-fun res!966274 () Bool)

(assert (=> b!1432415 (=> (not res!966274) (not e!808589))))

(assert (=> b!1432415 (= res!966274 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47618 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47618 a!2831))))))

(declare-fun b!1432416 () Bool)

(assert (=> b!1432416 (= e!808585 e!808584)))

(declare-fun res!966280 () Bool)

(assert (=> b!1432416 (=> (not res!966280) (not e!808584))))

(assert (=> b!1432416 (= res!966280 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630580 mask!2608) lt!630580 lt!630582 mask!2608) lt!630581))))

(assert (=> b!1432416 (= lt!630581 (Intermediate!11347 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432416 (= lt!630580 (select (store (arr!47068 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432416 (= lt!630582 (array!97523 (store (arr!47068 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47618 a!2831)))))

(assert (= (and start!123550 res!966268) b!1432410))

(assert (= (and b!1432410 res!966279) b!1432407))

(assert (= (and b!1432407 res!966271) b!1432403))

(assert (= (and b!1432403 res!966275) b!1432405))

(assert (= (and b!1432405 res!966273) b!1432404))

(assert (= (and b!1432404 res!966276) b!1432415))

(assert (= (and b!1432415 res!966274) b!1432412))

(assert (= (and b!1432412 res!966270) b!1432416))

(assert (= (and b!1432416 res!966280) b!1432414))

(assert (= (and b!1432414 res!966277) b!1432406))

(assert (= (and b!1432406 res!966278) b!1432409))

(assert (= (and b!1432409 res!966269) b!1432411))

(assert (= (and b!1432411 res!966267) b!1432408))

(assert (= (and b!1432411 (not res!966272)) b!1432413))

(declare-fun m!1322209 () Bool)

(assert (=> b!1432413 m!1322209))

(declare-fun m!1322211 () Bool)

(assert (=> b!1432405 m!1322211))

(declare-fun m!1322213 () Bool)

(assert (=> b!1432408 m!1322213))

(assert (=> b!1432408 m!1322213))

(declare-fun m!1322215 () Bool)

(assert (=> b!1432408 m!1322215))

(declare-fun m!1322217 () Bool)

(assert (=> b!1432407 m!1322217))

(assert (=> b!1432407 m!1322217))

(declare-fun m!1322219 () Bool)

(assert (=> b!1432407 m!1322219))

(assert (=> b!1432414 m!1322213))

(assert (=> b!1432414 m!1322213))

(declare-fun m!1322221 () Bool)

(assert (=> b!1432414 m!1322221))

(declare-fun m!1322223 () Bool)

(assert (=> start!123550 m!1322223))

(declare-fun m!1322225 () Bool)

(assert (=> start!123550 m!1322225))

(assert (=> b!1432412 m!1322213))

(assert (=> b!1432412 m!1322213))

(declare-fun m!1322227 () Bool)

(assert (=> b!1432412 m!1322227))

(assert (=> b!1432412 m!1322227))

(assert (=> b!1432412 m!1322213))

(declare-fun m!1322229 () Bool)

(assert (=> b!1432412 m!1322229))

(declare-fun m!1322231 () Bool)

(assert (=> b!1432411 m!1322231))

(declare-fun m!1322233 () Bool)

(assert (=> b!1432411 m!1322233))

(declare-fun m!1322235 () Bool)

(assert (=> b!1432411 m!1322235))

(declare-fun m!1322237 () Bool)

(assert (=> b!1432411 m!1322237))

(assert (=> b!1432411 m!1322213))

(declare-fun m!1322239 () Bool)

(assert (=> b!1432411 m!1322239))

(declare-fun m!1322241 () Bool)

(assert (=> b!1432404 m!1322241))

(assert (=> b!1432403 m!1322213))

(assert (=> b!1432403 m!1322213))

(declare-fun m!1322243 () Bool)

(assert (=> b!1432403 m!1322243))

(declare-fun m!1322245 () Bool)

(assert (=> b!1432416 m!1322245))

(assert (=> b!1432416 m!1322245))

(declare-fun m!1322247 () Bool)

(assert (=> b!1432416 m!1322247))

(assert (=> b!1432416 m!1322231))

(declare-fun m!1322249 () Bool)

(assert (=> b!1432416 m!1322249))

(declare-fun m!1322251 () Bool)

(assert (=> b!1432406 m!1322251))

(push 1)

