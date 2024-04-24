; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121604 () Bool)

(assert start!121604)

(declare-fun b!1411800 () Bool)

(declare-fun res!948345 () Bool)

(declare-fun e!799040 () Bool)

(assert (=> b!1411800 (=> (not res!948345) (not e!799040))))

(declare-datatypes ((array!96527 0))(
  ( (array!96528 (arr!46600 (Array (_ BitVec 32) (_ BitVec 64))) (size!47151 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96527)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96527 (_ BitVec 32)) Bool)

(assert (=> b!1411800 (= res!948345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411801 () Bool)

(declare-fun res!948346 () Bool)

(assert (=> b!1411801 (=> (not res!948346) (not e!799040))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411801 (= res!948346 (validKeyInArray!0 (select (arr!46600 a!2901) i!1037)))))

(declare-fun b!1411802 () Bool)

(declare-fun res!948348 () Bool)

(assert (=> b!1411802 (=> (not res!948348) (not e!799040))))

(declare-datatypes ((List!33106 0))(
  ( (Nil!33103) (Cons!33102 (h!34382 (_ BitVec 64)) (t!47792 List!33106)) )
))
(declare-fun arrayNoDuplicates!0 (array!96527 (_ BitVec 32) List!33106) Bool)

(assert (=> b!1411802 (= res!948348 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33103))))

(declare-datatypes ((SeekEntryResult!10814 0))(
  ( (MissingZero!10814 (index!45633 (_ BitVec 32))) (Found!10814 (index!45634 (_ BitVec 32))) (Intermediate!10814 (undefined!11626 Bool) (index!45635 (_ BitVec 32)) (x!127388 (_ BitVec 32))) (Undefined!10814) (MissingVacant!10814 (index!45636 (_ BitVec 32))) )
))
(declare-fun lt!621671 () SeekEntryResult!10814)

(declare-fun lt!621674 () (_ BitVec 32))

(declare-fun e!799037 () Bool)

(declare-fun b!1411803 () Bool)

(declare-fun lt!621673 () SeekEntryResult!10814)

(get-info :version)

(assert (=> b!1411803 (= e!799037 (or (= lt!621671 lt!621673) (not ((_ is Intermediate!10814) lt!621673)) (bvslt (x!127388 lt!621671) #b00000000000000000000000000000000) (bvsgt (x!127388 lt!621671) #b01111111111111111111111111111110) (bvslt lt!621674 #b00000000000000000000000000000000) (bvsge lt!621674 (size!47151 a!2901)) (bvslt (index!45635 lt!621671) #b00000000000000000000000000000000) (bvsge (index!45635 lt!621671) (size!47151 a!2901)) (= lt!621671 (Intermediate!10814 false (index!45635 lt!621671) (x!127388 lt!621671)))))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96527 (_ BitVec 32)) SeekEntryResult!10814)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411803 (= lt!621673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96528 (store (arr!46600 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47151 a!2901)) mask!2840))))

(declare-fun b!1411804 () Bool)

(declare-fun e!799039 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96527 (_ BitVec 32)) SeekEntryResult!10814)

(assert (=> b!1411804 (= e!799039 (= (seekEntryOrOpen!0 (select (arr!46600 a!2901) j!112) a!2901 mask!2840) (Found!10814 j!112)))))

(declare-fun res!948343 () Bool)

(assert (=> start!121604 (=> (not res!948343) (not e!799040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121604 (= res!948343 (validMask!0 mask!2840))))

(assert (=> start!121604 e!799040))

(assert (=> start!121604 true))

(declare-fun array_inv!35881 (array!96527) Bool)

(assert (=> start!121604 (array_inv!35881 a!2901)))

(declare-fun b!1411799 () Bool)

(declare-fun res!948342 () Bool)

(assert (=> b!1411799 (=> (not res!948342) (not e!799040))))

(assert (=> b!1411799 (= res!948342 (validKeyInArray!0 (select (arr!46600 a!2901) j!112)))))

(declare-fun b!1411805 () Bool)

(assert (=> b!1411805 (= e!799040 (not e!799037))))

(declare-fun res!948349 () Bool)

(assert (=> b!1411805 (=> res!948349 e!799037)))

(assert (=> b!1411805 (= res!948349 (or (not ((_ is Intermediate!10814) lt!621671)) (undefined!11626 lt!621671)))))

(assert (=> b!1411805 e!799039))

(declare-fun res!948344 () Bool)

(assert (=> b!1411805 (=> (not res!948344) (not e!799039))))

(assert (=> b!1411805 (= res!948344 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47629 0))(
  ( (Unit!47630) )
))
(declare-fun lt!621672 () Unit!47629)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47629)

(assert (=> b!1411805 (= lt!621672 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411805 (= lt!621671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621674 (select (arr!46600 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411805 (= lt!621674 (toIndex!0 (select (arr!46600 a!2901) j!112) mask!2840))))

(declare-fun b!1411806 () Bool)

(declare-fun res!948347 () Bool)

(assert (=> b!1411806 (=> (not res!948347) (not e!799040))))

(assert (=> b!1411806 (= res!948347 (and (= (size!47151 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47151 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47151 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121604 res!948343) b!1411806))

(assert (= (and b!1411806 res!948347) b!1411801))

(assert (= (and b!1411801 res!948346) b!1411799))

(assert (= (and b!1411799 res!948342) b!1411800))

(assert (= (and b!1411800 res!948345) b!1411802))

(assert (= (and b!1411802 res!948348) b!1411805))

(assert (= (and b!1411805 res!948344) b!1411804))

(assert (= (and b!1411805 (not res!948349)) b!1411803))

(declare-fun m!1301635 () Bool)

(assert (=> b!1411805 m!1301635))

(declare-fun m!1301637 () Bool)

(assert (=> b!1411805 m!1301637))

(assert (=> b!1411805 m!1301635))

(declare-fun m!1301639 () Bool)

(assert (=> b!1411805 m!1301639))

(declare-fun m!1301641 () Bool)

(assert (=> b!1411805 m!1301641))

(assert (=> b!1411805 m!1301635))

(declare-fun m!1301643 () Bool)

(assert (=> b!1411805 m!1301643))

(assert (=> b!1411804 m!1301635))

(assert (=> b!1411804 m!1301635))

(declare-fun m!1301645 () Bool)

(assert (=> b!1411804 m!1301645))

(assert (=> b!1411799 m!1301635))

(assert (=> b!1411799 m!1301635))

(declare-fun m!1301647 () Bool)

(assert (=> b!1411799 m!1301647))

(declare-fun m!1301649 () Bool)

(assert (=> b!1411803 m!1301649))

(declare-fun m!1301651 () Bool)

(assert (=> b!1411803 m!1301651))

(assert (=> b!1411803 m!1301651))

(declare-fun m!1301653 () Bool)

(assert (=> b!1411803 m!1301653))

(assert (=> b!1411803 m!1301653))

(assert (=> b!1411803 m!1301651))

(declare-fun m!1301655 () Bool)

(assert (=> b!1411803 m!1301655))

(declare-fun m!1301657 () Bool)

(assert (=> b!1411802 m!1301657))

(declare-fun m!1301659 () Bool)

(assert (=> start!121604 m!1301659))

(declare-fun m!1301661 () Bool)

(assert (=> start!121604 m!1301661))

(declare-fun m!1301663 () Bool)

(assert (=> b!1411800 m!1301663))

(declare-fun m!1301665 () Bool)

(assert (=> b!1411801 m!1301665))

(assert (=> b!1411801 m!1301665))

(declare-fun m!1301667 () Bool)

(assert (=> b!1411801 m!1301667))

(check-sat (not start!121604) (not b!1411802) (not b!1411799) (not b!1411804) (not b!1411801) (not b!1411800) (not b!1411803) (not b!1411805))
(check-sat)
