; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125186 () Bool)

(assert start!125186)

(declare-fun b!1459783 () Bool)

(declare-fun res!989671 () Bool)

(declare-fun e!820906 () Bool)

(assert (=> b!1459783 (=> res!989671 e!820906)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11857 0))(
  ( (MissingZero!11857 (index!49820 (_ BitVec 32))) (Found!11857 (index!49821 (_ BitVec 32))) (Intermediate!11857 (undefined!12669 Bool) (index!49822 (_ BitVec 32)) (x!131426 (_ BitVec 32))) (Undefined!11857) (MissingVacant!11857 (index!49823 (_ BitVec 32))) )
))
(declare-fun lt!639586 () SeekEntryResult!11857)

(declare-fun lt!639588 () (_ BitVec 32))

(declare-datatypes ((array!98634 0))(
  ( (array!98635 (arr!47605 (Array (_ BitVec 32) (_ BitVec 64))) (size!48155 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98634)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98634 (_ BitVec 32)) SeekEntryResult!11857)

(assert (=> b!1459783 (= res!989671 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639588 (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!639586)))))

(declare-fun b!1459784 () Bool)

(declare-fun e!820903 () Bool)

(declare-fun e!820899 () Bool)

(assert (=> b!1459784 (= e!820903 (not e!820899))))

(declare-fun res!989669 () Bool)

(assert (=> b!1459784 (=> res!989669 e!820899)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459784 (= res!989669 (or (and (= (select (arr!47605 a!2862) index!646) (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47605 a!2862) index!646) (select (arr!47605 a!2862) j!93))) (= (select (arr!47605 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!639591 () SeekEntryResult!11857)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1459784 (and (= lt!639591 (Found!11857 j!93)) (or (= (select (arr!47605 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47605 a!2862) intermediateBeforeIndex!19) (select (arr!47605 a!2862) j!93))) (let ((bdg!53533 (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47605 a!2862) index!646) bdg!53533) (= (select (arr!47605 a!2862) index!646) (select (arr!47605 a!2862) j!93))) (= (select (arr!47605 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53533 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98634 (_ BitVec 32)) SeekEntryResult!11857)

(assert (=> b!1459784 (= lt!639591 (seekEntryOrOpen!0 (select (arr!47605 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98634 (_ BitVec 32)) Bool)

(assert (=> b!1459784 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49210 0))(
  ( (Unit!49211) )
))
(declare-fun lt!639589 () Unit!49210)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49210)

(assert (=> b!1459784 (= lt!639589 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459785 () Bool)

(assert (=> b!1459785 (= e!820899 e!820906)))

(declare-fun res!989667 () Bool)

(assert (=> b!1459785 (=> res!989667 e!820906)))

(assert (=> b!1459785 (= res!989667 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639588 #b00000000000000000000000000000000) (bvsge lt!639588 (size!48155 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459785 (= lt!639588 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639585 () array!98634)

(declare-fun lt!639583 () (_ BitVec 64))

(declare-fun lt!639584 () SeekEntryResult!11857)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98634 (_ BitVec 32)) SeekEntryResult!11857)

(assert (=> b!1459785 (= lt!639584 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639583 lt!639585 mask!2687))))

(assert (=> b!1459785 (= lt!639584 (seekEntryOrOpen!0 lt!639583 lt!639585 mask!2687))))

(declare-fun b!1459786 () Bool)

(declare-fun res!989661 () Bool)

(assert (=> b!1459786 (=> res!989661 e!820906)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459786 (= res!989661 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459787 () Bool)

(declare-fun res!989673 () Bool)

(assert (=> b!1459787 (=> (not res!989673) (not e!820903))))

(assert (=> b!1459787 (= res!989673 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459788 () Bool)

(declare-fun res!989658 () Bool)

(declare-fun e!820907 () Bool)

(assert (=> b!1459788 (=> (not res!989658) (not e!820907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459788 (= res!989658 (validKeyInArray!0 (select (arr!47605 a!2862) j!93)))))

(declare-fun b!1459789 () Bool)

(declare-fun res!989672 () Bool)

(assert (=> b!1459789 (=> (not res!989672) (not e!820907))))

(assert (=> b!1459789 (= res!989672 (validKeyInArray!0 (select (arr!47605 a!2862) i!1006)))))

(declare-fun b!1459790 () Bool)

(declare-fun e!820902 () Bool)

(assert (=> b!1459790 (= e!820902 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639588 intermediateAfterIndex!19 lt!639583 lt!639585 mask!2687) lt!639584)))))

(declare-fun b!1459791 () Bool)

(declare-fun res!989660 () Bool)

(assert (=> b!1459791 (=> (not res!989660) (not e!820907))))

(assert (=> b!1459791 (= res!989660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459792 () Bool)

(declare-fun res!989666 () Bool)

(assert (=> b!1459792 (=> (not res!989666) (not e!820903))))

(declare-fun e!820905 () Bool)

(assert (=> b!1459792 (= res!989666 e!820905)))

(declare-fun c!134573 () Bool)

(assert (=> b!1459792 (= c!134573 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459793 () Bool)

(assert (=> b!1459793 (= e!820905 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639583 lt!639585 mask!2687) (seekEntryOrOpen!0 lt!639583 lt!639585 mask!2687)))))

(declare-fun b!1459794 () Bool)

(declare-fun e!820904 () Bool)

(assert (=> b!1459794 (= e!820907 e!820904)))

(declare-fun res!989674 () Bool)

(assert (=> b!1459794 (=> (not res!989674) (not e!820904))))

(assert (=> b!1459794 (= res!989674 (= (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459794 (= lt!639585 (array!98635 (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48155 a!2862)))))

(declare-fun res!989662 () Bool)

(assert (=> start!125186 (=> (not res!989662) (not e!820907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125186 (= res!989662 (validMask!0 mask!2687))))

(assert (=> start!125186 e!820907))

(assert (=> start!125186 true))

(declare-fun array_inv!36633 (array!98634) Bool)

(assert (=> start!125186 (array_inv!36633 a!2862)))

(declare-fun b!1459782 () Bool)

(assert (=> b!1459782 (= e!820906 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1459782 (= lt!639591 lt!639584)))

(declare-fun lt!639587 () Unit!49210)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49210)

(assert (=> b!1459782 (= lt!639587 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639588 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459795 () Bool)

(declare-fun res!989668 () Bool)

(declare-fun e!820900 () Bool)

(assert (=> b!1459795 (=> (not res!989668) (not e!820900))))

(assert (=> b!1459795 (= res!989668 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!639586))))

(declare-fun lt!639590 () SeekEntryResult!11857)

(declare-fun b!1459796 () Bool)

(assert (=> b!1459796 (= e!820902 (not (= lt!639590 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639588 lt!639583 lt!639585 mask!2687))))))

(declare-fun b!1459797 () Bool)

(assert (=> b!1459797 (= e!820904 e!820900)))

(declare-fun res!989664 () Bool)

(assert (=> b!1459797 (=> (not res!989664) (not e!820900))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459797 (= res!989664 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47605 a!2862) j!93) mask!2687) (select (arr!47605 a!2862) j!93) a!2862 mask!2687) lt!639586))))

(assert (=> b!1459797 (= lt!639586 (Intermediate!11857 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459798 () Bool)

(declare-fun res!989663 () Bool)

(assert (=> b!1459798 (=> (not res!989663) (not e!820907))))

(assert (=> b!1459798 (= res!989663 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48155 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48155 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48155 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459799 () Bool)

(declare-fun res!989657 () Bool)

(assert (=> b!1459799 (=> res!989657 e!820906)))

(assert (=> b!1459799 (= res!989657 e!820902)))

(declare-fun c!134574 () Bool)

(assert (=> b!1459799 (= c!134574 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459800 () Bool)

(assert (=> b!1459800 (= e!820905 (= lt!639590 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639583 lt!639585 mask!2687)))))

(declare-fun b!1459801 () Bool)

(declare-fun res!989665 () Bool)

(assert (=> b!1459801 (=> (not res!989665) (not e!820907))))

(assert (=> b!1459801 (= res!989665 (and (= (size!48155 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48155 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48155 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459802 () Bool)

(assert (=> b!1459802 (= e!820900 e!820903)))

(declare-fun res!989659 () Bool)

(assert (=> b!1459802 (=> (not res!989659) (not e!820903))))

(assert (=> b!1459802 (= res!989659 (= lt!639590 (Intermediate!11857 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459802 (= lt!639590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639583 mask!2687) lt!639583 lt!639585 mask!2687))))

(assert (=> b!1459802 (= lt!639583 (select (store (arr!47605 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459803 () Bool)

(declare-fun res!989670 () Bool)

(assert (=> b!1459803 (=> (not res!989670) (not e!820907))))

(declare-datatypes ((List!34106 0))(
  ( (Nil!34103) (Cons!34102 (h!35452 (_ BitVec 64)) (t!48800 List!34106)) )
))
(declare-fun arrayNoDuplicates!0 (array!98634 (_ BitVec 32) List!34106) Bool)

(assert (=> b!1459803 (= res!989670 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34103))))

(assert (= (and start!125186 res!989662) b!1459801))

(assert (= (and b!1459801 res!989665) b!1459789))

(assert (= (and b!1459789 res!989672) b!1459788))

(assert (= (and b!1459788 res!989658) b!1459791))

(assert (= (and b!1459791 res!989660) b!1459803))

(assert (= (and b!1459803 res!989670) b!1459798))

(assert (= (and b!1459798 res!989663) b!1459794))

(assert (= (and b!1459794 res!989674) b!1459797))

(assert (= (and b!1459797 res!989664) b!1459795))

(assert (= (and b!1459795 res!989668) b!1459802))

(assert (= (and b!1459802 res!989659) b!1459792))

(assert (= (and b!1459792 c!134573) b!1459800))

(assert (= (and b!1459792 (not c!134573)) b!1459793))

(assert (= (and b!1459792 res!989666) b!1459787))

(assert (= (and b!1459787 res!989673) b!1459784))

(assert (= (and b!1459784 (not res!989669)) b!1459785))

(assert (= (and b!1459785 (not res!989667)) b!1459783))

(assert (= (and b!1459783 (not res!989671)) b!1459799))

(assert (= (and b!1459799 c!134574) b!1459796))

(assert (= (and b!1459799 (not c!134574)) b!1459790))

(assert (= (and b!1459799 (not res!989657)) b!1459786))

(assert (= (and b!1459786 (not res!989661)) b!1459782))

(declare-fun m!1347511 () Bool)

(assert (=> b!1459785 m!1347511))

(declare-fun m!1347513 () Bool)

(assert (=> b!1459785 m!1347513))

(declare-fun m!1347515 () Bool)

(assert (=> b!1459785 m!1347515))

(assert (=> b!1459793 m!1347513))

(assert (=> b!1459793 m!1347515))

(declare-fun m!1347517 () Bool)

(assert (=> b!1459802 m!1347517))

(assert (=> b!1459802 m!1347517))

(declare-fun m!1347519 () Bool)

(assert (=> b!1459802 m!1347519))

(declare-fun m!1347521 () Bool)

(assert (=> b!1459802 m!1347521))

(declare-fun m!1347523 () Bool)

(assert (=> b!1459802 m!1347523))

(declare-fun m!1347525 () Bool)

(assert (=> b!1459795 m!1347525))

(assert (=> b!1459795 m!1347525))

(declare-fun m!1347527 () Bool)

(assert (=> b!1459795 m!1347527))

(declare-fun m!1347529 () Bool)

(assert (=> start!125186 m!1347529))

(declare-fun m!1347531 () Bool)

(assert (=> start!125186 m!1347531))

(declare-fun m!1347533 () Bool)

(assert (=> b!1459803 m!1347533))

(declare-fun m!1347535 () Bool)

(assert (=> b!1459796 m!1347535))

(declare-fun m!1347537 () Bool)

(assert (=> b!1459789 m!1347537))

(assert (=> b!1459789 m!1347537))

(declare-fun m!1347539 () Bool)

(assert (=> b!1459789 m!1347539))

(declare-fun m!1347541 () Bool)

(assert (=> b!1459784 m!1347541))

(assert (=> b!1459784 m!1347521))

(declare-fun m!1347543 () Bool)

(assert (=> b!1459784 m!1347543))

(declare-fun m!1347545 () Bool)

(assert (=> b!1459784 m!1347545))

(declare-fun m!1347547 () Bool)

(assert (=> b!1459784 m!1347547))

(assert (=> b!1459784 m!1347525))

(declare-fun m!1347549 () Bool)

(assert (=> b!1459784 m!1347549))

(declare-fun m!1347551 () Bool)

(assert (=> b!1459784 m!1347551))

(assert (=> b!1459784 m!1347525))

(declare-fun m!1347553 () Bool)

(assert (=> b!1459790 m!1347553))

(declare-fun m!1347555 () Bool)

(assert (=> b!1459782 m!1347555))

(assert (=> b!1459783 m!1347525))

(assert (=> b!1459783 m!1347525))

(declare-fun m!1347557 () Bool)

(assert (=> b!1459783 m!1347557))

(declare-fun m!1347559 () Bool)

(assert (=> b!1459791 m!1347559))

(assert (=> b!1459794 m!1347521))

(declare-fun m!1347561 () Bool)

(assert (=> b!1459794 m!1347561))

(declare-fun m!1347563 () Bool)

(assert (=> b!1459800 m!1347563))

(assert (=> b!1459788 m!1347525))

(assert (=> b!1459788 m!1347525))

(declare-fun m!1347565 () Bool)

(assert (=> b!1459788 m!1347565))

(assert (=> b!1459797 m!1347525))

(assert (=> b!1459797 m!1347525))

(declare-fun m!1347567 () Bool)

(assert (=> b!1459797 m!1347567))

(assert (=> b!1459797 m!1347567))

(assert (=> b!1459797 m!1347525))

(declare-fun m!1347569 () Bool)

(assert (=> b!1459797 m!1347569))

(push 1)

(assert (not b!1459788))

(assert (not b!1459784))

(assert (not b!1459803))

(assert (not b!1459783))

(assert (not b!1459795))

(assert (not b!1459796))

