; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121596 () Bool)

(assert start!121596)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1412556 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!799376 () Bool)

(declare-datatypes ((array!96534 0))(
  ( (array!96535 (arr!46604 (Array (_ BitVec 32) (_ BitVec 64))) (size!47154 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96534)

(declare-datatypes ((SeekEntryResult!10915 0))(
  ( (MissingZero!10915 (index!46040 (_ BitVec 32))) (Found!10915 (index!46041 (_ BitVec 32))) (Intermediate!10915 (undefined!11727 Bool) (index!46042 (_ BitVec 32)) (x!127634 (_ BitVec 32))) (Undefined!10915) (MissingVacant!10915 (index!46043 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96534 (_ BitVec 32)) SeekEntryResult!10915)

(assert (=> b!1412556 (= e!799376 (= (seekEntryOrOpen!0 (select (arr!46604 a!2901) j!112) a!2901 mask!2840) (Found!10915 j!112)))))

(declare-fun b!1412557 () Bool)

(declare-fun e!799371 () Bool)

(declare-fun e!799375 () Bool)

(assert (=> b!1412557 (= e!799371 e!799375)))

(declare-fun res!949546 () Bool)

(assert (=> b!1412557 (=> res!949546 e!799375)))

(declare-fun lt!622418 () SeekEntryResult!10915)

(declare-fun lt!622421 () SeekEntryResult!10915)

(assert (=> b!1412557 (= res!949546 (or (= lt!622418 lt!622421) (not (is-Intermediate!10915 lt!622421))))))

(declare-fun lt!622422 () (_ BitVec 64))

(declare-fun lt!622419 () array!96534)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96534 (_ BitVec 32)) SeekEntryResult!10915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412557 (= lt!622421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622422 mask!2840) lt!622422 lt!622419 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412557 (= lt!622422 (select (store (arr!46604 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412557 (= lt!622419 (array!96535 (store (arr!46604 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47154 a!2901)))))

(declare-fun b!1412558 () Bool)

(declare-fun res!949554 () Bool)

(declare-fun e!799374 () Bool)

(assert (=> b!1412558 (=> (not res!949554) (not e!799374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412558 (= res!949554 (validKeyInArray!0 (select (arr!46604 a!2901) i!1037)))))

(declare-fun b!1412559 () Bool)

(declare-fun res!949548 () Bool)

(assert (=> b!1412559 (=> (not res!949548) (not e!799374))))

(assert (=> b!1412559 (= res!949548 (and (= (size!47154 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47154 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47154 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412560 () Bool)

(assert (=> b!1412560 (= e!799375 true)))

(declare-fun e!799372 () Bool)

(assert (=> b!1412560 e!799372))

(declare-fun res!949550 () Bool)

(assert (=> b!1412560 (=> (not res!949550) (not e!799372))))

(assert (=> b!1412560 (= res!949550 (and (not (undefined!11727 lt!622421)) (= (index!46042 lt!622421) i!1037) (bvslt (x!127634 lt!622421) (x!127634 lt!622418)) (= (select (store (arr!46604 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46042 lt!622421)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47804 0))(
  ( (Unit!47805) )
))
(declare-fun lt!622417 () Unit!47804)

(declare-fun lt!622420 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47804)

(assert (=> b!1412560 (= lt!622417 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622420 (x!127634 lt!622418) (index!46042 lt!622418) (x!127634 lt!622421) (index!46042 lt!622421) (undefined!11727 lt!622421) mask!2840))))

(declare-fun b!1412561 () Bool)

(declare-fun res!949547 () Bool)

(assert (=> b!1412561 (=> (not res!949547) (not e!799374))))

(declare-datatypes ((List!33123 0))(
  ( (Nil!33120) (Cons!33119 (h!34394 (_ BitVec 64)) (t!47817 List!33123)) )
))
(declare-fun arrayNoDuplicates!0 (array!96534 (_ BitVec 32) List!33123) Bool)

(assert (=> b!1412561 (= res!949547 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33120))))

(declare-fun b!1412562 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96534 (_ BitVec 32)) SeekEntryResult!10915)

(assert (=> b!1412562 (= e!799372 (= (seekEntryOrOpen!0 lt!622422 lt!622419 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127634 lt!622421) (index!46042 lt!622421) (index!46042 lt!622421) (select (arr!46604 a!2901) j!112) lt!622419 mask!2840)))))

(declare-fun res!949549 () Bool)

(assert (=> start!121596 (=> (not res!949549) (not e!799374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121596 (= res!949549 (validMask!0 mask!2840))))

(assert (=> start!121596 e!799374))

(assert (=> start!121596 true))

(declare-fun array_inv!35632 (array!96534) Bool)

(assert (=> start!121596 (array_inv!35632 a!2901)))

(declare-fun b!1412563 () Bool)

(assert (=> b!1412563 (= e!799374 (not e!799371))))

(declare-fun res!949555 () Bool)

(assert (=> b!1412563 (=> res!949555 e!799371)))

(assert (=> b!1412563 (= res!949555 (or (not (is-Intermediate!10915 lt!622418)) (undefined!11727 lt!622418)))))

(assert (=> b!1412563 e!799376))

(declare-fun res!949552 () Bool)

(assert (=> b!1412563 (=> (not res!949552) (not e!799376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96534 (_ BitVec 32)) Bool)

(assert (=> b!1412563 (= res!949552 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622416 () Unit!47804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47804)

(assert (=> b!1412563 (= lt!622416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412563 (= lt!622418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622420 (select (arr!46604 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412563 (= lt!622420 (toIndex!0 (select (arr!46604 a!2901) j!112) mask!2840))))

(declare-fun b!1412564 () Bool)

(declare-fun res!949551 () Bool)

(assert (=> b!1412564 (=> (not res!949551) (not e!799374))))

(assert (=> b!1412564 (= res!949551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412565 () Bool)

(declare-fun res!949553 () Bool)

(assert (=> b!1412565 (=> (not res!949553) (not e!799374))))

(assert (=> b!1412565 (= res!949553 (validKeyInArray!0 (select (arr!46604 a!2901) j!112)))))

(assert (= (and start!121596 res!949549) b!1412559))

(assert (= (and b!1412559 res!949548) b!1412558))

(assert (= (and b!1412558 res!949554) b!1412565))

(assert (= (and b!1412565 res!949553) b!1412564))

(assert (= (and b!1412564 res!949551) b!1412561))

(assert (= (and b!1412561 res!949547) b!1412563))

(assert (= (and b!1412563 res!949552) b!1412556))

(assert (= (and b!1412563 (not res!949555)) b!1412557))

(assert (= (and b!1412557 (not res!949546)) b!1412560))

(assert (= (and b!1412560 res!949550) b!1412562))

(declare-fun m!1302627 () Bool)

(assert (=> b!1412556 m!1302627))

(assert (=> b!1412556 m!1302627))

(declare-fun m!1302629 () Bool)

(assert (=> b!1412556 m!1302629))

(assert (=> b!1412565 m!1302627))

(assert (=> b!1412565 m!1302627))

(declare-fun m!1302631 () Bool)

(assert (=> b!1412565 m!1302631))

(declare-fun m!1302633 () Bool)

(assert (=> b!1412560 m!1302633))

(declare-fun m!1302635 () Bool)

(assert (=> b!1412560 m!1302635))

(declare-fun m!1302637 () Bool)

(assert (=> b!1412560 m!1302637))

(declare-fun m!1302639 () Bool)

(assert (=> b!1412561 m!1302639))

(declare-fun m!1302641 () Bool)

(assert (=> b!1412562 m!1302641))

(assert (=> b!1412562 m!1302627))

(assert (=> b!1412562 m!1302627))

(declare-fun m!1302643 () Bool)

(assert (=> b!1412562 m!1302643))

(declare-fun m!1302645 () Bool)

(assert (=> b!1412557 m!1302645))

(assert (=> b!1412557 m!1302645))

(declare-fun m!1302647 () Bool)

(assert (=> b!1412557 m!1302647))

(assert (=> b!1412557 m!1302633))

(declare-fun m!1302649 () Bool)

(assert (=> b!1412557 m!1302649))

(declare-fun m!1302651 () Bool)

(assert (=> start!121596 m!1302651))

(declare-fun m!1302653 () Bool)

(assert (=> start!121596 m!1302653))

(assert (=> b!1412563 m!1302627))

(declare-fun m!1302655 () Bool)

(assert (=> b!1412563 m!1302655))

(assert (=> b!1412563 m!1302627))

(declare-fun m!1302657 () Bool)

(assert (=> b!1412563 m!1302657))

(assert (=> b!1412563 m!1302627))

(declare-fun m!1302659 () Bool)

(assert (=> b!1412563 m!1302659))

(declare-fun m!1302661 () Bool)

(assert (=> b!1412563 m!1302661))

(declare-fun m!1302663 () Bool)

(assert (=> b!1412558 m!1302663))

(assert (=> b!1412558 m!1302663))

(declare-fun m!1302665 () Bool)

(assert (=> b!1412558 m!1302665))

(declare-fun m!1302667 () Bool)

(assert (=> b!1412564 m!1302667))

(push 1)

