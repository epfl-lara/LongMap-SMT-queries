; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124786 () Bool)

(assert start!124786)

(declare-fun b!1447629 () Bool)

(declare-fun res!979269 () Bool)

(declare-fun e!815291 () Bool)

(assert (=> b!1447629 (=> (not res!979269) (not e!815291))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447629 (= res!979269 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447630 () Bool)

(declare-fun res!979263 () Bool)

(declare-fun e!815289 () Bool)

(assert (=> b!1447630 (=> (not res!979263) (not e!815289))))

(declare-datatypes ((array!98234 0))(
  ( (array!98235 (arr!47405 (Array (_ BitVec 32) (_ BitVec 64))) (size!47955 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98234)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447630 (= res!979263 (validKeyInArray!0 (select (arr!47405 a!2862) j!93)))))

(declare-fun b!1447631 () Bool)

(declare-fun e!815285 () Bool)

(assert (=> b!1447631 (= e!815289 e!815285)))

(declare-fun res!979275 () Bool)

(assert (=> b!1447631 (=> (not res!979275) (not e!815285))))

(assert (=> b!1447631 (= res!979275 (= (select (store (arr!47405 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635237 () array!98234)

(assert (=> b!1447631 (= lt!635237 (array!98235 (store (arr!47405 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47955 a!2862)))))

(declare-fun b!1447632 () Bool)

(declare-fun e!815293 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635235 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11657 0))(
  ( (MissingZero!11657 (index!49020 (_ BitVec 32))) (Found!11657 (index!49021 (_ BitVec 32))) (Intermediate!11657 (undefined!12469 Bool) (index!49022 (_ BitVec 32)) (x!130698 (_ BitVec 32))) (Undefined!11657) (MissingVacant!11657 (index!49023 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98234 (_ BitVec 32)) SeekEntryResult!11657)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98234 (_ BitVec 32)) SeekEntryResult!11657)

(assert (=> b!1447632 (= e!815293 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635235 lt!635237 mask!2687) (seekEntryOrOpen!0 lt!635235 lt!635237 mask!2687)))))

(declare-fun b!1447633 () Bool)

(declare-fun res!979261 () Bool)

(assert (=> b!1447633 (=> (not res!979261) (not e!815289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98234 (_ BitVec 32)) Bool)

(assert (=> b!1447633 (= res!979261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447634 () Bool)

(declare-fun e!815290 () Bool)

(declare-fun e!815294 () Bool)

(assert (=> b!1447634 (= e!815290 e!815294)))

(declare-fun res!979274 () Bool)

(assert (=> b!1447634 (=> res!979274 e!815294)))

(assert (=> b!1447634 (= res!979274 (or (and (= (select (arr!47405 a!2862) index!646) (select (store (arr!47405 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47405 a!2862) index!646) (select (arr!47405 a!2862) j!93))) (not (= (select (arr!47405 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447635 () Bool)

(declare-fun res!979264 () Bool)

(declare-fun e!815288 () Bool)

(assert (=> b!1447635 (=> (not res!979264) (not e!815288))))

(declare-fun lt!635234 () SeekEntryResult!11657)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98234 (_ BitVec 32)) SeekEntryResult!11657)

(assert (=> b!1447635 (= res!979264 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47405 a!2862) j!93) a!2862 mask!2687) lt!635234))))

(declare-fun b!1447636 () Bool)

(declare-fun res!979270 () Bool)

(assert (=> b!1447636 (=> (not res!979270) (not e!815289))))

(assert (=> b!1447636 (= res!979270 (and (= (size!47955 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47955 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47955 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447637 () Bool)

(declare-fun e!815292 () Bool)

(assert (=> b!1447637 (= e!815294 e!815292)))

(declare-fun res!979267 () Bool)

(assert (=> b!1447637 (=> (not res!979267) (not e!815292))))

(declare-fun lt!635232 () SeekEntryResult!11657)

(assert (=> b!1447637 (= res!979267 (= lt!635232 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47405 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447638 () Bool)

(declare-fun res!979273 () Bool)

(assert (=> b!1447638 (=> (not res!979273) (not e!815289))))

(assert (=> b!1447638 (= res!979273 (validKeyInArray!0 (select (arr!47405 a!2862) i!1006)))))

(declare-fun b!1447639 () Bool)

(declare-fun res!979266 () Bool)

(assert (=> b!1447639 (=> (not res!979266) (not e!815291))))

(assert (=> b!1447639 (= res!979266 e!815293)))

(declare-fun c!133695 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447639 (= c!133695 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!979271 () Bool)

(assert (=> start!124786 (=> (not res!979271) (not e!815289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124786 (= res!979271 (validMask!0 mask!2687))))

(assert (=> start!124786 e!815289))

(assert (=> start!124786 true))

(declare-fun array_inv!36433 (array!98234) Bool)

(assert (=> start!124786 (array_inv!36433 a!2862)))

(declare-fun b!1447640 () Bool)

(declare-fun e!815287 () Bool)

(assert (=> b!1447640 (= e!815291 (not e!815287))))

(declare-fun res!979272 () Bool)

(assert (=> b!1447640 (=> res!979272 e!815287)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1447640 (= res!979272 (or (and (= (select (arr!47405 a!2862) index!646) (select (store (arr!47405 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47405 a!2862) index!646) (select (arr!47405 a!2862) j!93))) (not (= (select (arr!47405 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47405 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447640 e!815290))

(declare-fun res!979260 () Bool)

(assert (=> b!1447640 (=> (not res!979260) (not e!815290))))

(assert (=> b!1447640 (= res!979260 (and (= lt!635232 (Found!11657 j!93)) (or (= (select (arr!47405 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47405 a!2862) intermediateBeforeIndex!19) (select (arr!47405 a!2862) j!93)))))))

(assert (=> b!1447640 (= lt!635232 (seekEntryOrOpen!0 (select (arr!47405 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447640 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48810 0))(
  ( (Unit!48811) )
))
(declare-fun lt!635236 () Unit!48810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48810)

(assert (=> b!1447640 (= lt!635236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447641 () Bool)

(declare-fun res!979265 () Bool)

(assert (=> b!1447641 (=> (not res!979265) (not e!815289))))

(assert (=> b!1447641 (= res!979265 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47955 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47955 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47955 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447642 () Bool)

(declare-fun lt!635233 () SeekEntryResult!11657)

(assert (=> b!1447642 (= e!815293 (= lt!635233 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635235 lt!635237 mask!2687)))))

(declare-fun b!1447643 () Bool)

(assert (=> b!1447643 (= e!815292 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447644 () Bool)

(declare-fun res!979262 () Bool)

(assert (=> b!1447644 (=> (not res!979262) (not e!815289))))

(declare-datatypes ((List!33906 0))(
  ( (Nil!33903) (Cons!33902 (h!35252 (_ BitVec 64)) (t!48600 List!33906)) )
))
(declare-fun arrayNoDuplicates!0 (array!98234 (_ BitVec 32) List!33906) Bool)

(assert (=> b!1447644 (= res!979262 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33903))))

(declare-fun b!1447645 () Bool)

(assert (=> b!1447645 (= e!815285 e!815288)))

(declare-fun res!979268 () Bool)

(assert (=> b!1447645 (=> (not res!979268) (not e!815288))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447645 (= res!979268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47405 a!2862) j!93) mask!2687) (select (arr!47405 a!2862) j!93) a!2862 mask!2687) lt!635234))))

(assert (=> b!1447645 (= lt!635234 (Intermediate!11657 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447646 () Bool)

(assert (=> b!1447646 (= e!815288 e!815291)))

(declare-fun res!979276 () Bool)

(assert (=> b!1447646 (=> (not res!979276) (not e!815291))))

(assert (=> b!1447646 (= res!979276 (= lt!635233 (Intermediate!11657 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447646 (= lt!635233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635235 mask!2687) lt!635235 lt!635237 mask!2687))))

(assert (=> b!1447646 (= lt!635235 (select (store (arr!47405 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447647 () Bool)

(assert (=> b!1447647 (= e!815287 true)))

(declare-fun lt!635238 () SeekEntryResult!11657)

(assert (=> b!1447647 (= lt!635238 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47405 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!124786 res!979271) b!1447636))

(assert (= (and b!1447636 res!979270) b!1447638))

(assert (= (and b!1447638 res!979273) b!1447630))

(assert (= (and b!1447630 res!979263) b!1447633))

(assert (= (and b!1447633 res!979261) b!1447644))

(assert (= (and b!1447644 res!979262) b!1447641))

(assert (= (and b!1447641 res!979265) b!1447631))

(assert (= (and b!1447631 res!979275) b!1447645))

(assert (= (and b!1447645 res!979268) b!1447635))

(assert (= (and b!1447635 res!979264) b!1447646))

(assert (= (and b!1447646 res!979276) b!1447639))

(assert (= (and b!1447639 c!133695) b!1447642))

(assert (= (and b!1447639 (not c!133695)) b!1447632))

(assert (= (and b!1447639 res!979266) b!1447629))

(assert (= (and b!1447629 res!979269) b!1447640))

(assert (= (and b!1447640 res!979260) b!1447634))

(assert (= (and b!1447634 (not res!979274)) b!1447637))

(assert (= (and b!1447637 res!979267) b!1447643))

(assert (= (and b!1447640 (not res!979272)) b!1447647))

(declare-fun m!1336435 () Bool)

(assert (=> b!1447645 m!1336435))

(assert (=> b!1447645 m!1336435))

(declare-fun m!1336437 () Bool)

(assert (=> b!1447645 m!1336437))

(assert (=> b!1447645 m!1336437))

(assert (=> b!1447645 m!1336435))

(declare-fun m!1336439 () Bool)

(assert (=> b!1447645 m!1336439))

(assert (=> b!1447635 m!1336435))

(assert (=> b!1447635 m!1336435))

(declare-fun m!1336441 () Bool)

(assert (=> b!1447635 m!1336441))

(assert (=> b!1447647 m!1336435))

(assert (=> b!1447647 m!1336435))

(declare-fun m!1336443 () Bool)

(assert (=> b!1447647 m!1336443))

(declare-fun m!1336445 () Bool)

(assert (=> b!1447640 m!1336445))

(declare-fun m!1336447 () Bool)

(assert (=> b!1447640 m!1336447))

(declare-fun m!1336449 () Bool)

(assert (=> b!1447640 m!1336449))

(declare-fun m!1336451 () Bool)

(assert (=> b!1447640 m!1336451))

(declare-fun m!1336453 () Bool)

(assert (=> b!1447640 m!1336453))

(assert (=> b!1447640 m!1336435))

(declare-fun m!1336455 () Bool)

(assert (=> b!1447640 m!1336455))

(declare-fun m!1336457 () Bool)

(assert (=> b!1447640 m!1336457))

(assert (=> b!1447640 m!1336435))

(declare-fun m!1336459 () Bool)

(assert (=> b!1447638 m!1336459))

(assert (=> b!1447638 m!1336459))

(declare-fun m!1336461 () Bool)

(assert (=> b!1447638 m!1336461))

(declare-fun m!1336463 () Bool)

(assert (=> b!1447642 m!1336463))

(assert (=> b!1447637 m!1336435))

(assert (=> b!1447637 m!1336435))

(declare-fun m!1336465 () Bool)

(assert (=> b!1447637 m!1336465))

(declare-fun m!1336467 () Bool)

(assert (=> b!1447632 m!1336467))

(declare-fun m!1336469 () Bool)

(assert (=> b!1447632 m!1336469))

(declare-fun m!1336471 () Bool)

(assert (=> b!1447633 m!1336471))

(declare-fun m!1336473 () Bool)

(assert (=> b!1447644 m!1336473))

(assert (=> b!1447630 m!1336435))

(assert (=> b!1447630 m!1336435))

(declare-fun m!1336475 () Bool)

(assert (=> b!1447630 m!1336475))

(declare-fun m!1336477 () Bool)

(assert (=> start!124786 m!1336477))

(declare-fun m!1336479 () Bool)

(assert (=> start!124786 m!1336479))

(declare-fun m!1336481 () Bool)

(assert (=> b!1447646 m!1336481))

(assert (=> b!1447646 m!1336481))

(declare-fun m!1336483 () Bool)

(assert (=> b!1447646 m!1336483))

(assert (=> b!1447646 m!1336447))

(declare-fun m!1336485 () Bool)

(assert (=> b!1447646 m!1336485))

(assert (=> b!1447631 m!1336447))

(declare-fun m!1336487 () Bool)

(assert (=> b!1447631 m!1336487))

(assert (=> b!1447634 m!1336453))

(assert (=> b!1447634 m!1336447))

(assert (=> b!1447634 m!1336451))

(assert (=> b!1447634 m!1336435))

(push 1)

