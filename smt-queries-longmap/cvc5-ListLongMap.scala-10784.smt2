; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126202 () Bool)

(assert start!126202)

(declare-fun b!1478434 () Bool)

(declare-fun res!1004453 () Bool)

(declare-fun e!829343 () Bool)

(assert (=> b!1478434 (=> (not res!1004453) (not e!829343))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99308 0))(
  ( (array!99309 (arr!47933 (Array (_ BitVec 32) (_ BitVec 64))) (size!48483 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99308)

(assert (=> b!1478434 (= res!1004453 (and (= (size!48483 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48483 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48483 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478435 () Bool)

(declare-fun e!829348 () Bool)

(declare-fun e!829342 () Bool)

(assert (=> b!1478435 (= e!829348 e!829342)))

(declare-fun res!1004464 () Bool)

(assert (=> b!1478435 (=> (not res!1004464) (not e!829342))))

(declare-datatypes ((SeekEntryResult!12173 0))(
  ( (MissingZero!12173 (index!51084 (_ BitVec 32))) (Found!12173 (index!51085 (_ BitVec 32))) (Intermediate!12173 (undefined!12985 Bool) (index!51086 (_ BitVec 32)) (x!132676 (_ BitVec 32))) (Undefined!12173) (MissingVacant!12173 (index!51087 (_ BitVec 32))) )
))
(declare-fun lt!645681 () SeekEntryResult!12173)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478435 (= res!1004464 (= lt!645681 (Intermediate!12173 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645680 () array!99308)

(declare-fun lt!645684 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99308 (_ BitVec 32)) SeekEntryResult!12173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478435 (= lt!645681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645684 mask!2687) lt!645684 lt!645680 mask!2687))))

(assert (=> b!1478435 (= lt!645684 (select (store (arr!47933 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1478437 () Bool)

(declare-fun e!829347 () Bool)

(assert (=> b!1478437 (= e!829347 (= lt!645681 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645684 lt!645680 mask!2687)))))

(declare-fun b!1478438 () Bool)

(assert (=> b!1478438 (= e!829342 (not true))))

(declare-fun e!829344 () Bool)

(assert (=> b!1478438 e!829344))

(declare-fun res!1004457 () Bool)

(assert (=> b!1478438 (=> (not res!1004457) (not e!829344))))

(declare-fun lt!645683 () SeekEntryResult!12173)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1478438 (= res!1004457 (and (= lt!645683 (Found!12173 j!93)) (or (= (select (arr!47933 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47933 a!2862) intermediateBeforeIndex!19) (select (arr!47933 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99308 (_ BitVec 32)) SeekEntryResult!12173)

(assert (=> b!1478438 (= lt!645683 (seekEntryOrOpen!0 (select (arr!47933 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99308 (_ BitVec 32)) Bool)

(assert (=> b!1478438 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49686 0))(
  ( (Unit!49687) )
))
(declare-fun lt!645679 () Unit!49686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49686)

(assert (=> b!1478438 (= lt!645679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478439 () Bool)

(declare-fun res!1004456 () Bool)

(assert (=> b!1478439 (=> (not res!1004456) (not e!829348))))

(declare-fun lt!645682 () SeekEntryResult!12173)

(assert (=> b!1478439 (= res!1004456 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47933 a!2862) j!93) a!2862 mask!2687) lt!645682))))

(declare-fun b!1478440 () Bool)

(declare-fun res!1004451 () Bool)

(assert (=> b!1478440 (=> (not res!1004451) (not e!829343))))

(assert (=> b!1478440 (= res!1004451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478441 () Bool)

(declare-fun res!1004460 () Bool)

(assert (=> b!1478441 (=> (not res!1004460) (not e!829342))))

(assert (=> b!1478441 (= res!1004460 e!829347)))

(declare-fun c!136512 () Bool)

(assert (=> b!1478441 (= c!136512 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478442 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99308 (_ BitVec 32)) SeekEntryResult!12173)

(assert (=> b!1478442 (= e!829347 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645684 lt!645680 mask!2687) (seekEntryOrOpen!0 lt!645684 lt!645680 mask!2687)))))

(declare-fun b!1478443 () Bool)

(declare-fun e!829346 () Bool)

(assert (=> b!1478443 (= e!829344 e!829346)))

(declare-fun res!1004461 () Bool)

(assert (=> b!1478443 (=> res!1004461 e!829346)))

(assert (=> b!1478443 (= res!1004461 (or (and (= (select (arr!47933 a!2862) index!646) (select (store (arr!47933 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47933 a!2862) index!646) (select (arr!47933 a!2862) j!93))) (not (= (select (arr!47933 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478444 () Bool)

(declare-fun e!829341 () Bool)

(assert (=> b!1478444 (= e!829343 e!829341)))

(declare-fun res!1004455 () Bool)

(assert (=> b!1478444 (=> (not res!1004455) (not e!829341))))

(assert (=> b!1478444 (= res!1004455 (= (select (store (arr!47933 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478444 (= lt!645680 (array!99309 (store (arr!47933 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48483 a!2862)))))

(declare-fun e!829345 () Bool)

(declare-fun b!1478445 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478445 (= e!829345 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478436 () Bool)

(declare-fun res!1004452 () Bool)

(assert (=> b!1478436 (=> (not res!1004452) (not e!829343))))

(declare-datatypes ((List!34434 0))(
  ( (Nil!34431) (Cons!34430 (h!35798 (_ BitVec 64)) (t!49128 List!34434)) )
))
(declare-fun arrayNoDuplicates!0 (array!99308 (_ BitVec 32) List!34434) Bool)

(assert (=> b!1478436 (= res!1004452 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34431))))

(declare-fun res!1004459 () Bool)

(assert (=> start!126202 (=> (not res!1004459) (not e!829343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126202 (= res!1004459 (validMask!0 mask!2687))))

(assert (=> start!126202 e!829343))

(assert (=> start!126202 true))

(declare-fun array_inv!36961 (array!99308) Bool)

(assert (=> start!126202 (array_inv!36961 a!2862)))

(declare-fun b!1478446 () Bool)

(declare-fun res!1004454 () Bool)

(assert (=> b!1478446 (=> (not res!1004454) (not e!829343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478446 (= res!1004454 (validKeyInArray!0 (select (arr!47933 a!2862) j!93)))))

(declare-fun b!1478447 () Bool)

(assert (=> b!1478447 (= e!829346 e!829345)))

(declare-fun res!1004458 () Bool)

(assert (=> b!1478447 (=> (not res!1004458) (not e!829345))))

(assert (=> b!1478447 (= res!1004458 (= lt!645683 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47933 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478448 () Bool)

(assert (=> b!1478448 (= e!829341 e!829348)))

(declare-fun res!1004450 () Bool)

(assert (=> b!1478448 (=> (not res!1004450) (not e!829348))))

(assert (=> b!1478448 (= res!1004450 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47933 a!2862) j!93) mask!2687) (select (arr!47933 a!2862) j!93) a!2862 mask!2687) lt!645682))))

(assert (=> b!1478448 (= lt!645682 (Intermediate!12173 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478449 () Bool)

(declare-fun res!1004449 () Bool)

(assert (=> b!1478449 (=> (not res!1004449) (not e!829342))))

(assert (=> b!1478449 (= res!1004449 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478450 () Bool)

(declare-fun res!1004463 () Bool)

(assert (=> b!1478450 (=> (not res!1004463) (not e!829343))))

(assert (=> b!1478450 (= res!1004463 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48483 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48483 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48483 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478451 () Bool)

(declare-fun res!1004462 () Bool)

(assert (=> b!1478451 (=> (not res!1004462) (not e!829343))))

(assert (=> b!1478451 (= res!1004462 (validKeyInArray!0 (select (arr!47933 a!2862) i!1006)))))

(assert (= (and start!126202 res!1004459) b!1478434))

(assert (= (and b!1478434 res!1004453) b!1478451))

(assert (= (and b!1478451 res!1004462) b!1478446))

(assert (= (and b!1478446 res!1004454) b!1478440))

(assert (= (and b!1478440 res!1004451) b!1478436))

(assert (= (and b!1478436 res!1004452) b!1478450))

(assert (= (and b!1478450 res!1004463) b!1478444))

(assert (= (and b!1478444 res!1004455) b!1478448))

(assert (= (and b!1478448 res!1004450) b!1478439))

(assert (= (and b!1478439 res!1004456) b!1478435))

(assert (= (and b!1478435 res!1004464) b!1478441))

(assert (= (and b!1478441 c!136512) b!1478437))

(assert (= (and b!1478441 (not c!136512)) b!1478442))

(assert (= (and b!1478441 res!1004460) b!1478449))

(assert (= (and b!1478449 res!1004449) b!1478438))

(assert (= (and b!1478438 res!1004457) b!1478443))

(assert (= (and b!1478443 (not res!1004461)) b!1478447))

(assert (= (and b!1478447 res!1004458) b!1478445))

(declare-fun m!1364347 () Bool)

(assert (=> b!1478439 m!1364347))

(assert (=> b!1478439 m!1364347))

(declare-fun m!1364349 () Bool)

(assert (=> b!1478439 m!1364349))

(declare-fun m!1364351 () Bool)

(assert (=> b!1478444 m!1364351))

(declare-fun m!1364353 () Bool)

(assert (=> b!1478444 m!1364353))

(declare-fun m!1364355 () Bool)

(assert (=> b!1478435 m!1364355))

(assert (=> b!1478435 m!1364355))

(declare-fun m!1364357 () Bool)

(assert (=> b!1478435 m!1364357))

(assert (=> b!1478435 m!1364351))

(declare-fun m!1364359 () Bool)

(assert (=> b!1478435 m!1364359))

(declare-fun m!1364361 () Bool)

(assert (=> b!1478451 m!1364361))

(assert (=> b!1478451 m!1364361))

(declare-fun m!1364363 () Bool)

(assert (=> b!1478451 m!1364363))

(assert (=> b!1478447 m!1364347))

(assert (=> b!1478447 m!1364347))

(declare-fun m!1364365 () Bool)

(assert (=> b!1478447 m!1364365))

(declare-fun m!1364367 () Bool)

(assert (=> b!1478442 m!1364367))

(declare-fun m!1364369 () Bool)

(assert (=> b!1478442 m!1364369))

(declare-fun m!1364371 () Bool)

(assert (=> b!1478437 m!1364371))

(declare-fun m!1364373 () Bool)

(assert (=> b!1478443 m!1364373))

(assert (=> b!1478443 m!1364351))

(declare-fun m!1364375 () Bool)

(assert (=> b!1478443 m!1364375))

(assert (=> b!1478443 m!1364347))

(declare-fun m!1364377 () Bool)

(assert (=> b!1478438 m!1364377))

(declare-fun m!1364379 () Bool)

(assert (=> b!1478438 m!1364379))

(assert (=> b!1478438 m!1364347))

(declare-fun m!1364381 () Bool)

(assert (=> b!1478438 m!1364381))

(declare-fun m!1364383 () Bool)

(assert (=> b!1478438 m!1364383))

(assert (=> b!1478438 m!1364347))

(declare-fun m!1364385 () Bool)

(assert (=> start!126202 m!1364385))

(declare-fun m!1364387 () Bool)

(assert (=> start!126202 m!1364387))

(declare-fun m!1364389 () Bool)

(assert (=> b!1478440 m!1364389))

(assert (=> b!1478446 m!1364347))

(assert (=> b!1478446 m!1364347))

(declare-fun m!1364391 () Bool)

(assert (=> b!1478446 m!1364391))

(assert (=> b!1478448 m!1364347))

(assert (=> b!1478448 m!1364347))

(declare-fun m!1364393 () Bool)

(assert (=> b!1478448 m!1364393))

(assert (=> b!1478448 m!1364393))

(assert (=> b!1478448 m!1364347))

(declare-fun m!1364395 () Bool)

(assert (=> b!1478448 m!1364395))

(declare-fun m!1364397 () Bool)

(assert (=> b!1478436 m!1364397))

(push 1)

