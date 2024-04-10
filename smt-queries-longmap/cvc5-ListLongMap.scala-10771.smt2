; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126124 () Bool)

(assert start!126124)

(declare-fun b!1476328 () Bool)

(declare-fun e!828294 () Bool)

(declare-fun e!828291 () Bool)

(assert (=> b!1476328 (= e!828294 e!828291)))

(declare-fun res!1002590 () Bool)

(assert (=> b!1476328 (=> (not res!1002590) (not e!828291))))

(declare-datatypes ((SeekEntryResult!12134 0))(
  ( (MissingZero!12134 (index!50928 (_ BitVec 32))) (Found!12134 (index!50929 (_ BitVec 32))) (Intermediate!12134 (undefined!12946 Bool) (index!50930 (_ BitVec 32)) (x!132533 (_ BitVec 32))) (Undefined!12134) (MissingVacant!12134 (index!50931 (_ BitVec 32))) )
))
(declare-fun lt!644978 () SeekEntryResult!12134)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99230 0))(
  ( (array!99231 (arr!47894 (Array (_ BitVec 32) (_ BitVec 64))) (size!48444 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99230)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99230 (_ BitVec 32)) SeekEntryResult!12134)

(assert (=> b!1476328 (= res!1002590 (= lt!644978 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47894 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1476329 () Bool)

(assert (=> b!1476329 (= e!828291 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476330 () Bool)

(declare-fun res!1002582 () Bool)

(declare-fun e!828296 () Bool)

(assert (=> b!1476330 (=> (not res!1002582) (not e!828296))))

(declare-fun e!828295 () Bool)

(assert (=> b!1476330 (= res!1002582 e!828295)))

(declare-fun c!136395 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476330 (= c!136395 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476331 () Bool)

(declare-fun res!1002586 () Bool)

(assert (=> b!1476331 (=> (not res!1002586) (not e!828296))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476331 (= res!1002586 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1002583 () Bool)

(declare-fun e!828292 () Bool)

(assert (=> start!126124 (=> (not res!1002583) (not e!828292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126124 (= res!1002583 (validMask!0 mask!2687))))

(assert (=> start!126124 e!828292))

(assert (=> start!126124 true))

(declare-fun array_inv!36922 (array!99230) Bool)

(assert (=> start!126124 (array_inv!36922 a!2862)))

(declare-fun b!1476332 () Bool)

(declare-fun res!1002577 () Bool)

(assert (=> b!1476332 (=> (not res!1002577) (not e!828292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99230 (_ BitVec 32)) Bool)

(assert (=> b!1476332 (= res!1002577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476333 () Bool)

(assert (=> b!1476333 (= e!828296 (not true))))

(declare-fun e!828293 () Bool)

(assert (=> b!1476333 e!828293))

(declare-fun res!1002588 () Bool)

(assert (=> b!1476333 (=> (not res!1002588) (not e!828293))))

(assert (=> b!1476333 (= res!1002588 (and (= lt!644978 (Found!12134 j!93)) (or (= (select (arr!47894 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47894 a!2862) intermediateBeforeIndex!19) (select (arr!47894 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99230 (_ BitVec 32)) SeekEntryResult!12134)

(assert (=> b!1476333 (= lt!644978 (seekEntryOrOpen!0 (select (arr!47894 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476333 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49608 0))(
  ( (Unit!49609) )
))
(declare-fun lt!644982 () Unit!49608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49608)

(assert (=> b!1476333 (= lt!644982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476334 () Bool)

(declare-fun res!1002578 () Bool)

(assert (=> b!1476334 (=> (not res!1002578) (not e!828292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476334 (= res!1002578 (validKeyInArray!0 (select (arr!47894 a!2862) i!1006)))))

(declare-fun b!1476335 () Bool)

(declare-fun res!1002589 () Bool)

(assert (=> b!1476335 (=> (not res!1002589) (not e!828292))))

(assert (=> b!1476335 (= res!1002589 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48444 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48444 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48444 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476336 () Bool)

(declare-fun e!828289 () Bool)

(assert (=> b!1476336 (= e!828292 e!828289)))

(declare-fun res!1002584 () Bool)

(assert (=> b!1476336 (=> (not res!1002584) (not e!828289))))

(assert (=> b!1476336 (= res!1002584 (= (select (store (arr!47894 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644981 () array!99230)

(assert (=> b!1476336 (= lt!644981 (array!99231 (store (arr!47894 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48444 a!2862)))))

(declare-fun lt!644980 () SeekEntryResult!12134)

(declare-fun b!1476337 () Bool)

(declare-fun lt!644979 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99230 (_ BitVec 32)) SeekEntryResult!12134)

(assert (=> b!1476337 (= e!828295 (= lt!644980 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644979 lt!644981 mask!2687)))))

(declare-fun b!1476338 () Bool)

(declare-fun res!1002592 () Bool)

(assert (=> b!1476338 (=> (not res!1002592) (not e!828292))))

(declare-datatypes ((List!34395 0))(
  ( (Nil!34392) (Cons!34391 (h!35759 (_ BitVec 64)) (t!49089 List!34395)) )
))
(declare-fun arrayNoDuplicates!0 (array!99230 (_ BitVec 32) List!34395) Bool)

(assert (=> b!1476338 (= res!1002592 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34392))))

(declare-fun b!1476339 () Bool)

(declare-fun e!828290 () Bool)

(assert (=> b!1476339 (= e!828289 e!828290)))

(declare-fun res!1002585 () Bool)

(assert (=> b!1476339 (=> (not res!1002585) (not e!828290))))

(declare-fun lt!644977 () SeekEntryResult!12134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476339 (= res!1002585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47894 a!2862) j!93) mask!2687) (select (arr!47894 a!2862) j!93) a!2862 mask!2687) lt!644977))))

(assert (=> b!1476339 (= lt!644977 (Intermediate!12134 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476340 () Bool)

(declare-fun res!1002579 () Bool)

(assert (=> b!1476340 (=> (not res!1002579) (not e!828290))))

(assert (=> b!1476340 (= res!1002579 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47894 a!2862) j!93) a!2862 mask!2687) lt!644977))))

(declare-fun b!1476341 () Bool)

(assert (=> b!1476341 (= e!828293 e!828294)))

(declare-fun res!1002587 () Bool)

(assert (=> b!1476341 (=> res!1002587 e!828294)))

(assert (=> b!1476341 (= res!1002587 (or (and (= (select (arr!47894 a!2862) index!646) (select (store (arr!47894 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47894 a!2862) index!646) (select (arr!47894 a!2862) j!93))) (not (= (select (arr!47894 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476342 () Bool)

(declare-fun res!1002591 () Bool)

(assert (=> b!1476342 (=> (not res!1002591) (not e!828292))))

(assert (=> b!1476342 (= res!1002591 (and (= (size!48444 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48444 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48444 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476343 () Bool)

(assert (=> b!1476343 (= e!828290 e!828296)))

(declare-fun res!1002581 () Bool)

(assert (=> b!1476343 (=> (not res!1002581) (not e!828296))))

(assert (=> b!1476343 (= res!1002581 (= lt!644980 (Intermediate!12134 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1476343 (= lt!644980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644979 mask!2687) lt!644979 lt!644981 mask!2687))))

(assert (=> b!1476343 (= lt!644979 (select (store (arr!47894 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476344 () Bool)

(assert (=> b!1476344 (= e!828295 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644979 lt!644981 mask!2687) (seekEntryOrOpen!0 lt!644979 lt!644981 mask!2687)))))

(declare-fun b!1476345 () Bool)

(declare-fun res!1002580 () Bool)

(assert (=> b!1476345 (=> (not res!1002580) (not e!828292))))

(assert (=> b!1476345 (= res!1002580 (validKeyInArray!0 (select (arr!47894 a!2862) j!93)))))

(assert (= (and start!126124 res!1002583) b!1476342))

(assert (= (and b!1476342 res!1002591) b!1476334))

(assert (= (and b!1476334 res!1002578) b!1476345))

(assert (= (and b!1476345 res!1002580) b!1476332))

(assert (= (and b!1476332 res!1002577) b!1476338))

(assert (= (and b!1476338 res!1002592) b!1476335))

(assert (= (and b!1476335 res!1002589) b!1476336))

(assert (= (and b!1476336 res!1002584) b!1476339))

(assert (= (and b!1476339 res!1002585) b!1476340))

(assert (= (and b!1476340 res!1002579) b!1476343))

(assert (= (and b!1476343 res!1002581) b!1476330))

(assert (= (and b!1476330 c!136395) b!1476337))

(assert (= (and b!1476330 (not c!136395)) b!1476344))

(assert (= (and b!1476330 res!1002582) b!1476331))

(assert (= (and b!1476331 res!1002586) b!1476333))

(assert (= (and b!1476333 res!1002588) b!1476341))

(assert (= (and b!1476341 (not res!1002587)) b!1476328))

(assert (= (and b!1476328 res!1002590) b!1476329))

(declare-fun m!1362319 () Bool)

(assert (=> b!1476344 m!1362319))

(declare-fun m!1362321 () Bool)

(assert (=> b!1476344 m!1362321))

(declare-fun m!1362323 () Bool)

(assert (=> b!1476336 m!1362323))

(declare-fun m!1362325 () Bool)

(assert (=> b!1476336 m!1362325))

(declare-fun m!1362327 () Bool)

(assert (=> b!1476337 m!1362327))

(declare-fun m!1362329 () Bool)

(assert (=> b!1476328 m!1362329))

(assert (=> b!1476328 m!1362329))

(declare-fun m!1362331 () Bool)

(assert (=> b!1476328 m!1362331))

(declare-fun m!1362333 () Bool)

(assert (=> b!1476338 m!1362333))

(declare-fun m!1362335 () Bool)

(assert (=> start!126124 m!1362335))

(declare-fun m!1362337 () Bool)

(assert (=> start!126124 m!1362337))

(declare-fun m!1362339 () Bool)

(assert (=> b!1476333 m!1362339))

(declare-fun m!1362341 () Bool)

(assert (=> b!1476333 m!1362341))

(assert (=> b!1476333 m!1362329))

(declare-fun m!1362343 () Bool)

(assert (=> b!1476333 m!1362343))

(declare-fun m!1362345 () Bool)

(assert (=> b!1476333 m!1362345))

(assert (=> b!1476333 m!1362329))

(assert (=> b!1476339 m!1362329))

(assert (=> b!1476339 m!1362329))

(declare-fun m!1362347 () Bool)

(assert (=> b!1476339 m!1362347))

(assert (=> b!1476339 m!1362347))

(assert (=> b!1476339 m!1362329))

(declare-fun m!1362349 () Bool)

(assert (=> b!1476339 m!1362349))

(assert (=> b!1476345 m!1362329))

(assert (=> b!1476345 m!1362329))

(declare-fun m!1362351 () Bool)

(assert (=> b!1476345 m!1362351))

(declare-fun m!1362353 () Bool)

(assert (=> b!1476334 m!1362353))

(assert (=> b!1476334 m!1362353))

(declare-fun m!1362355 () Bool)

(assert (=> b!1476334 m!1362355))

(declare-fun m!1362357 () Bool)

(assert (=> b!1476343 m!1362357))

(assert (=> b!1476343 m!1362357))

(declare-fun m!1362359 () Bool)

(assert (=> b!1476343 m!1362359))

(assert (=> b!1476343 m!1362323))

(declare-fun m!1362361 () Bool)

(assert (=> b!1476343 m!1362361))

(assert (=> b!1476340 m!1362329))

(assert (=> b!1476340 m!1362329))

(declare-fun m!1362363 () Bool)

(assert (=> b!1476340 m!1362363))

(declare-fun m!1362365 () Bool)

(assert (=> b!1476332 m!1362365))

(declare-fun m!1362367 () Bool)

(assert (=> b!1476341 m!1362367))

(assert (=> b!1476341 m!1362323))

(declare-fun m!1362369 () Bool)

(assert (=> b!1476341 m!1362369))

(assert (=> b!1476341 m!1362329))

(push 1)

