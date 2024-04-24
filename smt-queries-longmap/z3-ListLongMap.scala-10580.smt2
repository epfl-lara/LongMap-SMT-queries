; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124836 () Bool)

(assert start!124836)

(declare-fun b!1444481 () Bool)

(declare-fun e!814118 () Bool)

(declare-fun e!814119 () Bool)

(assert (=> b!1444481 (= e!814118 e!814119)))

(declare-fun res!975798 () Bool)

(assert (=> b!1444481 (=> (not res!975798) (not e!814119))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98179 0))(
  ( (array!98180 (arr!47374 (Array (_ BitVec 32) (_ BitVec 64))) (size!47925 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98179)

(assert (=> b!1444481 (= res!975798 (= (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634252 () array!98179)

(assert (=> b!1444481 (= lt!634252 (array!98180 (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47925 a!2862)))))

(declare-fun b!1444482 () Bool)

(declare-fun e!814116 () Bool)

(declare-fun lt!634251 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444482 (= e!814116 (validKeyInArray!0 lt!634251))))

(declare-fun b!1444483 () Bool)

(declare-fun res!975792 () Bool)

(assert (=> b!1444483 (=> (not res!975792) (not e!814118))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1444483 (= res!975792 (and (= (size!47925 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47925 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47925 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444484 () Bool)

(declare-fun res!975796 () Bool)

(assert (=> b!1444484 (=> (not res!975796) (not e!814118))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1444484 (= res!975796 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47925 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47925 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47925 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!975802 () Bool)

(assert (=> start!124836 (=> (not res!975802) (not e!814118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124836 (= res!975802 (validMask!0 mask!2687))))

(assert (=> start!124836 e!814118))

(assert (=> start!124836 true))

(declare-fun array_inv!36655 (array!98179) Bool)

(assert (=> start!124836 (array_inv!36655 a!2862)))

(declare-fun b!1444485 () Bool)

(declare-fun res!975801 () Bool)

(declare-fun e!814114 () Bool)

(assert (=> b!1444485 (=> (not res!975801) (not e!814114))))

(assert (=> b!1444485 (= res!975801 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444486 () Bool)

(assert (=> b!1444486 (= e!814114 (not e!814116))))

(declare-fun res!975797 () Bool)

(assert (=> b!1444486 (=> res!975797 e!814116)))

(assert (=> b!1444486 (= res!975797 (or (not (= (select (arr!47374 a!2862) index!646) (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47374 a!2862) index!646) (select (arr!47374 a!2862) j!93))) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun e!814117 () Bool)

(assert (=> b!1444486 e!814117))

(declare-fun res!975805 () Bool)

(assert (=> b!1444486 (=> (not res!975805) (not e!814117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98179 (_ BitVec 32)) Bool)

(assert (=> b!1444486 (= res!975805 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48575 0))(
  ( (Unit!48576) )
))
(declare-fun lt!634250 () Unit!48575)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48575)

(assert (=> b!1444486 (= lt!634250 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-datatypes ((SeekEntryResult!11523 0))(
  ( (MissingZero!11523 (index!48484 (_ BitVec 32))) (Found!11523 (index!48485 (_ BitVec 32))) (Intermediate!11523 (undefined!12335 Bool) (index!48486 (_ BitVec 32)) (x!130364 (_ BitVec 32))) (Undefined!11523) (MissingVacant!11523 (index!48487 (_ BitVec 32))) )
))
(declare-fun lt!634248 () SeekEntryResult!11523)

(declare-fun b!1444487 () Bool)

(declare-fun e!814115 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98179 (_ BitVec 32)) SeekEntryResult!11523)

(assert (=> b!1444487 (= e!814115 (= lt!634248 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634251 lt!634252 mask!2687)))))

(declare-fun b!1444488 () Bool)

(declare-fun res!975799 () Bool)

(assert (=> b!1444488 (=> (not res!975799) (not e!814118))))

(assert (=> b!1444488 (= res!975799 (validKeyInArray!0 (select (arr!47374 a!2862) j!93)))))

(declare-fun b!1444489 () Bool)

(assert (=> b!1444489 (= e!814117 (or (= (select (arr!47374 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47374 a!2862) intermediateBeforeIndex!19) (select (arr!47374 a!2862) j!93))))))

(declare-fun b!1444490 () Bool)

(declare-fun res!975791 () Bool)

(assert (=> b!1444490 (=> (not res!975791) (not e!814118))))

(assert (=> b!1444490 (= res!975791 (validKeyInArray!0 (select (arr!47374 a!2862) i!1006)))))

(declare-fun b!1444491 () Bool)

(declare-fun res!975803 () Bool)

(assert (=> b!1444491 (=> (not res!975803) (not e!814117))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98179 (_ BitVec 32)) SeekEntryResult!11523)

(assert (=> b!1444491 (= res!975803 (= (seekEntryOrOpen!0 (select (arr!47374 a!2862) j!93) a!2862 mask!2687) (Found!11523 j!93)))))

(declare-fun b!1444492 () Bool)

(declare-fun e!814113 () Bool)

(assert (=> b!1444492 (= e!814119 e!814113)))

(declare-fun res!975793 () Bool)

(assert (=> b!1444492 (=> (not res!975793) (not e!814113))))

(declare-fun lt!634249 () SeekEntryResult!11523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444492 (= res!975793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47374 a!2862) j!93) mask!2687) (select (arr!47374 a!2862) j!93) a!2862 mask!2687) lt!634249))))

(assert (=> b!1444492 (= lt!634249 (Intermediate!11523 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444493 () Bool)

(declare-fun res!975804 () Bool)

(assert (=> b!1444493 (=> (not res!975804) (not e!814118))))

(assert (=> b!1444493 (= res!975804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444494 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98179 (_ BitVec 32)) SeekEntryResult!11523)

(assert (=> b!1444494 (= e!814115 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634251 lt!634252 mask!2687) (seekEntryOrOpen!0 lt!634251 lt!634252 mask!2687)))))

(declare-fun b!1444495 () Bool)

(declare-fun res!975800 () Bool)

(assert (=> b!1444495 (=> (not res!975800) (not e!814114))))

(assert (=> b!1444495 (= res!975800 e!814115)))

(declare-fun c!133864 () Bool)

(assert (=> b!1444495 (= c!133864 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444496 () Bool)

(declare-fun res!975794 () Bool)

(assert (=> b!1444496 (=> (not res!975794) (not e!814118))))

(declare-datatypes ((List!33862 0))(
  ( (Nil!33859) (Cons!33858 (h!35219 (_ BitVec 64)) (t!48548 List!33862)) )
))
(declare-fun arrayNoDuplicates!0 (array!98179 (_ BitVec 32) List!33862) Bool)

(assert (=> b!1444496 (= res!975794 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33859))))

(declare-fun b!1444497 () Bool)

(assert (=> b!1444497 (= e!814113 e!814114)))

(declare-fun res!975806 () Bool)

(assert (=> b!1444497 (=> (not res!975806) (not e!814114))))

(assert (=> b!1444497 (= res!975806 (= lt!634248 (Intermediate!11523 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444497 (= lt!634248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634251 mask!2687) lt!634251 lt!634252 mask!2687))))

(assert (=> b!1444497 (= lt!634251 (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444498 () Bool)

(declare-fun res!975795 () Bool)

(assert (=> b!1444498 (=> (not res!975795) (not e!814113))))

(assert (=> b!1444498 (= res!975795 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47374 a!2862) j!93) a!2862 mask!2687) lt!634249))))

(assert (= (and start!124836 res!975802) b!1444483))

(assert (= (and b!1444483 res!975792) b!1444490))

(assert (= (and b!1444490 res!975791) b!1444488))

(assert (= (and b!1444488 res!975799) b!1444493))

(assert (= (and b!1444493 res!975804) b!1444496))

(assert (= (and b!1444496 res!975794) b!1444484))

(assert (= (and b!1444484 res!975796) b!1444481))

(assert (= (and b!1444481 res!975798) b!1444492))

(assert (= (and b!1444492 res!975793) b!1444498))

(assert (= (and b!1444498 res!975795) b!1444497))

(assert (= (and b!1444497 res!975806) b!1444495))

(assert (= (and b!1444495 c!133864) b!1444487))

(assert (= (and b!1444495 (not c!133864)) b!1444494))

(assert (= (and b!1444495 res!975800) b!1444485))

(assert (= (and b!1444485 res!975801) b!1444486))

(assert (= (and b!1444486 res!975805) b!1444491))

(assert (= (and b!1444491 res!975803) b!1444489))

(assert (= (and b!1444486 (not res!975797)) b!1444482))

(declare-fun m!1333687 () Bool)

(assert (=> b!1444487 m!1333687))

(declare-fun m!1333689 () Bool)

(assert (=> b!1444491 m!1333689))

(assert (=> b!1444491 m!1333689))

(declare-fun m!1333691 () Bool)

(assert (=> b!1444491 m!1333691))

(assert (=> b!1444498 m!1333689))

(assert (=> b!1444498 m!1333689))

(declare-fun m!1333693 () Bool)

(assert (=> b!1444498 m!1333693))

(declare-fun m!1333695 () Bool)

(assert (=> start!124836 m!1333695))

(declare-fun m!1333697 () Bool)

(assert (=> start!124836 m!1333697))

(declare-fun m!1333699 () Bool)

(assert (=> b!1444486 m!1333699))

(declare-fun m!1333701 () Bool)

(assert (=> b!1444486 m!1333701))

(declare-fun m!1333703 () Bool)

(assert (=> b!1444486 m!1333703))

(declare-fun m!1333705 () Bool)

(assert (=> b!1444486 m!1333705))

(declare-fun m!1333707 () Bool)

(assert (=> b!1444486 m!1333707))

(assert (=> b!1444486 m!1333689))

(declare-fun m!1333709 () Bool)

(assert (=> b!1444493 m!1333709))

(declare-fun m!1333711 () Bool)

(assert (=> b!1444497 m!1333711))

(assert (=> b!1444497 m!1333711))

(declare-fun m!1333713 () Bool)

(assert (=> b!1444497 m!1333713))

(assert (=> b!1444497 m!1333701))

(declare-fun m!1333715 () Bool)

(assert (=> b!1444497 m!1333715))

(assert (=> b!1444481 m!1333701))

(declare-fun m!1333717 () Bool)

(assert (=> b!1444481 m!1333717))

(assert (=> b!1444488 m!1333689))

(assert (=> b!1444488 m!1333689))

(declare-fun m!1333719 () Bool)

(assert (=> b!1444488 m!1333719))

(declare-fun m!1333721 () Bool)

(assert (=> b!1444496 m!1333721))

(declare-fun m!1333723 () Bool)

(assert (=> b!1444494 m!1333723))

(declare-fun m!1333725 () Bool)

(assert (=> b!1444494 m!1333725))

(assert (=> b!1444492 m!1333689))

(assert (=> b!1444492 m!1333689))

(declare-fun m!1333727 () Bool)

(assert (=> b!1444492 m!1333727))

(assert (=> b!1444492 m!1333727))

(assert (=> b!1444492 m!1333689))

(declare-fun m!1333729 () Bool)

(assert (=> b!1444492 m!1333729))

(declare-fun m!1333731 () Bool)

(assert (=> b!1444482 m!1333731))

(declare-fun m!1333733 () Bool)

(assert (=> b!1444490 m!1333733))

(assert (=> b!1444490 m!1333733))

(declare-fun m!1333735 () Bool)

(assert (=> b!1444490 m!1333735))

(declare-fun m!1333737 () Bool)

(assert (=> b!1444489 m!1333737))

(assert (=> b!1444489 m!1333689))

(check-sat (not b!1444487) (not b!1444498) (not b!1444496) (not b!1444488) (not b!1444491) (not b!1444486) (not b!1444497) (not b!1444482) (not b!1444490) (not b!1444494) (not start!124836) (not b!1444493) (not b!1444492))
(check-sat)
