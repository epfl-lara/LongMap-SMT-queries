; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125802 () Bool)

(assert start!125802)

(declare-fun res!1000271 () Bool)

(declare-fun e!826425 () Bool)

(assert (=> start!125802 (=> (not res!1000271) (not e!826425))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125802 (= res!1000271 (validMask!0 mask!2687))))

(assert (=> start!125802 e!826425))

(assert (=> start!125802 true))

(declare-datatypes ((array!99136 0))(
  ( (array!99137 (arr!47853 (Array (_ BitVec 32) (_ BitVec 64))) (size!48403 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99136)

(declare-fun array_inv!36881 (array!99136) Bool)

(assert (=> start!125802 (array_inv!36881 a!2862)))

(declare-fun b!1472621 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!826429 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472621 (= e!826429 (or (= (select (arr!47853 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47853 a!2862) intermediateBeforeIndex!19) (select (arr!47853 a!2862) j!93))))))

(declare-fun b!1472622 () Bool)

(declare-fun e!826430 () Bool)

(declare-fun e!826424 () Bool)

(assert (=> b!1472622 (= e!826430 e!826424)))

(declare-fun res!1000275 () Bool)

(assert (=> b!1472622 (=> (not res!1000275) (not e!826424))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12093 0))(
  ( (MissingZero!12093 (index!50764 (_ BitVec 32))) (Found!12093 (index!50765 (_ BitVec 32))) (Intermediate!12093 (undefined!12905 Bool) (index!50766 (_ BitVec 32)) (x!132344 (_ BitVec 32))) (Undefined!12093) (MissingVacant!12093 (index!50767 (_ BitVec 32))) )
))
(declare-fun lt!643628 () SeekEntryResult!12093)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472622 (= res!1000275 (= lt!643628 (Intermediate!12093 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643627 () array!99136)

(declare-fun lt!643625 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99136 (_ BitVec 32)) SeekEntryResult!12093)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472622 (= lt!643628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643625 mask!2687) lt!643625 lt!643627 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472622 (= lt!643625 (select (store (arr!47853 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1472623 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!826427 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99136 (_ BitVec 32)) SeekEntryResult!12093)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99136 (_ BitVec 32)) SeekEntryResult!12093)

(assert (=> b!1472623 (= e!826427 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643625 lt!643627 mask!2687) (seekEntryOrOpen!0 lt!643625 lt!643627 mask!2687)))))

(declare-fun b!1472624 () Bool)

(declare-fun res!1000270 () Bool)

(assert (=> b!1472624 (=> (not res!1000270) (not e!826424))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472624 (= res!1000270 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472625 () Bool)

(declare-fun res!1000268 () Bool)

(assert (=> b!1472625 (=> (not res!1000268) (not e!826425))))

(assert (=> b!1472625 (= res!1000268 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48403 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48403 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48403 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472626 () Bool)

(declare-fun res!1000276 () Bool)

(assert (=> b!1472626 (=> (not res!1000276) (not e!826429))))

(assert (=> b!1472626 (= res!1000276 (= (seekEntryOrOpen!0 (select (arr!47853 a!2862) j!93) a!2862 mask!2687) (Found!12093 j!93)))))

(declare-fun b!1472627 () Bool)

(declare-fun res!1000272 () Bool)

(assert (=> b!1472627 (=> (not res!1000272) (not e!826425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472627 (= res!1000272 (validKeyInArray!0 (select (arr!47853 a!2862) i!1006)))))

(declare-fun b!1472628 () Bool)

(declare-fun res!1000262 () Bool)

(assert (=> b!1472628 (=> (not res!1000262) (not e!826425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99136 (_ BitVec 32)) Bool)

(assert (=> b!1472628 (= res!1000262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472629 () Bool)

(assert (=> b!1472629 (= e!826424 (not true))))

(assert (=> b!1472629 e!826429))

(declare-fun res!1000273 () Bool)

(assert (=> b!1472629 (=> (not res!1000273) (not e!826429))))

(assert (=> b!1472629 (= res!1000273 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49526 0))(
  ( (Unit!49527) )
))
(declare-fun lt!643629 () Unit!49526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49526)

(assert (=> b!1472629 (= lt!643629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472630 () Bool)

(declare-fun e!826428 () Bool)

(assert (=> b!1472630 (= e!826428 e!826430)))

(declare-fun res!1000266 () Bool)

(assert (=> b!1472630 (=> (not res!1000266) (not e!826430))))

(declare-fun lt!643626 () SeekEntryResult!12093)

(assert (=> b!1472630 (= res!1000266 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47853 a!2862) j!93) mask!2687) (select (arr!47853 a!2862) j!93) a!2862 mask!2687) lt!643626))))

(assert (=> b!1472630 (= lt!643626 (Intermediate!12093 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472631 () Bool)

(declare-fun res!1000264 () Bool)

(assert (=> b!1472631 (=> (not res!1000264) (not e!826424))))

(assert (=> b!1472631 (= res!1000264 e!826427)))

(declare-fun c!135693 () Bool)

(assert (=> b!1472631 (= c!135693 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472632 () Bool)

(declare-fun res!1000267 () Bool)

(assert (=> b!1472632 (=> (not res!1000267) (not e!826425))))

(assert (=> b!1472632 (= res!1000267 (validKeyInArray!0 (select (arr!47853 a!2862) j!93)))))

(declare-fun b!1472633 () Bool)

(declare-fun res!1000274 () Bool)

(assert (=> b!1472633 (=> (not res!1000274) (not e!826425))))

(assert (=> b!1472633 (= res!1000274 (and (= (size!48403 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48403 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48403 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472634 () Bool)

(declare-fun res!1000263 () Bool)

(assert (=> b!1472634 (=> (not res!1000263) (not e!826430))))

(assert (=> b!1472634 (= res!1000263 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47853 a!2862) j!93) a!2862 mask!2687) lt!643626))))

(declare-fun b!1472635 () Bool)

(assert (=> b!1472635 (= e!826427 (= lt!643628 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643625 lt!643627 mask!2687)))))

(declare-fun b!1472636 () Bool)

(declare-fun res!1000269 () Bool)

(assert (=> b!1472636 (=> (not res!1000269) (not e!826425))))

(declare-datatypes ((List!34354 0))(
  ( (Nil!34351) (Cons!34350 (h!35706 (_ BitVec 64)) (t!49048 List!34354)) )
))
(declare-fun arrayNoDuplicates!0 (array!99136 (_ BitVec 32) List!34354) Bool)

(assert (=> b!1472636 (= res!1000269 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34351))))

(declare-fun b!1472637 () Bool)

(assert (=> b!1472637 (= e!826425 e!826428)))

(declare-fun res!1000265 () Bool)

(assert (=> b!1472637 (=> (not res!1000265) (not e!826428))))

(assert (=> b!1472637 (= res!1000265 (= (select (store (arr!47853 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472637 (= lt!643627 (array!99137 (store (arr!47853 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48403 a!2862)))))

(assert (= (and start!125802 res!1000271) b!1472633))

(assert (= (and b!1472633 res!1000274) b!1472627))

(assert (= (and b!1472627 res!1000272) b!1472632))

(assert (= (and b!1472632 res!1000267) b!1472628))

(assert (= (and b!1472628 res!1000262) b!1472636))

(assert (= (and b!1472636 res!1000269) b!1472625))

(assert (= (and b!1472625 res!1000268) b!1472637))

(assert (= (and b!1472637 res!1000265) b!1472630))

(assert (= (and b!1472630 res!1000266) b!1472634))

(assert (= (and b!1472634 res!1000263) b!1472622))

(assert (= (and b!1472622 res!1000275) b!1472631))

(assert (= (and b!1472631 c!135693) b!1472635))

(assert (= (and b!1472631 (not c!135693)) b!1472623))

(assert (= (and b!1472631 res!1000264) b!1472624))

(assert (= (and b!1472624 res!1000270) b!1472629))

(assert (= (and b!1472629 res!1000273) b!1472626))

(assert (= (and b!1472626 res!1000276) b!1472621))

(declare-fun m!1359317 () Bool)

(assert (=> b!1472629 m!1359317))

(declare-fun m!1359319 () Bool)

(assert (=> b!1472629 m!1359319))

(declare-fun m!1359321 () Bool)

(assert (=> b!1472626 m!1359321))

(assert (=> b!1472626 m!1359321))

(declare-fun m!1359323 () Bool)

(assert (=> b!1472626 m!1359323))

(assert (=> b!1472630 m!1359321))

(assert (=> b!1472630 m!1359321))

(declare-fun m!1359325 () Bool)

(assert (=> b!1472630 m!1359325))

(assert (=> b!1472630 m!1359325))

(assert (=> b!1472630 m!1359321))

(declare-fun m!1359327 () Bool)

(assert (=> b!1472630 m!1359327))

(assert (=> b!1472634 m!1359321))

(assert (=> b!1472634 m!1359321))

(declare-fun m!1359329 () Bool)

(assert (=> b!1472634 m!1359329))

(declare-fun m!1359331 () Bool)

(assert (=> b!1472621 m!1359331))

(assert (=> b!1472621 m!1359321))

(declare-fun m!1359333 () Bool)

(assert (=> b!1472623 m!1359333))

(declare-fun m!1359335 () Bool)

(assert (=> b!1472623 m!1359335))

(declare-fun m!1359337 () Bool)

(assert (=> b!1472635 m!1359337))

(declare-fun m!1359339 () Bool)

(assert (=> b!1472636 m!1359339))

(declare-fun m!1359341 () Bool)

(assert (=> b!1472628 m!1359341))

(declare-fun m!1359343 () Bool)

(assert (=> b!1472637 m!1359343))

(declare-fun m!1359345 () Bool)

(assert (=> b!1472637 m!1359345))

(declare-fun m!1359347 () Bool)

(assert (=> start!125802 m!1359347))

(declare-fun m!1359349 () Bool)

(assert (=> start!125802 m!1359349))

(declare-fun m!1359351 () Bool)

(assert (=> b!1472627 m!1359351))

(assert (=> b!1472627 m!1359351))

(declare-fun m!1359353 () Bool)

(assert (=> b!1472627 m!1359353))

(assert (=> b!1472632 m!1359321))

(assert (=> b!1472632 m!1359321))

(declare-fun m!1359355 () Bool)

(assert (=> b!1472632 m!1359355))

(declare-fun m!1359357 () Bool)

(assert (=> b!1472622 m!1359357))

(assert (=> b!1472622 m!1359357))

(declare-fun m!1359359 () Bool)

(assert (=> b!1472622 m!1359359))

(assert (=> b!1472622 m!1359343))

(declare-fun m!1359361 () Bool)

(assert (=> b!1472622 m!1359361))

(check-sat (not b!1472627) (not b!1472626) (not b!1472636) (not b!1472630) (not b!1472623) (not b!1472629) (not b!1472622) (not b!1472628) (not b!1472632) (not b!1472635) (not start!125802) (not b!1472634))
(check-sat)
