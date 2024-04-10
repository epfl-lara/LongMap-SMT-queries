; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125798 () Bool)

(assert start!125798)

(declare-fun b!1472520 () Bool)

(declare-fun res!1000185 () Bool)

(declare-fun e!826387 () Bool)

(assert (=> b!1472520 (=> (not res!1000185) (not e!826387))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472520 (= res!1000185 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472521 () Bool)

(declare-fun res!1000182 () Bool)

(declare-fun e!826383 () Bool)

(assert (=> b!1472521 (=> (not res!1000182) (not e!826383))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99132 0))(
  ( (array!99133 (arr!47851 (Array (_ BitVec 32) (_ BitVec 64))) (size!48401 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99132)

(assert (=> b!1472521 (= res!1000182 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48401 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48401 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48401 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472522 () Bool)

(declare-fun e!826386 () Bool)

(declare-fun e!826384 () Bool)

(assert (=> b!1472522 (= e!826386 e!826384)))

(declare-fun res!1000174 () Bool)

(assert (=> b!1472522 (=> (not res!1000174) (not e!826384))))

(declare-datatypes ((SeekEntryResult!12091 0))(
  ( (MissingZero!12091 (index!50756 (_ BitVec 32))) (Found!12091 (index!50757 (_ BitVec 32))) (Intermediate!12091 (undefined!12903 Bool) (index!50758 (_ BitVec 32)) (x!132334 (_ BitVec 32))) (Undefined!12091) (MissingVacant!12091 (index!50759 (_ BitVec 32))) )
))
(declare-fun lt!643598 () SeekEntryResult!12091)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99132 (_ BitVec 32)) SeekEntryResult!12091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472522 (= res!1000174 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47851 a!2862) j!93) mask!2687) (select (arr!47851 a!2862) j!93) a!2862 mask!2687) lt!643598))))

(assert (=> b!1472522 (= lt!643598 (Intermediate!12091 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!643595 () SeekEntryResult!12091)

(declare-fun e!826382 () Bool)

(declare-fun b!1472523 () Bool)

(declare-fun lt!643596 () array!99132)

(declare-fun lt!643597 () (_ BitVec 64))

(assert (=> b!1472523 (= e!826382 (= lt!643595 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643597 lt!643596 mask!2687)))))

(declare-fun b!1472524 () Bool)

(declare-fun res!1000180 () Bool)

(assert (=> b!1472524 (=> (not res!1000180) (not e!826383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472524 (= res!1000180 (validKeyInArray!0 (select (arr!47851 a!2862) i!1006)))))

(declare-fun b!1472525 () Bool)

(declare-fun res!1000179 () Bool)

(assert (=> b!1472525 (=> (not res!1000179) (not e!826383))))

(assert (=> b!1472525 (= res!1000179 (and (= (size!48401 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48401 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48401 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472526 () Bool)

(declare-fun res!1000181 () Bool)

(declare-fun e!826385 () Bool)

(assert (=> b!1472526 (=> (not res!1000181) (not e!826385))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99132 (_ BitVec 32)) SeekEntryResult!12091)

(assert (=> b!1472526 (= res!1000181 (= (seekEntryOrOpen!0 (select (arr!47851 a!2862) j!93) a!2862 mask!2687) (Found!12091 j!93)))))

(declare-fun b!1472527 () Bool)

(declare-fun res!1000175 () Bool)

(assert (=> b!1472527 (=> (not res!1000175) (not e!826383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99132 (_ BitVec 32)) Bool)

(assert (=> b!1472527 (= res!1000175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472528 () Bool)

(declare-fun res!1000186 () Bool)

(assert (=> b!1472528 (=> (not res!1000186) (not e!826383))))

(declare-datatypes ((List!34352 0))(
  ( (Nil!34349) (Cons!34348 (h!35704 (_ BitVec 64)) (t!49046 List!34352)) )
))
(declare-fun arrayNoDuplicates!0 (array!99132 (_ BitVec 32) List!34352) Bool)

(assert (=> b!1472528 (= res!1000186 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34349))))

(declare-fun b!1472529 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99132 (_ BitVec 32)) SeekEntryResult!12091)

(assert (=> b!1472529 (= e!826382 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643597 lt!643596 mask!2687) (seekEntryOrOpen!0 lt!643597 lt!643596 mask!2687)))))

(declare-fun res!1000172 () Bool)

(assert (=> start!125798 (=> (not res!1000172) (not e!826383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125798 (= res!1000172 (validMask!0 mask!2687))))

(assert (=> start!125798 e!826383))

(assert (=> start!125798 true))

(declare-fun array_inv!36879 (array!99132) Bool)

(assert (=> start!125798 (array_inv!36879 a!2862)))

(declare-fun b!1472519 () Bool)

(declare-fun res!1000173 () Bool)

(assert (=> b!1472519 (=> (not res!1000173) (not e!826383))))

(assert (=> b!1472519 (= res!1000173 (validKeyInArray!0 (select (arr!47851 a!2862) j!93)))))

(declare-fun b!1472530 () Bool)

(declare-fun res!1000178 () Bool)

(assert (=> b!1472530 (=> (not res!1000178) (not e!826384))))

(assert (=> b!1472530 (= res!1000178 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47851 a!2862) j!93) a!2862 mask!2687) lt!643598))))

(declare-fun b!1472531 () Bool)

(assert (=> b!1472531 (= e!826387 (not true))))

(assert (=> b!1472531 e!826385))

(declare-fun res!1000184 () Bool)

(assert (=> b!1472531 (=> (not res!1000184) (not e!826385))))

(assert (=> b!1472531 (= res!1000184 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49522 0))(
  ( (Unit!49523) )
))
(declare-fun lt!643599 () Unit!49522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49522)

(assert (=> b!1472531 (= lt!643599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472532 () Bool)

(assert (=> b!1472532 (= e!826384 e!826387)))

(declare-fun res!1000176 () Bool)

(assert (=> b!1472532 (=> (not res!1000176) (not e!826387))))

(assert (=> b!1472532 (= res!1000176 (= lt!643595 (Intermediate!12091 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472532 (= lt!643595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643597 mask!2687) lt!643597 lt!643596 mask!2687))))

(assert (=> b!1472532 (= lt!643597 (select (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472533 () Bool)

(declare-fun res!1000177 () Bool)

(assert (=> b!1472533 (=> (not res!1000177) (not e!826387))))

(assert (=> b!1472533 (= res!1000177 e!826382)))

(declare-fun c!135687 () Bool)

(assert (=> b!1472533 (= c!135687 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472534 () Bool)

(assert (=> b!1472534 (= e!826385 (or (= (select (arr!47851 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47851 a!2862) intermediateBeforeIndex!19) (select (arr!47851 a!2862) j!93))))))

(declare-fun b!1472535 () Bool)

(assert (=> b!1472535 (= e!826383 e!826386)))

(declare-fun res!1000183 () Bool)

(assert (=> b!1472535 (=> (not res!1000183) (not e!826386))))

(assert (=> b!1472535 (= res!1000183 (= (select (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472535 (= lt!643596 (array!99133 (store (arr!47851 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48401 a!2862)))))

(assert (= (and start!125798 res!1000172) b!1472525))

(assert (= (and b!1472525 res!1000179) b!1472524))

(assert (= (and b!1472524 res!1000180) b!1472519))

(assert (= (and b!1472519 res!1000173) b!1472527))

(assert (= (and b!1472527 res!1000175) b!1472528))

(assert (= (and b!1472528 res!1000186) b!1472521))

(assert (= (and b!1472521 res!1000182) b!1472535))

(assert (= (and b!1472535 res!1000183) b!1472522))

(assert (= (and b!1472522 res!1000174) b!1472530))

(assert (= (and b!1472530 res!1000178) b!1472532))

(assert (= (and b!1472532 res!1000176) b!1472533))

(assert (= (and b!1472533 c!135687) b!1472523))

(assert (= (and b!1472533 (not c!135687)) b!1472529))

(assert (= (and b!1472533 res!1000177) b!1472520))

(assert (= (and b!1472520 res!1000185) b!1472531))

(assert (= (and b!1472531 res!1000184) b!1472526))

(assert (= (and b!1472526 res!1000181) b!1472534))

(declare-fun m!1359225 () Bool)

(assert (=> b!1472535 m!1359225))

(declare-fun m!1359227 () Bool)

(assert (=> b!1472535 m!1359227))

(declare-fun m!1359229 () Bool)

(assert (=> b!1472530 m!1359229))

(assert (=> b!1472530 m!1359229))

(declare-fun m!1359231 () Bool)

(assert (=> b!1472530 m!1359231))

(declare-fun m!1359233 () Bool)

(assert (=> b!1472529 m!1359233))

(declare-fun m!1359235 () Bool)

(assert (=> b!1472529 m!1359235))

(assert (=> b!1472519 m!1359229))

(assert (=> b!1472519 m!1359229))

(declare-fun m!1359237 () Bool)

(assert (=> b!1472519 m!1359237))

(declare-fun m!1359239 () Bool)

(assert (=> b!1472523 m!1359239))

(assert (=> b!1472526 m!1359229))

(assert (=> b!1472526 m!1359229))

(declare-fun m!1359241 () Bool)

(assert (=> b!1472526 m!1359241))

(declare-fun m!1359243 () Bool)

(assert (=> b!1472524 m!1359243))

(assert (=> b!1472524 m!1359243))

(declare-fun m!1359245 () Bool)

(assert (=> b!1472524 m!1359245))

(declare-fun m!1359247 () Bool)

(assert (=> b!1472528 m!1359247))

(assert (=> b!1472522 m!1359229))

(assert (=> b!1472522 m!1359229))

(declare-fun m!1359249 () Bool)

(assert (=> b!1472522 m!1359249))

(assert (=> b!1472522 m!1359249))

(assert (=> b!1472522 m!1359229))

(declare-fun m!1359251 () Bool)

(assert (=> b!1472522 m!1359251))

(declare-fun m!1359253 () Bool)

(assert (=> start!125798 m!1359253))

(declare-fun m!1359255 () Bool)

(assert (=> start!125798 m!1359255))

(declare-fun m!1359257 () Bool)

(assert (=> b!1472534 m!1359257))

(assert (=> b!1472534 m!1359229))

(declare-fun m!1359259 () Bool)

(assert (=> b!1472527 m!1359259))

(declare-fun m!1359261 () Bool)

(assert (=> b!1472531 m!1359261))

(declare-fun m!1359263 () Bool)

(assert (=> b!1472531 m!1359263))

(declare-fun m!1359265 () Bool)

(assert (=> b!1472532 m!1359265))

(assert (=> b!1472532 m!1359265))

(declare-fun m!1359267 () Bool)

(assert (=> b!1472532 m!1359267))

(assert (=> b!1472532 m!1359225))

(declare-fun m!1359269 () Bool)

(assert (=> b!1472532 m!1359269))

(push 1)

(assert (not b!1472519))

