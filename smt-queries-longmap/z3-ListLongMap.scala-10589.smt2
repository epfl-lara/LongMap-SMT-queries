; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124674 () Bool)

(assert start!124674)

(declare-fun b!1444643 () Bool)

(declare-fun res!976617 () Bool)

(declare-fun e!813920 () Bool)

(assert (=> b!1444643 (=> (not res!976617) (not e!813920))))

(declare-datatypes ((array!98122 0))(
  ( (array!98123 (arr!47349 (Array (_ BitVec 32) (_ BitVec 64))) (size!47899 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98122)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444643 (= res!976617 (validKeyInArray!0 (select (arr!47349 a!2862) i!1006)))))

(declare-fun b!1444644 () Bool)

(declare-fun e!813915 () Bool)

(assert (=> b!1444644 (= e!813915 (not true))))

(declare-fun e!813918 () Bool)

(assert (=> b!1444644 e!813918))

(declare-fun res!976610 () Bool)

(assert (=> b!1444644 (=> (not res!976610) (not e!813918))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98122 (_ BitVec 32)) Bool)

(assert (=> b!1444644 (= res!976610 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48698 0))(
  ( (Unit!48699) )
))
(declare-fun lt!634263 () Unit!48698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48698)

(assert (=> b!1444644 (= lt!634263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444645 () Bool)

(declare-fun res!976623 () Bool)

(assert (=> b!1444645 (=> (not res!976623) (not e!813915))))

(declare-fun e!813919 () Bool)

(assert (=> b!1444645 (= res!976623 e!813919)))

(declare-fun c!133527 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444645 (= c!133527 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444646 () Bool)

(declare-fun res!976624 () Bool)

(assert (=> b!1444646 (=> (not res!976624) (not e!813920))))

(assert (=> b!1444646 (= res!976624 (validKeyInArray!0 (select (arr!47349 a!2862) j!93)))))

(declare-fun b!1444647 () Bool)

(declare-fun e!813917 () Bool)

(assert (=> b!1444647 (= e!813917 e!813915)))

(declare-fun res!976620 () Bool)

(assert (=> b!1444647 (=> (not res!976620) (not e!813915))))

(declare-datatypes ((SeekEntryResult!11601 0))(
  ( (MissingZero!11601 (index!48796 (_ BitVec 32))) (Found!11601 (index!48797 (_ BitVec 32))) (Intermediate!11601 (undefined!12413 Bool) (index!48798 (_ BitVec 32)) (x!130490 (_ BitVec 32))) (Undefined!11601) (MissingVacant!11601 (index!48799 (_ BitVec 32))) )
))
(declare-fun lt!634264 () SeekEntryResult!11601)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444647 (= res!976620 (= lt!634264 (Intermediate!11601 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634262 () array!98122)

(declare-fun lt!634266 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98122 (_ BitVec 32)) SeekEntryResult!11601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444647 (= lt!634264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634266 mask!2687) lt!634266 lt!634262 mask!2687))))

(assert (=> b!1444647 (= lt!634266 (select (store (arr!47349 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444648 () Bool)

(declare-fun e!813914 () Bool)

(assert (=> b!1444648 (= e!813920 e!813914)))

(declare-fun res!976622 () Bool)

(assert (=> b!1444648 (=> (not res!976622) (not e!813914))))

(assert (=> b!1444648 (= res!976622 (= (select (store (arr!47349 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444648 (= lt!634262 (array!98123 (store (arr!47349 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47899 a!2862)))))

(declare-fun b!1444649 () Bool)

(declare-fun res!976615 () Bool)

(assert (=> b!1444649 (=> (not res!976615) (not e!813920))))

(assert (=> b!1444649 (= res!976615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444650 () Bool)

(assert (=> b!1444650 (= e!813914 e!813917)))

(declare-fun res!976621 () Bool)

(assert (=> b!1444650 (=> (not res!976621) (not e!813917))))

(declare-fun lt!634265 () SeekEntryResult!11601)

(assert (=> b!1444650 (= res!976621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47349 a!2862) j!93) mask!2687) (select (arr!47349 a!2862) j!93) a!2862 mask!2687) lt!634265))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444650 (= lt!634265 (Intermediate!11601 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444651 () Bool)

(declare-fun res!976611 () Bool)

(assert (=> b!1444651 (=> (not res!976611) (not e!813920))))

(assert (=> b!1444651 (= res!976611 (and (= (size!47899 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47899 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47899 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444652 () Bool)

(declare-fun res!976618 () Bool)

(assert (=> b!1444652 (=> (not res!976618) (not e!813920))))

(declare-datatypes ((List!33850 0))(
  ( (Nil!33847) (Cons!33846 (h!35196 (_ BitVec 64)) (t!48544 List!33850)) )
))
(declare-fun arrayNoDuplicates!0 (array!98122 (_ BitVec 32) List!33850) Bool)

(assert (=> b!1444652 (= res!976618 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33847))))

(declare-fun b!1444654 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98122 (_ BitVec 32)) SeekEntryResult!11601)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98122 (_ BitVec 32)) SeekEntryResult!11601)

(assert (=> b!1444654 (= e!813919 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634266 lt!634262 mask!2687) (seekEntryOrOpen!0 lt!634266 lt!634262 mask!2687)))))

(declare-fun b!1444655 () Bool)

(assert (=> b!1444655 (= e!813918 (or (= (select (arr!47349 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47349 a!2862) intermediateBeforeIndex!19) (select (arr!47349 a!2862) j!93))))))

(declare-fun b!1444656 () Bool)

(declare-fun res!976612 () Bool)

(assert (=> b!1444656 (=> (not res!976612) (not e!813920))))

(assert (=> b!1444656 (= res!976612 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47899 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47899 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47899 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444657 () Bool)

(declare-fun res!976619 () Bool)

(assert (=> b!1444657 (=> (not res!976619) (not e!813918))))

(assert (=> b!1444657 (= res!976619 (= (seekEntryOrOpen!0 (select (arr!47349 a!2862) j!93) a!2862 mask!2687) (Found!11601 j!93)))))

(declare-fun b!1444658 () Bool)

(assert (=> b!1444658 (= e!813919 (= lt!634264 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634266 lt!634262 mask!2687)))))

(declare-fun b!1444659 () Bool)

(declare-fun res!976614 () Bool)

(assert (=> b!1444659 (=> (not res!976614) (not e!813917))))

(assert (=> b!1444659 (= res!976614 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47349 a!2862) j!93) a!2862 mask!2687) lt!634265))))

(declare-fun b!1444653 () Bool)

(declare-fun res!976613 () Bool)

(assert (=> b!1444653 (=> (not res!976613) (not e!813915))))

(assert (=> b!1444653 (= res!976613 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!976616 () Bool)

(assert (=> start!124674 (=> (not res!976616) (not e!813920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124674 (= res!976616 (validMask!0 mask!2687))))

(assert (=> start!124674 e!813920))

(assert (=> start!124674 true))

(declare-fun array_inv!36377 (array!98122) Bool)

(assert (=> start!124674 (array_inv!36377 a!2862)))

(assert (= (and start!124674 res!976616) b!1444651))

(assert (= (and b!1444651 res!976611) b!1444643))

(assert (= (and b!1444643 res!976617) b!1444646))

(assert (= (and b!1444646 res!976624) b!1444649))

(assert (= (and b!1444649 res!976615) b!1444652))

(assert (= (and b!1444652 res!976618) b!1444656))

(assert (= (and b!1444656 res!976612) b!1444648))

(assert (= (and b!1444648 res!976622) b!1444650))

(assert (= (and b!1444650 res!976621) b!1444659))

(assert (= (and b!1444659 res!976614) b!1444647))

(assert (= (and b!1444647 res!976620) b!1444645))

(assert (= (and b!1444645 c!133527) b!1444658))

(assert (= (and b!1444645 (not c!133527)) b!1444654))

(assert (= (and b!1444645 res!976623) b!1444653))

(assert (= (and b!1444653 res!976613) b!1444644))

(assert (= (and b!1444644 res!976610) b!1444657))

(assert (= (and b!1444657 res!976619) b!1444655))

(declare-fun m!1333655 () Bool)

(assert (=> b!1444654 m!1333655))

(declare-fun m!1333657 () Bool)

(assert (=> b!1444654 m!1333657))

(declare-fun m!1333659 () Bool)

(assert (=> b!1444652 m!1333659))

(declare-fun m!1333661 () Bool)

(assert (=> b!1444643 m!1333661))

(assert (=> b!1444643 m!1333661))

(declare-fun m!1333663 () Bool)

(assert (=> b!1444643 m!1333663))

(declare-fun m!1333665 () Bool)

(assert (=> b!1444644 m!1333665))

(declare-fun m!1333667 () Bool)

(assert (=> b!1444644 m!1333667))

(declare-fun m!1333669 () Bool)

(assert (=> b!1444659 m!1333669))

(assert (=> b!1444659 m!1333669))

(declare-fun m!1333671 () Bool)

(assert (=> b!1444659 m!1333671))

(declare-fun m!1333673 () Bool)

(assert (=> b!1444658 m!1333673))

(declare-fun m!1333675 () Bool)

(assert (=> b!1444649 m!1333675))

(assert (=> b!1444650 m!1333669))

(assert (=> b!1444650 m!1333669))

(declare-fun m!1333677 () Bool)

(assert (=> b!1444650 m!1333677))

(assert (=> b!1444650 m!1333677))

(assert (=> b!1444650 m!1333669))

(declare-fun m!1333679 () Bool)

(assert (=> b!1444650 m!1333679))

(declare-fun m!1333681 () Bool)

(assert (=> b!1444647 m!1333681))

(assert (=> b!1444647 m!1333681))

(declare-fun m!1333683 () Bool)

(assert (=> b!1444647 m!1333683))

(declare-fun m!1333685 () Bool)

(assert (=> b!1444647 m!1333685))

(declare-fun m!1333687 () Bool)

(assert (=> b!1444647 m!1333687))

(assert (=> b!1444657 m!1333669))

(assert (=> b!1444657 m!1333669))

(declare-fun m!1333689 () Bool)

(assert (=> b!1444657 m!1333689))

(assert (=> b!1444646 m!1333669))

(assert (=> b!1444646 m!1333669))

(declare-fun m!1333691 () Bool)

(assert (=> b!1444646 m!1333691))

(declare-fun m!1333693 () Bool)

(assert (=> start!124674 m!1333693))

(declare-fun m!1333695 () Bool)

(assert (=> start!124674 m!1333695))

(assert (=> b!1444648 m!1333685))

(declare-fun m!1333697 () Bool)

(assert (=> b!1444648 m!1333697))

(declare-fun m!1333699 () Bool)

(assert (=> b!1444655 m!1333699))

(assert (=> b!1444655 m!1333669))

(check-sat (not start!124674) (not b!1444654) (not b!1444649) (not b!1444652) (not b!1444650) (not b!1444644) (not b!1444659) (not b!1444647) (not b!1444646) (not b!1444643) (not b!1444658) (not b!1444657))
(check-sat)
