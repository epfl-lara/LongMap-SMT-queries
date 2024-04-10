; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124548 () Bool)

(assert start!124548)

(declare-fun b!1441455 () Bool)

(declare-fun e!812579 () Bool)

(assert (=> b!1441455 (= e!812579 false)))

(declare-fun lt!633247 () Bool)

(declare-fun e!812578 () Bool)

(assert (=> b!1441455 (= lt!633247 e!812578)))

(declare-fun c!133338 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441455 (= c!133338 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441456 () Bool)

(declare-datatypes ((array!97996 0))(
  ( (array!97997 (arr!47286 (Array (_ BitVec 32) (_ BitVec 64))) (size!47836 (_ BitVec 32))) )
))
(declare-fun lt!633248 () array!97996)

(declare-fun lt!633245 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11538 0))(
  ( (MissingZero!11538 (index!48544 (_ BitVec 32))) (Found!11538 (index!48545 (_ BitVec 32))) (Intermediate!11538 (undefined!12350 Bool) (index!48546 (_ BitVec 32)) (x!130259 (_ BitVec 32))) (Undefined!11538) (MissingVacant!11538 (index!48547 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97996 (_ BitVec 32)) SeekEntryResult!11538)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97996 (_ BitVec 32)) SeekEntryResult!11538)

(assert (=> b!1441456 (= e!812578 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633245 lt!633248 mask!2687) (seekEntryOrOpen!0 lt!633245 lt!633248 mask!2687))))))

(declare-fun b!1441457 () Bool)

(declare-fun res!973800 () Bool)

(declare-fun e!812582 () Bool)

(assert (=> b!1441457 (=> (not res!973800) (not e!812582))))

(declare-fun a!2862 () array!97996)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441457 (= res!973800 (validKeyInArray!0 (select (arr!47286 a!2862) j!93)))))

(declare-fun b!1441458 () Bool)

(declare-fun lt!633249 () SeekEntryResult!11538)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97996 (_ BitVec 32)) SeekEntryResult!11538)

(assert (=> b!1441458 (= e!812578 (not (= lt!633249 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633245 lt!633248 mask!2687))))))

(declare-fun b!1441459 () Bool)

(declare-fun e!812580 () Bool)

(assert (=> b!1441459 (= e!812582 e!812580)))

(declare-fun res!973810 () Bool)

(assert (=> b!1441459 (=> (not res!973810) (not e!812580))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441459 (= res!973810 (= (select (store (arr!47286 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441459 (= lt!633248 (array!97997 (store (arr!47286 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47836 a!2862)))))

(declare-fun b!1441460 () Bool)

(declare-fun res!973802 () Bool)

(assert (=> b!1441460 (=> (not res!973802) (not e!812582))))

(declare-datatypes ((List!33787 0))(
  ( (Nil!33784) (Cons!33783 (h!35133 (_ BitVec 64)) (t!48481 List!33787)) )
))
(declare-fun arrayNoDuplicates!0 (array!97996 (_ BitVec 32) List!33787) Bool)

(assert (=> b!1441460 (= res!973802 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33784))))

(declare-fun b!1441462 () Bool)

(declare-fun res!973807 () Bool)

(assert (=> b!1441462 (=> (not res!973807) (not e!812582))))

(assert (=> b!1441462 (= res!973807 (validKeyInArray!0 (select (arr!47286 a!2862) i!1006)))))

(declare-fun b!1441463 () Bool)

(declare-fun e!812581 () Bool)

(assert (=> b!1441463 (= e!812581 e!812579)))

(declare-fun res!973805 () Bool)

(assert (=> b!1441463 (=> (not res!973805) (not e!812579))))

(assert (=> b!1441463 (= res!973805 (= lt!633249 (Intermediate!11538 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441463 (= lt!633249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633245 mask!2687) lt!633245 lt!633248 mask!2687))))

(assert (=> b!1441463 (= lt!633245 (select (store (arr!47286 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441464 () Bool)

(declare-fun res!973808 () Bool)

(assert (=> b!1441464 (=> (not res!973808) (not e!812582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97996 (_ BitVec 32)) Bool)

(assert (=> b!1441464 (= res!973808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441465 () Bool)

(declare-fun res!973804 () Bool)

(assert (=> b!1441465 (=> (not res!973804) (not e!812582))))

(assert (=> b!1441465 (= res!973804 (and (= (size!47836 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47836 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47836 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441466 () Bool)

(assert (=> b!1441466 (= e!812580 e!812581)))

(declare-fun res!973809 () Bool)

(assert (=> b!1441466 (=> (not res!973809) (not e!812581))))

(declare-fun lt!633246 () SeekEntryResult!11538)

(assert (=> b!1441466 (= res!973809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47286 a!2862) j!93) mask!2687) (select (arr!47286 a!2862) j!93) a!2862 mask!2687) lt!633246))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441466 (= lt!633246 (Intermediate!11538 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441467 () Bool)

(declare-fun res!973801 () Bool)

(assert (=> b!1441467 (=> (not res!973801) (not e!812582))))

(assert (=> b!1441467 (= res!973801 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47836 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47836 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47836 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441461 () Bool)

(declare-fun res!973806 () Bool)

(assert (=> b!1441461 (=> (not res!973806) (not e!812581))))

(assert (=> b!1441461 (= res!973806 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47286 a!2862) j!93) a!2862 mask!2687) lt!633246))))

(declare-fun res!973803 () Bool)

(assert (=> start!124548 (=> (not res!973803) (not e!812582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124548 (= res!973803 (validMask!0 mask!2687))))

(assert (=> start!124548 e!812582))

(assert (=> start!124548 true))

(declare-fun array_inv!36314 (array!97996) Bool)

(assert (=> start!124548 (array_inv!36314 a!2862)))

(assert (= (and start!124548 res!973803) b!1441465))

(assert (= (and b!1441465 res!973804) b!1441462))

(assert (= (and b!1441462 res!973807) b!1441457))

(assert (= (and b!1441457 res!973800) b!1441464))

(assert (= (and b!1441464 res!973808) b!1441460))

(assert (= (and b!1441460 res!973802) b!1441467))

(assert (= (and b!1441467 res!973801) b!1441459))

(assert (= (and b!1441459 res!973810) b!1441466))

(assert (= (and b!1441466 res!973809) b!1441461))

(assert (= (and b!1441461 res!973806) b!1441463))

(assert (= (and b!1441463 res!973805) b!1441455))

(assert (= (and b!1441455 c!133338) b!1441458))

(assert (= (and b!1441455 (not c!133338)) b!1441456))

(declare-fun m!1330677 () Bool)

(assert (=> b!1441462 m!1330677))

(assert (=> b!1441462 m!1330677))

(declare-fun m!1330679 () Bool)

(assert (=> b!1441462 m!1330679))

(declare-fun m!1330681 () Bool)

(assert (=> b!1441461 m!1330681))

(assert (=> b!1441461 m!1330681))

(declare-fun m!1330683 () Bool)

(assert (=> b!1441461 m!1330683))

(assert (=> b!1441466 m!1330681))

(assert (=> b!1441466 m!1330681))

(declare-fun m!1330685 () Bool)

(assert (=> b!1441466 m!1330685))

(assert (=> b!1441466 m!1330685))

(assert (=> b!1441466 m!1330681))

(declare-fun m!1330687 () Bool)

(assert (=> b!1441466 m!1330687))

(declare-fun m!1330689 () Bool)

(assert (=> b!1441458 m!1330689))

(declare-fun m!1330691 () Bool)

(assert (=> start!124548 m!1330691))

(declare-fun m!1330693 () Bool)

(assert (=> start!124548 m!1330693))

(declare-fun m!1330695 () Bool)

(assert (=> b!1441460 m!1330695))

(assert (=> b!1441457 m!1330681))

(assert (=> b!1441457 m!1330681))

(declare-fun m!1330697 () Bool)

(assert (=> b!1441457 m!1330697))

(declare-fun m!1330699 () Bool)

(assert (=> b!1441459 m!1330699))

(declare-fun m!1330701 () Bool)

(assert (=> b!1441459 m!1330701))

(declare-fun m!1330703 () Bool)

(assert (=> b!1441456 m!1330703))

(declare-fun m!1330705 () Bool)

(assert (=> b!1441456 m!1330705))

(declare-fun m!1330707 () Bool)

(assert (=> b!1441464 m!1330707))

(declare-fun m!1330709 () Bool)

(assert (=> b!1441463 m!1330709))

(assert (=> b!1441463 m!1330709))

(declare-fun m!1330711 () Bool)

(assert (=> b!1441463 m!1330711))

(assert (=> b!1441463 m!1330699))

(declare-fun m!1330713 () Bool)

(assert (=> b!1441463 m!1330713))

(check-sat (not b!1441458) (not b!1441457) (not b!1441462) (not start!124548) (not b!1441461) (not b!1441464) (not b!1441456) (not b!1441460) (not b!1441463) (not b!1441466))
(check-sat)
