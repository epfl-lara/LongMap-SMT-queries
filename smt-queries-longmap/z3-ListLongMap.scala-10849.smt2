; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127008 () Bool)

(assert start!127008)

(declare-fun b!1492627 () Bool)

(declare-fun e!836214 () Bool)

(declare-fun e!836215 () Bool)

(assert (=> b!1492627 (= e!836214 e!836215)))

(declare-fun res!1015436 () Bool)

(assert (=> b!1492627 (=> (not res!1015436) (not e!836215))))

(declare-datatypes ((SeekEntryResult!12369 0))(
  ( (MissingZero!12369 (index!51868 (_ BitVec 32))) (Found!12369 (index!51869 (_ BitVec 32))) (Intermediate!12369 (undefined!13181 Bool) (index!51870 (_ BitVec 32)) (x!133461 (_ BitVec 32))) (Undefined!12369) (MissingVacant!12369 (index!51871 (_ BitVec 32))) )
))
(declare-fun lt!650715 () SeekEntryResult!12369)

(declare-datatypes ((array!99718 0))(
  ( (array!99719 (arr!48129 (Array (_ BitVec 32) (_ BitVec 64))) (size!48679 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99718)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99718 (_ BitVec 32)) SeekEntryResult!12369)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492627 (= res!1015436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48129 a!2862) j!93) mask!2687) (select (arr!48129 a!2862) j!93) a!2862 mask!2687) lt!650715))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492627 (= lt!650715 (Intermediate!12369 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492628 () Bool)

(declare-fun e!836213 () Bool)

(assert (=> b!1492628 (= e!836215 e!836213)))

(declare-fun res!1015441 () Bool)

(assert (=> b!1492628 (=> (not res!1015441) (not e!836213))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!650718 () SeekEntryResult!12369)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492628 (= res!1015441 (= lt!650718 (Intermediate!12369 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650716 () (_ BitVec 64))

(declare-fun lt!650713 () array!99718)

(assert (=> b!1492628 (= lt!650718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650716 mask!2687) lt!650716 lt!650713 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1492628 (= lt!650716 (select (store (arr!48129 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492629 () Bool)

(declare-fun res!1015439 () Bool)

(assert (=> b!1492629 (=> (not res!1015439) (not e!836215))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1492629 (= res!1015439 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48129 a!2862) j!93) a!2862 mask!2687) lt!650715))))

(declare-fun b!1492630 () Bool)

(declare-fun e!836210 () Bool)

(assert (=> b!1492630 (= e!836213 (not e!836210))))

(declare-fun res!1015433 () Bool)

(assert (=> b!1492630 (=> res!1015433 e!836210)))

(assert (=> b!1492630 (= res!1015433 (or (and (= (select (arr!48129 a!2862) index!646) (select (store (arr!48129 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48129 a!2862) index!646) (select (arr!48129 a!2862) j!93))) (= (select (arr!48129 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836212 () Bool)

(assert (=> b!1492630 e!836212))

(declare-fun res!1015435 () Bool)

(assert (=> b!1492630 (=> (not res!1015435) (not e!836212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99718 (_ BitVec 32)) Bool)

(assert (=> b!1492630 (= res!1015435 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50078 0))(
  ( (Unit!50079) )
))
(declare-fun lt!650717 () Unit!50078)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50078)

(assert (=> b!1492630 (= lt!650717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1492631 () Bool)

(declare-fun res!1015445 () Bool)

(declare-fun e!836216 () Bool)

(assert (=> b!1492631 (=> (not res!1015445) (not e!836216))))

(assert (=> b!1492631 (= res!1015445 (and (= (size!48679 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48679 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48679 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492632 () Bool)

(declare-fun res!1015443 () Bool)

(assert (=> b!1492632 (=> (not res!1015443) (not e!836216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492632 (= res!1015443 (validKeyInArray!0 (select (arr!48129 a!2862) j!93)))))

(declare-fun b!1492633 () Bool)

(declare-fun res!1015432 () Bool)

(assert (=> b!1492633 (=> (not res!1015432) (not e!836213))))

(declare-fun e!836211 () Bool)

(assert (=> b!1492633 (= res!1015432 e!836211)))

(declare-fun c!138126 () Bool)

(assert (=> b!1492633 (= c!138126 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492634 () Bool)

(declare-fun res!1015438 () Bool)

(assert (=> b!1492634 (=> (not res!1015438) (not e!836212))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99718 (_ BitVec 32)) SeekEntryResult!12369)

(assert (=> b!1492634 (= res!1015438 (= (seekEntryOrOpen!0 (select (arr!48129 a!2862) j!93) a!2862 mask!2687) (Found!12369 j!93)))))

(declare-fun b!1492635 () Bool)

(declare-fun res!1015442 () Bool)

(assert (=> b!1492635 (=> (not res!1015442) (not e!836216))))

(assert (=> b!1492635 (= res!1015442 (validKeyInArray!0 (select (arr!48129 a!2862) i!1006)))))

(declare-fun b!1492636 () Bool)

(assert (=> b!1492636 (= e!836211 (= lt!650718 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650716 lt!650713 mask!2687)))))

(declare-fun res!1015440 () Bool)

(assert (=> start!127008 (=> (not res!1015440) (not e!836216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127008 (= res!1015440 (validMask!0 mask!2687))))

(assert (=> start!127008 e!836216))

(assert (=> start!127008 true))

(declare-fun array_inv!37157 (array!99718) Bool)

(assert (=> start!127008 (array_inv!37157 a!2862)))

(declare-fun b!1492637 () Bool)

(declare-fun res!1015444 () Bool)

(assert (=> b!1492637 (=> (not res!1015444) (not e!836216))))

(assert (=> b!1492637 (= res!1015444 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48679 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48679 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48679 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492638 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99718 (_ BitVec 32)) SeekEntryResult!12369)

(assert (=> b!1492638 (= e!836211 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650716 lt!650713 mask!2687) (seekEntryOrOpen!0 lt!650716 lt!650713 mask!2687)))))

(declare-fun b!1492639 () Bool)

(declare-fun res!1015446 () Bool)

(assert (=> b!1492639 (=> (not res!1015446) (not e!836216))))

(declare-datatypes ((List!34630 0))(
  ( (Nil!34627) (Cons!34626 (h!36012 (_ BitVec 64)) (t!49324 List!34630)) )
))
(declare-fun arrayNoDuplicates!0 (array!99718 (_ BitVec 32) List!34630) Bool)

(assert (=> b!1492639 (= res!1015446 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34627))))

(declare-fun b!1492640 () Bool)

(assert (=> b!1492640 (= e!836216 e!836214)))

(declare-fun res!1015434 () Bool)

(assert (=> b!1492640 (=> (not res!1015434) (not e!836214))))

(assert (=> b!1492640 (= res!1015434 (= (select (store (arr!48129 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492640 (= lt!650713 (array!99719 (store (arr!48129 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48679 a!2862)))))

(declare-fun b!1492641 () Bool)

(declare-fun res!1015447 () Bool)

(assert (=> b!1492641 (=> (not res!1015447) (not e!836216))))

(assert (=> b!1492641 (= res!1015447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492642 () Bool)

(assert (=> b!1492642 (= e!836210 true)))

(declare-fun lt!650714 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492642 (= lt!650714 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492643 () Bool)

(assert (=> b!1492643 (= e!836212 (or (= (select (arr!48129 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48129 a!2862) intermediateBeforeIndex!19) (select (arr!48129 a!2862) j!93))))))

(declare-fun b!1492644 () Bool)

(declare-fun res!1015437 () Bool)

(assert (=> b!1492644 (=> (not res!1015437) (not e!836213))))

(assert (=> b!1492644 (= res!1015437 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127008 res!1015440) b!1492631))

(assert (= (and b!1492631 res!1015445) b!1492635))

(assert (= (and b!1492635 res!1015442) b!1492632))

(assert (= (and b!1492632 res!1015443) b!1492641))

(assert (= (and b!1492641 res!1015447) b!1492639))

(assert (= (and b!1492639 res!1015446) b!1492637))

(assert (= (and b!1492637 res!1015444) b!1492640))

(assert (= (and b!1492640 res!1015434) b!1492627))

(assert (= (and b!1492627 res!1015436) b!1492629))

(assert (= (and b!1492629 res!1015439) b!1492628))

(assert (= (and b!1492628 res!1015441) b!1492633))

(assert (= (and b!1492633 c!138126) b!1492636))

(assert (= (and b!1492633 (not c!138126)) b!1492638))

(assert (= (and b!1492633 res!1015432) b!1492644))

(assert (= (and b!1492644 res!1015437) b!1492630))

(assert (= (and b!1492630 res!1015435) b!1492634))

(assert (= (and b!1492634 res!1015438) b!1492643))

(assert (= (and b!1492630 (not res!1015433)) b!1492642))

(declare-fun m!1376573 () Bool)

(assert (=> b!1492629 m!1376573))

(assert (=> b!1492629 m!1376573))

(declare-fun m!1376575 () Bool)

(assert (=> b!1492629 m!1376575))

(declare-fun m!1376577 () Bool)

(assert (=> b!1492638 m!1376577))

(declare-fun m!1376579 () Bool)

(assert (=> b!1492638 m!1376579))

(assert (=> b!1492627 m!1376573))

(assert (=> b!1492627 m!1376573))

(declare-fun m!1376581 () Bool)

(assert (=> b!1492627 m!1376581))

(assert (=> b!1492627 m!1376581))

(assert (=> b!1492627 m!1376573))

(declare-fun m!1376583 () Bool)

(assert (=> b!1492627 m!1376583))

(declare-fun m!1376585 () Bool)

(assert (=> b!1492630 m!1376585))

(declare-fun m!1376587 () Bool)

(assert (=> b!1492630 m!1376587))

(declare-fun m!1376589 () Bool)

(assert (=> b!1492630 m!1376589))

(declare-fun m!1376591 () Bool)

(assert (=> b!1492630 m!1376591))

(declare-fun m!1376593 () Bool)

(assert (=> b!1492630 m!1376593))

(assert (=> b!1492630 m!1376573))

(assert (=> b!1492634 m!1376573))

(assert (=> b!1492634 m!1376573))

(declare-fun m!1376595 () Bool)

(assert (=> b!1492634 m!1376595))

(assert (=> b!1492640 m!1376587))

(declare-fun m!1376597 () Bool)

(assert (=> b!1492640 m!1376597))

(declare-fun m!1376599 () Bool)

(assert (=> b!1492639 m!1376599))

(declare-fun m!1376601 () Bool)

(assert (=> b!1492641 m!1376601))

(declare-fun m!1376603 () Bool)

(assert (=> b!1492628 m!1376603))

(assert (=> b!1492628 m!1376603))

(declare-fun m!1376605 () Bool)

(assert (=> b!1492628 m!1376605))

(assert (=> b!1492628 m!1376587))

(declare-fun m!1376607 () Bool)

(assert (=> b!1492628 m!1376607))

(declare-fun m!1376609 () Bool)

(assert (=> start!127008 m!1376609))

(declare-fun m!1376611 () Bool)

(assert (=> start!127008 m!1376611))

(declare-fun m!1376613 () Bool)

(assert (=> b!1492643 m!1376613))

(assert (=> b!1492643 m!1376573))

(declare-fun m!1376615 () Bool)

(assert (=> b!1492636 m!1376615))

(declare-fun m!1376617 () Bool)

(assert (=> b!1492635 m!1376617))

(assert (=> b!1492635 m!1376617))

(declare-fun m!1376619 () Bool)

(assert (=> b!1492635 m!1376619))

(declare-fun m!1376621 () Bool)

(assert (=> b!1492642 m!1376621))

(assert (=> b!1492632 m!1376573))

(assert (=> b!1492632 m!1376573))

(declare-fun m!1376623 () Bool)

(assert (=> b!1492632 m!1376623))

(check-sat (not b!1492642) (not b!1492628) (not b!1492632) (not b!1492636) (not start!127008) (not b!1492641) (not b!1492635) (not b!1492630) (not b!1492634) (not b!1492638) (not b!1492627) (not b!1492639) (not b!1492629))
(check-sat)
