; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125674 () Bool)

(assert start!125674)

(declare-fun res!998659 () Bool)

(declare-fun e!825491 () Bool)

(assert (=> start!125674 (=> (not res!998659) (not e!825491))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125674 (= res!998659 (validMask!0 mask!2687))))

(assert (=> start!125674 e!825491))

(assert (=> start!125674 true))

(declare-datatypes ((array!99065 0))(
  ( (array!99066 (arr!47819 (Array (_ BitVec 32) (_ BitVec 64))) (size!48369 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99065)

(declare-fun array_inv!36847 (array!99065) Bool)

(assert (=> start!125674 (array_inv!36847 a!2862)))

(declare-fun b!1470540 () Bool)

(declare-fun res!998670 () Bool)

(assert (=> b!1470540 (=> (not res!998670) (not e!825491))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470540 (= res!998670 (validKeyInArray!0 (select (arr!47819 a!2862) i!1006)))))

(declare-fun b!1470541 () Bool)

(declare-fun res!998658 () Bool)

(declare-fun e!825488 () Bool)

(assert (=> b!1470541 (=> (not res!998658) (not e!825488))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470541 (= res!998658 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470542 () Bool)

(declare-fun res!998666 () Bool)

(declare-fun e!825487 () Bool)

(assert (=> b!1470542 (=> (not res!998666) (not e!825487))))

(declare-datatypes ((SeekEntryResult!12059 0))(
  ( (MissingZero!12059 (index!50628 (_ BitVec 32))) (Found!12059 (index!50629 (_ BitVec 32))) (Intermediate!12059 (undefined!12871 Bool) (index!50630 (_ BitVec 32)) (x!132213 (_ BitVec 32))) (Undefined!12059) (MissingVacant!12059 (index!50631 (_ BitVec 32))) )
))
(declare-fun lt!642960 () SeekEntryResult!12059)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99065 (_ BitVec 32)) SeekEntryResult!12059)

(assert (=> b!1470542 (= res!998666 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47819 a!2862) j!93) a!2862 mask!2687) lt!642960))))

(declare-fun b!1470543 () Bool)

(assert (=> b!1470543 (= e!825487 e!825488)))

(declare-fun res!998662 () Bool)

(assert (=> b!1470543 (=> (not res!998662) (not e!825488))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!642956 () SeekEntryResult!12059)

(assert (=> b!1470543 (= res!998662 (= lt!642956 (Intermediate!12059 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642959 () array!99065)

(declare-fun lt!642958 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470543 (= lt!642956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642958 mask!2687) lt!642958 lt!642959 mask!2687))))

(assert (=> b!1470543 (= lt!642958 (select (store (arr!47819 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470544 () Bool)

(declare-fun e!825485 () Bool)

(assert (=> b!1470544 (= e!825485 e!825487)))

(declare-fun res!998671 () Bool)

(assert (=> b!1470544 (=> (not res!998671) (not e!825487))))

(assert (=> b!1470544 (= res!998671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47819 a!2862) j!93) mask!2687) (select (arr!47819 a!2862) j!93) a!2862 mask!2687) lt!642960))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1470544 (= lt!642960 (Intermediate!12059 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470545 () Bool)

(declare-fun res!998667 () Bool)

(assert (=> b!1470545 (=> (not res!998667) (not e!825491))))

(assert (=> b!1470545 (= res!998667 (validKeyInArray!0 (select (arr!47819 a!2862) j!93)))))

(declare-fun b!1470546 () Bool)

(declare-fun res!998660 () Bool)

(assert (=> b!1470546 (=> (not res!998660) (not e!825491))))

(assert (=> b!1470546 (= res!998660 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48369 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48369 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48369 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470547 () Bool)

(declare-fun res!998665 () Bool)

(assert (=> b!1470547 (=> (not res!998665) (not e!825491))))

(assert (=> b!1470547 (= res!998665 (and (= (size!48369 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48369 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48369 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470548 () Bool)

(declare-fun e!825486 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99065 (_ BitVec 32)) SeekEntryResult!12059)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99065 (_ BitVec 32)) SeekEntryResult!12059)

(assert (=> b!1470548 (= e!825486 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642958 lt!642959 mask!2687) (seekEntryOrOpen!0 lt!642958 lt!642959 mask!2687)))))

(declare-fun b!1470549 () Bool)

(assert (=> b!1470549 (= e!825486 (= lt!642956 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642958 lt!642959 mask!2687)))))

(declare-fun e!825489 () Bool)

(declare-fun b!1470550 () Bool)

(assert (=> b!1470550 (= e!825489 (= (seekEntryOrOpen!0 (select (arr!47819 a!2862) j!93) a!2862 mask!2687) (Found!12059 j!93)))))

(declare-fun b!1470551 () Bool)

(assert (=> b!1470551 (= e!825491 e!825485)))

(declare-fun res!998668 () Bool)

(assert (=> b!1470551 (=> (not res!998668) (not e!825485))))

(assert (=> b!1470551 (= res!998668 (= (select (store (arr!47819 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470551 (= lt!642959 (array!99066 (store (arr!47819 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48369 a!2862)))))

(declare-fun b!1470552 () Bool)

(declare-fun res!998661 () Bool)

(assert (=> b!1470552 (=> (not res!998661) (not e!825488))))

(assert (=> b!1470552 (= res!998661 e!825486)))

(declare-fun c!135453 () Bool)

(assert (=> b!1470552 (= c!135453 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470553 () Bool)

(assert (=> b!1470553 (= e!825488 (not true))))

(assert (=> b!1470553 e!825489))

(declare-fun res!998664 () Bool)

(assert (=> b!1470553 (=> (not res!998664) (not e!825489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99065 (_ BitVec 32)) Bool)

(assert (=> b!1470553 (= res!998664 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49458 0))(
  ( (Unit!49459) )
))
(declare-fun lt!642957 () Unit!49458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99065 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49458)

(assert (=> b!1470553 (= lt!642957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470554 () Bool)

(declare-fun res!998669 () Bool)

(assert (=> b!1470554 (=> (not res!998669) (not e!825491))))

(assert (=> b!1470554 (= res!998669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470555 () Bool)

(declare-fun res!998663 () Bool)

(assert (=> b!1470555 (=> (not res!998663) (not e!825491))))

(declare-datatypes ((List!34320 0))(
  ( (Nil!34317) (Cons!34316 (h!35669 (_ BitVec 64)) (t!49014 List!34320)) )
))
(declare-fun arrayNoDuplicates!0 (array!99065 (_ BitVec 32) List!34320) Bool)

(assert (=> b!1470555 (= res!998663 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34317))))

(assert (= (and start!125674 res!998659) b!1470547))

(assert (= (and b!1470547 res!998665) b!1470540))

(assert (= (and b!1470540 res!998670) b!1470545))

(assert (= (and b!1470545 res!998667) b!1470554))

(assert (= (and b!1470554 res!998669) b!1470555))

(assert (= (and b!1470555 res!998663) b!1470546))

(assert (= (and b!1470546 res!998660) b!1470551))

(assert (= (and b!1470551 res!998668) b!1470544))

(assert (= (and b!1470544 res!998671) b!1470542))

(assert (= (and b!1470542 res!998666) b!1470543))

(assert (= (and b!1470543 res!998662) b!1470552))

(assert (= (and b!1470552 c!135453) b!1470549))

(assert (= (and b!1470552 (not c!135453)) b!1470548))

(assert (= (and b!1470552 res!998661) b!1470541))

(assert (= (and b!1470541 res!998658) b!1470553))

(assert (= (and b!1470553 res!998664) b!1470550))

(declare-fun m!1357531 () Bool)

(assert (=> b!1470550 m!1357531))

(assert (=> b!1470550 m!1357531))

(declare-fun m!1357533 () Bool)

(assert (=> b!1470550 m!1357533))

(assert (=> b!1470544 m!1357531))

(assert (=> b!1470544 m!1357531))

(declare-fun m!1357535 () Bool)

(assert (=> b!1470544 m!1357535))

(assert (=> b!1470544 m!1357535))

(assert (=> b!1470544 m!1357531))

(declare-fun m!1357537 () Bool)

(assert (=> b!1470544 m!1357537))

(assert (=> b!1470545 m!1357531))

(assert (=> b!1470545 m!1357531))

(declare-fun m!1357539 () Bool)

(assert (=> b!1470545 m!1357539))

(declare-fun m!1357541 () Bool)

(assert (=> b!1470549 m!1357541))

(assert (=> b!1470542 m!1357531))

(assert (=> b!1470542 m!1357531))

(declare-fun m!1357543 () Bool)

(assert (=> b!1470542 m!1357543))

(declare-fun m!1357545 () Bool)

(assert (=> b!1470553 m!1357545))

(declare-fun m!1357547 () Bool)

(assert (=> b!1470553 m!1357547))

(declare-fun m!1357549 () Bool)

(assert (=> b!1470554 m!1357549))

(declare-fun m!1357551 () Bool)

(assert (=> start!125674 m!1357551))

(declare-fun m!1357553 () Bool)

(assert (=> start!125674 m!1357553))

(declare-fun m!1357555 () Bool)

(assert (=> b!1470543 m!1357555))

(assert (=> b!1470543 m!1357555))

(declare-fun m!1357557 () Bool)

(assert (=> b!1470543 m!1357557))

(declare-fun m!1357559 () Bool)

(assert (=> b!1470543 m!1357559))

(declare-fun m!1357561 () Bool)

(assert (=> b!1470543 m!1357561))

(declare-fun m!1357563 () Bool)

(assert (=> b!1470548 m!1357563))

(declare-fun m!1357565 () Bool)

(assert (=> b!1470548 m!1357565))

(declare-fun m!1357567 () Bool)

(assert (=> b!1470555 m!1357567))

(assert (=> b!1470551 m!1357559))

(declare-fun m!1357569 () Bool)

(assert (=> b!1470551 m!1357569))

(declare-fun m!1357571 () Bool)

(assert (=> b!1470540 m!1357571))

(assert (=> b!1470540 m!1357571))

(declare-fun m!1357573 () Bool)

(assert (=> b!1470540 m!1357573))

(push 1)

