; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125092 () Bool)

(assert start!125092)

(declare-fun b!1456680 () Bool)

(declare-fun res!987119 () Bool)

(declare-fun e!819550 () Bool)

(assert (=> b!1456680 (=> (not res!987119) (not e!819550))))

(declare-fun e!819547 () Bool)

(assert (=> b!1456680 (= res!987119 e!819547)))

(declare-fun c!134291 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456680 (= c!134291 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456681 () Bool)

(declare-fun res!987133 () Bool)

(declare-fun e!819544 () Bool)

(assert (=> b!1456681 (=> (not res!987133) (not e!819544))))

(declare-datatypes ((array!98540 0))(
  ( (array!98541 (arr!47558 (Array (_ BitVec 32) (_ BitVec 64))) (size!48108 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98540)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11810 0))(
  ( (MissingZero!11810 (index!49632 (_ BitVec 32))) (Found!11810 (index!49633 (_ BitVec 32))) (Intermediate!11810 (undefined!12622 Bool) (index!49634 (_ BitVec 32)) (x!131259 (_ BitVec 32))) (Undefined!11810) (MissingVacant!11810 (index!49635 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98540 (_ BitVec 32)) SeekEntryResult!11810)

(assert (=> b!1456681 (= res!987133 (= (seekEntryOrOpen!0 (select (arr!47558 a!2862) j!93) a!2862 mask!2687) (Found!11810 j!93)))))

(declare-fun b!1456682 () Bool)

(declare-fun res!987136 () Bool)

(declare-fun e!819543 () Bool)

(assert (=> b!1456682 (=> (not res!987136) (not e!819543))))

(declare-fun lt!638403 () SeekEntryResult!11810)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98540 (_ BitVec 32)) SeekEntryResult!11810)

(assert (=> b!1456682 (= res!987136 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47558 a!2862) j!93) a!2862 mask!2687) lt!638403))))

(declare-fun lt!638406 () (_ BitVec 64))

(declare-fun e!819549 () Bool)

(declare-fun lt!638405 () (_ BitVec 32))

(declare-fun lt!638404 () array!98540)

(declare-fun b!1456684 () Bool)

(declare-fun lt!638402 () SeekEntryResult!11810)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98540 (_ BitVec 32)) SeekEntryResult!11810)

(assert (=> b!1456684 (= e!819549 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638405 intermediateAfterIndex!19 lt!638406 lt!638404 mask!2687) lt!638402)))))

(declare-fun b!1456685 () Bool)

(declare-fun lt!638407 () SeekEntryResult!11810)

(assert (=> b!1456685 (= e!819547 (= lt!638407 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638406 lt!638404 mask!2687)))))

(declare-fun b!1456686 () Bool)

(declare-fun e!819551 () Bool)

(assert (=> b!1456686 (= e!819550 (not e!819551))))

(declare-fun res!987126 () Bool)

(assert (=> b!1456686 (=> res!987126 e!819551)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456686 (= res!987126 (or (and (= (select (arr!47558 a!2862) index!646) (select (store (arr!47558 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47558 a!2862) index!646) (select (arr!47558 a!2862) j!93))) (= (select (arr!47558 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456686 e!819544))

(declare-fun res!987129 () Bool)

(assert (=> b!1456686 (=> (not res!987129) (not e!819544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98540 (_ BitVec 32)) Bool)

(assert (=> b!1456686 (= res!987129 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49116 0))(
  ( (Unit!49117) )
))
(declare-fun lt!638409 () Unit!49116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49116)

(assert (=> b!1456686 (= lt!638409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456687 () Bool)

(declare-fun res!987123 () Bool)

(declare-fun e!819542 () Bool)

(assert (=> b!1456687 (=> (not res!987123) (not e!819542))))

(assert (=> b!1456687 (= res!987123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456688 () Bool)

(assert (=> b!1456688 (= e!819543 e!819550)))

(declare-fun res!987134 () Bool)

(assert (=> b!1456688 (=> (not res!987134) (not e!819550))))

(assert (=> b!1456688 (= res!987134 (= lt!638407 (Intermediate!11810 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456688 (= lt!638407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638406 mask!2687) lt!638406 lt!638404 mask!2687))))

(assert (=> b!1456688 (= lt!638406 (select (store (arr!47558 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456689 () Bool)

(declare-fun res!987132 () Bool)

(assert (=> b!1456689 (=> (not res!987132) (not e!819542))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456689 (= res!987132 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48108 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48108 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48108 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456690 () Bool)

(declare-fun res!987128 () Bool)

(assert (=> b!1456690 (=> (not res!987128) (not e!819542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456690 (= res!987128 (validKeyInArray!0 (select (arr!47558 a!2862) i!1006)))))

(declare-fun b!1456691 () Bool)

(declare-fun res!987120 () Bool)

(assert (=> b!1456691 (=> (not res!987120) (not e!819542))))

(declare-datatypes ((List!34059 0))(
  ( (Nil!34056) (Cons!34055 (h!35405 (_ BitVec 64)) (t!48753 List!34059)) )
))
(declare-fun arrayNoDuplicates!0 (array!98540 (_ BitVec 32) List!34059) Bool)

(assert (=> b!1456691 (= res!987120 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34056))))

(declare-fun b!1456692 () Bool)

(declare-fun e!819548 () Bool)

(assert (=> b!1456692 (= e!819551 e!819548)))

(declare-fun res!987131 () Bool)

(assert (=> b!1456692 (=> res!987131 e!819548)))

(assert (=> b!1456692 (= res!987131 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638405 #b00000000000000000000000000000000) (bvsge lt!638405 (size!48108 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456692 (= lt!638405 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456692 (= lt!638402 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638406 lt!638404 mask!2687))))

(assert (=> b!1456692 (= lt!638402 (seekEntryOrOpen!0 lt!638406 lt!638404 mask!2687))))

(declare-fun b!1456693 () Bool)

(assert (=> b!1456693 (= e!819548 true)))

(declare-fun lt!638408 () Bool)

(assert (=> b!1456693 (= lt!638408 e!819549)))

(declare-fun c!134292 () Bool)

(assert (=> b!1456693 (= c!134292 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456694 () Bool)

(declare-fun e!819546 () Bool)

(assert (=> b!1456694 (= e!819542 e!819546)))

(declare-fun res!987127 () Bool)

(assert (=> b!1456694 (=> (not res!987127) (not e!819546))))

(assert (=> b!1456694 (= res!987127 (= (select (store (arr!47558 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456694 (= lt!638404 (array!98541 (store (arr!47558 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48108 a!2862)))))

(declare-fun b!1456695 () Bool)

(assert (=> b!1456695 (= e!819544 (and (or (= (select (arr!47558 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47558 a!2862) intermediateBeforeIndex!19) (select (arr!47558 a!2862) j!93))) (let ((bdg!53269 (select (store (arr!47558 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47558 a!2862) index!646) bdg!53269) (= (select (arr!47558 a!2862) index!646) (select (arr!47558 a!2862) j!93))) (= (select (arr!47558 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53269 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456696 () Bool)

(assert (=> b!1456696 (= e!819549 (not (= lt!638407 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638405 lt!638406 lt!638404 mask!2687))))))

(declare-fun b!1456697 () Bool)

(assert (=> b!1456697 (= e!819547 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638406 lt!638404 mask!2687) (seekEntryOrOpen!0 lt!638406 lt!638404 mask!2687)))))

(declare-fun b!1456698 () Bool)

(declare-fun res!987130 () Bool)

(assert (=> b!1456698 (=> (not res!987130) (not e!819542))))

(assert (=> b!1456698 (= res!987130 (and (= (size!48108 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48108 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48108 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!987125 () Bool)

(assert (=> start!125092 (=> (not res!987125) (not e!819542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125092 (= res!987125 (validMask!0 mask!2687))))

(assert (=> start!125092 e!819542))

(assert (=> start!125092 true))

(declare-fun array_inv!36586 (array!98540) Bool)

(assert (=> start!125092 (array_inv!36586 a!2862)))

(declare-fun b!1456683 () Bool)

(declare-fun res!987124 () Bool)

(assert (=> b!1456683 (=> (not res!987124) (not e!819550))))

(assert (=> b!1456683 (= res!987124 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456699 () Bool)

(declare-fun res!987135 () Bool)

(assert (=> b!1456699 (=> res!987135 e!819548)))

(assert (=> b!1456699 (= res!987135 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638405 (select (arr!47558 a!2862) j!93) a!2862 mask!2687) lt!638403)))))

(declare-fun b!1456700 () Bool)

(declare-fun res!987121 () Bool)

(assert (=> b!1456700 (=> (not res!987121) (not e!819542))))

(assert (=> b!1456700 (= res!987121 (validKeyInArray!0 (select (arr!47558 a!2862) j!93)))))

(declare-fun b!1456701 () Bool)

(assert (=> b!1456701 (= e!819546 e!819543)))

(declare-fun res!987122 () Bool)

(assert (=> b!1456701 (=> (not res!987122) (not e!819543))))

(assert (=> b!1456701 (= res!987122 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47558 a!2862) j!93) mask!2687) (select (arr!47558 a!2862) j!93) a!2862 mask!2687) lt!638403))))

(assert (=> b!1456701 (= lt!638403 (Intermediate!11810 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125092 res!987125) b!1456698))

(assert (= (and b!1456698 res!987130) b!1456690))

(assert (= (and b!1456690 res!987128) b!1456700))

(assert (= (and b!1456700 res!987121) b!1456687))

(assert (= (and b!1456687 res!987123) b!1456691))

(assert (= (and b!1456691 res!987120) b!1456689))

(assert (= (and b!1456689 res!987132) b!1456694))

(assert (= (and b!1456694 res!987127) b!1456701))

(assert (= (and b!1456701 res!987122) b!1456682))

(assert (= (and b!1456682 res!987136) b!1456688))

(assert (= (and b!1456688 res!987134) b!1456680))

(assert (= (and b!1456680 c!134291) b!1456685))

(assert (= (and b!1456680 (not c!134291)) b!1456697))

(assert (= (and b!1456680 res!987119) b!1456683))

(assert (= (and b!1456683 res!987124) b!1456686))

(assert (= (and b!1456686 res!987129) b!1456681))

(assert (= (and b!1456681 res!987133) b!1456695))

(assert (= (and b!1456686 (not res!987126)) b!1456692))

(assert (= (and b!1456692 (not res!987131)) b!1456699))

(assert (= (and b!1456699 (not res!987135)) b!1456693))

(assert (= (and b!1456693 c!134292) b!1456696))

(assert (= (and b!1456693 (not c!134292)) b!1456684))

(declare-fun m!1344751 () Bool)

(assert (=> b!1456697 m!1344751))

(declare-fun m!1344753 () Bool)

(assert (=> b!1456697 m!1344753))

(declare-fun m!1344755 () Bool)

(assert (=> b!1456686 m!1344755))

(declare-fun m!1344757 () Bool)

(assert (=> b!1456686 m!1344757))

(declare-fun m!1344759 () Bool)

(assert (=> b!1456686 m!1344759))

(declare-fun m!1344761 () Bool)

(assert (=> b!1456686 m!1344761))

(declare-fun m!1344763 () Bool)

(assert (=> b!1456686 m!1344763))

(declare-fun m!1344765 () Bool)

(assert (=> b!1456686 m!1344765))

(declare-fun m!1344767 () Bool)

(assert (=> b!1456687 m!1344767))

(assert (=> b!1456700 m!1344765))

(assert (=> b!1456700 m!1344765))

(declare-fun m!1344769 () Bool)

(assert (=> b!1456700 m!1344769))

(assert (=> b!1456681 m!1344765))

(assert (=> b!1456681 m!1344765))

(declare-fun m!1344771 () Bool)

(assert (=> b!1456681 m!1344771))

(declare-fun m!1344773 () Bool)

(assert (=> b!1456685 m!1344773))

(assert (=> b!1456699 m!1344765))

(assert (=> b!1456699 m!1344765))

(declare-fun m!1344775 () Bool)

(assert (=> b!1456699 m!1344775))

(declare-fun m!1344777 () Bool)

(assert (=> b!1456684 m!1344777))

(declare-fun m!1344779 () Bool)

(assert (=> b!1456696 m!1344779))

(declare-fun m!1344781 () Bool)

(assert (=> b!1456688 m!1344781))

(assert (=> b!1456688 m!1344781))

(declare-fun m!1344783 () Bool)

(assert (=> b!1456688 m!1344783))

(assert (=> b!1456688 m!1344757))

(declare-fun m!1344785 () Bool)

(assert (=> b!1456688 m!1344785))

(assert (=> b!1456695 m!1344757))

(declare-fun m!1344787 () Bool)

(assert (=> b!1456695 m!1344787))

(assert (=> b!1456695 m!1344759))

(assert (=> b!1456695 m!1344761))

(assert (=> b!1456695 m!1344765))

(assert (=> b!1456694 m!1344757))

(declare-fun m!1344789 () Bool)

(assert (=> b!1456694 m!1344789))

(declare-fun m!1344791 () Bool)

(assert (=> b!1456692 m!1344791))

(assert (=> b!1456692 m!1344751))

(assert (=> b!1456692 m!1344753))

(assert (=> b!1456701 m!1344765))

(assert (=> b!1456701 m!1344765))

(declare-fun m!1344793 () Bool)

(assert (=> b!1456701 m!1344793))

(assert (=> b!1456701 m!1344793))

(assert (=> b!1456701 m!1344765))

(declare-fun m!1344795 () Bool)

(assert (=> b!1456701 m!1344795))

(declare-fun m!1344797 () Bool)

(assert (=> b!1456691 m!1344797))

(declare-fun m!1344799 () Bool)

(assert (=> b!1456690 m!1344799))

(assert (=> b!1456690 m!1344799))

(declare-fun m!1344801 () Bool)

(assert (=> b!1456690 m!1344801))

(declare-fun m!1344803 () Bool)

(assert (=> start!125092 m!1344803))

(declare-fun m!1344805 () Bool)

(assert (=> start!125092 m!1344805))

(assert (=> b!1456682 m!1344765))

(assert (=> b!1456682 m!1344765))

(declare-fun m!1344807 () Bool)

(assert (=> b!1456682 m!1344807))

(push 1)

