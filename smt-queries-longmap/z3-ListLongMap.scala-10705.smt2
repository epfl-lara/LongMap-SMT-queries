; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125370 () Bool)

(assert start!125370)

(declare-fun b!1465683 () Bool)

(declare-fun res!994536 () Bool)

(declare-fun e!823546 () Bool)

(assert (=> b!1465683 (=> (not res!994536) (not e!823546))))

(declare-datatypes ((array!98818 0))(
  ( (array!98819 (arr!47697 (Array (_ BitVec 32) (_ BitVec 64))) (size!48247 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98818)

(declare-datatypes ((List!34198 0))(
  ( (Nil!34195) (Cons!34194 (h!35544 (_ BitVec 64)) (t!48892 List!34198)) )
))
(declare-fun arrayNoDuplicates!0 (array!98818 (_ BitVec 32) List!34198) Bool)

(assert (=> b!1465683 (= res!994536 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34195))))

(declare-fun b!1465684 () Bool)

(declare-fun res!994535 () Bool)

(assert (=> b!1465684 (=> (not res!994535) (not e!823546))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98818 (_ BitVec 32)) Bool)

(assert (=> b!1465684 (= res!994535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465685 () Bool)

(declare-fun res!994537 () Bool)

(declare-fun e!823550 () Bool)

(assert (=> b!1465685 (=> (not res!994537) (not e!823550))))

(declare-fun e!823548 () Bool)

(assert (=> b!1465685 (= res!994537 e!823548)))

(declare-fun c!135090 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465685 (= c!135090 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465686 () Bool)

(declare-fun res!994528 () Bool)

(declare-fun e!823542 () Bool)

(assert (=> b!1465686 (=> (not res!994528) (not e!823542))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11949 0))(
  ( (MissingZero!11949 (index!50188 (_ BitVec 32))) (Found!11949 (index!50189 (_ BitVec 32))) (Intermediate!11949 (undefined!12761 Bool) (index!50190 (_ BitVec 32)) (x!131766 (_ BitVec 32))) (Undefined!11949) (MissingVacant!11949 (index!50191 (_ BitVec 32))) )
))
(declare-fun lt!641481 () SeekEntryResult!11949)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98818 (_ BitVec 32)) SeekEntryResult!11949)

(assert (=> b!1465686 (= res!994528 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47697 a!2862) j!93) a!2862 mask!2687) lt!641481))))

(declare-fun b!1465687 () Bool)

(declare-fun res!994540 () Bool)

(assert (=> b!1465687 (=> (not res!994540) (not e!823546))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465687 (= res!994540 (and (= (size!48247 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48247 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48247 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465689 () Bool)

(declare-fun e!823545 () Bool)

(assert (=> b!1465689 (= e!823546 e!823545)))

(declare-fun res!994542 () Bool)

(assert (=> b!1465689 (=> (not res!994542) (not e!823545))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465689 (= res!994542 (= (select (store (arr!47697 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641484 () array!98818)

(assert (=> b!1465689 (= lt!641484 (array!98819 (store (arr!47697 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48247 a!2862)))))

(declare-fun b!1465690 () Bool)

(declare-fun lt!641486 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98818 (_ BitVec 32)) SeekEntryResult!11949)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98818 (_ BitVec 32)) SeekEntryResult!11949)

(assert (=> b!1465690 (= e!823548 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641486 lt!641484 mask!2687) (seekEntryOrOpen!0 lt!641486 lt!641484 mask!2687)))))

(declare-fun b!1465691 () Bool)

(declare-fun res!994526 () Bool)

(assert (=> b!1465691 (=> (not res!994526) (not e!823546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465691 (= res!994526 (validKeyInArray!0 (select (arr!47697 a!2862) i!1006)))))

(declare-fun b!1465692 () Bool)

(declare-fun lt!641482 () SeekEntryResult!11949)

(assert (=> b!1465692 (= e!823548 (= lt!641482 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641486 lt!641484 mask!2687)))))

(declare-fun b!1465693 () Bool)

(declare-fun res!994531 () Bool)

(assert (=> b!1465693 (=> (not res!994531) (not e!823550))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465693 (= res!994531 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465694 () Bool)

(declare-fun e!823549 () Bool)

(declare-fun lt!641487 () (_ BitVec 32))

(assert (=> b!1465694 (= e!823549 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641487 intermediateAfterIndex!19 lt!641486 lt!641484 mask!2687) (seekEntryOrOpen!0 lt!641486 lt!641484 mask!2687))))))

(declare-fun b!1465695 () Bool)

(assert (=> b!1465695 (= e!823549 (not (= lt!641482 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641487 lt!641486 lt!641484 mask!2687))))))

(declare-fun b!1465696 () Bool)

(declare-fun res!994527 () Bool)

(assert (=> b!1465696 (=> (not res!994527) (not e!823546))))

(assert (=> b!1465696 (= res!994527 (validKeyInArray!0 (select (arr!47697 a!2862) j!93)))))

(declare-fun b!1465697 () Bool)

(declare-fun res!994530 () Bool)

(assert (=> b!1465697 (=> (not res!994530) (not e!823546))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1465697 (= res!994530 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48247 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48247 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48247 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465698 () Bool)

(declare-fun e!823543 () Bool)

(assert (=> b!1465698 (= e!823543 (or (= (select (arr!47697 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47697 a!2862) intermediateBeforeIndex!19) (select (arr!47697 a!2862) j!93))))))

(declare-fun b!1465699 () Bool)

(declare-fun e!823547 () Bool)

(assert (=> b!1465699 (= e!823550 (not e!823547))))

(declare-fun res!994533 () Bool)

(assert (=> b!1465699 (=> res!994533 e!823547)))

(assert (=> b!1465699 (= res!994533 (or (and (= (select (arr!47697 a!2862) index!646) (select (store (arr!47697 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47697 a!2862) index!646) (select (arr!47697 a!2862) j!93))) (= (select (arr!47697 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465699 e!823543))

(declare-fun res!994543 () Bool)

(assert (=> b!1465699 (=> (not res!994543) (not e!823543))))

(assert (=> b!1465699 (= res!994543 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49394 0))(
  ( (Unit!49395) )
))
(declare-fun lt!641485 () Unit!49394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49394)

(assert (=> b!1465699 (= lt!641485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465700 () Bool)

(assert (=> b!1465700 (= e!823545 e!823542)))

(declare-fun res!994539 () Bool)

(assert (=> b!1465700 (=> (not res!994539) (not e!823542))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465700 (= res!994539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47697 a!2862) j!93) mask!2687) (select (arr!47697 a!2862) j!93) a!2862 mask!2687) lt!641481))))

(assert (=> b!1465700 (= lt!641481 (Intermediate!11949 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465688 () Bool)

(declare-fun e!823541 () Bool)

(assert (=> b!1465688 (= e!823547 e!823541)))

(declare-fun res!994532 () Bool)

(assert (=> b!1465688 (=> res!994532 e!823541)))

(assert (=> b!1465688 (= res!994532 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641487 #b00000000000000000000000000000000) (bvsge lt!641487 (size!48247 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465688 (= lt!641487 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!994538 () Bool)

(assert (=> start!125370 (=> (not res!994538) (not e!823546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125370 (= res!994538 (validMask!0 mask!2687))))

(assert (=> start!125370 e!823546))

(assert (=> start!125370 true))

(declare-fun array_inv!36725 (array!98818) Bool)

(assert (=> start!125370 (array_inv!36725 a!2862)))

(declare-fun b!1465701 () Bool)

(assert (=> b!1465701 (= e!823541 true)))

(declare-fun lt!641483 () Bool)

(assert (=> b!1465701 (= lt!641483 e!823549)))

(declare-fun c!135089 () Bool)

(assert (=> b!1465701 (= c!135089 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465702 () Bool)

(declare-fun res!994534 () Bool)

(assert (=> b!1465702 (=> (not res!994534) (not e!823543))))

(assert (=> b!1465702 (= res!994534 (= (seekEntryOrOpen!0 (select (arr!47697 a!2862) j!93) a!2862 mask!2687) (Found!11949 j!93)))))

(declare-fun b!1465703 () Bool)

(declare-fun res!994529 () Bool)

(assert (=> b!1465703 (=> res!994529 e!823541)))

(assert (=> b!1465703 (= res!994529 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641487 (select (arr!47697 a!2862) j!93) a!2862 mask!2687) lt!641481)))))

(declare-fun b!1465704 () Bool)

(assert (=> b!1465704 (= e!823542 e!823550)))

(declare-fun res!994541 () Bool)

(assert (=> b!1465704 (=> (not res!994541) (not e!823550))))

(assert (=> b!1465704 (= res!994541 (= lt!641482 (Intermediate!11949 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465704 (= lt!641482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641486 mask!2687) lt!641486 lt!641484 mask!2687))))

(assert (=> b!1465704 (= lt!641486 (select (store (arr!47697 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125370 res!994538) b!1465687))

(assert (= (and b!1465687 res!994540) b!1465691))

(assert (= (and b!1465691 res!994526) b!1465696))

(assert (= (and b!1465696 res!994527) b!1465684))

(assert (= (and b!1465684 res!994535) b!1465683))

(assert (= (and b!1465683 res!994536) b!1465697))

(assert (= (and b!1465697 res!994530) b!1465689))

(assert (= (and b!1465689 res!994542) b!1465700))

(assert (= (and b!1465700 res!994539) b!1465686))

(assert (= (and b!1465686 res!994528) b!1465704))

(assert (= (and b!1465704 res!994541) b!1465685))

(assert (= (and b!1465685 c!135090) b!1465692))

(assert (= (and b!1465685 (not c!135090)) b!1465690))

(assert (= (and b!1465685 res!994537) b!1465693))

(assert (= (and b!1465693 res!994531) b!1465699))

(assert (= (and b!1465699 res!994543) b!1465702))

(assert (= (and b!1465702 res!994534) b!1465698))

(assert (= (and b!1465699 (not res!994533)) b!1465688))

(assert (= (and b!1465688 (not res!994532)) b!1465703))

(assert (= (and b!1465703 (not res!994529)) b!1465701))

(assert (= (and b!1465701 c!135089) b!1465695))

(assert (= (and b!1465701 (not c!135089)) b!1465694))

(declare-fun m!1352747 () Bool)

(assert (=> b!1465696 m!1352747))

(assert (=> b!1465696 m!1352747))

(declare-fun m!1352749 () Bool)

(assert (=> b!1465696 m!1352749))

(declare-fun m!1352751 () Bool)

(assert (=> b!1465704 m!1352751))

(assert (=> b!1465704 m!1352751))

(declare-fun m!1352753 () Bool)

(assert (=> b!1465704 m!1352753))

(declare-fun m!1352755 () Bool)

(assert (=> b!1465704 m!1352755))

(declare-fun m!1352757 () Bool)

(assert (=> b!1465704 m!1352757))

(declare-fun m!1352759 () Bool)

(assert (=> b!1465694 m!1352759))

(declare-fun m!1352761 () Bool)

(assert (=> b!1465694 m!1352761))

(declare-fun m!1352763 () Bool)

(assert (=> b!1465692 m!1352763))

(declare-fun m!1352765 () Bool)

(assert (=> start!125370 m!1352765))

(declare-fun m!1352767 () Bool)

(assert (=> start!125370 m!1352767))

(declare-fun m!1352769 () Bool)

(assert (=> b!1465691 m!1352769))

(assert (=> b!1465691 m!1352769))

(declare-fun m!1352771 () Bool)

(assert (=> b!1465691 m!1352771))

(assert (=> b!1465689 m!1352755))

(declare-fun m!1352773 () Bool)

(assert (=> b!1465689 m!1352773))

(declare-fun m!1352775 () Bool)

(assert (=> b!1465695 m!1352775))

(assert (=> b!1465686 m!1352747))

(assert (=> b!1465686 m!1352747))

(declare-fun m!1352777 () Bool)

(assert (=> b!1465686 m!1352777))

(assert (=> b!1465700 m!1352747))

(assert (=> b!1465700 m!1352747))

(declare-fun m!1352779 () Bool)

(assert (=> b!1465700 m!1352779))

(assert (=> b!1465700 m!1352779))

(assert (=> b!1465700 m!1352747))

(declare-fun m!1352781 () Bool)

(assert (=> b!1465700 m!1352781))

(declare-fun m!1352783 () Bool)

(assert (=> b!1465683 m!1352783))

(declare-fun m!1352785 () Bool)

(assert (=> b!1465699 m!1352785))

(assert (=> b!1465699 m!1352755))

(declare-fun m!1352787 () Bool)

(assert (=> b!1465699 m!1352787))

(declare-fun m!1352789 () Bool)

(assert (=> b!1465699 m!1352789))

(declare-fun m!1352791 () Bool)

(assert (=> b!1465699 m!1352791))

(assert (=> b!1465699 m!1352747))

(declare-fun m!1352793 () Bool)

(assert (=> b!1465698 m!1352793))

(assert (=> b!1465698 m!1352747))

(assert (=> b!1465703 m!1352747))

(assert (=> b!1465703 m!1352747))

(declare-fun m!1352795 () Bool)

(assert (=> b!1465703 m!1352795))

(declare-fun m!1352797 () Bool)

(assert (=> b!1465690 m!1352797))

(assert (=> b!1465690 m!1352761))

(declare-fun m!1352799 () Bool)

(assert (=> b!1465684 m!1352799))

(assert (=> b!1465702 m!1352747))

(assert (=> b!1465702 m!1352747))

(declare-fun m!1352801 () Bool)

(assert (=> b!1465702 m!1352801))

(declare-fun m!1352803 () Bool)

(assert (=> b!1465688 m!1352803))

(check-sat (not b!1465684) (not b!1465694) (not b!1465704) (not b!1465699) (not b!1465683) (not b!1465696) (not b!1465702) (not b!1465695) (not b!1465688) (not b!1465703) (not b!1465691) (not start!125370) (not b!1465692) (not b!1465690) (not b!1465686) (not b!1465700))
(check-sat)
