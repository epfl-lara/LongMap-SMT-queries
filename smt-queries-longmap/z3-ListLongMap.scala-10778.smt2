; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126168 () Bool)

(assert start!126168)

(declare-fun b!1477516 () Bool)

(declare-fun res!1003634 () Bool)

(declare-fun e!828888 () Bool)

(assert (=> b!1477516 (=> (not res!1003634) (not e!828888))))

(declare-datatypes ((array!99274 0))(
  ( (array!99275 (arr!47916 (Array (_ BitVec 32) (_ BitVec 64))) (size!48466 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99274)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99274 (_ BitVec 32)) Bool)

(assert (=> b!1477516 (= res!1003634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477517 () Bool)

(declare-fun e!828884 () Bool)

(assert (=> b!1477517 (= e!828884 (not true))))

(declare-fun e!828883 () Bool)

(assert (=> b!1477517 e!828883))

(declare-fun res!1003644 () Bool)

(assert (=> b!1477517 (=> (not res!1003644) (not e!828883))))

(declare-datatypes ((SeekEntryResult!12156 0))(
  ( (MissingZero!12156 (index!51016 (_ BitVec 32))) (Found!12156 (index!51017 (_ BitVec 32))) (Intermediate!12156 (undefined!12968 Bool) (index!51018 (_ BitVec 32)) (x!132611 (_ BitVec 32))) (Undefined!12156) (MissingVacant!12156 (index!51019 (_ BitVec 32))) )
))
(declare-fun lt!645376 () SeekEntryResult!12156)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477517 (= res!1003644 (and (= lt!645376 (Found!12156 j!93)) (or (= (select (arr!47916 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47916 a!2862) intermediateBeforeIndex!19) (select (arr!47916 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99274 (_ BitVec 32)) SeekEntryResult!12156)

(assert (=> b!1477517 (= lt!645376 (seekEntryOrOpen!0 (select (arr!47916 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477517 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49652 0))(
  ( (Unit!49653) )
))
(declare-fun lt!645378 () Unit!49652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49652)

(assert (=> b!1477517 (= lt!645378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477518 () Bool)

(declare-fun e!828890 () Bool)

(assert (=> b!1477518 (= e!828883 e!828890)))

(declare-fun res!1003637 () Bool)

(assert (=> b!1477518 (=> res!1003637 e!828890)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477518 (= res!1003637 (or (and (= (select (arr!47916 a!2862) index!646) (select (store (arr!47916 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47916 a!2862) index!646) (select (arr!47916 a!2862) j!93))) (not (= (select (arr!47916 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1477519 () Bool)

(declare-fun e!828886 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477519 (= e!828886 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477520 () Bool)

(declare-fun res!1003642 () Bool)

(assert (=> b!1477520 (=> (not res!1003642) (not e!828884))))

(declare-fun e!828882 () Bool)

(assert (=> b!1477520 (= res!1003642 e!828882)))

(declare-fun c!136461 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477520 (= c!136461 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477521 () Bool)

(declare-fun res!1003633 () Bool)

(assert (=> b!1477521 (=> (not res!1003633) (not e!828888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477521 (= res!1003633 (validKeyInArray!0 (select (arr!47916 a!2862) j!93)))))

(declare-fun b!1477522 () Bool)

(declare-fun e!828889 () Bool)

(assert (=> b!1477522 (= e!828889 e!828884)))

(declare-fun res!1003638 () Bool)

(assert (=> b!1477522 (=> (not res!1003638) (not e!828884))))

(declare-fun lt!645377 () SeekEntryResult!12156)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477522 (= res!1003638 (= lt!645377 (Intermediate!12156 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645375 () array!99274)

(declare-fun lt!645374 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99274 (_ BitVec 32)) SeekEntryResult!12156)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477522 (= lt!645377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645374 mask!2687) lt!645374 lt!645375 mask!2687))))

(assert (=> b!1477522 (= lt!645374 (select (store (arr!47916 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1003648 () Bool)

(assert (=> start!126168 (=> (not res!1003648) (not e!828888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126168 (= res!1003648 (validMask!0 mask!2687))))

(assert (=> start!126168 e!828888))

(assert (=> start!126168 true))

(declare-fun array_inv!36944 (array!99274) Bool)

(assert (=> start!126168 (array_inv!36944 a!2862)))

(declare-fun b!1477523 () Bool)

(declare-fun res!1003636 () Bool)

(assert (=> b!1477523 (=> (not res!1003636) (not e!828884))))

(assert (=> b!1477523 (= res!1003636 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477524 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99274 (_ BitVec 32)) SeekEntryResult!12156)

(assert (=> b!1477524 (= e!828882 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645374 lt!645375 mask!2687) (seekEntryOrOpen!0 lt!645374 lt!645375 mask!2687)))))

(declare-fun b!1477525 () Bool)

(declare-fun res!1003640 () Bool)

(assert (=> b!1477525 (=> (not res!1003640) (not e!828888))))

(assert (=> b!1477525 (= res!1003640 (and (= (size!48466 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48466 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48466 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477526 () Bool)

(declare-fun res!1003639 () Bool)

(assert (=> b!1477526 (=> (not res!1003639) (not e!828888))))

(assert (=> b!1477526 (= res!1003639 (validKeyInArray!0 (select (arr!47916 a!2862) i!1006)))))

(declare-fun b!1477527 () Bool)

(declare-fun res!1003647 () Bool)

(assert (=> b!1477527 (=> (not res!1003647) (not e!828888))))

(declare-datatypes ((List!34417 0))(
  ( (Nil!34414) (Cons!34413 (h!35781 (_ BitVec 64)) (t!49111 List!34417)) )
))
(declare-fun arrayNoDuplicates!0 (array!99274 (_ BitVec 32) List!34417) Bool)

(assert (=> b!1477527 (= res!1003647 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34414))))

(declare-fun b!1477528 () Bool)

(declare-fun e!828885 () Bool)

(assert (=> b!1477528 (= e!828888 e!828885)))

(declare-fun res!1003641 () Bool)

(assert (=> b!1477528 (=> (not res!1003641) (not e!828885))))

(assert (=> b!1477528 (= res!1003641 (= (select (store (arr!47916 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477528 (= lt!645375 (array!99275 (store (arr!47916 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48466 a!2862)))))

(declare-fun b!1477529 () Bool)

(assert (=> b!1477529 (= e!828882 (= lt!645377 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645374 lt!645375 mask!2687)))))

(declare-fun b!1477530 () Bool)

(declare-fun res!1003646 () Bool)

(assert (=> b!1477530 (=> (not res!1003646) (not e!828889))))

(declare-fun lt!645373 () SeekEntryResult!12156)

(assert (=> b!1477530 (= res!1003646 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47916 a!2862) j!93) a!2862 mask!2687) lt!645373))))

(declare-fun b!1477531 () Bool)

(declare-fun res!1003635 () Bool)

(assert (=> b!1477531 (=> (not res!1003635) (not e!828888))))

(assert (=> b!1477531 (= res!1003635 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48466 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48466 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48466 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477532 () Bool)

(assert (=> b!1477532 (= e!828890 e!828886)))

(declare-fun res!1003643 () Bool)

(assert (=> b!1477532 (=> (not res!1003643) (not e!828886))))

(assert (=> b!1477532 (= res!1003643 (= lt!645376 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47916 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477533 () Bool)

(assert (=> b!1477533 (= e!828885 e!828889)))

(declare-fun res!1003645 () Bool)

(assert (=> b!1477533 (=> (not res!1003645) (not e!828889))))

(assert (=> b!1477533 (= res!1003645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47916 a!2862) j!93) mask!2687) (select (arr!47916 a!2862) j!93) a!2862 mask!2687) lt!645373))))

(assert (=> b!1477533 (= lt!645373 (Intermediate!12156 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126168 res!1003648) b!1477525))

(assert (= (and b!1477525 res!1003640) b!1477526))

(assert (= (and b!1477526 res!1003639) b!1477521))

(assert (= (and b!1477521 res!1003633) b!1477516))

(assert (= (and b!1477516 res!1003634) b!1477527))

(assert (= (and b!1477527 res!1003647) b!1477531))

(assert (= (and b!1477531 res!1003635) b!1477528))

(assert (= (and b!1477528 res!1003641) b!1477533))

(assert (= (and b!1477533 res!1003645) b!1477530))

(assert (= (and b!1477530 res!1003646) b!1477522))

(assert (= (and b!1477522 res!1003638) b!1477520))

(assert (= (and b!1477520 c!136461) b!1477529))

(assert (= (and b!1477520 (not c!136461)) b!1477524))

(assert (= (and b!1477520 res!1003642) b!1477523))

(assert (= (and b!1477523 res!1003636) b!1477517))

(assert (= (and b!1477517 res!1003644) b!1477518))

(assert (= (and b!1477518 (not res!1003637)) b!1477532))

(assert (= (and b!1477532 res!1003643) b!1477519))

(declare-fun m!1363463 () Bool)

(assert (=> b!1477518 m!1363463))

(declare-fun m!1363465 () Bool)

(assert (=> b!1477518 m!1363465))

(declare-fun m!1363467 () Bool)

(assert (=> b!1477518 m!1363467))

(declare-fun m!1363469 () Bool)

(assert (=> b!1477518 m!1363469))

(assert (=> b!1477528 m!1363465))

(declare-fun m!1363471 () Bool)

(assert (=> b!1477528 m!1363471))

(assert (=> b!1477530 m!1363469))

(assert (=> b!1477530 m!1363469))

(declare-fun m!1363473 () Bool)

(assert (=> b!1477530 m!1363473))

(declare-fun m!1363475 () Bool)

(assert (=> b!1477516 m!1363475))

(declare-fun m!1363477 () Bool)

(assert (=> b!1477527 m!1363477))

(declare-fun m!1363479 () Bool)

(assert (=> b!1477522 m!1363479))

(assert (=> b!1477522 m!1363479))

(declare-fun m!1363481 () Bool)

(assert (=> b!1477522 m!1363481))

(assert (=> b!1477522 m!1363465))

(declare-fun m!1363483 () Bool)

(assert (=> b!1477522 m!1363483))

(assert (=> b!1477521 m!1363469))

(assert (=> b!1477521 m!1363469))

(declare-fun m!1363485 () Bool)

(assert (=> b!1477521 m!1363485))

(declare-fun m!1363487 () Bool)

(assert (=> b!1477517 m!1363487))

(declare-fun m!1363489 () Bool)

(assert (=> b!1477517 m!1363489))

(assert (=> b!1477517 m!1363469))

(declare-fun m!1363491 () Bool)

(assert (=> b!1477517 m!1363491))

(declare-fun m!1363493 () Bool)

(assert (=> b!1477517 m!1363493))

(assert (=> b!1477517 m!1363469))

(declare-fun m!1363495 () Bool)

(assert (=> b!1477524 m!1363495))

(declare-fun m!1363497 () Bool)

(assert (=> b!1477524 m!1363497))

(declare-fun m!1363499 () Bool)

(assert (=> start!126168 m!1363499))

(declare-fun m!1363501 () Bool)

(assert (=> start!126168 m!1363501))

(assert (=> b!1477532 m!1363469))

(assert (=> b!1477532 m!1363469))

(declare-fun m!1363503 () Bool)

(assert (=> b!1477532 m!1363503))

(assert (=> b!1477533 m!1363469))

(assert (=> b!1477533 m!1363469))

(declare-fun m!1363505 () Bool)

(assert (=> b!1477533 m!1363505))

(assert (=> b!1477533 m!1363505))

(assert (=> b!1477533 m!1363469))

(declare-fun m!1363507 () Bool)

(assert (=> b!1477533 m!1363507))

(declare-fun m!1363509 () Bool)

(assert (=> b!1477526 m!1363509))

(assert (=> b!1477526 m!1363509))

(declare-fun m!1363511 () Bool)

(assert (=> b!1477526 m!1363511))

(declare-fun m!1363513 () Bool)

(assert (=> b!1477529 m!1363513))

(check-sat (not b!1477533) (not b!1477517) (not start!126168) (not b!1477526) (not b!1477521) (not b!1477516) (not b!1477522) (not b!1477532) (not b!1477530) (not b!1477529) (not b!1477527) (not b!1477524))
(check-sat)
