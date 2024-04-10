; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123552 () Bool)

(assert start!123552)

(declare-fun b!1432445 () Bool)

(declare-fun res!966322 () Bool)

(declare-fun e!808603 () Bool)

(assert (=> b!1432445 (=> (not res!966322) (not e!808603))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97524 0))(
  ( (array!97525 (arr!47069 (Array (_ BitVec 32) (_ BitVec 64))) (size!47619 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97524)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11348 0))(
  ( (MissingZero!11348 (index!47784 (_ BitVec 32))) (Found!11348 (index!47785 (_ BitVec 32))) (Intermediate!11348 (undefined!12160 Bool) (index!47786 (_ BitVec 32)) (x!129430 (_ BitVec 32))) (Undefined!11348) (MissingVacant!11348 (index!47787 (_ BitVec 32))) )
))
(declare-fun lt!630595 () SeekEntryResult!11348)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97524 (_ BitVec 32)) SeekEntryResult!11348)

(assert (=> b!1432445 (= res!966322 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47069 a!2831) j!81) a!2831 mask!2608) lt!630595))))

(declare-fun b!1432446 () Bool)

(declare-fun e!808604 () Bool)

(assert (=> b!1432446 (= e!808604 true)))

(declare-fun lt!630599 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432446 (= lt!630599 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432447 () Bool)

(declare-fun e!808605 () Bool)

(assert (=> b!1432447 (= e!808605 e!808603)))

(declare-fun res!966315 () Bool)

(assert (=> b!1432447 (=> (not res!966315) (not e!808603))))

(declare-fun lt!630598 () (_ BitVec 64))

(declare-fun lt!630600 () array!97524)

(declare-fun lt!630596 () SeekEntryResult!11348)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432447 (= res!966315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630598 mask!2608) lt!630598 lt!630600 mask!2608) lt!630596))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432447 (= lt!630596 (Intermediate!11348 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432447 (= lt!630598 (select (store (arr!47069 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432447 (= lt!630600 (array!97525 (store (arr!47069 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47619 a!2831)))))

(declare-fun b!1432448 () Bool)

(declare-fun res!966319 () Bool)

(assert (=> b!1432448 (=> (not res!966319) (not e!808603))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432448 (= res!966319 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432449 () Bool)

(declare-fun res!966310 () Bool)

(declare-fun e!808606 () Bool)

(assert (=> b!1432449 (=> (not res!966310) (not e!808606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97524 (_ BitVec 32)) Bool)

(assert (=> b!1432449 (= res!966310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432450 () Bool)

(declare-fun res!966317 () Bool)

(assert (=> b!1432450 (=> (not res!966317) (not e!808603))))

(assert (=> b!1432450 (= res!966317 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630598 lt!630600 mask!2608) lt!630596))))

(declare-fun b!1432451 () Bool)

(declare-fun res!966309 () Bool)

(assert (=> b!1432451 (=> (not res!966309) (not e!808606))))

(assert (=> b!1432451 (= res!966309 (and (= (size!47619 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47619 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47619 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432452 () Bool)

(declare-fun res!966311 () Bool)

(assert (=> b!1432452 (=> (not res!966311) (not e!808606))))

(declare-datatypes ((List!33579 0))(
  ( (Nil!33576) (Cons!33575 (h!34898 (_ BitVec 64)) (t!48273 List!33579)) )
))
(declare-fun arrayNoDuplicates!0 (array!97524 (_ BitVec 32) List!33579) Bool)

(assert (=> b!1432452 (= res!966311 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33576))))

(declare-fun b!1432453 () Bool)

(assert (=> b!1432453 (= e!808603 (not e!808604))))

(declare-fun res!966321 () Bool)

(assert (=> b!1432453 (=> res!966321 e!808604)))

(assert (=> b!1432453 (= res!966321 (or (= (select (arr!47069 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47069 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47069 a!2831) index!585) (select (arr!47069 a!2831) j!81)) (= (select (store (arr!47069 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808602 () Bool)

(assert (=> b!1432453 e!808602))

(declare-fun res!966320 () Bool)

(assert (=> b!1432453 (=> (not res!966320) (not e!808602))))

(assert (=> b!1432453 (= res!966320 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48442 0))(
  ( (Unit!48443) )
))
(declare-fun lt!630597 () Unit!48442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48442)

(assert (=> b!1432453 (= lt!630597 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!966314 () Bool)

(assert (=> start!123552 (=> (not res!966314) (not e!808606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123552 (= res!966314 (validMask!0 mask!2608))))

(assert (=> start!123552 e!808606))

(assert (=> start!123552 true))

(declare-fun array_inv!36097 (array!97524) Bool)

(assert (=> start!123552 (array_inv!36097 a!2831)))

(declare-fun b!1432454 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97524 (_ BitVec 32)) SeekEntryResult!11348)

(assert (=> b!1432454 (= e!808602 (= (seekEntryOrOpen!0 (select (arr!47069 a!2831) j!81) a!2831 mask!2608) (Found!11348 j!81)))))

(declare-fun b!1432455 () Bool)

(declare-fun res!966318 () Bool)

(assert (=> b!1432455 (=> (not res!966318) (not e!808606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432455 (= res!966318 (validKeyInArray!0 (select (arr!47069 a!2831) j!81)))))

(declare-fun b!1432456 () Bool)

(declare-fun res!966313 () Bool)

(assert (=> b!1432456 (=> (not res!966313) (not e!808606))))

(assert (=> b!1432456 (= res!966313 (validKeyInArray!0 (select (arr!47069 a!2831) i!982)))))

(declare-fun b!1432457 () Bool)

(declare-fun res!966312 () Bool)

(assert (=> b!1432457 (=> (not res!966312) (not e!808606))))

(assert (=> b!1432457 (= res!966312 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47619 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47619 a!2831))))))

(declare-fun b!1432458 () Bool)

(assert (=> b!1432458 (= e!808606 e!808605)))

(declare-fun res!966316 () Bool)

(assert (=> b!1432458 (=> (not res!966316) (not e!808605))))

(assert (=> b!1432458 (= res!966316 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47069 a!2831) j!81) mask!2608) (select (arr!47069 a!2831) j!81) a!2831 mask!2608) lt!630595))))

(assert (=> b!1432458 (= lt!630595 (Intermediate!11348 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123552 res!966314) b!1432451))

(assert (= (and b!1432451 res!966309) b!1432456))

(assert (= (and b!1432456 res!966313) b!1432455))

(assert (= (and b!1432455 res!966318) b!1432449))

(assert (= (and b!1432449 res!966310) b!1432452))

(assert (= (and b!1432452 res!966311) b!1432457))

(assert (= (and b!1432457 res!966312) b!1432458))

(assert (= (and b!1432458 res!966316) b!1432447))

(assert (= (and b!1432447 res!966315) b!1432445))

(assert (= (and b!1432445 res!966322) b!1432450))

(assert (= (and b!1432450 res!966317) b!1432448))

(assert (= (and b!1432448 res!966319) b!1432453))

(assert (= (and b!1432453 res!966320) b!1432454))

(assert (= (and b!1432453 (not res!966321)) b!1432446))

(declare-fun m!1322253 () Bool)

(assert (=> b!1432454 m!1322253))

(assert (=> b!1432454 m!1322253))

(declare-fun m!1322255 () Bool)

(assert (=> b!1432454 m!1322255))

(declare-fun m!1322257 () Bool)

(assert (=> start!123552 m!1322257))

(declare-fun m!1322259 () Bool)

(assert (=> start!123552 m!1322259))

(assert (=> b!1432445 m!1322253))

(assert (=> b!1432445 m!1322253))

(declare-fun m!1322261 () Bool)

(assert (=> b!1432445 m!1322261))

(declare-fun m!1322263 () Bool)

(assert (=> b!1432446 m!1322263))

(declare-fun m!1322265 () Bool)

(assert (=> b!1432450 m!1322265))

(assert (=> b!1432455 m!1322253))

(assert (=> b!1432455 m!1322253))

(declare-fun m!1322267 () Bool)

(assert (=> b!1432455 m!1322267))

(declare-fun m!1322269 () Bool)

(assert (=> b!1432456 m!1322269))

(assert (=> b!1432456 m!1322269))

(declare-fun m!1322271 () Bool)

(assert (=> b!1432456 m!1322271))

(declare-fun m!1322273 () Bool)

(assert (=> b!1432447 m!1322273))

(assert (=> b!1432447 m!1322273))

(declare-fun m!1322275 () Bool)

(assert (=> b!1432447 m!1322275))

(declare-fun m!1322277 () Bool)

(assert (=> b!1432447 m!1322277))

(declare-fun m!1322279 () Bool)

(assert (=> b!1432447 m!1322279))

(assert (=> b!1432453 m!1322277))

(declare-fun m!1322281 () Bool)

(assert (=> b!1432453 m!1322281))

(declare-fun m!1322283 () Bool)

(assert (=> b!1432453 m!1322283))

(declare-fun m!1322285 () Bool)

(assert (=> b!1432453 m!1322285))

(assert (=> b!1432453 m!1322253))

(declare-fun m!1322287 () Bool)

(assert (=> b!1432453 m!1322287))

(declare-fun m!1322289 () Bool)

(assert (=> b!1432452 m!1322289))

(declare-fun m!1322291 () Bool)

(assert (=> b!1432449 m!1322291))

(assert (=> b!1432458 m!1322253))

(assert (=> b!1432458 m!1322253))

(declare-fun m!1322293 () Bool)

(assert (=> b!1432458 m!1322293))

(assert (=> b!1432458 m!1322293))

(assert (=> b!1432458 m!1322253))

(declare-fun m!1322295 () Bool)

(assert (=> b!1432458 m!1322295))

(push 1)

