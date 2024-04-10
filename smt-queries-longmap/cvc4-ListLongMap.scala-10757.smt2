; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125804 () Bool)

(assert start!125804)

(declare-fun b!1472672 () Bool)

(declare-fun res!1000321 () Bool)

(declare-fun e!826449 () Bool)

(assert (=> b!1472672 (=> (not res!1000321) (not e!826449))))

(declare-datatypes ((array!99138 0))(
  ( (array!99139 (arr!47854 (Array (_ BitVec 32) (_ BitVec 64))) (size!48404 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99138)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472672 (= res!1000321 (validKeyInArray!0 (select (arr!47854 a!2862) i!1006)))))

(declare-fun b!1472673 () Bool)

(declare-fun res!1000312 () Bool)

(assert (=> b!1472673 (=> (not res!1000312) (not e!826449))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1472673 (= res!1000312 (and (= (size!48404 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48404 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48404 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472674 () Bool)

(declare-fun e!826450 () Bool)

(assert (=> b!1472674 (= e!826450 (not true))))

(declare-fun e!826451 () Bool)

(assert (=> b!1472674 e!826451))

(declare-fun res!1000314 () Bool)

(assert (=> b!1472674 (=> (not res!1000314) (not e!826451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99138 (_ BitVec 32)) Bool)

(assert (=> b!1472674 (= res!1000314 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49528 0))(
  ( (Unit!49529) )
))
(declare-fun lt!643642 () Unit!49528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49528)

(assert (=> b!1472674 (= lt!643642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472675 () Bool)

(declare-fun e!826448 () Bool)

(assert (=> b!1472675 (= e!826449 e!826448)))

(declare-fun res!1000309 () Bool)

(assert (=> b!1472675 (=> (not res!1000309) (not e!826448))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472675 (= res!1000309 (= (select (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643643 () array!99138)

(assert (=> b!1472675 (= lt!643643 (array!99139 (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48404 a!2862)))))

(declare-fun b!1472676 () Bool)

(declare-fun e!826446 () Bool)

(assert (=> b!1472676 (= e!826446 e!826450)))

(declare-fun res!1000315 () Bool)

(assert (=> b!1472676 (=> (not res!1000315) (not e!826450))))

(declare-datatypes ((SeekEntryResult!12094 0))(
  ( (MissingZero!12094 (index!50768 (_ BitVec 32))) (Found!12094 (index!50769 (_ BitVec 32))) (Intermediate!12094 (undefined!12906 Bool) (index!50770 (_ BitVec 32)) (x!132345 (_ BitVec 32))) (Undefined!12094) (MissingVacant!12094 (index!50771 (_ BitVec 32))) )
))
(declare-fun lt!643644 () SeekEntryResult!12094)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472676 (= res!1000315 (= lt!643644 (Intermediate!12094 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643641 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99138 (_ BitVec 32)) SeekEntryResult!12094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472676 (= lt!643644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643641 mask!2687) lt!643641 lt!643643 mask!2687))))

(assert (=> b!1472676 (= lt!643641 (select (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!826447 () Bool)

(declare-fun b!1472677 () Bool)

(assert (=> b!1472677 (= e!826447 (= lt!643644 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643641 lt!643643 mask!2687)))))

(declare-fun b!1472678 () Bool)

(declare-fun res!1000310 () Bool)

(assert (=> b!1472678 (=> (not res!1000310) (not e!826446))))

(declare-fun lt!643640 () SeekEntryResult!12094)

(assert (=> b!1472678 (= res!1000310 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47854 a!2862) j!93) a!2862 mask!2687) lt!643640))))

(declare-fun b!1472679 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99138 (_ BitVec 32)) SeekEntryResult!12094)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99138 (_ BitVec 32)) SeekEntryResult!12094)

(assert (=> b!1472679 (= e!826447 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643641 lt!643643 mask!2687) (seekEntryOrOpen!0 lt!643641 lt!643643 mask!2687)))))

(declare-fun b!1472680 () Bool)

(declare-fun res!1000308 () Bool)

(assert (=> b!1472680 (=> (not res!1000308) (not e!826450))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472680 (= res!1000308 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472681 () Bool)

(assert (=> b!1472681 (= e!826448 e!826446)))

(declare-fun res!1000317 () Bool)

(assert (=> b!1472681 (=> (not res!1000317) (not e!826446))))

(assert (=> b!1472681 (= res!1000317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47854 a!2862) j!93) mask!2687) (select (arr!47854 a!2862) j!93) a!2862 mask!2687) lt!643640))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472681 (= lt!643640 (Intermediate!12094 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472683 () Bool)

(declare-fun res!1000311 () Bool)

(assert (=> b!1472683 (=> (not res!1000311) (not e!826449))))

(declare-datatypes ((List!34355 0))(
  ( (Nil!34352) (Cons!34351 (h!35707 (_ BitVec 64)) (t!49049 List!34355)) )
))
(declare-fun arrayNoDuplicates!0 (array!99138 (_ BitVec 32) List!34355) Bool)

(assert (=> b!1472683 (= res!1000311 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34352))))

(declare-fun b!1472684 () Bool)

(assert (=> b!1472684 (= e!826451 (or (= (select (arr!47854 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47854 a!2862) intermediateBeforeIndex!19) (select (arr!47854 a!2862) j!93))))))

(declare-fun b!1472685 () Bool)

(declare-fun res!1000307 () Bool)

(assert (=> b!1472685 (=> (not res!1000307) (not e!826450))))

(assert (=> b!1472685 (= res!1000307 e!826447)))

(declare-fun c!135696 () Bool)

(assert (=> b!1472685 (= c!135696 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472686 () Bool)

(declare-fun res!1000313 () Bool)

(assert (=> b!1472686 (=> (not res!1000313) (not e!826449))))

(assert (=> b!1472686 (= res!1000313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472687 () Bool)

(declare-fun res!1000320 () Bool)

(assert (=> b!1472687 (=> (not res!1000320) (not e!826451))))

(assert (=> b!1472687 (= res!1000320 (= (seekEntryOrOpen!0 (select (arr!47854 a!2862) j!93) a!2862 mask!2687) (Found!12094 j!93)))))

(declare-fun b!1472688 () Bool)

(declare-fun res!1000318 () Bool)

(assert (=> b!1472688 (=> (not res!1000318) (not e!826449))))

(assert (=> b!1472688 (= res!1000318 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48404 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48404 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48404 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1000316 () Bool)

(assert (=> start!125804 (=> (not res!1000316) (not e!826449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125804 (= res!1000316 (validMask!0 mask!2687))))

(assert (=> start!125804 e!826449))

(assert (=> start!125804 true))

(declare-fun array_inv!36882 (array!99138) Bool)

(assert (=> start!125804 (array_inv!36882 a!2862)))

(declare-fun b!1472682 () Bool)

(declare-fun res!1000319 () Bool)

(assert (=> b!1472682 (=> (not res!1000319) (not e!826449))))

(assert (=> b!1472682 (= res!1000319 (validKeyInArray!0 (select (arr!47854 a!2862) j!93)))))

(assert (= (and start!125804 res!1000316) b!1472673))

(assert (= (and b!1472673 res!1000312) b!1472672))

(assert (= (and b!1472672 res!1000321) b!1472682))

(assert (= (and b!1472682 res!1000319) b!1472686))

(assert (= (and b!1472686 res!1000313) b!1472683))

(assert (= (and b!1472683 res!1000311) b!1472688))

(assert (= (and b!1472688 res!1000318) b!1472675))

(assert (= (and b!1472675 res!1000309) b!1472681))

(assert (= (and b!1472681 res!1000317) b!1472678))

(assert (= (and b!1472678 res!1000310) b!1472676))

(assert (= (and b!1472676 res!1000315) b!1472685))

(assert (= (and b!1472685 c!135696) b!1472677))

(assert (= (and b!1472685 (not c!135696)) b!1472679))

(assert (= (and b!1472685 res!1000307) b!1472680))

(assert (= (and b!1472680 res!1000308) b!1472674))

(assert (= (and b!1472674 res!1000314) b!1472687))

(assert (= (and b!1472687 res!1000320) b!1472684))

(declare-fun m!1359363 () Bool)

(assert (=> b!1472672 m!1359363))

(assert (=> b!1472672 m!1359363))

(declare-fun m!1359365 () Bool)

(assert (=> b!1472672 m!1359365))

(declare-fun m!1359367 () Bool)

(assert (=> b!1472682 m!1359367))

(assert (=> b!1472682 m!1359367))

(declare-fun m!1359369 () Bool)

(assert (=> b!1472682 m!1359369))

(declare-fun m!1359371 () Bool)

(assert (=> b!1472677 m!1359371))

(assert (=> b!1472678 m!1359367))

(assert (=> b!1472678 m!1359367))

(declare-fun m!1359373 () Bool)

(assert (=> b!1472678 m!1359373))

(assert (=> b!1472687 m!1359367))

(assert (=> b!1472687 m!1359367))

(declare-fun m!1359375 () Bool)

(assert (=> b!1472687 m!1359375))

(declare-fun m!1359377 () Bool)

(assert (=> b!1472686 m!1359377))

(declare-fun m!1359379 () Bool)

(assert (=> b!1472684 m!1359379))

(assert (=> b!1472684 m!1359367))

(declare-fun m!1359381 () Bool)

(assert (=> b!1472679 m!1359381))

(declare-fun m!1359383 () Bool)

(assert (=> b!1472679 m!1359383))

(declare-fun m!1359385 () Bool)

(assert (=> b!1472683 m!1359385))

(declare-fun m!1359387 () Bool)

(assert (=> b!1472674 m!1359387))

(declare-fun m!1359389 () Bool)

(assert (=> b!1472674 m!1359389))

(declare-fun m!1359391 () Bool)

(assert (=> b!1472676 m!1359391))

(assert (=> b!1472676 m!1359391))

(declare-fun m!1359393 () Bool)

(assert (=> b!1472676 m!1359393))

(declare-fun m!1359395 () Bool)

(assert (=> b!1472676 m!1359395))

(declare-fun m!1359397 () Bool)

(assert (=> b!1472676 m!1359397))

(assert (=> b!1472675 m!1359395))

(declare-fun m!1359399 () Bool)

(assert (=> b!1472675 m!1359399))

(assert (=> b!1472681 m!1359367))

(assert (=> b!1472681 m!1359367))

(declare-fun m!1359401 () Bool)

(assert (=> b!1472681 m!1359401))

(assert (=> b!1472681 m!1359401))

(assert (=> b!1472681 m!1359367))

(declare-fun m!1359403 () Bool)

(assert (=> b!1472681 m!1359403))

(declare-fun m!1359405 () Bool)

(assert (=> start!125804 m!1359405))

(declare-fun m!1359407 () Bool)

(assert (=> start!125804 m!1359407))

(push 1)

