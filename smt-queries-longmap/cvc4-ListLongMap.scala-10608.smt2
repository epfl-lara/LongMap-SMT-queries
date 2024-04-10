; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124790 () Bool)

(assert start!124790)

(declare-fun b!1447743 () Bool)

(declare-fun res!979362 () Bool)

(declare-fun e!815351 () Bool)

(assert (=> b!1447743 (=> (not res!979362) (not e!815351))))

(declare-datatypes ((array!98238 0))(
  ( (array!98239 (arr!47407 (Array (_ BitVec 32) (_ BitVec 64))) (size!47957 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98238)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447743 (= res!979362 (validKeyInArray!0 (select (arr!47407 a!2862) j!93)))))

(declare-fun b!1447744 () Bool)

(declare-fun e!815346 () Bool)

(declare-fun e!815347 () Bool)

(assert (=> b!1447744 (= e!815346 (not e!815347))))

(declare-fun res!979372 () Bool)

(assert (=> b!1447744 (=> res!979372 e!815347)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447744 (= res!979372 (or (and (= (select (arr!47407 a!2862) index!646) (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47407 a!2862) index!646) (select (arr!47407 a!2862) j!93))) (not (= (select (arr!47407 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47407 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815354 () Bool)

(assert (=> b!1447744 e!815354))

(declare-fun res!979377 () Bool)

(assert (=> b!1447744 (=> (not res!979377) (not e!815354))))

(declare-datatypes ((SeekEntryResult!11659 0))(
  ( (MissingZero!11659 (index!49028 (_ BitVec 32))) (Found!11659 (index!49029 (_ BitVec 32))) (Intermediate!11659 (undefined!12471 Bool) (index!49030 (_ BitVec 32)) (x!130700 (_ BitVec 32))) (Undefined!11659) (MissingVacant!11659 (index!49031 (_ BitVec 32))) )
))
(declare-fun lt!635277 () SeekEntryResult!11659)

(assert (=> b!1447744 (= res!979377 (and (= lt!635277 (Found!11659 j!93)) (or (= (select (arr!47407 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47407 a!2862) intermediateBeforeIndex!19) (select (arr!47407 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98238 (_ BitVec 32)) SeekEntryResult!11659)

(assert (=> b!1447744 (= lt!635277 (seekEntryOrOpen!0 (select (arr!47407 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98238 (_ BitVec 32)) Bool)

(assert (=> b!1447744 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48814 0))(
  ( (Unit!48815) )
))
(declare-fun lt!635274 () Unit!48814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48814)

(assert (=> b!1447744 (= lt!635274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447745 () Bool)

(declare-fun e!815350 () Bool)

(assert (=> b!1447745 (= e!815354 e!815350)))

(declare-fun res!979370 () Bool)

(assert (=> b!1447745 (=> res!979370 e!815350)))

(assert (=> b!1447745 (= res!979370 (or (and (= (select (arr!47407 a!2862) index!646) (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47407 a!2862) index!646) (select (arr!47407 a!2862) j!93))) (not (= (select (arr!47407 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447746 () Bool)

(declare-fun res!979376 () Bool)

(assert (=> b!1447746 (=> (not res!979376) (not e!815346))))

(declare-fun e!815352 () Bool)

(assert (=> b!1447746 (= res!979376 e!815352)))

(declare-fun c!133701 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447746 (= c!133701 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447747 () Bool)

(declare-fun res!979369 () Bool)

(assert (=> b!1447747 (=> (not res!979369) (not e!815346))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447747 (= res!979369 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447748 () Bool)

(declare-fun e!815348 () Bool)

(assert (=> b!1447748 (= e!815351 e!815348)))

(declare-fun res!979364 () Bool)

(assert (=> b!1447748 (=> (not res!979364) (not e!815348))))

(assert (=> b!1447748 (= res!979364 (= (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635275 () array!98238)

(assert (=> b!1447748 (= lt!635275 (array!98239 (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47957 a!2862)))))

(declare-fun b!1447750 () Bool)

(declare-fun res!979373 () Bool)

(assert (=> b!1447750 (=> (not res!979373) (not e!815351))))

(declare-datatypes ((List!33908 0))(
  ( (Nil!33905) (Cons!33904 (h!35254 (_ BitVec 64)) (t!48602 List!33908)) )
))
(declare-fun arrayNoDuplicates!0 (array!98238 (_ BitVec 32) List!33908) Bool)

(assert (=> b!1447750 (= res!979373 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33905))))

(declare-fun b!1447751 () Bool)

(declare-fun e!815345 () Bool)

(assert (=> b!1447751 (= e!815348 e!815345)))

(declare-fun res!979367 () Bool)

(assert (=> b!1447751 (=> (not res!979367) (not e!815345))))

(declare-fun lt!635279 () SeekEntryResult!11659)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98238 (_ BitVec 32)) SeekEntryResult!11659)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447751 (= res!979367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47407 a!2862) j!93) mask!2687) (select (arr!47407 a!2862) j!93) a!2862 mask!2687) lt!635279))))

(assert (=> b!1447751 (= lt!635279 (Intermediate!11659 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!635278 () (_ BitVec 64))

(declare-fun b!1447752 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98238 (_ BitVec 32)) SeekEntryResult!11659)

(assert (=> b!1447752 (= e!815352 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635278 lt!635275 mask!2687) (seekEntryOrOpen!0 lt!635278 lt!635275 mask!2687)))))

(declare-fun b!1447753 () Bool)

(declare-fun e!815349 () Bool)

(assert (=> b!1447753 (= e!815349 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447754 () Bool)

(assert (=> b!1447754 (= e!815345 e!815346)))

(declare-fun res!979366 () Bool)

(assert (=> b!1447754 (=> (not res!979366) (not e!815346))))

(declare-fun lt!635280 () SeekEntryResult!11659)

(assert (=> b!1447754 (= res!979366 (= lt!635280 (Intermediate!11659 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447754 (= lt!635280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635278 mask!2687) lt!635278 lt!635275 mask!2687))))

(assert (=> b!1447754 (= lt!635278 (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447755 () Bool)

(declare-fun res!979368 () Bool)

(assert (=> b!1447755 (=> (not res!979368) (not e!815351))))

(assert (=> b!1447755 (= res!979368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447756 () Bool)

(declare-fun res!979363 () Bool)

(assert (=> b!1447756 (=> (not res!979363) (not e!815345))))

(assert (=> b!1447756 (= res!979363 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47407 a!2862) j!93) a!2862 mask!2687) lt!635279))))

(declare-fun b!1447757 () Bool)

(declare-fun res!979374 () Bool)

(assert (=> b!1447757 (=> (not res!979374) (not e!815351))))

(assert (=> b!1447757 (= res!979374 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47957 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47957 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47957 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447758 () Bool)

(assert (=> b!1447758 (= e!815352 (= lt!635280 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635278 lt!635275 mask!2687)))))

(declare-fun b!1447759 () Bool)

(declare-fun res!979378 () Bool)

(assert (=> b!1447759 (=> (not res!979378) (not e!815351))))

(assert (=> b!1447759 (= res!979378 (validKeyInArray!0 (select (arr!47407 a!2862) i!1006)))))

(declare-fun b!1447749 () Bool)

(assert (=> b!1447749 (= e!815350 e!815349)))

(declare-fun res!979371 () Bool)

(assert (=> b!1447749 (=> (not res!979371) (not e!815349))))

(assert (=> b!1447749 (= res!979371 (= lt!635277 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47407 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!979375 () Bool)

(assert (=> start!124790 (=> (not res!979375) (not e!815351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124790 (= res!979375 (validMask!0 mask!2687))))

(assert (=> start!124790 e!815351))

(assert (=> start!124790 true))

(declare-fun array_inv!36435 (array!98238) Bool)

(assert (=> start!124790 (array_inv!36435 a!2862)))

(declare-fun b!1447760 () Bool)

(assert (=> b!1447760 (= e!815347 true)))

(declare-fun lt!635276 () SeekEntryResult!11659)

(assert (=> b!1447760 (= lt!635276 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47407 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447761 () Bool)

(declare-fun res!979365 () Bool)

(assert (=> b!1447761 (=> (not res!979365) (not e!815351))))

(assert (=> b!1447761 (= res!979365 (and (= (size!47957 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47957 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47957 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124790 res!979375) b!1447761))

(assert (= (and b!1447761 res!979365) b!1447759))

(assert (= (and b!1447759 res!979378) b!1447743))

(assert (= (and b!1447743 res!979362) b!1447755))

(assert (= (and b!1447755 res!979368) b!1447750))

(assert (= (and b!1447750 res!979373) b!1447757))

(assert (= (and b!1447757 res!979374) b!1447748))

(assert (= (and b!1447748 res!979364) b!1447751))

(assert (= (and b!1447751 res!979367) b!1447756))

(assert (= (and b!1447756 res!979363) b!1447754))

(assert (= (and b!1447754 res!979366) b!1447746))

(assert (= (and b!1447746 c!133701) b!1447758))

(assert (= (and b!1447746 (not c!133701)) b!1447752))

(assert (= (and b!1447746 res!979376) b!1447747))

(assert (= (and b!1447747 res!979369) b!1447744))

(assert (= (and b!1447744 res!979377) b!1447745))

(assert (= (and b!1447745 (not res!979370)) b!1447749))

(assert (= (and b!1447749 res!979371) b!1447753))

(assert (= (and b!1447744 (not res!979372)) b!1447760))

(declare-fun m!1336543 () Bool)

(assert (=> b!1447749 m!1336543))

(assert (=> b!1447749 m!1336543))

(declare-fun m!1336545 () Bool)

(assert (=> b!1447749 m!1336545))

(assert (=> b!1447756 m!1336543))

(assert (=> b!1447756 m!1336543))

(declare-fun m!1336547 () Bool)

(assert (=> b!1447756 m!1336547))

(declare-fun m!1336549 () Bool)

(assert (=> b!1447754 m!1336549))

(assert (=> b!1447754 m!1336549))

(declare-fun m!1336551 () Bool)

(assert (=> b!1447754 m!1336551))

(declare-fun m!1336553 () Bool)

(assert (=> b!1447754 m!1336553))

(declare-fun m!1336555 () Bool)

(assert (=> b!1447754 m!1336555))

(assert (=> b!1447748 m!1336553))

(declare-fun m!1336557 () Bool)

(assert (=> b!1447748 m!1336557))

(declare-fun m!1336559 () Bool)

(assert (=> b!1447745 m!1336559))

(assert (=> b!1447745 m!1336553))

(declare-fun m!1336561 () Bool)

(assert (=> b!1447745 m!1336561))

(assert (=> b!1447745 m!1336543))

(declare-fun m!1336563 () Bool)

(assert (=> b!1447744 m!1336563))

(assert (=> b!1447744 m!1336553))

(declare-fun m!1336565 () Bool)

(assert (=> b!1447744 m!1336565))

(assert (=> b!1447744 m!1336561))

(assert (=> b!1447744 m!1336559))

(assert (=> b!1447744 m!1336543))

(declare-fun m!1336567 () Bool)

(assert (=> b!1447744 m!1336567))

(declare-fun m!1336569 () Bool)

(assert (=> b!1447744 m!1336569))

(assert (=> b!1447744 m!1336543))

(declare-fun m!1336571 () Bool)

(assert (=> start!124790 m!1336571))

(declare-fun m!1336573 () Bool)

(assert (=> start!124790 m!1336573))

(assert (=> b!1447760 m!1336543))

(assert (=> b!1447760 m!1336543))

(declare-fun m!1336575 () Bool)

(assert (=> b!1447760 m!1336575))

(declare-fun m!1336577 () Bool)

(assert (=> b!1447750 m!1336577))

(assert (=> b!1447751 m!1336543))

(assert (=> b!1447751 m!1336543))

(declare-fun m!1336579 () Bool)

(assert (=> b!1447751 m!1336579))

(assert (=> b!1447751 m!1336579))

(assert (=> b!1447751 m!1336543))

(declare-fun m!1336581 () Bool)

(assert (=> b!1447751 m!1336581))

(declare-fun m!1336583 () Bool)

(assert (=> b!1447759 m!1336583))

(assert (=> b!1447759 m!1336583))

(declare-fun m!1336585 () Bool)

(assert (=> b!1447759 m!1336585))

(declare-fun m!1336587 () Bool)

(assert (=> b!1447752 m!1336587))

(declare-fun m!1336589 () Bool)

(assert (=> b!1447752 m!1336589))

(declare-fun m!1336591 () Bool)

(assert (=> b!1447758 m!1336591))

(declare-fun m!1336593 () Bool)

(assert (=> b!1447755 m!1336593))

(assert (=> b!1447743 m!1336543))

(assert (=> b!1447743 m!1336543))

(declare-fun m!1336595 () Bool)

(assert (=> b!1447743 m!1336595))

(push 1)

